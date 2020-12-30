import matplotlib
# matplotlib.use('Agg')
from matplotlib import pyplot as plt
import numpy as np


class graph_model(object):
    """
    graph_model class

    Grafical representation of first periodicity of states-array with corresponding
    FreMEn-predictions
    """

    def __init__(self, name):
        """
        Constructor

        Args:
            name: name of the cell
        """
        self.name = name

    def graph_model_construction(self, ep, states, preds):
        """
        Plots first periodicity of states-array and FreMEn-predictions of requested orders

        Args:
            ep: epochs, timestamps of the model
            states: cell's state at the corresponding timestamps
            preds: predictions of the cell's state at the corresponding timestamps
        """
        print("Until here everyting seems to be working ...")
        yp = []
        pred_colours = ['blue', 'green', 'cyan', 'magenta', 'yellow', 'black']

        x = np.asarray(ep)
        x2 = np.asarray(ep)
        y1 = np.asarray(states)
        for i in preds:
            yp.append(np.asarray(i))

        fig = plt.figure()
        ax1 = fig.add_subplot(511)
        ax1.plot(x, y1, color='red')
        plt.ylim(-0.1, max(y1) + 1)
        ax2 = fig.add_subplot(512)
        ax2.plot(x2, yp[0], color='magenta')

        ax3 = fig.add_subplot(513)
        ax3.plot(x2, yp[1], color=pred_colours[1])

        ax4 = fig.add_subplot(514)
        ax4.plot(x2, yp[2], color=pred_colours[2])

        ax5 = fig.add_subplot(515)
        ax5.plot(x2, yp[3], color=pred_colours[3])

        plt.show()
