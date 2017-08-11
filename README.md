### How to use this repository?
https://github.com/Homebrew/brew/blob/master/docs/brew-tap.md

```
.
├── README.md
├── bootloadhid.rb
├── casks
│   ├── font-iosevka-inziu.rb
│   └── font-noto-mono.rb
├── chromium-build.rb
├── hwmonitor.rb
├── iosevka.rb
└── simulavr.rb
```

## bootloadhid.rb
The formula uses my fork of the original repository by [ajd4096](https://github.com/ajd4096), that adds a simple build switch.

## iosevka.rb
This formula builds [Iosevka](https://github.com/be5invis/iosevka) from source. 
So far you can modify the upright style glyphs for:

  * asterisk `*` (high/low variants)
  * tilde `~` (high/low variants)
  * paragraph `¶` (high/low variants)
  * caret `^` (high/low variants)
  * underscore `_` (high/low variants)
  * zero `0` (3 variants)
  * at-sign `@` (3 variants)
  * eszet `ß` (2 variants)
  * numbersign `#` (2 variants)
  * dollar `$` (2 variants)
  * braces `{}` (2 variants)
  * letter `g` (3 variants)
  * letter `Q` (2 variants)
  * letter `t` (2 variants)
  * letter `a` (2 variants)
  * letter `m` (2 variants)
  * number `3` (2 variants)

It is possible to also build Iosevka Slab and the `.woff` web fonts (with the same variants set).

**TODO:** *`l` `i` glyph variants, `term`, `type` and `stress-fw` styles*

The formula builds with [standard options](https://github.com/be5invis/Iosevka#build-your-own-style) by default.

If you don't want to make any modifications you can also just download and install:
```bash
$ brew tap caskroom/fonts
$ brew cask install font-iosevka
```
