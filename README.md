# vim-preboil

Start a new parameterized document flawlessly.

---

Ever got tired of copying a LaTeX boilerplate and modifing some parameters like series-number for every assignment solution you create? I did, so I created this plugin.

This plugin provides a simple command to **open up a new vim buffer** based on a selected **template**, allowing **up to 20 placeholders** to be filled via the command arguments.

Preboil works almost out-of-the-box, the only thing you have to do is telling Preboil where your templates are stored.

---

- [Installation](#installation)
- [Usage](#usage)
- [Documentation](#documentation)
- [Roadmap](#roadmap)
- [Feedback](#feedback)
- [License](#license)

---

## Installation

Use your favourite plugin manager.

Using [Vundle](https://github.com/VundleVim/Vundle.vim):

	call vundle#begin()
	Plugin 'EightSQ/vim-preboil'
	call vundle#end()

The only configuration you might want to set in your `.vimrc` is

	let g:preboil_template_directory = '~/path/to/my/templates'

---

## Usage

At any point in your vim session, when you feel the time is right for a new preboiled document, you can use

	:Boil templatename.{tex|txt|...} buffername par0 par1 ...

to open up a new buffer based on the selected template, with tokens **#PAR0** replaced accordingly.

Say you have a template named `todo.txt` in your templates directory which looks like this:

	Todo-list for #PAR0/#PAR1/#PAR2
	-
	-
	-

You can now enter `:Boil todo.txt today.txt 20 10 18` into the vim commandline and you'll get

	Todo-list fir 20/10/18
	-
	-
	-

in a buffer named **today.txt**.

---

## Documentation

	:h preboil

---

## Roadmap

- [ ] Vader tests, Travis CI
- [ ] Accepting Strings as parameter arguments
- [ ] Support cold-start buffer-creation (like `vim +Boil ...`)
- [ ] Directory-specific config-file system (like .preboil.yml)
	- [ ] Ability to fill parameters from the config file
- [ ] Configuration of a global default template

---

## Feedback

Feel free to add issue reports or feature requests. This encourages me to make futher improvements.

---

## License

See [here](https://github.com/EightSQ/vim-preboil/blob/master/LICENSE).
