//Append to student roster (SR) master in main data, clean and then update (replaces new append) - Note: ID saved as numeric (destring)
clear *

cd "$student_roster_path/current"
local current_SR_list : dir "." files "current_*"
foreach current_SR in `current_SR_list' {
	use `current_SR'
	destring ID, replace
	capture confirm variable UC, exact
	
	if !_rc {
		keep UC
	}
	else {
		generate UC=""
	}

	replace UC="Yes" if PROG=="Specialized Grad. Certificate" & MAJOR_DESC!="Systems Engineering"
	replace UC="Yes" if strpos(PROGRAM, "Univ Coll") | strpos(PROGRAM, "Women's Coll")
	replace UC="Yes" if PROGRAM=="Certificate-University College" | PROGRAM=="Certificate-Women's College"
	replace UC="Yes" if PROGRAM=="Master of Professional Studies"
	replace UC="Yes" if PROGRAM=="Master of Liberal Studies"
	replace UC="Yes" if PROGRAM=="Master of Applied Science"
	replace UC="Yes" if PROGRAM=="Non-Degree Cont Ed UCOL"
	replace UC="Yes" if PROGRAM=="Non-Degree UCOL BACP"
	replace UC="Yes" if PROGRAM=="Non-Degree Women's Coll (Spec)"
	keep if UC=="Yes"
	drop UC
	
	local ucol_filename = subinstr("`current_SR'", ".dta", "", .)
	local ucol_timestamp = subinstr("`ucol_filename'", "current_DU_Student_Roster_", "", .)
	save "ucol.dta", replace
	clear
}

cd "$main_data_path"
local ucol_master_list : dir "." files "UCOL_200910*"
foreach ucol_master in `ucol_master_list' {
	use  `ucol_master'
	erase `ucol_master'
	
	cd "$student_roster_path/current"
	local ucol_delete_list : dir "." files "ucol*"
	foreach ucol_delete in `ucol_delete_list' {
		append using "`ucol_delete'"
		erase `ucol_delete'
	}
	cd "$main_data_path"
	save "UCOL_200910-`ucol_timestamp'.dta", replace
}

cd "$app_path"
