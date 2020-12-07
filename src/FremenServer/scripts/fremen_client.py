#!/usr/bin/env python
#include rospy in CMakeLists and package.xml

import rospy
import actionlib
import os
from tqdm import tqdm
import pymongo
import yaml

# here need to insert the message types that the fremenserver is using to communicate

from fremenserver.msg import FremenAction
from fremenserver.msg import FremenGoal

import numpy as np
from matplotlib import pyplot as plt
# here need to be inserted the dependencies for data analyzation such as numpy, matplotlib...

test_master_bedroom = []

test_plot_times_array = []
test_plot_probabilities_array = []


class FremenClient:

	def __init__(self):
		self.requested_cell = []
		self.times_array = []
		self.current_order = 0
		self.current_row = 0
		self.current_col = 0
		self._ac = actionlib.SimpleActionClient("/fremenserver", FremenAction)
		self._ac.wait_for_server()
		rospy.loginfo("fremenserver is up, we can send a new goal")

	def add_cell(self):
		goal = FremenGoal()
		rospy.loginfo("Seems like no problems occured during creation of FremenGoal(). Lets fill the message with values")
		self.requested_cell = np.array(self.requested_cell, dtype=bool)
		self.times_array = self.times_array.astype(int) #transformation seems to have no effect at all
		print("Type of times_array ", type(self.times_array))
		goal.operation = 'add'
		goal.id = 'test_cell'
		goal.states = self.requested_cell
		goal.times = self.times_array
		goal.order = 5 #just for testing purposes, should be removed later
		rospy.loginfo("All information has been written inside the fremen_add message.")
		
		#send the message to the fremenserver
		self._ac.send_goal(goal, done_cb=self.add_cell_done_callback,
				feedback_cb=self.add_cell_feedback_callback)
		rospy.loginfo("Goal has been sent.")
		self._ac.wait_for_result()
		
	def predict_cell(self, order):
		#we will send a 'predict' request for several time stamps and try to print it in the callback_function
		goal = FremenGoal()
		rospy.loginfo("Seems like no problems occured during creation of FremenGoal(). Lets fill the message with values")
		goal.operation = 'predict'
		goal.id = 'test_cell'
		goal.times = self.times_array
		goal.order = order
		rospy.loginfo("All information has been written inside the fremen_predict message.")
		#send the message to the fremenserver
		self._ac.send_goal(goal, done_cb=self.predict_cell_done_callback,
				feedback_cb=self.predict_cell_feedback_callback)
		rospy.loginfo("Goal has been sent.")
		self._ac.wait_for_result()

	def evaluate_cell(self):
		rospy.loginfo('We will now use the evaluate function')
		goal = FremenGoal()
		goal.operation = 'evaluate'
		goal.order = 100
		goal.id ='test_cell'
		goal.states = self.requested_cell
		goal.times = self.times_array
		rospy.loginfo("All information has been written inside the fremen_evaluate message.")

		#send the message to the fremenserver
		self._ac.send_goal(goal, done_cb=self.evaluate_cell_done_callback,
				feedback_cb=self.evaluate_cell_feedback_callback)


	def add_cell_done_callback(self, status, result):
		pass

	def add_cell_feedback_callback(self, feedback):
		pass
	
	def predict_cell_done_callback(self, status, result):
		#rospy.loginfo("Result is : " + str(result.probabilities))
		probability_array = result.probabilities
		
		#save probability_array to text file
		np.savetxt("/home/adrian/requested_room/fremen_model_probabilities/model_order_" + str(self.current_order) +".txt", probability_array)
		rospy.loginfo("Probabilities have been saved to separate files")
		self.current_order += 1
		#somehow in this callback plt.plot() does not really work
		

	def predict_cell_feedback_callback(self, feedback):
		pass
	
	def evaluate_cell_done_callback(self, status, result):
		errors_array = result.errors
		np.savetxt("/home/adrian/requested_room/fremen_model_errors/errors.txt", errors_array)
		rospy.loginfo("Errors have been saved to a file")

	def evaluate_cell_feedback_callback(self, feedback):
		pass

	def add_cells_uol(self, dataset_shape):
		# We need to iterate over all cells of the occupancy grid
		rows = dataset_shape[1]
		cols = dataset_shape[2]
		for row in tqdm(range(rows), desc="Add each cell row-wise to server"):
			for col in tqdm(range(cols), desc="Current row progress : "):
				# Path has been changed to save files on the Volume partition
				path = "/media/adrian/Volume/occupancy_grid/cell_row_" + str(row) + "_col_" + str(col)
				requested_cell = np.loadtxt(path + "/binary_states_array.txt")
				self.requested_cell = np.array(requested_cell, dtype=bool)
				self.times_array = np.linspace(60*10, 604800.0, num=int(604800.0/(60*10)), endpoint=True)
				# How does the sampling interval time change the above line?
				# Sampling time needs to be read in via an .yaml file specification

				goal = FremenGoal()
				goal.operation = 'add'
				goal.id = 'cell_row_' + str(row) + '_col_' + str(col)
				goal.states = self.requested_cell
				goal.times = self.times_array

				# Send the message to the fremenserver
				self._ac.send_goal(goal, done_cb=self.add_cells_uol_done_callback,
								feedback_cb=self.add_cells_uol_feedback_callback)
				self._ac.wait_for_result()

	def predict_cells_uol(self, dataset_shape, order):
		# We will send a 'predict' request for every cell of the occupancy grid and iterate also over a range of orders
		rows = dataset_shape[1]
		cols = dataset_shape[2]
		self.current_order = 0

		for current_order in range(order):	# Is iteration sequency important here? Maybe need to be changed
			for row in tqdm(range(rows), desc="Send prediction request for each single cell"):
				rospy.loginfo("The current order is : " + str(self.current_order))
				self.current_row = row	# Row and col mustn't be iterated at the same place !!!
				for col in range(cols):
					self.current_col = col
					goal = FremenGoal()
					goal.operation = 'predict'
					goal.id = 'cell_row_' + str(row) + '_col_' + str(col)
					goal.times = np.linspace(60*10, 604800.0, num=int(604800.0/(60*10)), endpoint=True)
					goal.order = current_order
					# Send the message to the fremenserver
					self._ac.send_goal(goal, done_cb=self.predict_cells_uol_done_callback,
									feedback_cb=self.predict_cells_uol_feedback_callback)
					self._ac.wait_for_result()
			self.current_order += 1	 # Needs to be increased, because the prediction_callback can otherwise not access the order
		self.current_row = 0
		self.current_col = 0	# Needs to be resetted for following evaluate method!

	def evaluate_cells_uol(self, dataset_shape, order):
		# We will send a 'evaluate' request for every cel lof the occupancy grid and iterate also over a range of orders
		rows = dataset_shape[1]
		cols = dataset_shape[2]
		self.current_order = 0

		for row in tqdm(range(rows), desc="Send evaluate request for each single cell"):
			self.current_row = row
			for col in range(cols):
				self.current_col = col
				path = "/media/adrian/Volume/occupancy_grid/cell_row_" + str(row) + "_col_" + str(col)
				requested_cell = np.loadtxt(path + "/binary_states_array.txt")
				self.requested_cell = np.array(requested_cell, dtype=bool)
				self.times_array = np.linspace(60*5, 604800.0, num=int(604800.0/(60*5)), endpoint=True)

				goal = FremenGoal()
				goal.operation = 'evaluate'
				goal.id = 'cell_row_' + str(row) + '_col_' + str(col)
				goal.order = order
				goal.states = self.requested_cell
				goal.times = self.times_array

				self._ac.send_goal(goal, done_cb=self.evaluate_cells_uol_done_callback,
								feedback_cb=self.evaluate_cells_uol_feedback_callback)
				self._ac.wait_for_result()
			self.current_row = 0
			self.current_col = 0	# Needs to be resetted



	def add_cells_uol_done_callback(self, status, result):
		pass

	def add_cells_uol_feedback_callback(self, feedback):
		pass

	def predict_cells_uol_done_callback(self, status, result):
		probability_array = result.probabilities

		# Save probability_array to text file
		path = "/media/adrian/Volume/occupancy_grid/cell_row_" + str(self.current_row) + "_col_" + str(self.current_col) + "/fremen_model_probabilities"
		if not os.path.exists(str(path)):
			os.makedirs(path)
		np.savetxt(path + "/model_order_" + str(self.current_order) + ".txt", probability_array)

	def predict_cells_uol_feedback_callback(self, feedback):
		pass

	def evaluate_cells_uol_done_callback(self, status, result):
		errors_array = result.errors
		path = "/media/adrian/Volume/occupancy_grid/cell_row_" + str(self.current_row) + "_col_" + str(self.current_col) + "/fremen_model_errors"
		if not os.path.exists(str(path)):
			os.makedirs(path)
		# The error for every model order gets saved to a separate file
		np.savetxt(path + "/errors.txt" , errors_array)

	def evaluate_cells_uol_feedback_callback(self, feedback):
		pass

def convert_data_to_binary_cell_arrays(dataset_shape):
	matrix = np.loadtxt("/home/adrian/counts_time_series_matrices/test.txt").reshape(dataset_shape[0], dataset_shape[1], dataset_shape[2])  # adro: need to get rid of hard coded shape numbers
	for row in tqdm(range(0, np.shape(matrix)[1]), desc="Binary states for each cell : "):
		for col in range(0, np.shape(matrix)[2]):
			binary_state_vector = matrix[:, row, col]
			path = "/media/adrian/Volume/occupancy_grid/cell_row_" + str(row) + "_col_" + str(col)
			if not os.path.exists(str(path)):
				os.makedirs(path)
			np.savetxt(path + "/binary_states_array.txt", binary_state_vector)
	print("Binary states array has been saved for every cell...")

def convert_data_from_database_to_binary_cell_arrays(dataset_shape):
	client = pymongo.MongoClient('localhost', 27017)
	print("Connection to database has been established.")
	db = client['uol_database']
	collection = db['cells']
	for row in tqdm(range(dataset_shape[1]), desc="Binary states for each cell :"):
		for col in range(dataset_shape[2]):
			cell_id = 'cell_row_'+str(row)+'_col_'+str(col)
			data = collection.find_one({'_id': cell_id})
			states = data['states']	# Needs to be converted in to numpy-format maybe?
			path = "/media/adrian/Volume/occupancy_grid/cell_row_" + str(row) + "_col_" + str(col)
			if not os.path.exists(str(path)):
				os.makedirs(path)
			np.savetxt(path + "/binary_states_array.txt", states)
	print("Binary states array has been saved for every cell...")

def compute_dataset_shape():
	print("Just entered the compute_dataset_shape function")
	with open("/home/adrian/Desktop/occupancy_grid_specifications.yaml") as f:
		specifications = yaml.load(f, Loader=yaml.FullLoader)
		print("Test_statement.")
		overall_time_in_seconds = specifications['overall_time_in_seconds']
		bin_size_in_seconds = specifications['bin_size_in_seconds']
		row_numbers = specifications['rows']
		col_numbers = specifications['cols']
		number_of_time_stamps = int(overall_time_in_seconds/bin_size_in_seconds)
		dataset_shape = [number_of_time_stamps, row_numbers, col_numbers]
		f.close()
	return dataset_shape

def test_function():
	print("Test has been started.")
	locations_min = np.loadtxt(fname="/home/adrian/Downloads/strands/aruba/locations.min")

	with open("/home/adrian/Downloads/strands/aruba/locations.names") as file_in:
		location_names = []
		for line in file_in:
			location_names.append(line)
	print("File has been read into the lines array")
	
	for line in location_names:
		print(line)

	print("The length of the data array is ", len(locations_min))
	print(type(locations_min))

	unique, counts = np.unique(locations_min, return_counts=True)
	dictionary = dict(zip(unique, counts))
	print(dictionary)
	
	rooms = np.array([0,1,2,3,4,5,6,7,8,9])
	number_appearances_total = np.zeros(10)
	#print(len(number_appearances))

	for room, appearances in dictionary.items():
		number_appearances_total[int(room)] = appearances

	#and now lets do everything for one day
	locations_one_day = locations_min[0:1440]
	print("Length of locations_one_day", len(locations_one_day))
	unique_day, counts_day = np.unique(locations_one_day, return_counts=True)
	dictionary_day = dict(zip(unique_day, counts_day))
	number_appearances_day = np.zeros(10)

	for room, appearances in dictionary_day.items():
		number_appearances_day[int(room)] = appearances
	
	#now we plot the total appearances and appearances for one day
#	plt.figure(1)
#	plt.subplot(211)
#	plt.bar(rooms, number_appearances_total)
#	plt.title("Person presence for 16 weeks")
#	plt.ylabel("Occurence times")
#	plt.xlabel("Rooms")
#	plt.xticks(rooms, location_names, rotation=60, fontsize=8)
#	
#	plt.show()
	
	#print("The program is still running")

	#create an array for each room for one day, filled with 1 for occupancy and 0 for empty

	print("Program check statement")
	master_bedroom = np.zeros(len(locations_one_day))
	master_bathroom = np.zeros(len(locations_one_day))
	living_room = np.zeros(len(locations_one_day))
	kitchen = np.zeros(len(locations_one_day))
	center = np.zeros(len(locations_one_day))
	corridor = np.zeros(len(locations_one_day))
	second_bedroom = np.zeros(len(locations_one_day))
	office = np.zeros(len(locations_one_day))
	second_bathroom = np.zeros(len(locations_one_day))
	outside = np.zeros(len(locations_one_day))

	idx = 0

	for location in locations_one_day:
		location = int(location)
		print("Location")
		print(location)
		print("Index")
		print(idx)

		if location == 0:
			master_bedroom[idx] = 1
		elif location == 1:
			master_bathroom[idx] = 1
		elif location == 2:
			living_room[idx] = 1
		elif location == 3:
			kitchen[idx] = 1
		elif location == 4:
			center[idx] = 1
		elif location == 5:
			corridor[idx] = 1
		elif location == 6:
			second_bedroom[idx] = 1
		elif location == 7:
			office[idx] = 1
		elif location == 8:
			second_bathroom[idx] = 1
		elif location == 9:
			outside[idx] = 1

		else:
			print("Error")
		idx += 1
	print(office.shape)
	print(office)
	
	#the master_bedroom array is saved to a global variable and the test_function terminates here
	#test_master_bedroom = master_bedroom #can this line be deleted?
	#return master_bedroom
	# exits test_function()
	#print("This print should not be displayed if everything works accordingly.")


	dummy_array = np.arange(1440)
	print("Test line before plotting the data.")

	#a plot for every room is beeing created
	#note: it is not possible using different colors for every plot, error gets thrown
	#note: using just one color for every plot for test purposes
#	fig, axs = plt.subplots(5, 2)
#    	fig.suptitle("Room occupancy for one day")
#    	axs[0, 0].step(dummy_array, np.array(master_bedroom))
#    	axs[0, 0].set_title("Master bedroom")
#    	axs[0, 1].step(dummy_array, np.array(master_bathroom))
#    	axs[0, 1].set_title("Master bathroom")
#    	axs[1, 0].step(dummy_array, np.array(living_room))
#    	axs[1, 0].set_title("Living room")
#    	axs[1, 1].step(dummy_array, np.array(kitchen))
#    	axs[1, 1].set_title("Kitchen")
#    	axs[2, 0].step(dummy_array, np.array(center))
#    	axs[2, 0].set_title("Center")
#    	axs[2, 1].step(dummy_array, np.array(corridor))
#    	axs[2, 1].set_title("Corridor")
#    	axs[3, 0].step(dummy_array, np.array(second_bedroom))
#    	axs[3, 0].set_title("Second bedroom")
#    	axs[3, 1].step(dummy_array, np.array(office))
#    	axs[3, 1].set_title("Office")
#    	axs[4, 0].step(dummy_array, np.array(second_bathroom))
#    	axs[4, 0].set_title("Second bathroom")
#    	axs[4, 1].step(dummy_array, np.array(outside))
#    	axs[4, 1].set_title("Outside")

#    	for ax in axs.flat:
#        	ax.set(xlabel='Time stamps', ylabel='Occupancy')

#    	for ax in axs.flat:
#        	ax.label_outer()


    	#plt.savefig("Room_occupancy_one_days.png")
    	plt.show()

	#and now lets do everything for one week
	locations_one_week = locations_min[0:10080]
	print("Length of locations_one_week", len(locations_one_week))
	unique_week, counts_week = np.unique(locations_one_week, return_counts=True)
	dictionary_week = dict(zip(unique_week, counts_week))
	number_appearances_week = np.zeros(10)

	for room, appearances in dictionary_week.items():
		number_appearances_week[int(room)] = appearances

	#create an array for each room for one week, filled with 1 for occupancy and 0 for empty

	print("Program check statement number 2")

	master_bedroom_week = np.zeros(len(locations_one_week))
	master_bathroom_week = np.zeros(len(locations_one_week))
	living_room_week = np.zeros(len(locations_one_week))
	kitchen_week = np.zeros(len(locations_one_week))
	center_week = np.zeros(len(locations_one_week))
	corridor_week = np.zeros(len(locations_one_week))
	second_bedroom_week = np.zeros(len(locations_one_week))
	office_week = np.zeros(len(locations_one_week))
	second_bathroom_week = np.zeros(len(locations_one_week))
	outside_week = np.zeros(len(locations_one_week))

	idx = 0
	for location in locations_one_week:
		location = int(location)
		print("Location")
		print(location)
		print("Index")
		print(idx)
		
		if location == 0:
			master_bedroom_week[idx] = 1
		elif location == 1:
			master_bathroom_week[idx] = 1
		elif location == 2:
			living_room_week[idx] = 1
		elif location == 3:
			kitchen_week[idx] = 1
		elif location == 4:
			center_week[idx] = 1
		elif location == 5:
			corridor_week[idx] = 1
		elif location == 6:
			second_bedroom_week[idx] = 1
		elif location == 7:
			office_week[idx] = 1
		elif location == 8:
			second_bathroom_week[idx] = 1
		elif location == 9:
			outside_week[idx] = 1
		else:
			print("Error")
		idx += 1
		
	# test of counting algorithm
	cumulation = (np.count_nonzero(master_bedroom_week == 1)
			+ np.count_nonzero(master_bathroom_week == 1) 
			+ np.count_nonzero(living_room_week == 1) 
			+ np.count_nonzero(kitchen_week == 1) 
			+ np.count_nonzero(center_week == 1) 
			+ np.count_nonzero(corridor_week == 1) 
			+ np.count_nonzero(second_bedroom_week == 1) 
			+ np.count_nonzero(office_week == 1) 
			+ np.count_nonzero(second_bathroom_week == 1)
			+ np.count_nonzero(outside_week == 1))

	print("The number of occupancies measured should match 10080... : ", cumulation)
	rospy.sleep(5)  

	dummy_array = np.arange(10080)

	#create a plot for every room

#	fig_week, axs_week = plt.subplots(5,2)
#	fig_week.suptitle('Room occupancy for one week')
#	axs_week[0, 0].step(dummy_array, np.array(master_bedroom_week))
#	axs_week[0, 0].set_title('Master bedroom')
#	axs_week[0, 1].step(dummy_array, np.array(master_bathroom_week))
#	axs_week[0, 1].set_title('Master bathroom')
#	axs_week[1, 0].step(dummy_array, np.array(living_room_week))
#	axs_week[1, 0].set_title("Living room")
#	axs_week[1, 1].step(dummy_array, np.array(kitchen_week))
#	axs_week[1, 1].set_title("Kitchen")
#	axs_week[2, 0].step(dummy_array, np.array(center_week))
#	axs_week[2, 0].set_title("Center")
#	axs_week[2, 1].step(dummy_array, np.array(corridor_week))
#	axs_week[2, 1].set_title("Corridor")
#	axs_week[3, 0].step(dummy_array, np.array(second_bedroom_week))
#	axs_week[3, 0].set_title("Second bedroom")
#	axs_week[3, 1].step(dummy_array, np.array(office_week))
#	axs_week[3, 1].set_title("Office")
#	axs_week[4, 0].step(dummy_array, np.array(second_bathroom_week))
#	axs_week[4, 0].set_title("Second bathroom")
#	axs_week[4, 1].step(dummy_array, np.array(outside_week))
#	axs_week[4, 1].set_title("Outside")

#	for ax in axs_week.flat:
#		ax.set(xlabel='Time stamps', ylabel='Occupancy')

#	for ax in axs_week.flat:
#		ax.label_outer()

#	plt.show()
	requested_room = outside_week	
	print("Test finished, saving the requested room states to a text file")
	np.savetxt("/home/adrian/requested_room/requested_room_states.txt", requested_room)

	return requested_room # don't change this!

def test_plot_function():
	plt.plot(test_plot_probabilities_array)
	plt.show()	


if __name__ == '__main__':
	aruba_dataset = False
	uol_dataset = True
	rospy.init_node("fremen_client")
	rospy.loginfo("The fremen_client_node has been started!")
	#example_room_one_week  = test_function()
	client = FremenClient()

	# below this is the code for the uol_dataset
	dataset_shape = compute_dataset_shape()
	print("Dataset has shape : ", dataset_shape)
	#dataset_shape = [1008, 60, 51]
	#print("Received all dataset informations.")
	# The informations above should be shared to all files via an extern .yaml file
	# Change of dataset_shape[0] needs to also be changed in client-functions
	#convert_data_from_database_to_binary_cell_arrays(dataset_shape)
	#convert_data_to_binary_cell_arrays(dataset_shape)
	#client.add_cells_uol(dataset_shape)
	#print("Each cell has been added to the server.")
	client.predict_cells_uol(dataset_shape, order=5)
	print("Predictions have been made for each cell up to the desired order")
	#client.evaluate_cells_uol(dataset_shape, order=80)
	#print("Evaluations have been made for each cell up to the desired order")

	exit()

	client.requested_cell = example_room_one_week
	print(type(client.requested_cell))
	print("Number of occurences of 1 ", np.count_nonzero(example_room_one_week == 1))
	client.times_array = np.linspace(60, 604800.0, num=10080, endpoint=True)  #for one week we need 10080 dates for every 60 seconds. Should array start at 0.0 0r 60.0???
	print(type(client.times_array))
	print("The requested cell array has a length of ", len(client.times_array))
	print(client.times_array[0])
	print(client.times_array[-1])
	rospy.loginfo("Client has been constructed. Master bedroom array has been copied.")
	client.add_cell()
	#for testing purposes we call the predict method up to the order 5, save it to separate text files, and plot it with a PyCharm program
	for order in range(100):
		client.predict_cell(order)
	print("finished prediction, now comes the evaluation")
	client.evaluate_cell()
	print("Process finished...")

	rospy.spin()

