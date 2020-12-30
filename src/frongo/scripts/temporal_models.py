import json
import datetime
from fremen_interface import *


def get_field(item, key):
    """
    Screens a DB-entry for a desired key

    Args:
        item:   DB-entry of a cell
        key:    information of interest of the DB-entry

    Returns:
        Corresponding value (e.g. a timestamp, an occupancy-value)
    """
    fields = key.split('.')
    value = item
    for i in fields:
        value = value[i]
    return value


class TModels(object):
    """
    TModels class

    Defines a temporal model for an occupancy-grid cell containing information about
    observation times and states


    Attributes:
        self.query:     search-query for finding the cell information in the DB
        self.order:     order of the best estimation, gets initialized with -1
        self._fremen:   each cell gets a fremen_interface instance
    """

    def __init__(self, name, data_field='data', data_type='boolean', data_conf='',
                 timestamp_field='timestamp', timestamp_type='epoch',
                 query='{}', db='uol_database', collection='cells'):
        """
        Constructor

        Args:
            name: name of the cell
            data_field: key of a DB-entry where the data can be found
            data_type: specifies the data type of an entry (e.g. boolean, float)
            data_conf: includes extended data configurations
            timestamp_field: key of a DB-entry where the timestamp can be found
            timestamp_type: the timestamp type of an entry (default: epoch)
            query: query to extract cell information from a DB
            db: DB containing the cell's information
            collection: corresponding collection inside the DB
        """
        self.name = name
        self.db = db
        self.collection = collection
        self.query = query
        self.data_field = data_field
        self.data_type = data_type
        self.data_conf = data_conf
        self.timestamp_field = timestamp_field
        self.timestamp_type = timestamp_type
        self.order = -1
        self.epochs = []
        self.states = []
        self._set_data_configuration()
        self._fremen = fremen_interface()
        self.error_best_order = 0.0
        self.error_static = 0.0
        if self.data_type == 'boolean':
            self.min_value = False
            self.max_value = True
        self.unknown = True

    def _set_props_from_dict(self, data):
        """
        Assigns the constructor-values with the specifications written inside aspecifications-file

        Args:
            data: specifications for the constructor-values

        """
        for i in data.keys():
            if i in dir(self):
                self.__setattr__(i, data[i])
        # It gets checked if the yaml-file contained a data_conf field
        self._set_data_configuration()

    def _set_data_configuration(self):
        """ Enables extended data configurations """
        if self.data_conf != '':
            self._dconf = json.loads(self.data_conf)
        else:
            self._dconf = self.data_conf

    def _add_entry(self, entry):
        """
        Analyzes each entry of the corresponding cell inside the DB

        Args:
            entry:  DB-entry

        """
        self.unknown = False
        if self.timestamp_type == 'datetime':
            epoch = int(get_field(entry, self.timestamp_field).strftime('%s'))
        else:
            epoch = int(get_field(entry, self.timestamp_field))

        state = self._decode_state(entry)

        if state != 'none':

            self.states.append(state)
            self.epochs.append(epoch)

    def _decode_state(self, entry):
        """
        Decodes the given occupancy state. Decoding depends on whether the datatype is specified as
        boolean or float

        Args:
            entry:  DB-entry of the corresponding cell

        Returns: decoded state in the specified format (boolean, float)
        """
        state = 'none'
        if self.data_type == 'boolean':
            if not self.data_conf:
                state = get_field(entry, self.data_field)
                # restrict state to {0,1}
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

        if self.data_type == 'float':
            if not self.data_conf:
                state = get_field(entry, self.data_field)
        return state

    def _create_fremen_models(self):
        """
        Creates a FreMEn-model for a cell. Assigns the prediction order with the lowest error to
        the variable self.order

        """
        print("_create_fremen_models check-statement")
        print(self.name)
        print(self.data_field)
        self.order, self.error_best_order, self.error_static = self._fremen.create_fremen_model(
            self.name, self.epochs, self.states, self.data_type)

    def _predict_outcome(self, epochs, order=-1):
        """
        Predicts probability (boolean) or person number (float) for epochs

        Args:
            epochs: series of timestamps
            order: FreMEn model order

        Returns: Probabilities (boolean) or person numbers (float) for requested epochs
        """
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
        """
        Sets the cell state to unknown, indicating that no observations have been made for
        this cell
        """
        self.unknown = status
