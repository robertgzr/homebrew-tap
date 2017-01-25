require "language/node"

class Iosevka < Formula
  desc "Monospace font family for programming built from code."
  homepage "https://be5invis.github.io/Iosevka"
  url "https://github.com/be5invis/Iosevka/archive/v1.11.0.zip"
  head "https://github.com/be5invis/Iosevka.git"

  option "with-test", "only builds the regular weight of each style - for testing"
  option "with-slab", "additionally build the serif variant"
  # option "with-webfonts", "additionally build the webfonts"

  # option "with-term", "additionally build the non-ligature variant"
  # option "with-cc", "additionally build the CC variant"

  option "with-zero-dotted", "use dotted zero glyph"
  option "with-zero-unslashed", "use O-like zero glyph"
  option "with-at-long", "use long, three-fold At symbol in Iosevka 1.7.x"
  option "with-at-fourfold", "use traditional, four-fold At symbol"
  option "with-tilde-high"
  option "with-asterisk-low"
  option "with-paragraph-low"
  option "with-caret-low"
  option "with-eszet-traditional", "use old eszet glyph"

  depends_on "node" => :build
  depends_on "ttfautohint" => :build
  depends_on "caryll/tap/otfcc-mac64" => :build

  depends_on "cmake" => :build if build.with? "webfonts"

  resource "sfnt2woff" do
    url "https://github.com/ppicazo/sfnt2woff.git"
    sha256 "1898e24afc18bb63b11698095d8a45169df9496e"
  end

  resource "woff2" do
    url "https://github.com/google/woff2.git"
    sha256 "b91b020ced3b0dc03a3d8c721ddbae811324f6fa"
  end

  def install
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

    # eszet options
    v_eszet = "v-eszet-"
    if build.with? "eszet-traditional"
      v_eszet += "traditional"
    else
      v_eszet += "sulzbacher"
    end

    upright = %W[
      #{v_zero}
      #{v_at}
      #{v_tilde}
      #{v_asterisk}
      #{v_paragraph}
      #{v_caret}
      #{v_eszet}
    ]

    args = %w[]
    args << "upright=#{upright.join(" ")}" unless upright.empty?

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
    ln_sf Dir[share/"*"], "/Users/#{ENV["USER"]}/Library/Fonts/iosevka/"
  end

  test do
    opoo "no tests"
  end
end
