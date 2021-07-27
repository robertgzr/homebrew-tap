require "language/node"

class Iosevka < Formula
  desc "Monospace font family for programming built from code"
  homepage "https://be5invis.github.io/Iosevka"
  url "https://github.com/be5invis/Iosevka/archive/v8.0.2.tar.gz"
  sha256 "2b8d9080f94b1492aafeb68b96df0d7ea77884d6f68395fb0c308aad0a9c13ec"
  head "https://github.com/be5invis/Iosevka.git"

  option "without-sans", "skip building the default sans variant"
  option "with-slab", "additionally build the serif variant"
  option "with-woff2", "additionally build the webfonts (woff2)"
  option "with-unhinted", "additionally build unhinted TTF"

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
  option "with-ss12", "build set based on the style of X Windows Fixed"
  option "with-ss13", "build set based on the style of X Windows Fixed"
  option "with-ss14", "build set based on the style of X Windows Fixed"
  option "with-ss15", "build set based on the style of X Windows Fixed"
  option "with-ss16", "build set based on the style of X Windows Fixed"
  option "with-ss17", "build set based on the style of X Windows Fixed"
  option "with-ss18", "build set based on the style of X Windows Fixed"
  option "with-ss19", "build set based on the style of X Windows Fixed"
  option "with-ss20", "build set based on the style of X Windows Fixed"

  option "with-term", "disable ligations and exact monospace"
  option "with-fixed", "like term but ligations are present"

  # option "with-ligset-haskell", "default ligation set would be assigned to Haskell"
  # option "with-ligset-idris", "default ligation set would be assigned to Idris"
  # option "with-ligset-coq", "default ligation set would be assigned to Coq (contains all possible ligatures)"
  # option "with-ligset-elm", "default ligation set would be assigned to Elm"
  # option "with-ligset-ml", "default ligation set would be assigned to ML"
  # option "with-ligset-fs", "default ligation set would be assigned to F#"
  # option "with-ligset-fstar", "default ligation set would be assigned to F*"
  # option "with-ligset-swift", "default ligation set would be assigned to Swift"
  # option "with-ligset-purescript", "default ligation set would be assigned to PureScript"

  option "with-zero-dotted"
  option "with-zero-unslashed"
  option "with-zero-slashed"

  option "with-at-long"
  option "with-at-short"
  option "with-at-fourfold"

  option "with-tilde-high"
  option "with-tilde-low"

  option "with-asterisk-high"
  option "with-asterisk-low"
  option "with-asterisk-hexhigh"
  option "with-asterisk-hexlow"

  option "with-paragraph-high"
  option "with-paragraph-low"

  option "with-caret-high"
  option "with-caret-low"

  option "with-underscore-high"
  option "with-underscore-low"

  option "with-percent-dots"
  option "with-percent-rings"

  option "with-eszet-traditional"
  option "with-eszet-sulzbacher"

  option "with-brace-curly"
  option "with-brace-straight"

  option "with-g-singlestorey"
  option "with-g-opendoublestorey"
  option "with-g-doublestorey"

  option "with-numbersign-slanted"
  option "with-numbersign-straight"

  option "with-dollar-through"
  option "with-dollar-open"
  option "with-dollar-opencap"
  option "with-dollar-throughcap"

  option "with-q-straight"
  option "with-q-taily"

  option "with-t-standard"
  option "with-t-cross"

  option "with-three-flattop"
  option "with-three-twoarcs"

  option "with-a-singlestorey"
  option "with-a-doublestorey"

  option "with-m-shortleg"
  option "with-m-longleg"

  option "with-l-hooky"
  option "with-l-zshaped"
  option "with-l-serifed"
  option "with-l-italic"
  option "with-l-tailed"
  option "with-l-hookybottom"

  option "with-i-hooky"
  option "with-i-zshaped"
  option "with-i-serified"
  option "with-i-italic"
  option "with-i-line"

  option "with-j-serifed"
  option "with-j-line"

  option "with-f-straight"
  option "with-f-tailed"

  option "with-y-straight"
  option "with-y-curly"

  option "with-one-serifed"
  option "with-one-hooky"

  option "without-weight-thin", "skip building the 'thin' (100) weight"
  option "without-weight-extralight", "skip building the 'extralight' (200) weight"
  option "without-weight-light", "skip building the 'light' (300) weight"
  option "without-weight-regular", "skip building the 'regular' (400) weight"
  option "without-weight-medium", "skip building the 'medium' (500) weight"
  option "without-weight-semibold", "skip building the 'semibold' (600) weight"
  option "without-weight-bold", "skip building the 'bold' (700) weight"
  option "without-weight-extrabold", "skip building the 'extrabold' (800) weight"
  option "without-weight-heavy", "skip building the 'heavy' (900) weight"

  option "without-slant-upright", "skip building the 'upright' slant vaiant"
  option "without-slant-italic", "skip building the 'italic' slant vaiant"
  option "without-slant-oblique", "skip building the 'oblique' slant vaiant"

  def design_oneof(assignto, options)
    val = return_oneof(options, assignto+"-")
    if val
      return "#{assignto} = \"#{}\""
    end
  end

  def return_oneof(options, prefix = "")
    options.each do |o|
      if build.with? "#{prefix}#{o}"
        return o
      end
    end
    return nil
  end

  depends_on "node" => :build
  depends_on "ttfautohint" => :build

  def install
    system "npm", "install", *Language::Node.local_npm_install_args
    File.open("private-build-plans.toml", "w:UTF-8") do |f|
      f.puts "[buildPlans.iosevka-brew]"
      f.puts "family = \"Iosevka Brew\""
      f.puts "serifs = \"sans\"" if build.with? "sans" and build.without? "slab"
      f.puts "serifs = \"slab\"" if build.without? "sans" and build.with? "slab"

      f.puts "[buildPlans.iosevka-brew.variants]"
      f.puts "inherits = \"#{return_oneof([
        "ss01",
        "ss02",
        "ss03",
        "ss04",
        "ss05",
        "ss06",
        "ss07",
        "ss08",
        "ss09",
        "ss10",
        "ss11",
        "ss12",
        "ss13",
        "ss14",
        "ss15",
        "ss16",
        "ss17",
        "ss18",
        "ss19",
        "ss20",
      ])}\""

      f.puts "[buildPlans.iosevka-brew.variants.design]"
      f.puts design_oneof("zero", ["dotted", "unslashed", "slashed"])
      f.puts design_oneof("at", ["long", "short", "fourfold"])
      f.puts design_oneof("tilde", ["high", "low"])
      f.puts design_oneof("asterisk", ["high", "low", "hexhigh", "hexlow"])
      f.puts design_oneof("paragraph", ["high", "low"])
      f.puts design_oneof("caret", ["high", "low"])
      f.puts design_oneof("underscore", ["high", "low"])
      f.puts design_oneof("percent", ["dots", "rings"])
      f.puts design_oneof("eszet", ["traditional", "sulzbacher"])
      f.puts design_oneof("brace", ["curly", "straight"])
      f.puts design_oneof("g", ["singlestorey", "opendoublestorey", "doublestorey"])
      f.puts design_oneof("numbersign", ["slanted", "straight"])
      f.puts design_oneof("dollar", ["through", "opencap", "thoughcap", "open"])
      f.puts design_oneof("q", ["straight", "taily"])
      f.puts design_oneof("t", ["standard", "cross"])
      f.puts design_oneof("three", ["flattop", "twoarcs"])
      f.puts design_oneof("a", ["singlestorey", "doublestorey"])
      f.puts design_oneof("m", ["shortleg", "longleg"])
      f.puts design_oneof("l", ["hooky", "zshaped", "serifed", "italic", "tailed", "hookybottom"])
      f.puts design_oneof("i", ["hooky", "zshaped", "serifed", "italic", "line"])
      f.puts design_oneof("j", ["serifed", "line"])
      f.puts design_oneof("j", ["serifed", "line"])
      f.puts design_oneof("f", ["straight", "tailed"])
      f.puts design_oneof("y", ["straight", "curly"])
      f.puts design_oneof("one", ["serifed", "hooky"])

      f.puts "\n"
      f.puts "[buildPlans.iosevka-brew.weights.thin]\nshape=100\ncss=100\nmenu=100" if build.with? "weight-thin"
      f.puts "[buildPlans.iosevka-brew.weights.extralight]\nshape=200\ncss=200\nmenu=200" if build.with? "weight-extralight"
      f.puts "[buildPlans.iosevka-brew.weights.light]\nshape=300\ncss=300\nmenu=300" if build.with? "weight-light"
      f.puts "[buildPlans.iosevka-brew.weights.regular]\nshape=400\ncss=400\nmenu=400" if build.with? "weight-regular"
      f.puts "[buildPlans.iosevka-brew.weights.medium]\nshape=500\ncss=500\nmenu=500" if build.with? "weight-medium"
      f.puts "[buildPlans.iosevka-brew.weights.semibold]\nshape=600\ncss=600\nmenu=600" if build.with? "weight-semibold"
      f.puts "[buildPlans.iosevka-brew.weights.bold]\nshape=700\ncss=700\nmenu=700" if build.with? "weight-bold"
      f.puts "[buildPlans.iosevka-brew.weights.extrabold]\nshape=800\ncss=800\nmenu=800" if build.with? "weight-extrabold"
      f.puts "[buildPlans.iosevka-brew.weights.heavy]\nshape=900\ncss=900\nmenu=900" if build.with? "weight-heavy"
      f.puts "\n"

      if build.with? "slant-upright"
        f.puts "[buildPlans.iosevka-brew.slopes.upright]"
        f.puts "angle = 0"
        f.puts "shape = \"upright\""
        f.puts "menu = \"upright\""
        f.puts "css = \"normal\""
      end
      if build.with? "slant-italic"
        f.puts "[buildPlans.iosevka-brew.slopes.italic]"
        f.puts "angle = 9.4"
        f.puts "shape = \"italic\""
        f.puts "menu = \"italic\""
        f.puts "css = \"italic\""
      end
      if build.with? "slant-oblique"
        f.puts "[buildPlans.iosevka-brew.slopes.oblique]"
        f.puts "angle = 9.4"
        f.puts "shape = \"oblique\""
        f.puts "menu = \"oblique\""
        f.puts "css = \"oblique\""
      end
    end

    system "npm", "run", "build", "--", "ttf::iosevka-brew" unless build.with? "woff" or build.with? "woff2"
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
