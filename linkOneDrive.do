quietly {
	
	
	/*
	
	
	TO LINK STATA TO THE SYNCED ONEDRIVE (SHAREPOINT) REPOSITORY, PLEASE RUN THIS FILE
	
	
	*/


	if `"`c(os)'"' == "MacOSX" {
		local root = "/Users/`c(username)'"
		global stem = `"`root'/University of Denver/Data_ucol-g - Documents"'
		global stata_path = "/Applications/Stata/"
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
	
	
	capture confirm file "$stem"
	if _rc {
		noisily {
			di
			di "ERROR: OneDrive not synced or at incorrect location"
			di "The following location should be used"
			di "$stem"
			exit
		}	
	}
	else {
		adopath + "$ado_path"
			foreach dummy in dummy {
				noisily di
				noisily di as text "⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷"
				noisily di as result "🌐     Connected to OneDrive     🌐" 
				noisily di as text "⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷⩷"   
		}                                              
	}
}               
