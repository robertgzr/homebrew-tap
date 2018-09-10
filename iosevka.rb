require "language/node"

class Iosevka < Formula
  desc "Monospace font family for programming built from code."
  homepage "https://be5invis.github.io/Iosevka"
  # url "https://github.com/be5invis/Iosevka/archive/v2.0.0.tar.gz"
  # sha256 "4b21d376db601280a4a5ee2a7996819188e8c4a32b7e7e6de16c0a260e0b69fc"
  head "https://github.com/be5invis/Iosevka.git"

  option "without-sans", "skip building the default sans variant"
  option "with-slab", "additionally build the serif variant"
  option "with-woff", "additionally build the webfonts (woff)"
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

  option "with-term", "disable ligations and exact monospace"
  option "with-termlig", "like term but ligations are present"
  option "with-type", "make symbols fullwidth"
  option "with-stress-fw", "full-width characters varying form U+FF00 to U+FFFF will be boxed to present a clear distinguish between ASCII and Full-width"

  option "with-ligset-haskell", "default ligation set would be assigned to Haskell"
  option "with-ligset-idris", "default ligation set would be assigned to Idris"
  option "with-ligset-coq", "default ligation set would be assigned to Coq (contains all possible ligatures)"
  option "with-ligset-elm", "default ligation set would be assigned to Elm"
  option "with-ligset-ml", "default ligation set would be assigned to ML"
  option "with-ligset-fs", "default ligation set would be assigned to F#"
  option "with-ligset-fstar", "default ligation set would be assigned to F*"
  option "with-ligset-swift", "default ligation set would be assigned to Swift"
  option "with-ligset-purescript", "default ligation set would be assigned to PureScript"

  # TODO leading-*
  # TODO powerline-*

  option "with-experimental-expanded", "build with 10% wider characters"
  option "with-experimental-compressed", "build with 10% narrower characters"

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

  option "with-paragraph-high"
  option "with-paragraph-low"

  option "with-caret-high"
  option "with-caret-low"

  option "with-underscore-high"
  option "with-underscore-low"

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

  def return_if_build_option(val, prefix = "")
    return "#{prefix}#{val}" if build.with? val
  end
  def return_variant_if_build_option(val)
    return return_if_build_option(val, "v-")
  end

  depends_on "node" => :build
  depends_on "ttfautohint" => :build
  depends_on "caryll/tap/otfcc-mac64" => :build

  def install
    design = Array.new
    design << "sans" unless build.without? "sans"
    design << return_if_build_option("slab")
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
    # ligature/spacing styles
    design << return_if_build_option("term")
    design << return_if_build_option("termlig")
    design << return_if_build_option("type")
    design << return_if_build_option("stress-fw")
    design << return_if_build_option("ligset-haskell")
    design << return_if_build_option("ligset-idris")
    design << return_if_build_option("ligset-coq")
    design << return_if_build_option("ligset-elm")
    design << return_if_build_option("ligset-ml")
    design << return_if_build_option("ligset-fs")
    design << return_if_build_option("ligset-fstar")
    design << return_if_build_option("ligset-swift")
    design << return_if_build_option("ligset-purescript")
    # character variants
    design << return_variant_if_build_option("zero-dotted")
    design << return_variant_if_build_option("zero-unslashed")
    design << return_variant_if_build_option("zero-slashed")
    design << return_variant_if_build_option("at-long")
    design << return_variant_if_build_option("at-short")
    design << return_variant_if_build_option("at-fourfold")
    design << return_variant_if_build_option("tilde-high")
    design << return_variant_if_build_option("tilde-low")
    design << return_variant_if_build_option("asterisk-high")
    design << return_variant_if_build_option("asterisk-low")
    design << return_variant_if_build_option("paragraph-high")
    design << return_variant_if_build_option("paragraph-low")
    design << return_variant_if_build_option("caret-high")
    design << return_variant_if_build_option("caret-low")
    design << return_variant_if_build_option("underscore-high")
    design << return_variant_if_build_option("underscore-low")
    design << return_variant_if_build_option("eszet-traditional")
    design << return_variant_if_build_option("eszet-sulzbacher")
    design << return_variant_if_build_option("brace-curly")
    design << return_variant_if_build_option("brace-straight")
    design << return_variant_if_build_option("g-singlestorey")
    design << return_variant_if_build_option("g-opendoublestorey")
    design << return_variant_if_build_option("g-doublestorey")
    design << return_variant_if_build_option("numbersign-slanted")
    design << return_variant_if_build_option("numbersign-straight")
    design << return_variant_if_build_option("dollar-through")
    design << return_variant_if_build_option("dollar-opencap")
    design << return_variant_if_build_option("dollar-throughcap")
    design << return_variant_if_build_option("dollar-open")
    design << return_variant_if_build_option("q-straight")
    design << return_variant_if_build_option("q-taily")
    design << return_variant_if_build_option("t-standard")
    design << return_variant_if_build_option("t-cross")
    design << return_variant_if_build_option("three-flattop")
    design << return_variant_if_build_option("three-twoarcs")
    design << return_variant_if_build_option("a-singlestorey")
    design << return_variant_if_build_option("a-doublestorey")
    design << return_variant_if_build_option("m-shortleg")
    design << return_variant_if_build_option("m-longleg")
    design << return_variant_if_build_option("l-hooky")
    design << return_variant_if_build_option("l-zshaped")
    design << return_variant_if_build_option("l-serifed")
    design << return_variant_if_build_option("l-italic")
    design << return_variant_if_build_option("l-tailed")
    design << return_variant_if_build_option("l-hookybottom")
    design << return_variant_if_build_option("i-hooky")
    design << return_variant_if_build_option("i-zshaped")
    design << return_variant_if_build_option("i-serified")
    design << return_variant_if_build_option("i-italic")
    design << return_variant_if_build_option("f-straight")
    design << return_variant_if_build_option("f-tailed")
    design << return_variant_if_build_option("y-straight")
    design << return_variant_if_build_option("y-curly")
    design << return_variant_if_build_option("one-serifed")
    design << return_variant_if_build_option("one-hooky")
    design.delete_if {|v| v == nil} # cleanup design array

    # experimental width mods (can only apply one at a time)
    with_mod = nil
    with_mod = return_if_build_option("compressed")
    with_mod = return_if_build_option("expanded")
    design << with_mod if with_mod != nil

    system "npm", "install", *Language::Node.local_npm_install_args
    File.open("private-build-plans.toml", "w:UTF-8") { |f|
      f.puts "[buildPlans.iosevka-brew]"
      f.puts "family = \"Iosevka Brew\""
      f.puts "design = [\"#{design.join('", "')}\"]"
      f.puts "\n"
      f.puts "[buildPlans.iosevka-brew.weights.thin]\nshape=100\ncss=100" unless build.without? "weight-thin"
      f.puts "[buildPlans.iosevka-brew.weights.extralight]\nshape=200\ncss=200" unless build.without? "weight-extralight"
      f.puts "[buildPlans.iosevka-brew.weights.light]\nshape=300\ncss=300" unless build.without? "weight-light"
      f.puts "[buildPlans.iosevka-brew.weights.regular]\nshape=400\ncss=400" unless build.without? "weight-regular"
      f.puts "[buildPlans.iosevka-brew.weights.medium]\nshape=500\ncss=500" unless build.without? "weight-medium"
      f.puts "[buildPlans.iosevka-brew.weights.semibold]\nshape=600\ncss=600" unless build.without? "weight-semibold"
      f.puts "[buildPlans.iosevka-brew.weights.bold]\nshape=700\ncss=700" unless build.without? "weight-bold"
      f.puts "[buildPlans.iosevka-brew.weights.extrabold]\nshape=800\ncss=800" unless build.without? "weight-extrabold"
      f.puts "[buildPlans.iosevka-brew.weights.heavy]\nshape=900\ncss=900" unless build.without? "weight-heavy"
      f.puts "\n"
      unless build.without? "slant-upright" and build.without? "slant-italic" and build.without? "slant-oblique"
        f.puts "[buildPlans.iosevka-brew.slants]" 
        f.puts "upright = \"normal\"" unless build.without? "slant-upright"
        f.puts "italic = \"italic\"" unless build.without? "slant-italic"
        f.puts "oblique = \"oblique\"" unless build.without? "slant-oblique"
      end
    }

    system "npm", "run", "build", "--", "ttf:iosevka-brew" unless build.with? "woff" or build.with? "woff2"
    system "npm", "run", "build", "--", "woff:iosevka-brew" if build.with? "woff"
    system "npm", "run", "build", "--", "woff2:iosevka-brew" if build.with? "woff2"
    system "npm", "run", "build", "--", "ttf-unhinted:iosevka-brew" if build.with? "unhinted"

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
