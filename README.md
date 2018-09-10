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
This formula builds [Iosevka](https://github.com/be5invis/iosevka) v1.x.x from source. 
All customizations listed in [github.com/be5invis/iosevka#build-your-own-style](https://github.com/be5invis/Iosevka/tree/v1.14.3#build-your-own-style) are supported.

**NOTE:** Starting with version 2 Iosevka no longer supports the `make` based build we use in this formula. I am looking at how to make it work...

Run `brew info iosevka` to see the options.

It is possible to also build Iosevka Slab and the `.woff` web fonts (with the same variants set).

If you don't want to make any modifications you can also just download and install via `brew cask`:
```bash
$ brew tap caskroom/fonts
$ brew cask install font-iosevka
```
