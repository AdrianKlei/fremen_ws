# cmr_fremen
This project contains the ROS packages **FremenServer** and **frongo**. The project enables the possibility to execute a spectral analysis of person detection data inside an occupancy grid. While the **FremenServer** package includes the components to execute aspectral analysis components based on the Frequency Map Enhancement ([FreMEn](https://github.com/gestom/fremen)) method, the **frongo** package represents a port connecting information of an occupancy grid stored inside a decentralized database with the FreMEn method.
Further explanation of the methods can be found inside the corresponding packages.

## Set up the project
To set up the project, first download the cmr_fremen packages to your local machine:
```
$ cd ~/catkin_ws
$ git clone https://gitlab.projekt.uni-hannover.de/imes-projekt-cmg_roboter
$ catkin build
```

