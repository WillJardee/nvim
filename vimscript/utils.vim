function GetCommentMarker()
  if len(split(&l:commentstring, '%s')) == 1
    " if 'commentstring' xx%sxx contains no end part
    return split(&l:commentstring, '%s')[0]
  elseif match(&l:comments, '\v(,|^):[^,:]*(,|$)')
    " if 'comments' contains ',:xxx,'
    return matchstr(&l:comments, '\v(,|^):\zs[^,:]*\ze(,|$)')
  else
    echoerr "unable to find line comment marker."
  endif
endfunction

function GetBlockCommentMarks()
  if len(split(&l:commentstring, '%s')) == 2
    " if 'commentstring' xx%sxx contains start and end part
    return split(&l:commentstring, '%s')
  endif

  let three_comment = matchstr(&l:comments, '\v(,|^)\zss[^O]{-}:.{-},m.{-}:.{-},e.{-}:.{-}\ze(,|$)')
  if three_comment != ""
    " if 'comments' contains s:xx,m:xx,e:xx
    let start_comment = matchstr(three_comment, '\v^s.{-}:\zs.{-}\ze,')
    let end_comment   = matchstr(three_comment, '\v,e.{-}:\zs.{-}\ze$')
    return [start_comment, end_comment]
  endif
  echoerr "unable to find block comment markers."
endfunction
