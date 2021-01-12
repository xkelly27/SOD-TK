clear *

//tableau end product
cd "$output_path/current"
local tableau_data : dir "." files "current_*"
foreach tableau_file in `tableau_data' {
	use "`tableau_file'"
	
	local step2_file = subinstr("`tableau_file'", ".dta", "", .)
	local step2_timestamp = subinstr("`step2_file'", "current_TERMCOUNT_", "", .)
	
	generate PROGRAM2=""
	replace PROGRAM2="BA" if PROGRAM=="Bachelor of Arts-Univ College" | PROGRAM=="Bachelor of Arts-Women's Coll"
	replace PROGRAM2="CERT-6" if PROGRAM=="Certificate-University College" | PROGRAM=="Certificate-Women's College"
	replace PROGRAM2="CERT-4" if PROGRAM=="Specialized Grad. Certificate"
	replace PROGRAM2="MA" if PROGRAM=="Master of Applied Science" | PROGRAM=="Master of Arts-Univ College" | PROGRAM=="Master of Liberal Studies" | PROGRAM=="Master of Professional Studies" | PROGRAM=="Master of Science-Univ College"
	replace PROGRAM2="ND" if PROGRAM=="Non-Degree Cont Ed UCOL" | PROGRAM=="Non-Degree UCOL BACP" | PROGRAM=="Non-Degree Univ Coll" | PROGRAM=="Non-Degree Women's Coll (Spec)"
	generate student_type=""
	replace student_type="returning"
	drop TERM_int
	destring TERM, generate(TERM_int)
	replace student_type="new" if TERM_int==Begin_Term
	drop TERM_int
// 	sort ID TERM
	generate qrtr = substr(TERM, -2, 2)
	generate Quarter_Type = "winter" if qrtr=="10"
	replace Quarter_Type = "spring" if qrtr=="30"
	replace Quarter_Type = "summer" if qrtr=="50"
	replace Quarter_Type = "fall" if qrtr=="70"
	generate yr = substr(TERM, 1, 4)
	generate mnth = "1" if qrtr=="10"
	replace mnth = "4" if qrtr=="30"
	replace mnth = "7" if qrtr=="50"
	replace mnth = "10" if qrtr=="70"
	generate Term_Date = mnth + "\" + "15" + "\" + yr
	destring yr, replace
	destring qrtr, replace
	replace yr = yr + 1 if qrtr > 40
	tostring yr, replace
	generate FY_flag = "FY" + substr(yr, -2, 2)
	drop qrtr yr mnth
	generate Completion_Status = "non-completer"
	tostring End_Term, replace
	replace Completion_Status = "current" if End_Term=="202070"
// 	sort ID
	by ID PROGRAM2, sort : gen pgmnum = _n == 1
	by ID: gen pgmnum2 = sum(pgmnum)
	by ID: gen pgmnum3 = pgmnum2[_N]
	generate PROGRAM3_multi = PROGRAM2
	replace PROGRAM3_multi = "multi" if pgmnum3>1
	rename pgmnum3 degrees_pursued
	drop pgmnum pgmnum2
	generate Complicated_Student = "no"
	replace Complicated_Student = "yes" if PROGRAM3_multi=="multi" 
	replace Complicated_Student = "yes" if Degrees_Awarded==2 
	replace Complicated_Student = "yes" if Degrees_Awarded==3 
	replace Complicated_Student = "yes" if Degrees_Awarded==4 
	replace Complicated_Student = "yes" if Degrees_Awarded==5 
	replace Complicated_Student = "yes" if Degrees_Awarded==6 
// 	sort ID
	
	save "$output_path/end_data/tableau_`step2_timestamp'.dta", replace
// 	export excel using "`base_path'\tableau\output\step_3\UC_tableau_furtherClean_201050`step2_timestamp'.xlsx", firstrow(variables)
}
