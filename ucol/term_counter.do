clear *

//Merges term counters with updated student roster master
cd "$main_data_path"
local SR_master_list : dir "." files "UCOL_200910*"
foreach SR_master in `SR_master_list' {
	use `SR_master'
	
	local SR_filename = subinstr("`SR_master'", ".dta", "", .)
	local SR_timestamp = subinstr("`SR_filename'", "UCOL_200910-", "", .)
	
	destring TERM, generate(TERM_int)
	bysort ID (TERM_int): egen Begin_Term = min(TERM_int)
	bysort ID (TERM_int): egen End_Term = max(TERM_int)
	
	cd "$main_data_path/additional_data"
	merge m:1 Begin_Term using "begin_term_counter_5_1.dta"
	drop if _merge<3
	drop _merge
	
	merge m:1 End_Term using "end_term_counter_5_1.dta"
	drop if _merge<3
	drop _merge
	
	gen Term_Count = End_Count - Begin_Count + 1
	drop End_Count Begin_Count TERM_int
	tostring ID, replace
	
	cd "$graduates_path/current"
	local current_unique_list : dir "." files "current_UNIQUE*"
	foreach current_unique in `current_unique_list' {
		merge m:1 ID using `current_unique'
		drop if _merge==2
		drop if PROGRAM=="Non-Degree Women's Coll (Spec)" | PROGRAM=="Certificate-Women's College" | PROGRAM=="Bachelor of Arts-Women's Coll"
		
		
		cd "$output_path/current"
		local delete_list : dir "." files "*"
		foreach delete in `delete_list' {
			erase `delete'
		}
		save "current_TERMCOUNT_200910-`SR_timestamp'.dta", replace
		save "$output_path/term_count/TERMCOUNT_200910-`SR_timestamp'.dta", replace
	}
}

cd "$app_path"
