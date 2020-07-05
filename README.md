### How to use this repository?
https://github.com/Homebrew/brew/blob/master/docs/Taps.md

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
Customizations listed in https://github.com/be5invis/Iosevka#build-your-own-style are supported (see [the tracking issue](https://github.com/robertgzr/homebrew-tap/issues/5) for current
status).

Run `brew info iosevka` to see the options.

It is possible to also build Iosevka Slab and the `.woff` web fonts (with the same variants set).

If you don't want to make any modifications you can also just download and install via `brew cask`:
```bash
$ brew tap homebrew/cask-fonts
$ brew cask install font-iosevka
```
