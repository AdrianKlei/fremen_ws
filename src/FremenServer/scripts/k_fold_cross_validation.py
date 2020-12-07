#!/usr/bin/env python
#include rospy in CMakeLists and package.xml

import rospy
import actionlib
import os
from tqdm import tqdm
import pymongo
import yaml
import numpy as np

# here need to insert the message types that the fremenserver is using to communicate

from fremenserver.msg import FremenAction
from fremenserver.msg import FremenGoal

import numpy as np
from matplotlib import pyplot as plt

class FremenClient:

    def __init__(self):
        # self.week_probabilities is a list containing the predictions for 16 consecutive weeks
        self.week_probabilities = []
        self.current_week = 0
        self.current_order = 0
        self._ac = actionlib.SimpleActionClient("/fremenserver", FremenAction)
        self._ac.wait_for_server()
        rospy.loginfo("Fremenserver is up, we can send a new goal")

    def save_week_probabilities(self):
        print("Lenght and shape of week_probabilities : ")
        print(len(self.week_probabilities))
        print(np.shape(self.week_probabilities))
        np.savetxt("/home/adrian/Desktop/week_probabilities.txt", self.week_probabilities)
        print("Week probabilities have been saved to a file.")

    # Adds a room to the server, uses 10 weeks for training the model
    def add_cell(self, data):
        room_occupancy = np.copy(data)
        room_occupancy[data == 0] = 1
        room_occupancy[data != 0] = 0
        times_array = np.linspace(60, 6048000, num= int((6048000/60)), endpoint=True) # Times array for 10 weeks
        training_data = room_occupancy[:(6048000/60)]
        goal = FremenGoal()
        goal.id = "test_cell"
        goal.operation = 'add'
        goal.states = training_data
        goal.times = times_array
        self._ac.send_goal(goal, done_cb=self.add_cell_done_callback)
        rospy.loginfo("Goal has been sent.")
        self._ac.wait_for_result()

    def predict_cell(self, data):
        room_occupancy = np.copy(data)
        # We use our model trained on 10 weeks to predict each 16 weeks up to order 7
        for order in range(8):
            for week in range(16):
                goal = FremenGoal()
                goal.operation = 'predict'
                goal.order = order
                goal.times = np.linspace(60+(604800*week), 604800+(604800*week), num=int(604800/60), endpoint=True)
                goal.id = 'test_cell'
                self._ac.send_goal(goal, done_cb=self.predict_cell_done_callback)
                self._ac.wait_for_result()

    def add_cell_done_callback(self, status, result):
        pass

    def predict_cell_done_callback(self, status, result):
        print("I am in the callback function")
        probability_array = result.probabilities
        print("Shape of result.probabilities : ", np.shape(probability_array))
        print("Length of result.probabilities : ", len(probability_array))
        self.week_probabilities.append(probability_array)

if __name__ == '__main__':
    rospy.init_node("k_fold_cross_validation")
    rospy.loginfo("The k_fold_cross_validation_node has been started!")
    data = np.loadtxt("/home/adrian/Desktop/locations.min")
    client = FremenClient()
    client.add_cell(data)
    client.predict_cell(data)
    client.save_week_probabilities()
