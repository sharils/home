function FormatInlineList()
	silent mark m
	silent s/\v(\()@<=.*(\))@=/\t&/g
	silent -
	silent s/\v(\,)@<=\s*/\t/g
	silent normal `m
endfunction
