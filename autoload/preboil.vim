" vim: et sw=4 sts=4

" Plugin:		https://github.com/EightSQ/vim-preboil
" Description:	A parameterizable templating script
" Maintainer:	EightSQ <https://blog.eletronvo.lt>

if exists('g:autoloaded_preboil') || &cp
    finish
endif
let g:autoloaded_preboil = 1

" Function: #template_complete {{{1
function! preboil#template_complete(lead, line, pos)
    let argc = len(split(a:line))
    if (argc == 1) || (argc == 2 && !empty(a:lead))
        return map(split(globpath(get(g:, 'preboil_template_directory'), "**/".a:lead."*", 1), '\n'), function('s:basename'))
    endif
    if argc == 2
        return []
    endif
    return map(range(1,16), function('s:string'))
endfunction

" Function: #new_assignment {{{1
function! preboil#new_assignment(template, filename, ...)
    " full path for this specific template
    let template_path = glob(get(g:, 'preboil_template_directory').'/'.a:template)

    " check if template exists
    if filereadable(template_path)
        " create the buffer, returning a bufnr
        let f = s:create_buffer(a:filename)

        " read template into buffer
        execute f "bufdo!" "0r" template_path

        " if we have parameters to replace in template
        if a:0 > 0
            let success = s:parameterize_buffer(f, a:000)
        endif
    else
        echom "Could not find template"a:filename"inside of"get(g:, 'preboil_template_directory')
    endif
endfunction

" Function: s:basename {{{1
function! s:basename(key,value)
    let path_parts = split(a:value, "/")
    return path_parts[-1]
endfunction

" Function: s:string {{{1
function! s:string(key,value)
    return string(a:value)
endfunction

" Function: s:create_buffer {{{1
function! s:create_buffer(name)
    execute "badd" a:name
    return bufnr(a:name)
endfunction

" Function: s:parameterize_buffer {{{1
function! s:parameterize_buffer(buf, pars)
    let i = 0
    for parameter in a:pars
        " replace token with parameter accordingly
        silent! execute a:buf "bufdo!" "%s/#PAR".i."/".parameter."/g"
        let i += 1
    endfor
    return 0
endfunction
