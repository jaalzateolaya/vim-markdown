setlocal indentexpr=GetMarkdownIndent()
setlocal autoindent

" Automatically continue blockquote on line break
setlocal comments+=b:>

setlocal formatlistpat=^\\s*[-\\d+*]\\+[]:.)}\\t\ ]\\s*

function! s:IsHeaderLine(line)
    return a:line =~ '^\s*#'
endfunction

function! s:IsBlankLine(line)
    return getline(a:line) =~ '^\s*$'
endfunction

function! GetMarkdownIndent()
    let cline = getline(v:lnum) " Current line
    if !s:IsBlankLine (cline) && s:IsHeaderLine(cline)
        return 0
    endif
    return -1
endfunction
