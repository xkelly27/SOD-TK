quietly {
	
	
	/*
	
	
	TO LINK STATA TO THE SYNCED ONEDRIVE (SHAREPOINT) REPOSITORY, PLEASE RUN THIS FILE
	
	
	*/


	if `"`c(os)'"' == "MacOSX" {
		local root = "/Users/`c(username)'"
		global stem = `"`root'/University of Denver/ucol_data-g - Documents"'
	}
	
	if `"`c(os)'"' == "Windows" {
		local root = "C:/Users/`c(username)'"
		global stem = `"`root'/OneDrive - University of Denver/Shared Documents"'
	}
	
	/*
	
	Create fixed paths for locations within the repositories
	
	As global macros (variables), these will be available for use within STATA once this file has run
	
	NOTE: If folder paths change, edit the global macros below
	
	*/
	
	
	global stata_path = "`c(sysdir_stata)'"
	global repo_path = "$stem/repository"
	
	global main_data_path = "$repo_path/main_data"
	global reports_path = "$repo_path/reports"
	global output_path = "$repo_path/output"
	global code_path = "$repo_path/code"
	
	global student_roster_path = "$main_data_path/student_roster"
	global graduates_path = "$main_data_path/graduates"
	
	global app_path = "$code_path/ucol"
	global ado_path = "$code_path/ado"
	
	
	/*


	Link STATA to OneDrive (repository)


	*/
	
	
	/*
		visual aid for mac in progress
	*/
	
	
	capture confirm file "$code_path/linkOneDrive.do"
	if _rc {
			noi di
			noi di "OneDrive not synced or Synced at incorrect location"
			noi di as error "Correct location ->", as text "$stem"
			exit
	}
	else {
		adopath + "$ado_path"
			foreach dummy in dummy {
				noisily di
				noisily di as text "*	*	*	*	*	*	*"
				noisily di as result "	   Connected to OneDrive | ucol_data-g"
				noisily di as text "*	*	*	*	*	*	*"
			}                                              
	}
}               
