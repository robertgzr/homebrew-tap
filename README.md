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
This formula builds the font from source. 

If you don't want to make any modifications you can also just download and install:
```bash
$ brew tap caskroom/fonts
$ brew cask install font-iosevka
```
