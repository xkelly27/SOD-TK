//Append to student roster (SR) master in main data, clean and then update (replaces new append) - Note: ID saved as numeric (destring)

clear *

cd "$main_data_path"
local old_SR_master_list : dir "." files "DU_200910*"
foreach old_SR_master in `old_SR_master_list' {
	use `old_SR_master'
	
	cd "$student_roster_path/current"
	local current_SR_list : dir "." files "*"
	foreach current_SR in `current_SR_list' {
		append using "`current_SR'"
		local sr_filename = subinstr("`current_SR'", ".dta", "", .)
		local sr_timestamp = subinstr("`sr_filename'", "current_DU_Student_Roster_", "", .)
		
		cd "$main_data_path"
		local delete_list : dir "." files "DU_200910*"
		foreach delete in `delete_list' {
			erase `delete'
		}
		save "DU_200910-`sr_timestamp'.dta", replace
	}
}

cd "$app_path"
