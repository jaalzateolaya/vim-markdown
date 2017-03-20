if exists("b:did_indent") | finish | endif
let b:did_indent = 1

setlocal indentexpr=GetMarkdownIndent()
setlocal nolisp
setlocal autoindent

" Automatically insert bullets
setlocal formatoptions+=r
" Do not automatically insert bullets when auto-wrapping with text-width
setlocal formatoptions-=c
" Accept various markers as bullets
setlocal comments=b:*,b:+,b:-

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
