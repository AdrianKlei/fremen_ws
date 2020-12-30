import numpy
import random
import rospy
import actionlib
import fremenserver.msg


class fremen_interface(object):
    """
    fremen_interface class

    Provides each cell's temporal model with a connection to the fremenserver,
    where a frequency analysis of the model is computed
    """

    def __init__(self):
        """
        Constructor
        """
        self.check_statement = "Check statement"
        rospy.on_shutdown(self._on_node_shutdown)

        # Creating fremen server client
        rospy.loginfo("Creating fremen server client")
        self.FremenClient = actionlib.SimpleActionClient('fremenserver',
                                                         fremenserver.msg.FremenAction)
        self.FremenClient.wait_for_server()

        rospy.loginfo("Set-Up Fremenserver monitors")
        # Fremen Server Monitor
        self.fremen_monitor = rospy.Timer(rospy.Duration(10), self.monitor_cb)
        rospy.loginfo(" ...done")

    def sampling_by_extrapolation(self, nepochs):
        """
        Calculates the indices of the training set and the testing set based on the specified values

        Parameters:
            nepochs:    overall number of epochs of dataset

        Returns: indices of the training-set and indices of the test-set
        """
        # Samples for result sampling
        # Ratio should include complete weeks
        index_b = range(int(numpy.ceil(nepochs * 0.75)))  # 0.064 resembles ca one week of aruba dataset
        index_e = range(int(numpy.ceil(nepochs * 0.75)), nepochs)  # default: range(int(numpy.ceil(nepochs*0.66)), nepochs
        if not index_e:
            index_e = random.sample(xrange(nepochs), 1)

        return index_b, index_e

    def random_sampling(self, nepochs):
        pass

    def get_build_and_eval_states(self, epochs, states, sampling_type='extrapolation'):
        """
        Splits the given data of a cell into a training and evaluation set

        Args:
            epochs: given epochs of the cell
            states: given states of the cell
            sampling_type: default set to 'extrapolation'

        Returns: epochs used for training and evaluation as well as the corresponding
                 states

        """
        if sampling_type == 'extrapolation':
            print("Number of epochs : ", len(epochs))
            index_b, index_e = self.sampling_by_extrapolation(len(epochs))

        epochs_build = [epochs[i] for i in index_b]
        epochs_eval = [epochs[i] for i in index_e]
        states_build = [states[i] for i in index_b]
        states_eval = [states[i] for i in index_e]

        return epochs_build, epochs_eval, states_build, states_eval

    def create_fremen_model(
            self, name, epochs, states, data_type='boolean', sampling_type='extrapolation'):
        """
        Creates a FreMEn-model for a cell

        Args:
            name: name of the cell
            epochs: array of the epochs of the cell
            states: array of the states of the cell
            data_type: can be 'boolean' or float
            sampling_type: default set to 'extrapolation

        Returns: FreMEn-model-order with the lowest prediction-error
        """
        print(self.check_statement)
        epochs_build, epochs_eval, states_build, states_eval = self.get_build_and_eval_states(
            epochs, states, sampling_type)
        if data_type == 'boolean':
            order = self.add_and_eval_models(
                name, epochs_build, states_build, epochs_eval, states_eval)
        elif data_type == 'float':
            order = self.add_and_eval_models_modified(
                name, epochs_build, states_build, epochs_eval, states_eval)
        return order

    def add_and_eval_models(self, model_id, a_epochs, a_states, e_epochs, e_states):
        """
        Produces a FreMEn-model of a cell for the case of binary states,
        calculating also the best order for the lowest prediction-error

        Args:
            model_id:       name of the cell
            a_epochs:       epochs for training the model
            a_states:       states for training the model
            e_epochs:       epochs for evaluating the model
            e_states:       states for evaluating the model

        Returns: model-order with the lowest prediction-error
        """
        fremgoal = fremenserver.msg.FremenGoal()
        fremgoal.operation = 'add'
        fremgoal.id = model_id
        fremgoal.times = a_epochs
        fremgoal.states = a_states

        print "--- BUILD ---"
        self.FremenClient.send_goal(fremgoal)
        self.FremenClient.wait_for_result()
        ps = self.FremenClient.get_result()
        print ps

        print "--- EVALUATE ---"
        frevgoal = fremenserver.msg.FremenGoal()
        frevgoal.operation = 'evaluate'
        frevgoal.id = model_id
        frevgoal.times = e_epochs
        frevgoal.states = e_states
        frevgoal.order = 20

        self.FremenClient.send_goal(frevgoal)
        self.FremenClient.wait_for_result()
        pse = self.FremenClient.get_result()
        print(pse)
        print("chosen order %d" % pse.errors.index(min(pse.errors)))
        return pse.errors.index(min(pse.errors)), min(pse.errors), pse.errors[0]

    def predict_outcome(self, epochs, name, order, data_type):
        """
        Predicts the state of a cell for given times and a given order

        Args:
            epochs: timestamps of the cell
            name: name of the cell
            order: FreMEn-model-order for state-prediction
            data_type: 'boolean' or 'float'

        Returns: array of probabilities
        """
        if data_type == 'boolean':
            fremgoal = fremenserver.msg.FremenGoal()
            fremgoal.operation = 'predict'
            fremgoal.id = name

            print(epochs)
            for i in epochs:
                fremgoal.times.append(i)
            fremgoal.order = order

            self.FremenClient.send_goal(fremgoal)
            # We wait maximum 10 seconds for the result
            self.FremenClient.wait_for_result(timeout=rospy.Duration(10.0))

            ps = self.FremenClient.get_result()
            prob = list(ps.probabilities)
            return prob

        elif data_type == 'float':
            fremgoal = fremenserver.msg.FremenGoal()
            fremgoal.operation = "predict_modified"
            fremgoal.id = name

            for i in epochs:
                fremgoal.times.append(i)
            fremgoal.order = order

            self.FremenClient.send_goal(fremgoal)
            self.FremenClient.wait_for_result(timeout=rospy.Duration(10.0))

            ps = self.FremenClient.get_result()
            prob = list(ps.probabilities)
            return prob

    def add_and_eval_models_modified(self, model_id, a_epochs, a_states, e_epochs, e_states):
        """
        Produces a FreMEn-model of a cell for the case of non-binary states,
        calculating also the best order for the lowest prediction-error

        Args:
            model_id:       name of the cell
            a_epochs:       epochs for training the model
            a_states:       states for training the model
            e_epochs:       epochs for evaluating the model
            e_states:       states for evaluating the model

        Returns: model-order with the lowest prediction-error
        """
        fremgoal = fremenserver.msg.FremenGoal()
        fremgoal.operation = "addvalues_modified"
        fremgoal.id = model_id
        fremgoal.times = a_epochs
        fremgoal.values = a_states

        print "--- BUILD ---"
        self.FremenClient.send_goal(fremgoal)
        self.FremenClient.wait_for_result()
        ps = self.FremenClient.get_result()
        print ps

        print "--- EVALUATE ---"
        frevgoal = fremenserver.msg.FremenGoal()
        frevgoal.operation = "evaluate_modified"
        frevgoal.id = model_id
        frevgoal.times = e_epochs
        frevgoal.values = e_states
        frevgoal.order = 20

        self.FremenClient.send_goal(frevgoal)
        self.FremenClient.wait_for_result()
        pse = self.FremenClient.get_result()
        print(pse)
        print("chosen order %d" % pse.errors.index(min(pse.errors)))
        return pse.errors.index(min(pse.errors)), min(pse.errors), pse.errors[0]

    def monitor_cb(self, events):
        """ Informs about disabled fremenserver"""
        if not self.FremenClient.wait_for_server(timeout=rospy.Duration(1)):
            rospy.logerr("NO FREMEN SERVER FOUND. Fremenserver restart might be required")

    def _on_node_shutdown(self):
        """ Exits program"""
        self.fremen_monitor.shutdown()
