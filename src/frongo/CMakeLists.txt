cmake_minimum_required(VERSION 3.0.2)
project(frongo)

find_package(catkin REQUIRED COMPONENTS rospy std_msgs message_generation fremenserver)

#catkin_python_setup()	# Adro: just relevant when you put other python files in separate folder???

#######################################
## Declare ROS messages and services ##
#######################################

add_service_files(
  FILES
  AddCell.srv
  GetModelName.srv
  #BuildModel.srv
  GraphModel.srv
  #GetInfo.srv
  #PredictState.srv
  PredictStateOrder.srv
  AddOccupancyGrid.srv
)

generate_messages(
    DEPENDENCIES
    std_msgs 
)

catkin_package()

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
# include_directories(include)
include_directories(
  ${catkin_INCLUDE_DIRS}
)


#############
## Install ##
#############

 install(PROGRAMS
   scripts/fremeniser.py
   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
 )
