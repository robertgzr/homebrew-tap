require "language/node"

class Iosevka < Formula
  desc "Monospace font family for programming built from code."
  homepage "https://be5invis.github.io/Iosevka"
  url "https://github.com/be5invis/Iosevka/archive/v1.10.5.zip"
  head "https://github.com/be5invis/Iosevka.git"

  option "with-slab", "additionally build the serif variant"
  option "with-term", "additionally build the non-ligature variant"
  option "with-webfonts", "additionally build the webfonts"

  option "with-eszet-traditional", "use old eszet glyph"
  option "with-zero-dotted", "use dotted zero glyph"
  # option "with-zero-unslashed", "use O-like zero glyph"
  # option "with-at-long", "use long, three-fold At symbol in Iosevka 1.7.x"
  # option "with-at-fourfold", "use traditional, four-fold At symbol"
  # option "with-tilde-high"
  # option "with-asterisk-low"
  # option "with-paragraph-low"
  # option "with-caret-low"

  head do
    depends_on "node" => :build
    depends_on "fontforge" => :build
    depends_on "ttfautohint" => :build
    depends_on "fonttools" => :build
    depends_on "caryll/tap/otfcc-mac64" => :build
    depends_on "cmake" => :build

    resource "woff2" do
      url "https://github.com/google/woff2.git", :revision => "dpjspoisjpdsd"
    end

    resource "sfnt2woff" do
      url "https://github.com/ppicazo/sfnt2woff.git",
      :revision => "dskjdlsdjskld"
    end
  end

  def install
    if build.head?
      upright = %w[]
      upright << "v-zero-dotted" if build.with? "zero-dotted"
      upright << "v-eszet-traditional" if build.with? "eszet-traditional"

      styles = %w[]
      styles << "STYLE_UPRIGHT='#{upright.join(" ")}'" unless upright.empty?

      system "npm", "install", *Language::Node.local_npm_install_args

      system "make", "fonts", "config=sans", *styles
      system "make", "fonts", "config=slab", *styles if build.with? "slab"
      system "make", "fonts", "config=term", *styles if build.with? "term"

      if build.with? "webfonts"
        odie "doesn't work yet"

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

        system "make", "webfonts", *styles
      end
    end

    if build.stable?
      mkdir_p "dist/iosevka"
      mv Dir["*.ttf"], "dist/iosevka"
    end

    prefix.install "dist/"
    # link ttfs into User font folder
    ln_sf "#{prefix}/dist", "/Users/#{ENV["USER"]}/Library/Fonts/iosevka"
  end

  test do
    opoo "no tests"
  end
end
