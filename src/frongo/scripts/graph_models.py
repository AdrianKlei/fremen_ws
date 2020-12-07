import matplotlib
#matplotlib.use('Agg')   # Adro: could maybe cause problems
from matplotlib import pyplot as plt
import numpy as np

class graph_model(object):

    def __init__(self, name):
        self.name = name

    def graph_model_construction(self, ep, states, preds, oep):
        yp = []
        pred_colours = ['blue', 'green', 'cyan', 'magenta', 'yellow', 'black']

        x = np.asarray(ep)
        x2 = np.asarray(oep)
        y1 = np.asarray(states)
        for i in preds:
            yp.append(np.asarray(i))

        fig = plt.figure()

        ax1 = fig.add_subplot(111)
        ax1.plot(x, y1, color='red', marker='', linestyle='-')
        col = 0
        for i in yp:
            ax1.plot(x2, i, color=pred_colours[col], marker='', linestyle='-')
            col+= 1

        plt.title(self.name)
        plt.ylim(-0.1, 1.1)
        plt.show()

    def graph_model_construction2(self, ep, states, preds, oep):
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
        plt.ylim(-0.1, max(y1)+1)
        ax2 = fig.add_subplot(512)
        ax2.plot(x2, yp[0], color='magenta')
        #yp[0][yp[0] < 0.5] = 0
        #yp[0][yp[0] >= 0.5] = 1
        #ax2.plot(x2, yp[0], color='green')
        #plt.ylim(-0.1, 1.2)
        ax3 = fig.add_subplot(513)
        ax3.plot(x2, yp[1], color=pred_colours[1])
        #yp[1][yp[1] < 0.5] = 0
        #yp[1][yp[1] >= 0.5] = 1
        #ax3.plot(x2, yp[1], color='green')
        #plt.ylim(-0.1, 1.2)
        ax4 = fig.add_subplot(514)
        ax4.plot(x2, yp[2], color=pred_colours[2])
        #yp[2][yp[2] < 0.5] = 0
        #yp[2][yp[2] >= 0.5] = 1
        #ax4.plot(x2, yp[2], color='green')
        #plt.ylim(-0.1, 1.2)
        ax5 = fig.add_subplot(515)
        ax5.plot(x2, yp[3], color=pred_colours[3])
        #yp[3][yp[3] < 0.5] = 0
        #yp[3][yp[3] >= 0.5] = 1
        #ax5.plot(x2, yp[3], color='green')

        #plt.ylim(-0.1, max(y1)+1)
        plt.show()
