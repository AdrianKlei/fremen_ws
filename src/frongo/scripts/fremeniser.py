#!/usr/bin/env python

import rospy
import yaml
import json
import pymongo
import numpy as np
from tqdm import tqdm

import std_msgs

from std_srvs.srv import Trigger
from temporal_models import *
from graph_models import *
from frongo.srv import AddCell
from frongo.srv import PredictStateOrder
from frongo.srv import GetModelName
from frongo.srv import GraphModel
from frongo.srv import AddOccupancyGrid

# Reads the models specified in the yaml-file into the array string, data[i] stored info about model_i
def load_yaml(filename):
    data = []
    rospy.loginfo("loading %s"%filename)
    with open(filename, 'r') as f:
        datum = yaml.load(f, Loader=yaml.FullLoader)
        if not isinstance(datum, list):
            data.append(datum)
        else:
            data = datum
        print(data)
        #exit()  # Check statement
        return data

class frongo(object):
    """
    This class creates a model of an occupancy grid, containing occupancy and time informations of every single cell,
    providing each cell with client to the fremenserver, where the FreMEn-algorithm is executedl This sentence is a comment made from github.

    Attributes:
        self.host:          DB-host
        self.port:          DB-port
        self.mongo_client:  MongoClient-instance
    """
    def __init__(self, data):
        self.is_fremen_active=False
        self.models = []
        rospy.on_shutdown(self._on_node_shutdown)
        # Host and port are defined manually cause ros mongodb_store pkg is not yet included
        self.host = 'localhost'
        self.port = 27017
        self.mongo_client = pymongo.MongoClient(self.host, self.port)

        if data:
            self.create_models(data)
                #exit() # Checkpoint if model has correct values assigned

        # Subscribe to fremen server start topic
        # The fremen_restart_cb adds the models in self.models to the fremenserver
        rospy.Subscriber('/fremenserver_start', std_msgs.msg.Bool, self.fremen_restart_cb)
        rospy.loginfo("... Done")

        rospy.sleep(3)

        ######## Services advertised section start #######
        self.predict_ord_srv = rospy.Service('/frongo/predict_models_with_order', PredictStateOrder, self.predict_order_cb)
        self.new_cell_srv = rospy.Service('/frongo/add_cell', AddCell, self.add_cell_cb)
        self.graph_build_srv = rospy.Service('/frongo/graph_model_build', GraphModel, self.graph_model_build_cb)
        self.add_occupancy_grid_srv = rospy.Service('/frongo/add_occupancy_grid', AddOccupancyGrid, self.add_occupancy_grid_cb)
        ####### Services advertised section end #######

        rospy.loginfo("All Done ...")
        rospy.spin()

    def add_cell_cb(self, req):
        """
        This function is the callback of the add_cell-service. It adds a new cell to the overall set of cells

        Parameters:
            req: The file including the specification of the cell

        Returns:
            Success: A message indicating that the adding of the cell worked or not
        """
        data = load_yaml(req.model_def)
        for i in data:
            val=TModels(i['model']['name'])
            # The active grid cell gets initialized with the yaml-file specifications
            val._set_props_from_dict(i['model'])
            self.models.append(val)
            self.set_model_states(val)

        return True


    def add_occupancy_grid_cb(self, req):
        """
        This function is the callback of the add_occupancy_grid-service. It adds a model of an occupancy grid to
        the client. Just the DB-data is used, no frequency calculations are done here.

        Parameters:
            req: The file including the specifications of the occupancy grid

        Returns:
            Success: A message indicating that the adding of the occupancy grid worked or not
        """
        data = []
        print(req.specifications_file)
        datum = load_yaml(req.specifications_file)
        print(datum)
        specifications = datum[0]
        rows = specifications['rows']
        cols = specifications['cols']
        # We create a temporal_model for each cell in the grid
        for row in tqdm(range(rows), desc="Adding row progress : "):
            for col in tqdm(range(cols), desc="Adding col progress : "):
                cell_name = 'cell_row_'+str(row)+'_col_'+str(col)
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
       This function is the callback of the fremenserver_start-topic. It calculates the FreMEn-models
       for each cell inside the models[]-array.

       Parameters:
           msg: boolean message

       Returns:
           Models containing the updated FreMEn-parameters for each cell of the occupancy grid
       """
        if msg.data:
            rospy.logwarn("FREMENSERVER restart detected will generate new models now")
            for i in tqdm(self.models, desc="Create fremen models progress : "):
                #exit()  # Check statement
                i._create_fremen_models()
                print i.name, i.order

            self.is_fremen_active = True

    def predict_order_cb(self, req):
        """
        This function is the callback of the predict_order-service. It predicts the estimated people for
        the given timestamps of req.epochs. In case of boolean states, it returns the probability for a
        cell occupancy, in case of float states, it returns the estimates person number

        Parameters:
            req: contains the timestamps and the order used for person estimation

        Returns:
            Person estimation for given timestamps
        """
        epochs = []
        for i in req.epochs:
            epochs.append(i)

        for i in self.models:
            if i.name == req.model_name:
                # We make a check for req.epochs[0]. If equal to 42, we predict all saved times of model
                if req.epochs[0] == 42:
                    print("Prediction for every epoch of the model will be made.")
                    epochs = i.epochs
                predictions = i._predict_outcome(epochs, order=req.order)
        # IMPORTANT: the following line needs to be adjusted to the currently used database
        np.savetxt("/home/adrian/Desktop/master_bedroom_frongo.txt", predictions)
        return epochs, predictions

    def create_models(self, data):
        """
        This function creates a temporal model of each cell of the occupancy-grid

        Parameters:
            data: contains informations about the cells, and how to find the corresponding cell-information inside the
            specified DB

        Returns:
            nothing
        """
        print data
        for i in data:
            val=TModels(i['model']['name'])
            # The active grid cell gets initialized with the yaml-file specifications
            val._set_props_from_dict(i['model'])
            self.models.append(val)
            self.set_model_states(i)

    # The function gets the cell_model with the yaml-specifications
    # Now we need to fill the empty cell-attributes (self.states[], self.timestamps[]
    def set_model_states(self, model):
        """
        This function queries the DB for all entries of the corresponding model

        Parameters:
            model: the corresponding model

        Returns:
            nothing
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
        self.graph_model_construction2(req)
        return "Done"

    def graph_model_construction(self, req):
        for i in self.models:
            if req.model_name == i.name:
                preds = []
                graph = graph_model(i.name)
                ordeps = np.arange(min(i.epochs), max(i.epochs), 3600)
                ordrange = np.arange(req.from_val, req.until_val+1, req.increment)
                for j in ordrange.tolist():
                    preds.append(i._predict_outcome(ordeps.tolist(), order=j))
                graph.graph_model_construction(i.epochs, i.states, preds, ordeps.tolist())

    def graph_model_construction2(self, req):
        # Adro: we visualize the original data and the predictions for ONE week based on two training weeks!
        for i in self.models:
            if req.model_name == i.name:
                preds = []
                graph = graph_model(i.name)
                ordeps = np.linspace(i.epochs[0], i.epochs[1007], 1008) # Adro: usually (600, 604800, 1008)
                print(i.epochs[0])
                ordrange = np.arange(req.from_val, req.until_val+1, req.increment)
                for j in ordrange.tolist():
                    preds.append(i._predict_outcome(ordeps.tolist(), order=j))
                graph.graph_model_construction2(i.epochs[:1008], i.states[:1008], preds, ordeps.tolist())

    def _on_node_shutdown(self):
        rospy.loginfo("Shutting Down ...")
        self.mongo_client.close()
        rospy.loginfo("Done... Bye")



if __name__ == '__main__':
    #data = load_yaml("/home/adrian/Desktop/fremeniser_specifications.yaml")
    data = None
    rospy.init_node("fremeniser")
    server = frongo(data)
