*! version 1.2.5  11jan2021

capture program drop ucol

program ucol
	quietly {

		if "`0'" == "open" | "`0'" == "o" | "`0'" == "dialog" | "`0'" == "Open " | "`0'" == "open dialog" {
			navigate app
			db ui2
			noisily {
				di as text "*	*	*	*	*	*"
				di as result "OneDrive Tool Launched"
				exit
			}
		}
// 		if "`0'" == "data" {
//			
// 		}
		else {
			noisily {
				di as text "*	*	*	*	*	*	*	*	*	*"
				di as error "-> ", as text "No command provided or unrecognized command after ucol."
				di as error "-> ", as text "To open the data management tool, type: ucol open"
				di as text "❓ For help, type: help ucol"
				exit
			}
		}
	}	
end
