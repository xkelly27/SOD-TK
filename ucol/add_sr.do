clear *
local import_path = "$stem/RawData_`1'"

//Import student roster file and save to student roster directory as dta file, then append to student roster master file
cd "`import_path'"
local import_roster : dir . files "DU_Student_Roster*"
foreach roster_file in `import_roster' {
	import excel using `roster_file', firstrow clear
	drop if REGISTRATIONSTATUS==""
	drop if missing(real(ID))
	destring ID, replace
	local roster_filename = subinstr("`roster_file'", ".xlsx", "", .)
	local roster_timestamp = subinstr("`roster_filename'", "DU_Student_Roster_", "", .)
	save "`student_roster_path'/dta_files/`roster_filename'.dta", replace
	
	//Erase contents of current student roster folder and replace with new student roster (SR) import
	cd "$student_roster_path/current"
	local old_SR_list : dir "." files "*"
	foreach old_SR in `old_SR_list' {
		erase `old_SR'
	}
	
	save "$student_roster_path/current/current_`roster_filename'.dta", replace
}

cd "$app_path"
