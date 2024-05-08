let g:lexima_ctrlh_as_backspace = 1

call lexima#add_rule({ 'filetype': ['rust'], 'char': '<', 'input_after': '>' })

call lexima#add_rule({ 'filetype': ['rust'], 'char': '<BS>', 'input': '<BS>', 'at': '<\%#>', 'delete': 1 })
