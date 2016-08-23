" Vim syntax file
" Language:    Nany
" Version: 1.0
" Last Change:    2014/07/02
" Maintainer:  Damien GERARD <damien@iwi.me>

" Into your .vimrc :
" autocmd BufRead,BufNewFile,BufEnter *.ny,*.hny,*.slny,*.tlny set filetype=nany nowrap cindent smartindent noexpandtab incsearch

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif


syn case match

syntax keyword nyk_bool         true false
syntax keyword nyk_conditional  if else then
syntax keyword nyk_null         null
syntax keyword nyk_labels       switch case default
syntax keyword nyk_operators    not and or mod shl shr xor
syntax keyword nyk_repeat       in on do for while each
syntax keyword nyk_stmt         namespace unittest
syntax keyword nyk_stmt         new typedef typeof func enum workflow operator view timeout
syntax keyword nyk_stmt         spawn every async sync
syntax keyword nyk_class        class
syntax keyword nyk_types        var ref const cref
syntax keyword nyk_types        bool char
syntax keyword nyk_types        f32 f64 f128 f256 f512
syntax keyword nyk_types        i8 i16 i32 i64 i128 i256 i512 u8 u16 u32 u64 u128 u256 u512
syntax keyword nyk_types        string void any
syntax keyword nyk_builtin      __i8 __i16 __i32 __i64  __u8 __u16 __u32 __u64 __bool __pointer __true __false
syntax keyword nyk_modifiers    override
syntax keyword nyk_modifiers    shared
syntax keyword nyk_visibility   private public protected published internal


" Region folding
"
syntax keyword nyk_todo contained brief note return param tparam see related group ingroup class
syntax keyword nyk_todo contained bug attention warning fixme todo remark
syntax keyword nyk_todo contained internal file
syntax keyword nyk_todo contained author authors version 



" trailing whitespaces
" syntax match nyk_space_error "\s\+$"
" tab
" syntax match nyk_space_error " \+\t"me=e-1



syntax match nyk_punctuation       "[+\-/*=]"
syntax match nyk_punctuation       "[<>]=\="
syntax match nyk_punctuation       "!="
syntax match nyk_punctuation       "="
syntax match nyk_punctuation       "\.\."
syntax match nyk_punctuation       "[\^.]"
syntax match nyk_punctuation       "<<"
syntax match nyk_punctuation       ">>"
syntax match nyk_punctuation       "[&|~]"

syntax match nyk_symbol_delimiter  "[][]"
syntax match nyk_symbol_delimiter  ":>"
syntax match nyk_symbol_delimiter  "<:"
syntax match nyk_symbol_delimiter  ":[a-z][a-zA-Z0-9]*"
syntax match nyk_symbol_delimiter  ":"
syntax match nyk_symbol_delimiter  "?"
syntax match nyk_symbol_delimiter  "@"
syntax match nyk_symbol_delimiter  "|"
syntax match nyk_symbol_delimiter  "\.\."
syntax match nyk_symbol_delimiter  "->"
syntax match nyk_symbol_delimiter  "&"

syntax match nyk_number            "-\=\<\d\+\>"
syntax match nyk_number_float      "-\=\<\d\+\.\d\+\>"
syntax match nyk_number_float      "-\=\<\d\+\.\d\+[eE]-\=\d\+\>"
syntax match nyk_number_hex        "\$[0-9a-fA-F]\+\>"

syntax match nyk_intrinsics        "!![_a-z][a-z0-9\._]*"

syntax keyword nyk_func            break continue return raise assert

" regions
syntax region nyk_blocks     start="{"   end="}"   transparent fold contains=nyk_blocks
syntax region nyk_comments   start="/\*" end="\*/" contains=nyk_todo,nyk_space_error,@Spell
syntax region nyk_comments   start="//"  end="$"   contains=nyk_todo,nyk_space_error,@Spell
syntax region nyk_attributes start="#\["  end="]"



syntax keyword nyk_self self



" Strings
" Highlight special characters (those which have a backslash) differently
syntax match  nyk_special display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syntax match  nyk_char  "'[^']*'" contains=cSpecial
syntax region nyk_string  start=+L\="+  skip=+\\\\\|\\"+ end=+"+ contains=nyk_special,nanyFormat,@Spell


syntax sync ccomment nyk_comments minlines=50 maxlines=500




" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_nany_syn_inits")
	if version < 508
	  let did_nany_syn_inits = 1
	  command -nargs=+ HiLink hi link <args>
	else
	  command -nargs=+ HiLink hi def link <args>
	endif

	HiLink nyk_visibility        nyk_stmt
	HiLink nyk_bool              Boolean
	HiLink nyk_comments          Comment
	HiLink nyk_template          SpecialChar
	HiLink nyk_intrinsics        Exception
	HiLink nyk_attributes        SpecialChar
	HiLink nyk_conditional       Conditional
	HiLink nyk_null              Constant
	HiLink nyk_delimiter         Identifier
	HiLink nyk_symbol_delimiter  SpecialChar
	HiLink nanyException         Exception
	HiLink nyk_number_float      Float
	HiLink nyk_func              Function
	HiLink nyk_labels            Label
	HiLink nyk_modifiers         Type
	HiLink nyk_number            Number
	HiLink nyk_operators         Conditional
	HiLink nyk_self              nyk_stmt
	HiLink nanyPreProc           PreProc
	HiLink nyk_repeat            Repeat
	HiLink nyk_stmt              Statement
	HiLink nyk_string            String
	HiLink nyk_class             nyk_stmt
	HiLink nyk_punctuation       Operator
	HiLink nyk_todo              Todo
	HiLink nyk_types             Type
	HiLink nyk_builtin           Type
	HiLink nanyUnclassified      nyk_stmt
	HiLink nanyError             Error
	HiLink nanyAsmKey            nyk_stmt
	HiLink nyk_special           SpecialChar

	" HiLink nanyAsm        Assembler
	" HiLink nyk_space_error       Error

	delcommand HiLink
endif


let b:current_syntax = "nany"

" vim: ts=4 sw=2
