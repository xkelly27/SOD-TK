clear *

//Appends current graduate file with graduates master and replaces it
	
cd "$main_data_path"
local graduates_master_list : dir "." files "GRAD*"
display `graduates_master_list'
foreach graduates_master in `graduates_master_list' {
	
	use `graduates_master'

	cd  "$graduates_path/current"
	local current_graduates : dir "." files "*"
	foreach current_g_file in `current_graduates' {
		
		local grad_file = subinstr("`current_g_file'", ".dta", "", .)
		local grad_timestamp = subinstr("`grad_file'", "current_GRAD_", "", .)
		
		append using `current_g_file'
		
		drop if TermGraduated=="202050" | TermGraduated =="202070"
		keep if COLLEGE_DESC=="University College"
		capture drop obsnum Degrees_Awarded TERM_int GradDate_Last 
		bysort ID (TermGraduated): gen obsnum = _n
		bysort ID (TermGraduated): gen Degrees_Awarded = _N
		destring TermGraduated, generate(TERM_int)
		bysort ID (TERM_int): egen GradDateLast = max(TERM_int)
		rename GradDateLast GradDate_Last
		
		cd "$main_data_path"
		local delete_list : dir "." files "GRAD_200910*"
		foreach delete in `delete_list' {
			erase `delete'
		}
		save "GRAD_200910-`grad_timestamp'.dta", replace

		capture keep if Degrees_Awarded==obsnum
		capture drop obsnum Minor MinorDescription TermGraduatedDescription
		rename Degree First_Degree
		rename DegreeDescription First_DegreeDescription
		rename Major First_Major
		rename MajorDescription First_MajorDescription

		save "$graduates_path/dta_files/UNIQUE_GRAD_200910-`grad_timestamp'.dta", replace
		save "$graduates_path/current/current_UNIQUE_GRAD_200910-`grad_timestamp'.dta", replace
	}
}

cd "$app_path"
