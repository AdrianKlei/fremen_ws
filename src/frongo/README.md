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

