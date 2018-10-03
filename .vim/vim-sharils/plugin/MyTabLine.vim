set tabline=%!MyTabLine()

function MyTabLine()
	let tabline = ''
	for i in range(tabpagenr('$'))
		" set label group for highlight
		let labelGroup = (i + 1 == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')

		" select the highlighting
		let tabline .= labelGroup

		" set the tab page number (for mouse clicks)
		let tabline .= '%' . (i + 1) . 'T'

		" find if tab is modified for modifiy sign
		" Add '+' if one of the buffers in the tab page is modified
		let buflist = tabpagebuflist(i + 1)
		let mod = ''
		for bufnr in buflist
			if getbufvar(bufnr, "&modified")
				let mod = '+'
				break
			endif
		endfor

		" define the tab name
		let winnr = tabpagewinnr(i + 1)
		let name = bufname(buflist[winnr - 1])
		if name != ''
			" get only the file name
			let name = pathshorten(name)
		elseif &buftype == 'quickfix'
			" give a name to no-name documents
			let name = '[Quickfix List]'
		else
			let name = '[No Name]'
		endif

		" set the label
		let tabline .= ' '
		let tabline .= (i + 1 == tabpagenr() ? '%#Title#' : '')
		let tabline .= (i + 1)
		let tabline .= labelGroup
		let tabline .= mod
		let tabline .= ' ' . name . ' '
	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let tabline .= '%#TabLineFill#%T'

	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let tabline .= '%=%#TabLine#%999Xclose'
	endif

	return tabline
endfunction
