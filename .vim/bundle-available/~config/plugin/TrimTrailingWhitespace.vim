function TrimTrailingWhitespace()
	%s/\v\s+$| +\ze\t|%(\n+|\n@<=)%$//g
endfunction
