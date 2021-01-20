//last edited jan 11 2021 6:55pm
capture program drop navigate
program navigate
		
		if "`0'" == "onedrive" | "`0'" == "OneDrive" | "`0'" == "sharepoint" | "`0'" == "shared library" {
			cd "$stem"
			exit
		}
		if "`0'" == "repo" | "`0'" == "repository" | "`0'" == "Repository" {
			cd "$repo_path"
			exit
		}
		if "`0'" == "code" | "`0'" == "function path" | "`0'" == "Code" {
			cd "$code_path"
			exit
		}
		if "`0'" == "app" | "`0'" == "tool" | "`0'" == "ucol" | "`0'" == "App" {
			cd "$app_path"
			exit
		}
		if "`0'" == "reports" | "`0'" == "Reports" | "`0'" == "rep" | "`0'" == "r" {
			cd "$reports_path"
			exit
		}
		if "`0'" == "stata" | "`0'" == "s" | "`0'" == "Stata" | "`0'" == "STATA" {
			cd "$stata_path"
			exit
		}
		if "`0'" == "output" | "`0'" == "out" {
			cd "$output_path"
			exit
		}
		if "`0'" == "data" | "`0'" == "main data" {
			cd "$main_data_path"
			exit
		}

		//add location here as needed
		
		else {
		    di as text "*	*	*	*	*	*	*	*	*	*"
			di as error "-> ", as text "No destination provided or unrecognized destination. Current location below"
			pwd
			di as text "❓ For help, type: help navigate"
			exit
		}
	}
end
