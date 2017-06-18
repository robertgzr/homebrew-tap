require "language/node"

class Iosevka < Formula
  desc "Monospace font family for programming built from code."
  homepage "https://be5invis.github.io/Iosevka"
  url "https://github.com/be5invis/Iosevka/archive/v1.13.1.tar.gz"
  sha256 "d4e9c79345e6490dd9a0f53058b955b8cc8baadbd4bc6d4bf00e19a1a6c20c3f"
  head "https://github.com/be5invis/Iosevka.git"

  option "with-test", "only builds the regular weight of each style - for testing"
  option "with-slab", "additionally build the serif variant"
  # option "with-webfonts", "additionally build the webfonts"

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

  option "with-experimental-expanded", "build with 15% wider characters"
  option "with-experimental-compressed", "build with even more compressed characters"

  depends_on "node" => :build
  depends_on "ttfautohint" => :build
  depends_on "caryll/tap/otfcc-mac64" => :build

  depends_on "cmake" => :build if build.with? "webfonts"

  resource "sfnt2woff" do
    url "https://github.com/ppicazo/sfnt2woff.git"
    sha256 "dab5d8bc14d79b0b4594bb97adcc2604079c1909112b96c2ba7787a30a5efe49"
  end

  resource "woff2" do
    url "https://github.com/google/woff2.git"
    sha256 "f540cc24cacf399c6153e81e5d582669192873b4240c480e13a43c8db5801939"
  end

  def install
    font_dir = "/Users/#{ENV["USER"]}/Library/Fonts/iosevka/"
    # check if iosevka is installed and remove the old version
    # if Dir[font_dir/"*"].exist? then
    #   File.foreach(Dir[font_dir/"**/*"]) do |fn|
    #     fn.delete
    #   end
    # end

    # zero options
    v_zero = "v-zero-"
    if build.with? "zero-dotted"
      v_zero += "dotted"
    elsif build.with? "zero-unslashed"
      v_zero += "unslashed"
    else
      v_zero += "slashed"
    end

    # at options
    v_at = "v-at-"
    if build.with? "at-long"
      v_at += "long"
    elsif build.with? "at-fourfold"
      v_at += "fourfold"
    else
      v_at += "short"
    end

    # g options
    v_g = "v-g-"
    if build.with? "g-singlestorey"
      v_g += "singlestorey"
    elsif build.with? "g-opendoublestorey"
      v_g += "opendoublestorey"
    else
      v_g += "doublestorey"
    end

    # tilde options
    v_tilde = "v-tilde-"
    if build.with? "tilde-high"
      v_tilde += "high"
    else
      v_tilde += "low"
    end

    # asterisk options
    v_asterisk = "v-asterisk-"
    if build.with? "asterisk-low"
      v_asterisk += "low"
    else
      v_asterisk += "high"
    end

    # paragraph options
    v_paragraph = "v-paragraph-"
    if build.with? "paragraph-low"
      v_paragraph += "low"
    else
      v_paragraph += "high"
    end

    # caret options
    v_caret = "v-caret-"
    if build.with? "caret-low"
      v_caret += "low"
    else
      v_caret += "high"
    end

    # underscore options
    v_underscore = "v-underscore-"
    if build.with? "underscore-low"
      v_underscore += "low"
    else
      v_underscore += "high"
    end

    # eszet options
    v_eszet = "v-eszet-"
    if build.with? "eszet-traditional"
      v_eszet += "traditional"
    else
      v_eszet += "sulzbacher"
    end

    # brace options
    v_brace = "v-brace-"
    if build.with? "brace-straight"
      v_brace += "straight"
    else
      v_brace += "curly"
    end

    # numbersign options
    v_numbersign = "v-numbersign-"
    if build.with? "numbersign-slanted"
      v_numbersign += "slanted"
    else
      v_numbersign += "straight"
    end

    # dollar options
    v_dollar = "v-dollar-"
    if build.with? "dollar-open"
      v_dollar += "open"
    else
      v_dollar += "through"
    end

    # t options
    v_t = "v-t-"
    if build.with? "-cross"
      v_t += "cross"
    else
      v_t += "standard"
    end

    # q options
    v_q = "v-q-"
    if build.with? "q-straight"
      v_q += "straight"
    else
      v_q += "taily"
    end

    upright = %W[
      #{v_g}
      #{v_t}
      #{v_q}
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
    ]

    poststyle = ""
    poststyle = "compressed" if build.with? "experimental-compressed"
    poststyle = "expanded" if build.with? "experimental-expanded"

    args = %w[]
    args << "upright=#{upright.join(" ")}" unless upright.empty?
    args << "poststyle=#{poststyle}" unless poststyle.empty?

    system "npm", "install", *Language::Node.local_npm_install_args
    system "make", "custom-config", "set=brew", *args

    # keep around for debugging
    if build.with? "test"
      system "make", "dist/iosevka-brew/iosevka-brew-regular.ttf", "set=brew", "__IOSEVKA_CUSTOM_BUILD__=true"
      system "make", "dist/iosevka-brew/iosevka-brew-italic.ttf", "set=brew", "__IOSEVKA_CUSTOM_BUILD__=true"
      system "make", "dist/iosevka-brew/iosevka-brew-oblique.ttf", "set=brew", "__IOSEVKA_CUSTOM_BUILD__=true"
    else
      system "make", "custom", "set=brew"
    end

    if build.with? "slab"
      system "make", "custom-config", "set=brew-slab", "design=slab", *args
      if build.with? "test"
        system "make", "dist/iosevka-brew-slab/iosevka-brew-slab-regular.ttf", "set=brew-slab", "__IOSEVKA_CUSTOM_BUILD__=true"
        system "make", "dist/iosevka-brew-slab/iosevka-brew-slab-italic.ttf", "set=brew-slab", "__IOSEVKA_CUSTOM_BUILD__=true"
        system "make", "dist/iosevka-brew-slab/iosevka-brew-slab-oblique.ttf", "set=brew-slab", "__IOSEVKA_CUSTOM_BUILD__=true"
      else
        system "make", "custom", "set=brew-slab"
      end
    end

    if build.with? "webfonts"
      resource("sfnt2woff").stage buildpath/"webfontbin/sfnt2woff"
      resource("woff2").stage buildpath/"webfontbin/woff2"
      chdir "#{buildpath}/webfontbin/sfnt2woff" do
        mkdir "build" do
          system "cmake", ".."
          system "make"
        end
      end
      chdir "#{buildpath}/webfontbin/woff2" do
        system "make"
      end
      ENV.prepend_path "PATH", "#{buildpath}/webfontbin/sfnt2woff/build"
      ENV.prepend_path "PATH", "#{buildpath}/webfontbin/woff2/"

      system "make", "custom-web"
    end

    share.install Dir["dist/*"]
    # link ttfs into User font folder
    mkdir_p "/Users/#{ENV["USER"]}/Library/Fonts/iosevka"
    ln_sf Dir[share/"*"], font_dir
  end

  test do
    opoo "no tests"
  end
end
