nmap <LEADER>df :call DiffText(@d, @f)<CR>
nmap <LEADER><LEADER>df :call WipeOutDiffs()<CR>

let g:diffed_buffers=[]

function DiffText(left, right)
	tabnew
	setlocal buftype=nowrite
	call add(g:diffed_buffers, bufnr('%'))
	call setline(1, split(a:right, '\n'))
	diffthis
	vnew
	setlocal buftype=nowrite
	call add(g:diffed_buffers, bufnr('%'))
	call setline(1, split(a:left, '\n'))
	diffthis
endfunction

function WipeOutDiffs()
	for buffer in g:diffed_buffers
		execute 'bwipeout! '.buffer
	endfor
	let g:diffed_buffers=[]
endfunction
