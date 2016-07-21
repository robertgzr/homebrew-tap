**New and/or modified brew formulas**

```
.
├── bootloadhid.rb
├── casks
│   ├── font-iosevka-inziu.rb
│   ├── font-iosevka-slab.rb
│   └── font-iosevka.rb
├── chromium-build.rb
├── hwmonitor.rb
├── iosevka.rb
├── nvc.rb
└── simulavr.rb
```

### notes:

## bootloadhid.rb
The formula uses my fork of the original repository by [ajd4096](https://github.com/ajd4096), that adds a simple build switch.

## iosevka.rb
This formula generates the font from the source repository. To simply download and install the newest version it's easier to use the `casks`

**TODO:**

* allow modifications off the build parameters

## nvc.rb
The pull request to get it into the main homebrew-repository is pending...
