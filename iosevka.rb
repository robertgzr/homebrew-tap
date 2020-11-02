require "language/node"

class Iosevka < Formula
  desc "Monospace font family for programming built from code"
  homepage "https://be5invis.github.io/Iosevka"
  url "https://github.com/be5invis/Iosevka/archive/v3.7.1.tar.gz"
  sha256 "ed7aee70af326ef22458f8f7603c599fd2f5164ae8062fbd6fb7d56864d98aca"
  head "https://github.com/be5invis/Iosevka.git"

  option "without-widths-normal", "skip building the normal width variant"
  option "without-widths-extended", "skip building the extended width variant"

  option "without-sans", "skip building the default sans variant"
  option "with-slab", "additionally build the serif variant"
  option "with-woff", "additionally build the webfonts (woff)"
  option "with-woff2", "additionally build the webfonts (woff2)"
  option "with-unhinted", "additionally build unhinted TTF"

  option "with-no-ligation", "disable ligations"
  option "with-no-cv-ss", "prevent generation of cv## and ss## features"
  option "with-sp-term", "make the symbols' width suitable for terminal emulators"
  option "with-sp-force-monospace", "recommended for Linux users who customize for their terminal fonts"
  option "with-sp-fixed", "apply sp-force-monospace and no-ligation together"

  option "with-default-to-old-style-digits", "default digit figures to old-style"
  option "with-default-to-lining-digits", "default digit figures to lining"

  option "with-calt-center-ops"
  option "with-calt-arrow"
  option "with-calt-arrow2"
  option "with-calt-trig"
  option "with-calt-eqeqeq"
  option "with-calt-eqeq"
  option "with-calt-ineq"
  option "with-calt-exeqeq"
  option "with-calt-eqexeq"
  option "with-calt-eqexeq-dl"
  option "with-calt-exeq"
  option "with-calt-exeq-alt-1"
  option "with-calt-tildeeq"
  option "with-calt-eqslasheq"
  option "with-calt-slasheq"
  option "with-calt-ltgt-ne"
  option "with-calt-ltgt-diamond"
  option "with-calt-brst"
  option "with-calt-plusplus"
  option "with-calt-kern-dotty"
  option "with-calt-logic"
  option "with-calt-llgg"
  option "with-calt-llggeq"
  option "with-calt-dotoper"
  option "with-calt-arrowZALE"
  option "with-calt-arrowZAGE"
  option "with-calt-html-comment"
  option "with-calt-colon-greater-as-colon-arrow"

  option "with-ss01", "build set based on the style of Andale Mono"
  option "with-ss02", "build set based on the style of Anonymous Pro"
  option "with-ss03", "build set based on the style of Consolas"
  option "with-ss04", "build set based on the style of Menlo"
  option "with-ss05", "build set based on the style of Fira Mono"
  option "with-ss06", "build set based on the style of Liberation Mono"
  option "with-ss07", "build set based on the style of Monaco"
  option "with-ss08", "build set based on the style of Pragmata Pro"
  option "with-ss09", "build set based on the style of Source Code Pro"
  option "with-ss10", "build set based on the style of Envy Code R"
  option "with-ss11", "build set based on the style of X Windows Fixed"
  option "with-ss12", "build set based on the style of Ubuntu Mono Style"
  option "with-ss13", "build set based on the style of Lucida Style"
  option "with-ss14", "build set based on the style of JetBrains Mono Style"
  option "with-ss20", "build set based on the style of Curly Style"

  option "with-ligset-dlig", "default ligation set would be assigned to Discretionary ligatures"
  option "with-ligset-clike", "default ligation set would be assigned to C-Like"
  option "with-ligset-javascript", "default ligation set would be assigned to JavaScript"
  option "with-ligset-php", "default ligation set would be assigned to PHP"
  option "with-ligset-ml", "default ligation set would be assigned to ML"
  option "with-ligset-fsharp", "default ligation set would be assigned to F#"
  option "with-ligset-fstar", "default ligation set would be assigned to F*"
  option "with-ligset-haskell", "default ligation set would be assigned to Haskell"
  option "with-ligset-idris", "default ligation set would be assigned to Idris"
  option "with-ligset-elm", "default ligation set would be assigned to Elm"
  option "with-ligset-purescript", "default ligation set would be assigned to PureScript"
  option "with-ligset-swift", "default ligation set would be assigned to Swift"
  option "with-ligset-coq", "default ligation set would be assigned to Coq"
  option "with-ligset-matlab", "default ligation set would be assigned to Matlab"
  option "with-ligset-wolfram", "default ligation set would be assigned to Wolfram Language (Mathematica)"

  option "with-a-doublestorey"
  option "with-a-singlestorey"
  option "with-a-singlestorey-tailed"
  option "with-a-doublestorey-tailed"
  option "with-a-singlestorey-earless-corner"
  option "with-a-singlestorey-earless-corner-tailed"
  option "with-a-singlestorey-earless-rounded"
  option "with-a-singlestorey-earless-rounded-tailed"
  option "with-a-doublestorey-toothless-corner"
  option "with-a-doublestorey-toothless-rounded"

  option "with-b-toothed"
  option "with-b-toothless-corner"
  option "with-b-toothless-rounded"

  option "with-d-toothed"
  option "with-d-toothless-corner"
  option "with-d-toothless-rounded"
  option "with-d-tailed"

  option "with-f-straight"
  option "with-f-tailed"
  option "with-f-serifed"
  option "with-f-straight-tailed"
  option "with-f-flat-hook"
  option "with-f-flat-hook-crossbar-at-x-height"
  option "with-f-flat-hook-serifed"
  option "with-f-flat-hook-serifed-crossbar-at-x-height"
  option "with-f-flat-hook-round-tailed"
  option "with-f-flat-hook-round-tailed-crossbar-at-x-height"
  option "with-f-flat-hook-flat-tailed"
  option "with-f-flat-hook-flat-tailed-crossbar-at-x-height"

  option "with-g-doublestorey"
  option "with-g-singlestorey"
  option "with-g-opendoublestorey"
  option "with-g-earless-corner"
  option "with-g-earless-rounded"

  option "with-h-straight"
  option "with-h-tailed"
  option "with-h-motion-serifed-straight"
  option "with-h-motion-serifed-tailed"

  option "with-i-serifed"
  option "with-i-italic"
  option "with-i-hooky"
  option "with-i-zshaped"
  option "with-i-line"
  option "with-i-tailed"
  option "with-i-hookybottom"
  option "with-i-serifed-asymmetric"

  option "with-j-line"
  option "with-j-serifed"
  option "with-j-straight"
  option "with-j-flat-hook-serifed"
  option "with-j-flat-hook-serifless"

  option "with-k-straight"
  option "with-k-curly"
  option "with-k-cursive"

  option "with-l-serifed"
  option "with-l-italic"
  option "with-l-hooky"
  option "with-l-zshaped"
  option "with-l-tailed"
  option "with-l-hookybottom"
  option "with-l-line"
  option "with-l-serifed-asymmetric"

  option "with-m-normal"
  option "with-m-shortleg"
  option "with-m-tailed"
  option "with-m-shortleg-tailed"
  option "with-m-earless-corner-double-arch"
  option "with-m-earless-corner-double-arch-shortleg"
  option "with-m-earless-corner-double-arch-tailed"
  option "with-m-earless-corner-double-arch-shortleg-tailed"
  option "with-m-earless-rounded-double-arch"
  option "with-m-earless-rounded-double-arch-shortleg"
  option "with-m-earless-rounded-double-arch-tailed"
  option "with-m-earless-rounded-double-arch-shortleg-tailed"
  option "with-m-earless-single-arch"
  option "with-m-earless-single-arch-shortleg"
  option "with-m-earless-single-arch-tailed"
  option "with-m-earless-single-arch-shortleg-tailed"
  option "with-m-motion-serifed"
  option "with-m-motion-serifed-shortleg"
  option "with-m-motion-serifed-tailed"
  option "with-m-motion-serifed-shortleg-tailed"

  option "with-n-straight"
  option "with-n-tailed"
  option "with-n-earless-corner-straight"
  option "with-n-earless-corner-tailed"
  option "with-n-earless-rounded-straight"
  option "with-n-earless-rounded-tailed"
  option "with-n-motion-serifed-straight"
  option "with-n-motion-serifed-tailed"

  option "with-p-eared"
  option "with-p-earless-corner"
  option "with-p-earless-rounded"
  option "with-p-motion-serifed"

  option "with-q-straight"
  option "with-q-tailed"
  option "with-q-earless-corner"
  option "with-q-earless-corner-tailed"
  option "with-q-earless-rounded"
  option "with-q-earless-rounded-tailed"

  option "with-r-straight"
  option "with-r-serifed"
  option "with-r-top-serifed"
  option "with-r-earless-corner"
  option "with-r-earless-rounded"

  option "with-t-standard"
  option "with-t-cross"
  option "with-t-flat-hook"
  option "with-t-hookless-asymmetric"
  option "with-t-flat-hook-short-neck"
  option "with-t-flat-hook-short-neck2"

  option "with-u-with-bar"
  option "with-u-without-bar"
  option "with-u-tailed"
  option "with-u-motion-serifed"
  option "with-u-motion-serifed-tailed"

  option "with-v-straight"
  option "with-v-curly"

  option "with-w-straight"
  option "with-w-curly"
  option "with-w-straight-flat-top"

  option "with-x-straight"
  option "with-x-curly"

  option "with-y-straight"
  option "with-y-cursive"
  option "with-y-curly"
  option "with-y-straight-turn"

  option "with-z-standard"
  option "with-z-with-crossbar"
  option "with-z-with-horizontal-crossbar"

  option "with-turn-v-straight"
  option "with-turn-v-curly"

  option "with-capital-b-standard"
  option "with-capital-b-more-asymmetric"

  option "with-capital-d-standard"
  option "with-capital-d-more-rounded"

  option "with-capital-g-tooth"
  option "with-capital-g-toothless"

  option "with-capital-j-serifless"
  option "with-capital-j-serifed"
  option "with-capital-j-serifed-both-sides"
  option "with-capital-j-serifed-symmetric"

  option "with-capital-k-straight"
  option "with-capital-k-curly"

  option "with-capital-m-hanging"
  option "with-capital-m-flat-bottom"

  option "with-capital-q-taily"
  option "with-capital-q-straight"
  option "with-capital-q-crossing"

  option "with-capital-r-straight"
  option "with-capital-r-curly"

  option "with-capital-y-straight"
  option "with-capital-y-curly"

  option "with-zero-slashed"
  option "with-zero-dotted"
  option "with-zero-unslashed"
  option "with-zero-reverse-slashed"
  option "with-zero-long-dotted"

  option "with-one-nobase"
  option "with-one-base"
  option "with-one-line"

  option "with-three-flattop"
  option "with-three-twoarcs"

  option "with-four-closed"
  option "with-four-closed-non-crossing"
  option "with-four-semi-open"
  option "with-four-semi-open-non-crossing"
  option "with-four-open"
  option "with-four-open-non-crossing"

  option "with-six-closed-contour"
  option "with-six-open-contour"
  option "with-six-straight-bar"

  option "with-seven-noserif"
  option "with-seven-serifed"
  option "with-seven-crossbar"
  option "with-seven-crossbar-serifed"

  option "with-nine-closed-contour"
  option "with-nine-open-contour"
  option "with-nine-straight-bar"

  option "with-eszet-traditional"
  option "with-eszet-sulzbacher"
  option "with-eszet-longs-s-lig"

  option "with-lambda-straight"
  option "with-lambda-curly"

  option "with-tilde-high"
  option "with-tilde-low"

  option "with-asterisk-high"
  option "with-asterisk-low"
  option "with-asterisk-hexhigh"
  option "with-asterisk-hexlow"
  option "with-asterisk-flip-penta-high"
  option "with-asterisk-flip-penta-low"

  option "with-underscore-high"
  option "with-underscore-low"
  option "with-underscore-above-baseline"

  option "with-paragraph-high"
  option "with-paragraph-low"

  option "with-caret-high"
  option "with-caret-low"

  option "with-paren-normal"
  option "with-paren-large-contour"

  option "with-brace-straight"
  option "with-brace-curly"

  option "with-numbersign-upright"
  option "with-numbersign-slanted"
  option "with-numbersign-upright-open"
  option "with-numbersign-slanted-open"

  option "with-ampersand-closed"
  option "with-ampersand-upper-open"
  option "with-ampersand-lower-open"
  option "with-ampersand-et"
  option "with-ampersand-et-toothed"
  option "with-ampersand-flat-top"

  option "with-at-threefold"
  option "with-at-fourfold"
  option "with-at-short"

  option "with-dollar-open"
  option "with-dollar-through"
  option "with-dollar-opencap"
  option "with-dollar-throughcap"

  option "with-percent-dots"
  option "with-percent-rings"
  option "with-percent-rings-connected"

  option "with-bar-natural-slope"
  option "with-bar-force-upright"

  option "with-lig-ltgteq-flat"
  option "with-lig-ltgteq-slanted"

  option "with-ascii-quote-straight"
  option "with-ascii-quote-raised-comma"

  option "with-ascii-grave-straight"
  option "with-ascii-grave-raised-inverse-comma"

  option "without-weight-thin", "skip building the 'thin' (100) weight"
  option "without-weight-extralight", "skip building the 'extralight' (200) weight"
  option "without-weight-light", "skip building the 'light' (300) weight"
  option "without-weight-regular", "skip building the 'regular' (400) weight"
  option "without-weight-medium", "skip building the 'medium' (500) weight"
  option "without-weight-semibold", "skip building the 'semibold' (600) weight"
  option "without-weight-bold", "skip building the 'bold' (700) weight"
  option "without-weight-extrabold", "skip building the 'extrabold' (800) weight"
  option "without-weight-heavy", "skip building the 'heavy' (900) weight"

  option "without-slope-upright", "skip building the 'upright' slope vaiant"
  option "without-slope-italic", "skip building the 'italic' slope vaiant"
  option "without-slope-oblique", "skip building the 'oblique' slope vaiant"

  def return_if_build_option(val, prefix = "")
    return "#{prefix}#{val}" if build.with? val
  end

  def return_variant_if_build_option(val)
    return return_if_build_option(val, "v-")
  end

  depends_on "node" => :build
  depends_on "ttfautohint" => :build

  def install
    design = []
    design << return_if_build_option("sans")
    design << return_if_build_option("slab")

    # ligature/spacing styles
    design << return_if_build_option("no-ligation")
    design << return_if_build_option("no-cv-ss")
    design << return_if_build_option("sp-term")
    design << return_if_build_option("sp-force-monospace")
    design << return_if_build_option("sp-fixed")

    # digits' styles
    design << return_if_build_option("default-to-old-style-digits")
    design << return_if_build_option("default-to-lining-digits")

    # customize the default (calt) ligation set style
    design << return_if_build_option("calt-center-ops")
    design << return_if_build_option("calt-arrow")
    design << return_if_build_option("calt-arrow2")
    design << return_if_build_option("calt-trig")
    design << return_if_build_option("calt-eqeqeq")
    design << return_if_build_option("calt-eqeq")
    design << return_if_build_option("calt-ineq")
    design << return_if_build_option("calt-exeqeq")
    design << return_if_build_option("calt-eqexeq")
    design << return_if_build_option("calt-eqexeq-dl")
    design << return_if_build_option("calt-exeq")
    design << return_if_build_option("calt-exeq-alt-1")
    design << return_if_build_option("calt-tildeeq")
    design << return_if_build_option("calt-eqslasheq")
    design << return_if_build_option("calt-slasheq")
    design << return_if_build_option("calt-ltgt-ne")
    design << return_if_build_option("calt-ltgt-diamond")
    design << return_if_build_option("calt-brst")
    design << return_if_build_option("calt-plusplus")
    design << return_if_build_option("calt-kern-dotty")
    design << return_if_build_option("calt-logic")
    design << return_if_build_option("calt-llgg")
    design << return_if_build_option("calt-llggeq")
    design << return_if_build_option("calt-dotoper")
    design << return_if_build_option("calt-arrowZALE")
    design << return_if_build_option("calt-arrowZAGE")
    design << return_if_build_option("calt-html-comment")
    design << return_if_build_option("calt-colon-greater-as-colon-arrow")

    # predefined stylistic sets
    design << return_if_build_option("ss01")
    design << return_if_build_option("ss02")
    design << return_if_build_option("ss03")
    design << return_if_build_option("ss04")
    design << return_if_build_option("ss05")
    design << return_if_build_option("ss06")
    design << return_if_build_option("ss07")
    design << return_if_build_option("ss08")
    design << return_if_build_option("ss09")
    design << return_if_build_option("ss10")
    design << return_if_build_option("ss11")
    design << return_if_build_option("ss12")
    design << return_if_build_option("ss13")
    design << return_if_build_option("ss14")
    design << return_if_build_option("ss20")

    # ligation set styles
    design << return_if_build_option("ligset-dlig")
    design << return_if_build_option("ligset-clike")
    design << return_if_build_option("ligset-javascript")
    design << return_if_build_option("ligset-php")
    design << return_if_build_option("ligset-ml")
    design << return_if_build_option("ligset-fsharp")
    design << return_if_build_option("ligset-fstar")
    design << return_if_build_option("ligset-haskell")
    design << return_if_build_option("ligset-idris")
    design << return_if_build_option("ligset-elm")
    design << return_if_build_option("ligset-purescript")
    design << return_if_build_option("ligset-swift")
    design << return_if_build_option("ligset-coq")
    design << return_if_build_option("ligset-matlab")
    design << return_if_build_option("ligset-wolfram")

    # character variants
    design << return_variant_if_build_option("a-doublestorey")
    design << return_variant_if_build_option("a-singlestorey")
    design << return_variant_if_build_option("a-singlestorey-tailed")
    design << return_variant_if_build_option("a-doublestorey-tailed")
    design << return_variant_if_build_option("a-singlestorey-earless-corner")
    design << return_variant_if_build_option("a-singlestorey-earless-corner-tailed")
    design << return_variant_if_build_option("a-singlestorey-earless-rounded")
    design << return_variant_if_build_option("a-singlestorey-earless-rounded-tailed")
    design << return_variant_if_build_option("a-doublestorey-toothless-corner")
    design << return_variant_if_build_option("a-doublestorey-toothless-rounded")

    design << return_variant_if_build_option("b-toothed")
    design << return_variant_if_build_option("b-toothless-corner")
    design << return_variant_if_build_option("b-toothless-rounded")

    design << return_variant_if_build_option("d-toothed")
    design << return_variant_if_build_option("d-toothless-corner")
    design << return_variant_if_build_option("d-toothless-rounded")
    design << return_variant_if_build_option("d-tailed")

    design << return_variant_if_build_option("f-straight")
    design << return_variant_if_build_option("f-tailed")
    design << return_variant_if_build_option("f-serifed")
    design << return_variant_if_build_option("f-straight-tailed")
    design << return_variant_if_build_option("f-flat-hook")
    design << return_variant_if_build_option("f-flat-hook-crossbar-at-x-height")
    design << return_variant_if_build_option("f-flat-hook-serifed")
    design << return_variant_if_build_option("f-flat-hook-serifed-crossbar-at-x-height")
    design << return_variant_if_build_option("f-flat-hook-round-tailed")
    design << return_variant_if_build_option("f-flat-hook-round-tailed-crossbar-at-x-height")
    design << return_variant_if_build_option("f-flat-hook-flat-tailed")
    design << return_variant_if_build_option("f-flat-hook-flat-tailed-crossbar-at-x-height")

    design << return_variant_if_build_option("g-doublestorey")
    design << return_variant_if_build_option("g-singlestorey")
    design << return_variant_if_build_option("g-opendoublestorey")
    design << return_variant_if_build_option("g-earless-corner")
    design << return_variant_if_build_option("g-earless-rounded")

    design << return_variant_if_build_option("h-straight")
    design << return_variant_if_build_option("h-tailed")
    design << return_variant_if_build_option("h-motion-serifed-straight")
    design << return_variant_if_build_option("h-motion-serifed-tailed")

    design << return_variant_if_build_option("i-serifed")
    design << return_variant_if_build_option("i-italic")
    design << return_variant_if_build_option("i-hooky")
    design << return_variant_if_build_option("i-zshaped")
    design << return_variant_if_build_option("i-line")
    design << return_variant_if_build_option("i-tailed")
    design << return_variant_if_build_option("i-hookybottom")
    design << return_variant_if_build_option("i-serifed-asymmetric")

    design << return_variant_if_build_option("j-line")
    design << return_variant_if_build_option("j-serifed")
    design << return_variant_if_build_option("j-straight")
    design << return_variant_if_build_option("j-flat-hook-serifed")
    design << return_variant_if_build_option("j-flat-hook-serifless")

    design << return_variant_if_build_option("k-straight")
    design << return_variant_if_build_option("k-curly")
    design << return_variant_if_build_option("k-cursive")

    design << return_variant_if_build_option("l-serifed")
    design << return_variant_if_build_option("l-italic")
    design << return_variant_if_build_option("l-hooky")
    design << return_variant_if_build_option("l-zshaped")
    design << return_variant_if_build_option("l-tailed")
    design << return_variant_if_build_option("l-hookybottom")
    design << return_variant_if_build_option("l-line")
    design << return_variant_if_build_option("l-serifed-asymmetric")

    design << return_variant_if_build_option("m-normal")
    design << return_variant_if_build_option("m-shortleg")
    design << return_variant_if_build_option("m-tailed")
    design << return_variant_if_build_option("m-shortleg-tailed")
    design << return_variant_if_build_option("m-earless-corner-double-arch")
    design << return_variant_if_build_option("m-earless-corner-double-arch-shortleg")
    design << return_variant_if_build_option("m-earless-corner-double-arch-tailed")
    design << return_variant_if_build_option("m-earless-corner-double-arch-shortleg-tailed")
    design << return_variant_if_build_option("m-earless-rounded-double-arch")
    design << return_variant_if_build_option("m-earless-rounded-double-arch-shortleg")
    design << return_variant_if_build_option("m-earless-rounded-double-arch-tailed")
    design << return_variant_if_build_option("m-earless-rounded-double-arch-shortleg-tailed")
    design << return_variant_if_build_option("m-earless-single-arch")
    design << return_variant_if_build_option("m-earless-single-arch-shortleg")
    design << return_variant_if_build_option("m-earless-single-arch-tailed")
    design << return_variant_if_build_option("m-earless-single-arch-shortleg-tailed")
    design << return_variant_if_build_option("m-motion-serifed")
    design << return_variant_if_build_option("m-motion-serifed-shortleg")
    design << return_variant_if_build_option("m-motion-serifed-tailed")
    design << return_variant_if_build_option("m-motion-serifed-shortleg-tailed")

    design << return_variant_if_build_option("n-straight")
    design << return_variant_if_build_option("n-tailed")
    design << return_variant_if_build_option("n-earless-corner-straight")
    design << return_variant_if_build_option("n-earless-corner-tailed")
    design << return_variant_if_build_option("n-earless-rounded-straight")
    design << return_variant_if_build_option("n-earless-rounded-tailed")
    design << return_variant_if_build_option("n-motion-serifed-straight")
    design << return_variant_if_build_option("n-motion-serifed-tailed")

    design << return_variant_if_build_option("p-eared")
    design << return_variant_if_build_option("p-earless-corner")
    design << return_variant_if_build_option("p-earless-rounded")
    design << return_variant_if_build_option("p-motion-serifed")

    design << return_variant_if_build_option("q-straight")
    design << return_variant_if_build_option("q-tailed")
    design << return_variant_if_build_option("q-earless-corner")
    design << return_variant_if_build_option("q-earless-corner-tailed")
    design << return_variant_if_build_option("q-earless-rounded")
    design << return_variant_if_build_option("q-earless-rounded-tailed")

    design << return_variant_if_build_option("r-straight")
    design << return_variant_if_build_option("r-serifed")
    design << return_variant_if_build_option("r-top-serifed")
    design << return_variant_if_build_option("r-earless-corner")
    design << return_variant_if_build_option("r-earless-rounded")

    design << return_variant_if_build_option("t-standard")
    design << return_variant_if_build_option("t-cross")
    design << return_variant_if_build_option("t-flat-hook")
    design << return_variant_if_build_option("t-hookless-asymmetric")
    design << return_variant_if_build_option("t-flat-hook-short-neck")
    design << return_variant_if_build_option("t-flat-hook-short-neck2")

    design << return_variant_if_build_option("u-with-bar")
    design << return_variant_if_build_option("u-without-bar")
    design << return_variant_if_build_option("u-tailed")
    design << return_variant_if_build_option("u-motion-serifed")
    design << return_variant_if_build_option("u-motion-serifed-tailed")

    design << return_variant_if_build_option("v-straight")
    design << return_variant_if_build_option("v-curly")

    design << return_variant_if_build_option("w-straight")
    design << return_variant_if_build_option("w-curly")
    design << return_variant_if_build_option("w-straight-flat-top")

    design << return_variant_if_build_option("x-straight")
    design << return_variant_if_build_option("x-curly")

    design << return_variant_if_build_option("y-straight")
    design << return_variant_if_build_option("y-cursive")
    design << return_variant_if_build_option("y-curly")
    design << return_variant_if_build_option("y-straight-turn")

    design << return_variant_if_build_option("z-standard")
    design << return_variant_if_build_option("z-with-crossbar")
    design << return_variant_if_build_option("z-with-horizontal-crossbar")

    design << return_variant_if_build_option("turn-v-straight")
    design << return_variant_if_build_option("turn-v-curly")

    design << return_variant_if_build_option("capital-b-standard")
    design << return_variant_if_build_option("capital-b-more-asymmetric")

    design << return_variant_if_build_option("capital-d-standard")
    design << return_variant_if_build_option("capital-d-more-rounded")

    design << return_variant_if_build_option("capital-g-tooth")
    design << return_variant_if_build_option("capital-g-toothless")

    design << return_variant_if_build_option("capital-j-serifless")
    design << return_variant_if_build_option("capital-j-serifed")
    design << return_variant_if_build_option("capital-j-serifed-both-sides")
    design << return_variant_if_build_option("capital-j-serifed-symmetric")

    design << return_variant_if_build_option("capital-k-straight")
    design << return_variant_if_build_option("capital-k-curly")

    design << return_variant_if_build_option("capital-m-hanging")
    design << return_variant_if_build_option("capital-m-flat-bottom")

    design << return_variant_if_build_option("capital-q-taily")
    design << return_variant_if_build_option("capital-q-straight")
    design << return_variant_if_build_option("capital-q-crossing")

    design << return_variant_if_build_option("capital-r-straight")
    design << return_variant_if_build_option("capital-r-curly")

    design << return_variant_if_build_option("capital-y-straight")
    design << return_variant_if_build_option("capital-y-curly")

    design << return_variant_if_build_option("zero-slashed")
    design << return_variant_if_build_option("zero-dotted")
    design << return_variant_if_build_option("zero-unslashed")
    design << return_variant_if_build_option("zero-reverse-slashed")
    design << return_variant_if_build_option("zero-long-dotted")

    design << return_variant_if_build_option("one-nobase")
    design << return_variant_if_build_option("one-base")
    design << return_variant_if_build_option("one-line")

    design << return_variant_if_build_option("three-flattop")
    design << return_variant_if_build_option("three-twoarcs")

    design << return_variant_if_build_option("four-closed")
    design << return_variant_if_build_option("four-closed-non-crossing")
    design << return_variant_if_build_option("four-semi-open")
    design << return_variant_if_build_option("four-semi-open-non-crossing")
    design << return_variant_if_build_option("four-open")
    design << return_variant_if_build_option("four-open-non-crossing")

    design << return_variant_if_build_option("six-closed-contour")
    design << return_variant_if_build_option("six-open-contour")
    design << return_variant_if_build_option("six-straight-bar")

    design << return_variant_if_build_option("seven-noserif")
    design << return_variant_if_build_option("seven-serifed")
    design << return_variant_if_build_option("seven-crossbar")
    design << return_variant_if_build_option("seven-crossbar-serifed")

    design << return_variant_if_build_option("nine-closed-contour")
    design << return_variant_if_build_option("nine-open-contour")
    design << return_variant_if_build_option("nine-straight-bar")

    design << return_variant_if_build_option("eszet-traditional")
    design << return_variant_if_build_option("eszet-sulzbacher")
    design << return_variant_if_build_option("eszet-longs-s-lig")

    design << return_variant_if_build_option("lambda-straight")
    design << return_variant_if_build_option("lambda-curly")

    design << return_variant_if_build_option("tilde-high")
    design << return_variant_if_build_option("tilde-low")

    design << return_variant_if_build_option("asterisk-high")
    design << return_variant_if_build_option("asterisk-low")
    design << return_variant_if_build_option("asterisk-hexhigh")
    design << return_variant_if_build_option("asterisk-hexlow")
    design << return_variant_if_build_option("asterisk-flip-penta-high")
    design << return_variant_if_build_option("asterisk-flip-penta-low")

    design << return_variant_if_build_option("underscore-high")
    design << return_variant_if_build_option("underscore-low")
    design << return_variant_if_build_option("underscore-above-baseline")

    design << return_variant_if_build_option("paragraph-high")
    design << return_variant_if_build_option("paragraph-low")

    design << return_variant_if_build_option("caret-high")
    design << return_variant_if_build_option("caret-low")

    design << return_variant_if_build_option("paren-normal")
    design << return_variant_if_build_option("paren-large-contour")

    design << return_variant_if_build_option("brace-straight")
    design << return_variant_if_build_option("brace-curly")

    design << return_variant_if_build_option("numbersign-upright")
    design << return_variant_if_build_option("numbersign-slanted")
    design << return_variant_if_build_option("numbersign-upright-open")
    design << return_variant_if_build_option("numbersign-slanted-open")

    design << return_variant_if_build_option("ampersand-closed")
    design << return_variant_if_build_option("ampersand-upper-open")
    design << return_variant_if_build_option("ampersand-lower-open")
    design << return_variant_if_build_option("ampersand-et")
    design << return_variant_if_build_option("ampersand-et-toothed")
    design << return_variant_if_build_option("ampersand-flat-top")

    design << return_variant_if_build_option("at-threefold")
    design << return_variant_if_build_option("at-fourfold")
    design << return_variant_if_build_option("at-short")

    design << return_variant_if_build_option("dollar-open")
    design << return_variant_if_build_option("dollar-through")
    design << return_variant_if_build_option("dollar-opencap")
    design << return_variant_if_build_option("dollar-throughcap")

    design << return_variant_if_build_option("percent-dots")
    design << return_variant_if_build_option("percent-rings")
    design << return_variant_if_build_option("percent-rings-connected")

    design << return_variant_if_build_option("bar-natural-slope")
    design << return_variant_if_build_option("bar-force-upright")

    design << return_variant_if_build_option("lig-ltgteq-flat")
    design << return_variant_if_build_option("lig-ltgteq-slanted")

    design << return_variant_if_build_option("ascii-quote-straight")
    design << return_variant_if_build_option("ascii-quote-raised-comma")

    design << return_variant_if_build_option("ascii-grave-straight")
    design << return_variant_if_build_option("ascii-grave-raised-inverse-comma")

    design.delete_if &:nil? # cleanup design array

    system "npm", "install", *Language::Node.local_npm_install_args
    File.open("private-build-plans.toml", "w:UTF-8") do |f|
      f.puts "[buildPlans.iosevka-brew]"
      f.puts "family = \"Iosevka Brew\""
      f.puts "design = [\"#{design.join('", "')}\"]"
      f.puts "\n"
      f.puts "[buildPlans.iosevka-brew.weights.thin]\nshape=100\nmenu=100\ncss=100" if build.with? "weight-thin"
      f.puts "[buildPlans.iosevka-brew.weights.extralight]\nshape=200\nmenu=200\ncss=200" if build.with? "weight-extralight"
      f.puts "[buildPlans.iosevka-brew.weights.light]\nshape=300\nmenu=300\ncss=300" if build.with? "weight-light"
      f.puts "[buildPlans.iosevka-brew.weights.regular]\nshape=400\nmenu=400\ncss=400" if build.with? "weight-regular"
      f.puts "[buildPlans.iosevka-brew.weights.medium]\nshape=500\nmenu=500\ncss=500" if build.with? "weight-medium"
      f.puts "[buildPlans.iosevka-brew.weights.semibold]\nshape=600\nmenu=600\ncss=600" if build.with? "weight-semibold"
      f.puts "[buildPlans.iosevka-brew.weights.bold]\nshape=700\nmenu=700\ncss=700" if build.with? "weight-bold"
      f.puts "[buildPlans.iosevka-brew.weights.extrabold]\nshape=800\nmenu=800\ncss=800" if build.with? "weight-extrabold"
      f.puts "[buildPlans.iosevka-brew.weights.heavy]\nshape=900\nmenu=900\ncss=900" if build.with? "weight-heavy"
      f.puts "\n"
      unless build.without? "slope-upright" and build.without? "slope-italic" and build.without? "slope-oblique"
        f.puts "[buildPlans.iosevka-brew.slopes]"
        f.puts "upright = \"normal\"" if build.with? "slope-upright"
        f.puts "italic = \"italic\"" if build.with? "slope-italic"
        f.puts "oblique = \"oblique\"" if build.with? "slope-oblique"
        f.puts "\n"
      end
      f.puts "[buildPlans.iosevka-brew.widths.normal]\nshape = 500\nmenu = 5\ncss = \"normal\"" if build.with? "widths-normal"
      f.puts "[buildPlans.iosevka-brew.widths.extended]\nshape = 576\nmenu = 7\ncss = \"expanded\"" if build.with? "widths-extended"
    end

    system "npm", "run", "build", "--", "ttf::iosevka-brew" unless build.with? "woff" or build.with? "woff2"
    system "npm", "run", "build", "--", "woff::iosevka-brew" if build.with? "woff"
    system "npm", "run", "build", "--", "woff2::iosevka-brew" if build.with? "woff2"
    system "npm", "run", "build", "--", "ttf-unhinted::iosevka-brew" if build.with? "unhinted"

    share.install Dir["dist/*"]
  end

  def caveats
    <<~EOS
      Homebrew does not allow Formulas to move files to arbitrary locations in the filesystem.
      To install the font please do:

      cp -fr #{share}/ ~/Library/Fonts/iosevka
    EOS
  end

  test do
    opoo "no tests"
  end
end
