setlocal indentexpr=GetMarkdownIndent()
setlocal autoindent

" Automatically continue blockquote on line break
setlocal formatoptions+=r
setlocal comments=b:>
if get(g:, "vim_markdown_auto_insert_bullets", 1)
    " Do not automatically insert bullets when auto-wrapping with text-width
    setlocal formatoptions-=c
    " Accept various markers as bullets
    setlocal comments+=b:*,b:+,b:-
endif

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
