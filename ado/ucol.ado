capture program drop ucol

program ucol
	quietly {

		if "`0'" == "open" | "`0'" == "o" | "`0'" == "dialog" | "`0'" == "Open " | "`0'" == "open dialog" {
			navigate app
			db _dialog
			noisily {
				di as error "->", as result "OneDrive Tool Launched"
				exit
			}
		}

		if "`0'" == "connect" | "`0'" == "Connect" | "`0'" == "link"   {
			navigate code
			noi do linkOneDrive
			exit
		}
		//fix	
		//	if "`0'" == "commands" | "`0'" == "help" | "`0'" == "list" {
		//		di as error "ucol command list:", as text "[open, connect, help]"
		//	}
			
		else {
			noisily {
				di as error "-> ", as text "No command provided or unrecognized command after ucol."
				di as text "❓ For list of cmds, type: ucol help"
				exit
			}
		}
	}
end
