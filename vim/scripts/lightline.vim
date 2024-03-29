" Configuración de LightLine

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [
      \             [ 'winnr', 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ],
      \             [ 'ctrlpmark' ]
      \           ],
      \   'right':  [
      \             [ 'lineinfo' ],
      \             [ 'filetype' ]
      \           ]
      \ },
      \ 'inactive': {
      \   'left': [
      \             [ 'winnr' ],
      \             [ 'filename' ]
      \           ],
      \   'right':  [
      \             [ 'lineinfo' ]
      \           ]
      \ },
      \ 'component_function': {
      \   'fugitive':  'LightLineFugitive',
      \   'readonly':  'LightLineReadonly',
      \   'modified':  'LightLineModified',
      \   'filename':  'LightLineFilename',
      \   'filetype':  'LightLineFiletype',
      \   'mode':      'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \   'winnr':     'LightLineWinnr',
      \   'lineinfo':  'LightLineLineInfo'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if expand('%:t') !~? 'NERD' && exists("*fugitive#head")
    let _ = fugitive#head()[ : 8]
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  let fname = expand('%')
  let width = winwidth(0) - 50
  let fname_disp = width > strlen(fname) ? fname : fname[ -1 * width : ]
  " let fname_disp = winwidth(0) > 100 ? expand('%') : expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
       \ fname =~ 'NERD_tree' ?  '' :
       \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != fname ? fname_disp : '[no name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFiletype()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? '' :
        \ strlen(&filetype) ? &filetype : ''
endfunction

function! LightLineMode()
  let fname = expand('%')
  return fname =~ 'NERD_tree' ?  '' :
         \ winwidth(0) > 60 ? lightline#mode()[ : 2] : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

function! LightLineWinnr()
  let fname = expand('%')
  return fname == "ControlP" ? '' :
      \ winnr('$') == 1 ? '' : winnr()
endfunction

function! LightLineLineInfo()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? '' :
        \ printf("%3d:%-2d", line('.'), col('.'))
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

" -------------------------------------------------------------------------------------------------
