import json
import yaml
import datetime
from fremen_interface import *

def get_field(item, key):
    """
    This function screens a DB-entry for a desired key

    Parameters:
        item:   DB-entry of a cell
        key:    information of interest of the DB-entry

    Returns:
        value:  the corresponding value (e.g. a timestamp, an occupancy-value)
    """
    # Is key.split('.') really neccessary, if we have just one key word?
    fields = key.split('.')
    value = item
    for i in fields:
        value = value[i]
    return value

class TModels(object):
    """
    This class creates a temporal model of each cell of the occupancy-grid

    Attributes:
        self.query:     search-query for finding the cell information in the DB
        self.order:     order of the best estimation, gets initialized with -1
        self._fremen:   each cell gets a fremen_interface instance
    """

    def __init__(self, name, data_field='data', data_type='boolean', data_conf='',
                 timestamp_field='timestamp', timestamp_type='epoch',
                 query='{}', db='uol_database', collection='cells'):
        self.name = name
        self.db=db
        self.collection=collection
        self.query=query
        self.data_field=data_field
        self.data_type = data_type
        self.data_conf = data_conf
        self.timestamp_field = timestamp_field
        self.timestamp_type = timestamp_type
        self.order = -1
        self.epochs = []
        self.states = []
        self._set_data_configuration()
        self._fremen = fremen_interface()
        if self.data_type == 'boolean':
            self.min_value = False
            self.max_value = True
        self.unknown = True

    def _set_props_from_dict(self, data):
        """
        This function assigns the constructor-values with the specifications written inside the specifications-file

        Parameters:
            data: specifications for the constructor-values

        Returns:
            nothing
        """
        for i in data.keys():
            if i in dir(self):
                self.__setattr__(i, data[i])
        # It gets checked if the yaml-file contained a data_conf field
        self._set_data_configuration()

    def _set_data_configuration(self):
        if self.data_conf != '':
            self._dconf=json.loads(self.data_conf)
        else:
            self._dconf=self.data_conf

    # Each matching database-entry found by collection.find() is analyzed and added with this function
    def _add_entry(self, entry):
        """
        This function analyzes each entry inside the DB of the corresponding cell

        Parameters:
            entry:  DB-entry

        Returns:
            nothing
        """
        self.unknown = False
        if self.timestamp_type == 'datetime':
            # Question: what does strftime() does?
            epoch = int(get_field(entry, self.timestamp_field).strftime('%s'))
        else:
            epoch = int(get_field(entry, self.timestamp_field))

        # Maybe I can delete this functionality ?
        state = self._decode_state(entry)

        if state != 'none':

            #self._set_min_max_values(state, epoch) # Nochmal anschauen die function
            self.states.append(state)
            self.epochs.append(epoch)


    def _decode_state(self, entry):
        """
        This function decodes the given occupancy state. The decoding depends on whether the datatype is specified as
        boolean or float

        Parameters:
            entry:  DB-entry of the corresponding cell

        Returns:
            state:  The decoded state in the specified format (boolean, float)
        """
        state = 'none'
        if self.data_type == 'boolean':
            if not self.data_conf:
                state = get_field(entry, self.data_field)
                # restrict statet to {0,1}
                if state > 1:
                    state = 1
                if state < 0:
                    state = 0
            else:
                a = get_field(entry, self.data_field)
                if a in self._dconf["True"]:
                    state = True
                if a in self._dconf["False"]:
                    state = False
        # I need to implement the functions for non binary states!
        if self.data_type == 'float':
            if not self.data_conf:
                state = get_field(entry, self.data_field)
        return state

    def _create_fremen_models(self):
        """
        This function creates a FreMEn-model for a cell. It assignes the prediction order with the lowest error to
        the variable self.order

        Parameters:
            none

        Returns:
            none
        """
        print("_create_fremen_models check-statement")
        print(self.name)
        print(self.data_field)
        self.order = self._fremen.create_fremen_model(self.name, self.epochs, self.states, self.data_type)

    def _predict_outcome(self, epochs, order=-1):
        if not self.unknown:
            # The _predict_outcome method is used for callback of predict with and without order
            # If no order is given, the order calculated by the evaluation method gets assigned
            if order < 0:
                order = self.order
            probs = self._fremen.predict_outcome(epochs, self.name, order, self.data_type)
            return probs
        else:
            probs = []
            for i in epochs:
                probs.append(0.5)
            return probs


    def _set_unknown(self, status):
        self.unknown = status
