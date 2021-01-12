*! version 1.2.5  31dec2020

capture program drop ucol

program ucol
	quietly {

		if "`0'" == "open" | "`0'" == "o" | "`0'" == "dialog" | "`0'" == "open " | "`0'" == "open dialog" {
			navigate app
			db ui2
			noisily {
				di as result "OneDrive Tool | UCOL Launched 🚀"
			}
		}
		else {
			noisily {
				di as error "Please enter a valid command after ucol"
				di as text "To open the Data Management Tool, type: ucol open"
				di as text "❓ For help, type: help ucol"
			}		
		}
	}	
end
