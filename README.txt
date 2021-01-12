				

				          [OneDrive Tool | UCOL]

				         --Last updated: Jan 11 2021--

    
					       DESCRIPTION


	This tool (app) is intended to automate UCOL data on the OneDrive Ucol_data-g shared library. 
	Along with .dta files, the app itself is hosted on the synced library.

	This app needs the following to run:
		1. STATA (version 16 or later)
		2. OneDrive Data_ucol-g synced at the following location on your device:
			For MacOSX users: /Users/"user"/University of Denver/Data_ucol-g - Documents
			For Windows users: C:\Users\"user"\OneDrive - University of Denver\Shared Documents

			Note: "user" = user-specific value - this is automatically checked


				         REPOSITORY STRUCTURE OVERVIEW


	Data_ucol-g OneDrive Structure:			|		Notes:
	-> Data_ucol-g (!)(r)				|	(!) = contains code
		-> repository (!)(r)			|	(r) = folder is a data repository
			-> code (!)			|	
				-> ado (!)		|	
				-> app_v1 (!)		|	
			-> main_data (r)		|	
			-> output (r)			|
			-> reports (r)			|
		-> ** other files **			|

				
					 LINKING STATA TO THE REPOSITORY

	
	In order to run the process and open the dialog box, run the linkOneDrive.do file found 
	in the code folder (see above). Make sure the "connected to OneDrive" icon appears in
	command log - if this doesn't work, the shared library is most likely not in the correct
	path. See 2. in the DESCRIPTION section.
	
	Once successfully linked, type "ucol open" to open the user interface (dialog box). (note: reports tab in progress)

					
					LINK STATA AUTOMATICALLY ON STARTUP


	If you'd like to avoid having to run linkOneDrive.do every time you start STATA, complete
	the following steps.
		1. MAKE A COPY of the linkOneDrive.do file (found in repository/code)
		2. Rename the file profile.do
		3. On Mac: go to the following path: /Applications/Stata
--------------------On Windows: go to the following path: C:\!!!!!!!!!!!!!!!!
		4. Drop the profile.do file, and if you have STATA open, restart it
		5. On startup, you should be able to see the "connected to OneDrive" icon in the command log
