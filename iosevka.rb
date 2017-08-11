require "language/node"

class Iosevka < Formula
  desc "Monospace font family for programming built from code."
  homepage "https://be5invis.github.io/Iosevka"
  url "https://github.com/be5invis/Iosevka/archive/v1.13.2.tar.gz"
  sha256 "bba7284dbff9abd778926ccacd8aa4d001dbb817d8bc5e8bad6b7086e7bccef0"
  head "https://github.com/be5invis/Iosevka.git"

  option "with-slab", "additionally build the serif variant"
  option "with-webfonts", "additionally build the webfonts"

  # option "with-term", "additionally build the non-ligature variant"
  # option "with-cc", "additionally build the CC variant"

  option "with-zero-dotted"
  option "with-zero-unslashed"
  option "with-at-long"
  option "with-at-fourfold"
  option "with-tilde-high"
  option "with-asterisk-low"
  option "with-paragraph-low"
  option "with-caret-low"
  option "with-underscore-low"
  option "with-eszet-traditional"
  option "with-g-singlestorey"
  option "with-g-opendoublestorey"
  option "with-numbersign-slanted"
  option "with-dollar-open"
  option "with-q-straight"
  option "with-t-cross"
  option "with-3-flattop"
  option "with-a-singlestorey"
  option "with-m-shortleg"
  # option "with-l-hooky"
  # option "with-l-zshaped"
  # option "with-i-hooky"
  # option "with-i-zshaped"

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
    # zero options
    v_zero = "v-zero-"
    v_zero += "dotted" if build.with? "zero-dotted"
    v_zero += "unslashed" if build.with? "zero-unslashed"
    v_zero += "slashed" unless (build.with? "zero-dotted") || (build.with? "zero-unslashed")

    # at options
    v_at = "v-at-"
    v_at += "long" if build.with? "at-long"
    v_at += "fourfold" if build.with? "at-fourfold"
    v_at += "short" unless (build.with? "at-long") || (build.with? "at-fourfold")

    # g options
    v_g = "v-g-"
    v_g += "singlestorey" if build.with? "g-singlestorey"
    v_g += "opendoublestorey" if build.with? "g-opendoublestorey"
    v_g += "doublestorey" unless (build.with? "g-singlestorey") || (build.with? "g-opendoublestorey")

    # tilde options
    v_tilde = "v-tilde-"
    v_tilde += (build.with? "tilde-high") && "high" || "low"

    # asterisk options
    v_asterisk = "v-asterisk-"
    v_asterisk += (build.with? "asterisk-low") && "low" || "high"

    # paragraph options
    v_paragraph = "v-paragraph-"
    v_paragraph += (build.with? "paragraph-low") && "low" || "high"

    # caret options
    v_caret = "v-caret-"
    v_caret += (build.with? "caret-low") && "low" || "high"

    # underscore options
    v_underscore = "v-underscore-"
    v_underscore += (build.with? "underscore-low") && "low" || "high"

    # eszet options
    v_eszet = "v-eszet-"
    v_eszet += (build.with? "eszet-traditional") && "traditional" || "sulzbacher"

    # brace options
    v_brace = "v-brace-"
    v_brace += (build.with? "brace-straight") && "straight" || "curly"

    # numbersign options
    v_numbersign = "v-numbersign-"
    v_numbersign += (build.with? "numbersign-slanted") && "slanted" || "straight"

    # dollar options
    v_dollar = "v-dollar-"
    v_dollar += (build.with? "dollar-open") && "open" || "through"

    # t options
    v_t = "v-t-"
    v_t += (build.with? "t-cross") && "cross" || "standard"

    # q options
    v_q = "v-q-"
    v_q += (build.with? "q-straight") && "straight" || "taily"

    # 3 options
    v_three = "v-three-"
    v_three += (build.with? "3-flattop") && "flattop" || "twoarcs"

    # a options
    v_a = "v-a-"
    v_a += (build.with? "a-singlestorey") && "singlestorey" || "doublestorey"

    # m options
    v_m = "v-m-"
    v_m += (build.with? "m-shortleg") && "shortleg" || "longleg"

    upright = %W[
      #{v_g}
      #{v_t}
      #{v_q}
      #{v_a}
      #{v_m}
      #{v_zero}
      #{v_tilde}
      #{v_asterisk}
      #{v_underscore}
      #{v_paragraph}
      #{v_caret}
      #{v_at}
      #{v_eszet}
      #{v_brace}
      #{v_dollar}
      #{v_numbersign}
      #{v_three}
    ]

    poststyle = ""
    poststyle = "compressed" if build.with? "experimental-compressed"
    poststyle = "expanded" if build.with? "experimental-expanded"

    args = %w[]
    args << "upright=#{upright.join(" ")}" unless upright.empty?
    args << "poststyle=#{poststyle}" unless poststyle.empty?

    system "npm", "install", *Language::Node.local_npm_install_args
    system "make", "custom-config", "set=brew", *args

    system "make", "custom", "set=brew"

    if build.with? "slab"
      system "make", "custom-config", "set=brew-slab", "design=slab", *args
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
      if build.with? "slab"
        system "make", "custom-web", "set=brew-slab"
      end
    end

    share.install Dir["dist/*"]
  end

  def caveats
    <<-EOS.undent
      Homebrew does not allow Formulas to move files to arbitrary locations in the filesystem.
      To install the font please do: 

      cp -fr #{share} ~/Library/Fonts/iosevka
    EOS
  end

  test do
    opoo "no tests"
  end
end
