#!/usr/bin/env python

import rospy
import yaml
import json
import pymongo
import numpy as np
from tqdm import tqdm
import std_msgs
from temporal_models import *
from graph_models import *
from frongo.srv import AddCell
from frongo.srv import PredictStateOrder
from frongo.srv import GraphModel
from frongo.srv import AddOccupancyGrid
from frongo.srv import EvaluateModels


def load_yaml(filename):
    """
    Processes information given in a .yaml specifications-file

    Args:
        filename: name of the specifications-file

    Returns:
        Processed information
    """
    data = []
    rospy.loginfo("loading %s" % filename)
    with open(filename, 'r') as f:
        datum = yaml.load(f, Loader=yaml.FullLoader)
        if not isinstance(datum, list):
            data.append(datum)
        else:
            data = datum
        print(data)

        return data


class frongo(object):   # default name : frongo
    """
    Frongo class

    Creates a model of an occupancy grid. Containing occupancy and time informations of every cell,
    providing each cell with client to the fremenserver.
    """
    def __init__(self, data=None):
        """
        Constructor

        Creates the grid. Connects to DB containing cell information

        Args:
            data: default value is None, a new grid is added via the 'add_occupancy_grid'-service

        """
        self.is_fremen_active = False
        self.models = []
        rospy.on_shutdown(self._on_node_shutdown)
        # Host and port are defined manually cause ros mongodb_store pkg is not yet included
        self.host = 'localhost'
        self.port = 27017
        self.mongo_client = pymongo.MongoClient(self.host, self.port)

        if data:
            self.create_models(data)

        # Subscribe to fremen server start topic
        # The fremen_restart_cb adds the models in self.models to the fremenserver
        rospy.Subscriber('/fremenserver_start', std_msgs.msg.Bool, self.fremen_restart_cb)
        rospy.loginfo("... Done")

        rospy.sleep(3)

        # Services advertised section start
        self.predict_ord_srv = rospy.Service('/frongo/predict_models_with_order', PredictStateOrder,
                                             self.predict_order_cb)
        self.new_cell_srv = rospy.Service('/frongo/add_cell', AddCell, self.add_cell_cb)
        self.graph_build_srv = rospy.Service('/frongo/graph_model_build', GraphModel, self.graph_model_build_cb)
        self.add_occupancy_grid_srv = rospy.Service('/frongo/add_occupancy_grid', AddOccupancyGrid,
                                                    self.add_occupancy_grid_cb)
        self.evaluate_models_vs_static_srv = rospy.Service('/frongo/evaluate_models_vs_static', EvaluateModels,
                                                           self.evaluate_models_vs_static_cb)
        # Services advertised section end

        rospy.loginfo("All Done ...")
        rospy.spin()

    def add_cell_cb(self, req):
        """
        Callback of the 'add_cell'-service. Adds a new cell to the set of cells

        Args:
            req: A .yaml-file including the specification of the cell

        Returns:
            Success: A message indicating that the adding of the cell worked or not
        """
        data = load_yaml(req.model_def)
        for i in data:
            val = TModels(i['model']['name'])
            # The active grid cell gets initialized with the yaml-file specifications
            val._set_props_from_dict(i['model'])
            self.models.append(val)
            self.set_model_states(val)

        return True

    def add_occupancy_grid_cb(self, req):
        """
        Callback of the 'add_occupancy_grid'-service. Adds a model of an occupancy grid to
        the client. Just the DB-data is used, no frequency calculations are done here.

        Args:
            req: A yaml-file including the specifications of the occupancy grid and the DB storing the
                 cell information

        Returns:
            Success: A message indicating that the adding of the occupancy grid worked or not
        """
        print(req.specifications_file)
        datum = load_yaml(req.specifications_file)
        print(datum)
        specifications = datum[0]
        rows = specifications['rows']
        cols = specifications['cols']
        # We create a temporal_model for each cell in the grid

        for row in tqdm(range(rows), desc="Adding row progress : "):
            for col in tqdm(range(cols), desc="Adding col progress : "):
                cell_name = 'cell_row_' + str(row) + '_col_' + str(col)
                query = '{"name":"' + str(cell_name) + '"}'
                val = TModels(cell_name, query=query)
                # The active grid cell gets initialized with the yaml-file specifications

                val._set_props_from_dict(specifications)
                self.models.append(val)

        for i in tqdm(self.models, desc="Set model states progress : "):
            print("-----------------------")
            print i.name
            self.set_model_states(i)

        return True

    def fremen_restart_cb(self, msg):
        """
        Callback of the 'fremenserver_start'-topic. Calculates FreMEn-models for each cell inside self.models[]

        Args:
            msg: type std_msgs/Bool
        """
        if msg.data:
            rospy.logwarn("FREMENSERVER restart detected will generate new models now")
            for i in tqdm(self.models, desc="Create fremen models progress : "):
                if not i.unknown:
                    i._create_fremen_models()
                    print i.name, i.order

            self.is_fremen_active = True

    def predict_order_cb(self, req):
        """
        Callback of the 'predict_order'-service. Predicts probability for a cell occupancy (case: boolean)
        or estimated person number (case: float)
        the given timestamps of req.epochs. In case of boolean states, it returns the probability for a
        cell occupancy, in case of float states, it returns the estimated person number

        Parameters:
            req: contains the timestamps and the order for which predictions shall be computed

        Returns: requested epochs with the corresponding predictions
        """
        epochs = []
        for i in req.epochs:
            epochs.append(i)

        for i in self.models:
            if i.name == req.model_name:
                # Check for req.epochs[0]. If equal to 42, predict all saved times of model
                if req.epochs[0] == 42:
                    print("Prediction for every existing epoch of the model will be made.")
                    epochs = i.epochs
                predictions = i._predict_outcome(epochs, order=req.order)
        # IMPORTANT: the following line needs to be adjusted to the currently used database
        # np.savetxt("/home/adrian/Desktop/master_bedroom_frongo.txt", predictions)
        return epochs, predictions

    def evaluate_models_vs_static_cb(self, req):
        sum_best_fit_error = 0.0
        sum_static_error = 0.0
        num_models = 0
        for model in self.models:
            # Just models with a minimal occupancy level get included in error calculation
            if not model.unknown:
                states = np.array(model.states)
                print("Current model", model.name)
                print("Number of non zero entrances", np.count_nonzero(states))
                print("Length of states-array", len(states))
                ratio = float(np.count_nonzero(states)) / float(len(states))
                if ratio > 0.05:
                    sum_best_fit_error += model.error_best_order
                    sum_static_error += model.error_static
                    num_models += 1

        avg_best_fit_error = sum_best_fit_error / num_models
        avg_static_error = sum_static_error / num_models
        # Save the errors to a file in the corresponding time_intervall folder
        information_array = np.array([avg_best_fit_error, avg_static_error, num_models])
        np.savetxt("/home/adrian/fremen_predictions/uol/float/interval_300/information_array.txt", information_array)
        message = "Completed error calculations."
        return message

    def create_models(self, data):
        """
        Creates a temporal model of each cell of the occupancy-grid

        Parameters:
            data: contains information about the cells, and the path to the corresponding cell-information inside the
            specified DB

        """
        print data
        for i in data:
            val = TModels(i['model']['name'])
            # The active grid cell gets initialized with the yaml-file specifications
            val._set_props_from_dict(i['model'])
            self.models.append(val)
            self.set_model_states(i)

    # The function gets the cell_model with the yaml-specifications
    # Now we need to fill the empty cell-attributes (self.states[], self.timestamps[]
    def set_model_states(self, model):
        """
        Queries the DB for all entries of the corresponding model

        Parameters:
            model: a single cell of the grid

        """
        db = self.mongo_client[model.db]
        collection = db[model.collection]
        query = json.loads(model.query)
        available = collection.find(query)
        if available:
            for i in available:
                model._add_entry(i)
        else:
            model._set_unknown(True)

    def graph_model_build_cb(self, req):
        """
        Callback of the 'graph_model_build'-service. Provides grafical representation

        Args:
            req: request containing the requiered cell

        Returns:
            Success message
        """
        self.graph_model_construction(req)
        return "Done"

    def graph_model_construction(self, req):
        """
        Given a certain periodicity, the first periodicity of the states-array is plotted against
        the FreMEn-predictions of several orders

        Args:
            req: request specifying cell and predictions orders
        """
        # periodicity corresponds to one week (default)
        periodicity = 604800
        matching_cell = False

        for i in self.models:
            if req.model_name == i.name:
                matching_cell = True
                preds = []
                graph = graph_model(i.name)
                ordeps = []
                ordeps_indices = []
                idx = 0
                for epoch in i.epochs:
                    if epoch - i.epochs[0] <= periodicity:
                        ordeps.append(epoch)
                        ordeps_indices.append(idx)
                        idx += 1
                ordeps = np.array(ordeps)
                ordrange = np.arange(req.from_val, req.until_val + 1, req.increment)
                for j in ordrange.tolist():
                    preds.append(i._predict_outcome(ordeps.tolist(), order=j))
                states = [i.states[k] for k in ordeps_indices]
                print("Length of the 'states'-array : ", len(states))
                graph.graph_model_construction(ordeps.tolist(), states, preds)

            if not matching_cell:
                rospy.logerr("Couldn't find a cell with matching name...")

    def _on_node_shutdown(self):
        """
        Interrupts connection to the DB. Exits the program
        """
        rospy.loginfo("Shutting Down ...")
        self.mongo_client.close()
        rospy.loginfo("Done... Bye")


if __name__ == '__main__':
    # data = load_yaml("/home/adrian/Desktop/fremeniser_specifications.yaml")
    data = None
    rospy.init_node("fremeniser")
    server = frongo(data)
