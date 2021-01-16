//report

//move
navigate output
cd current

//fetch output file
local files : dir "$data\qcew\2014" files "*.csv"
foreach file in `files' {
  dir `file'
}
