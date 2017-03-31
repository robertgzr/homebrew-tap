**New and/or modified brew formulas**

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

### notes:

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

TODO: *`l` `i` `a` `m` glyph variants, `term` and `cc` styles, webfonts*

We use the [standard options](https://github.com/be5invis/Iosevka#build-your-own-style) by default.

If you don't want to make any modifications you can also just download and install:
```bash
$ brew tap caskroom/fonts
$ brew cask install font-iosevka
```
