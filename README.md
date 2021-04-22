
<p align="center"><img src="docs/university-of-denver-shield.svg" width="70"/></p>

# Stata OneDrive Toolkit

## Description

This toolkit is intended to ease data management on the OneDrive ```ucol_data``` shared library for the University of Denver.

## Requirements

The following requirements need to be met:	<br />
1. Stata/IC, Stata/SE or Stata/MP (version 12 or later)	<br />
2. OneDrive ```ucol_data``` synced at the following location on your device:
   - MacOS: ```/Users/john_doe/University of Denver/ucol_data-g - Documents```
   - Windows: ```C:\Users\john_doe\OneDrive - University of Denver\Shared Documents```

## OneDrive Structure

```
.
├── ...					
├── ucol_data-g					
│   ├── other            			
│   └── repository				           
│   	├── code (SOD-TK folder) 	       
│   	├── main_data				
|	├── output				
│   	└── reports				
	
```


## Commands
| Command        | Description   |
| -------------  | ------------- |
| ```ucol```     | main tools    |
| ```navigate``` | move around   |
| ```goodbye```  | leave         |


## Contact
xavier.kelly@du.edu
