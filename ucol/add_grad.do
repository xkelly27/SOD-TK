clear *
local import_path = "$stem/RawData_`1'"

//Import new Graduates file and appends to master graduates file in main_data folder
cd "`import_path'"
local graduates_files : dir "." files "Graduates*"
foreach graduates_file in `graduates_files' {
	import excel using `graduates_file', firstrow clear
	local graduates_filename = subinstr("`graduates_file'", ".xlsx", "", .)
	local graduates_timestamp = subinstr("`graduates_filename'", "Graduates_", "", .)
	save "$graduates_path/dta_files/GRAD_`graduates_timestamp'.dta", replace
	
	cd "$graduates_path/current"
	local old_current : dir "." files "*"
	foreach old_curr in `old_current' {
		erase `old_curr'
	}
	save "$graduates_path/current/current_GRAD_`graduates_timestamp'.dta", replace
	clear
}

cd "$app_path"
