require "language/node"

class Iosevka < Formula
  desc "Monospace font family for programming built from code."
  homepage "https://be5invis.github.io/Iosevka"
  url "https://github.com/be5invis/Iosevka/archive/v1.14.3.tar.gz"
  sha256 "906e7a30245c4458100baef4e31e92b48e24a494b69db8b20bf8204f3b3860a5"
  head "https://github.com/be5invis/Iosevka.git"

  option "without-sans", "skip building the default sans variant"
  option "with-slab", "additionally build the serif variant"
  option "with-webfonts", "additionally build the webfonts"

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

  option "without-thin", "skip building the 'thin' weight"
  option "without-extralight", "skip building the 'extralight' weight"
  option "without-light", "skip building the 'light' weight"
  option "without-book", "skip building the 'regular' weight"
  option "without-medium", "skip building the 'medium' weight"
  option "without-bold", "skip building the 'bold' weight"
  option "without-heavy", "skip building the 'heavy' weight"

  def return_variant_if_build_option(val)
    return "v-#{val}" if build.with? val
  end

  option "with-experimental-expanded", "build with 15% wider characters"
  option "with-experimental-compressed", "build with even more compressed characters"

  depends_on "node" => :build
  depends_on "ttfautohint" => :build
  depends_on "caryll/tap/otfcc-mac64" => :build

  depends_on "cmake" => :build if build.with? "webfonts"
  depends_on "robertgzr/homebrew-tap/woff2" => :build if build.with? "webfonts"

  resource "sfnt2woff" do
    url "https://github.com/ppicazo/sfnt2woff.git"
    sha256 "dab5d8bc14d79b0b4594bb97adcc2604079c1909112b96c2ba7787a30a5efe49"
  end

  def install
    prestyle = Array.new

    prestyle << "ss01" if build.with? "ss01"
    prestyle << "ss02" if build.with? "ss02"
    prestyle << "ss03" if build.with? "ss03"
    prestyle << "ss04" if build.with? "ss04"
    prestyle << "ss05" if build.with? "ss05"
    prestyle << "ss06" if build.with? "ss06"
    prestyle << "ss07" if build.with? "ss07"
    prestyle << "ss08" if build.with? "ss08"
    prestyle << "ss09" if build.with? "ss09"
    prestyle << "ss10" if build.with? "ss10"
    prestyle << "ss11" if build.with? "ss11"

    prestyle << "ligset-haskell" if build.with? "ligset-haskell"
    prestyle << "ligset-idris" if build.with? "ligset-idris"
    prestyle << "ligset-coq" if build.with? "ligset-coq"
    prestyle << "ligset-elm" if build.with? "ligset-elm"
    prestyle << "ligset-ml" if build.with? "ligset-ml"
    prestyle << "ligset-fs" if build.with? "ligset-fs"
    prestyle << "ligset-fstar" if build.with? "ligset-fstar"
    prestyle << "ligset-swift" if build.with? "ligset-swift"
    prestyle << "ligset-purescript" if build.with? "ligset-purescript"

    prestyle << "term" if build.with? "term"
    prestyle << "termlig" if build.with? "termlig"
    prestyle << "type" if build.with? "type"
    prestyle << "stress-fw" if build.with? "stress-fw"

    design = Array.new
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

    poststyle = nil
    poststyle = "compressed" if build.with? "experimental-compressed"
    poststyle = "expanded" if build.with? "experimental-expanded"

    weights = Array.new
    weights << "thin" unless build.without? "thin"
    weights << "extralight" unless build.without? "extralight"
    weights << "light" unless build.without? "light"
    weights << "book" unless build.without? "book"
    weights << "medium" unless build.without? "medium"
    weights << "bold" unless build.without? "bold"
    weights << "heavy" unless build.without? "heavy"

    args = %w[]
    # args << "family=Iosevka Brew"
    args << "weights=#{weights.join(" ")}" unless weights.empty?
    args << "prestyle=#{prestyle.join(" ")}" unless prestyle.empty?
    args << "poststyle=#{poststyle}" unless poststyle.nil?
    args << "design=#{design.join(" ")}" unless design.empty?

    system "npm", "install", *Language::Node.local_npm_install_args
    system "make", "custom-config", "set=brew", *args

    if build.with? "sans"
      system "make", "custom", "set=brew"
    end

    if build.with? "slab"
      prestyle << "slab"

      args = %w[]
      args << "weights=#{weights.join(" ")}" unless weights.empty?
      args << "prestyle=#{prestyle.join(" ")}" unless prestyle.empty?
      args << "poststyle=#{poststyle}" unless poststyle.empty?
      args << "design=#{design.join(" ")}" unless design.empty?

      system "make", "custom-config", "set=brew-slab", *args
      system "make", "custom", "set=brew-slab"
    end

    if build.with? "webfonts"
      resource("sfnt2woff").stage buildpath/"webfontbin/sfnt2woff"
      chdir "#{buildpath}/webfontbin/sfnt2woff" do
        mkdir "build" do
          system "cmake", ".."
          system "make"
        end
      end
      ENV.prepend_path "PATH", "#{buildpath}/webfontbin/sfnt2woff/build"

      system "make", "custom-web", "set=brew"
      system "make", "custom-web", "set=brew-slab" if build.with? "slab"
    end

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
