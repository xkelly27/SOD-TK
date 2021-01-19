//last edit Jan 2 2021
clear *

//import excel using "$output_path/current/step3.xlsx", firstrow clear
use step3

by ID, sort: gen nvals = _n == 1
count if nvals>0
local student_count = r(N)



quietly {
	// //Report will be saved in the following location
	// cd "$output_path/current"

	// //the process should be included within the following for loop
	// local output_data : dir "." files "*"
	// foreach output in `output_data' {
	// 	//FYI "output" file is the step3 file
	// 	use "`output'"
		
		//NOTE: THE FILE ALREADY INCLUDES EMAILS (for Andrea G)
		
		//merge in active - need to confirm which file version to merge with.
		
		//completion status tag???
		
		//flatten files
		
		/*
		Wendy notes
		methodology 202070 Enrollment Status Tag
		enrolled 202070 >0 crhrs
		deferred = 202070 expected start w/ 0crhrs
		drop/withdraw in 202070 (0 ttl fall);  <202070 start & sum prior crhrs
		stopout  no banner event 202070;  <202070 start & sum prior crhrs
		maybe stopout_1q stopout 1q+? Chris mentioned
		future start = >202070 expected start & 0 crhrs
		enrolled - early start = >202070 but enrolled for crhr

		methodology 2022110_to date tag
		enrolled 202110 >0 crhrs; note grad tag too
		not registered = 202110 expected (exclude 202070 graduates); note grad tag  and crhrs too
		drop/withdraw in 202110 (0 ttl winter);  <202110 start & sum prior crhrs
		
		*/
		
		//enrollment status tags
		
		//disney report



	//WENDY COMMENTS FORECASTING FILE
	/*


	This is the perfect time to integrate Xavier's code
	compare my step#3 to XK's just for last check

	go back and figure out how to integrate emails into dataset (for andrea gross into this code)

	merge in actives and create active_111920 current date tag
	this could get messy. remember that we need to have major and program even if not on roster
	think this through

	work on completion status tag - this might not work anymore if we redefine non-completer etc.
	look into program_sum and major_mutli

	change "endterm to "last term enrolled" - endterm is misleading -- maybe do this in step#3 data
	sync up with Xavier to ensure his code matches mine

	Flatten file "pivot" so one row per unique with credits by term summed up and total to date
	//average things like termcount

	methodology 202070 Enrollment Status Tag
	enrolled 202070 >0 crhrs
	deferred = 202070 expected start w/ 0crhrs
	drop/withdraw in 202070 (0 ttl fall);  <202070 start & sum prior crhrs
	stopout  no banner event 202070;  <202070 start & sum prior crhrs
	maybe stopout_1q stopout 1q+? Chris mentioned
	future start = >202070 expected start & 0 crhrs
	enrolled - early start = >202070 but enrolled for crhr

	methodology 2022110_to date tag
	enrolled 202110 >0 crhrs; note grad tag too
	not registered = 202110 expected (exclude 202070 graduates); note grad tag  and crhrs too
	drop/withdraw in 202110 (0 ttl winter);  <202110 start & sum prior crhrs

	spit out final flat All UCOL file
	and final flat Disney file

	then create disney reports.

	Reports to create
	email report - Active Disney's
	Active Student Pivot by program and major
	finally have a way to compare these active student files such that we know what changed data pull over data pull

	This will become valuable at some point. Think it through
	duplicate Disney report for all UCOL Guild and non-Guild
	term order
	stop out term


*/
	
}

