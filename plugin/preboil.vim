" vim: et sw=4 sts=4

" Plugin:		https://github.com/EightSQ/vim-preboil
" Description:	A parameterizable templating script
" Maintainer:	EightSQ <https://blog.eletronvo.lt>

if exists('g:loaded_preboil') || &cp
	finish
endif
let g:loaded_preboil = 1

if !exists('g:preboil_template_directory')
	let g:preboil_template_directory = '~/Templates'
endif

command! -nargs=* -complete=customlist,preboil#template_complete Boil	call preboil#new_assignment(<f-args>)
