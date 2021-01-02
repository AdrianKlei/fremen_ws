# frongo
The **frongo** package is a Frequency Map Enhancement (FreMEn)-based extension for MongoDB. It enables the possibility, to extract information from cells of an occupancy grid stored in a MongoDB database and execute a spectral analysis of each cell using FreMEn. Thus, for each cell a model is created, allowing predictions of a cell's occupancy probability p(t) (*binary case*) or a cell's arrival-rate time series \lambda (t). 
A single entry of the occupancy grid has to follow the displayed format:
```python
entry = {
	string cell_name
	float time_stamp
	float/bool state
}
```
The cell's state format can be either a *boolean* or a *float* value. In the binary case the state reflects the cell's occupancy state, in the non-binary case it reflects the cell's arrival-rate.
To establish a connection between the **FremenServer** and **frongo**, the **FremenServer** needs to be up and running:
```
$ rosrun fremenserver fremenserver
```
To start **frongo**, open a terminal and run:
```
$ rosrun frongo fremeniser.py
```
And new rectangular grid can be inserted by calling the service:
```
$rosservice call /frongo/add_*occupancy_*grid
```
The service creates a grid with specifications defined in a .yaml-file, which, e.g., could be of the format:
```YAML
rows: 50			# The grid's rows number
cols: 60			# The grid's columns number
db: occupancy_grid_number_1	# The db name including the grid information
collection: cell_recordings	# The collection including the cells information
timestamp_field: timestamp	# This is the field where the timestamp is within the entry
data_field: state		# This is the field where the value to be modeled is found
data_type: boolean		# This is the type of the data to be modeled. Can be 'boolean' for occupancy probabilities or 'float' for arrival-rates
timestamp_type: epoch		# This is the type of timestamp corresponding to each entry of the collection
```

## Set up the MongoDB address and port
The MongoDB address and port can be set via rosparams:
```
$ rosparam set /mongodb_host <your mongodb server address>
$ rosparam set /mongodb_port <your mongodb server port>
```

## Working with the occupancy grid models
Once the connection between **frongo** and the **FremenServer** is established and the /frongo/add_occupancy_grid service has been called, a spectral analysis of the grid can be executed by:
```
$ rostopic pub /fremenserver_start
```
After the computation is finished, several services can be used for further analysis. Predictions of a state's occupancy or an interval arrival-rate can be done by using the /frongo/predict_models service:
```
string model_name # The name of the model to be predicted
uint32[] epochs # The list of epochs you want the prediction for
---
uint32[] epochs # The list of epochs the prediction was made for
float64[] predictions # the list of predictions made for each epoch on the top list
```
The above mentioned service hereby uses the optimal FreMEn-order to compute the predictions. To get predictions with a certain order, call the /frongo/predict_models_with_order service:
``` 
string model_name
int32 order
uint32[] epochs
---
uint32[] epochs
float64[] predictions
```
Due to the, depending on the occupancy grid size, long computation time of the FreMEn-models, it is good practice to save the spectral parameters of each cell. Call the service /frongo/save_grid :
```
string grid_name	# The name of the grid under which you want the parameters to be saved
---
bool result		# Info, if the saving process was successful or not
```
To load an occupancy grid, for which to parameter computation has already been done, make sure the **FremenServer** is up and running:
```
$ rosrun fremenserver fremenserver
```
Then load the grid by calling the /frongo/upload_grid service:
```
string grid_name
---
bool result
```




