require "language/node"

class Iosevka < Formula
  desc "Monospace font family for programming built from code."
  homepage "https://be5invis.github.io/Iosevka"

  stable do
    gh_url = "https://github.com/be5invis/Iosevka/releases/download"
    version = "1.8.5"

    url "#{gh_url}/v#{version}/01.iosevka-#{version}.zip"
    sha256 "abc7531632907bd7df017a7870c4fdf82d55331fb78d3f246d0b7bca48764291"

    resource "term" do
      url "#{gh_url}/v#{version}/02.iosevka-term-#{version}.zip"
      sha256 "c7b23e17ccd38e947f290142ebaf5cb8b78509635faf7c7d63976bc12c73fd3f"
    end

    resource "cc" do
      url "#{gh_url}/v#{version}/03.iosevka-cc-#{version}.zip"
      sha256 "27d4c5269006574af9cee392e8377c01d315b2ae34c003c97c49ece74b3f9a39"
    end

    resource "slab" do
      url "#{gh_url}/v#{version}/04.iosevka-slab-#{version}.zip"
      sha256 "5df02e6cb341ca4f33e591955ed0152c17457eca76b04d085a4d40ee5858c952"
    end

    resource "term-slab" do
      url "#{gh_url}/v#{version}/05.iosevka-term-slab-#{version}.zip"
      sha256 "5901bf9e48c89e139c13ed2396a9b3334fdd53df523fd8854dc5829f7a092cb7"
    end

    resource "cc-slab" do
      url "#{gh_url}/v#{version}/06.iosevka-cc-slab-#{version}.zip"
      sha256 "c3d606899f02da1e83ed9258c2a38eda9d05c3042ff0dda29330602049712a72"
    end

    resource "hooky" do
      url "#{gh_url}/v#{version}/07.iosevka-hooky-#{version}.zip"
      sha256 "43e3077016df5550b644686c3b018544c48bceb05a3ee53b5458ce90a010801f"
    end

    resource "term-hooky" do
      url "#{gh_url}/v#{version}/08.iosevka-term-hooky-#{version}.zip"
      sha256 "4fd5a06a7f43be0286f886ed4ef4c2a6acf23bae2964f474e8942826c1a86181"
    end

    resource "zshaped" do
      url "#{gh_url}/v#{version}/09.iosevka-zshaped-#{version}.zip"
      sha256 "2a8a02bac0f42cc4e1d69877c74a998e14363d0e5af96622f2e218f829a1b97c"
    end

    resource "term-zshaped" do
      url "#{gh_url}/v#{version}/10.iosevka-term-zshaped-#{version}.zip"
      sha256 "bf7a374cd31b68c846e3a661f60da21119d4bfa6c020315308bdc26611cd1fbf"
    end
  end

  head do
    url "https://github.com/be5invis/Iosevka.git"

    depends_on "node" => :build
    depends_on "fontforge" => :build
    depends_on "ttfautohint" => :build
    depends_on "fonttools" => :build
    depends_on "cmake" => :build

    resource "woff2" do
      url "https://github.com/google/woff2.git"
      sha256 "dpjspoisjpdsd"
    end

    resource "sfnt2woff" do
      url "https://github.com/ppicazo/sfnt2woff.git"
      sha256 "dskjdlsdjskld"
    end
  end

  option "with-slab", "Also install the serif version"
  option "with-term", "Also install the non-ligature version"
  option "with-cc", "Also install the CJK compatible version"
  option "with-hooky", "Also install the hooky variant of letters i,l"
  option "with-zshaped", "Also install the zshaped variant of letters i,l"
  option "with-all", "Install all variants"
  option "with-webfonts", "Build the webfont variant (only HEAD)"

  def stage_option(option)
    r = resource(option)
    r.stage (prefix/"iosevka-#{r.name}")
  end

  def install
    # HEAD build here
    if build.head?
      system "npm", "install", *Language::Node.local_npm_install_args
      # system "make fonts config=sans"
      # system "make fonts config=slab" if build.with? "slab"

      if build.with? "webfonts"
        odie "doesn't work yet"

        resource("sfnt2woff").stage buildpath/"webfontbin/sfnt2woff"
        resource("woff2").stage buildpath/"webfontbin/woff2"
        chdir "#{buildpath}/webfontbin/sfnt2woff" do
          mkdir "build" do
            system "cmake .."
            system "make clean all"
          end
        end
        chdir "#{buildpath}/webfontbin/woff2" do
          system "make clean all"
        end
        ENV.prepend_path "PATH", "#{buildpath}/webfontbin/sfnt2woff/build"
        ENV.prepend_path "PATH", "#{buildpath}/webfontbin/woff2/"

        # system "make webfonts"
      end
    # Download and install here
    else
      if build.with? "webfonts"
        opoo "You have to build from source to get the webfont"
      end
      if build.with? "all"
        resources.each do |r|
          r.stage (prefix/r.name)
        end
      end

      if build.with? "term"
        stage_option "term"
        stage_option "term-slab" if build.with? "slab"
        stage_option "term-hooky" if build.with? "hooky"
        stage_option "term-zshaped" if build.with? "zshaped"
      end

      if build.with? "cc"
        stage_option "cc"
        stage_option "cc-slab" if build.with? "slab"
      end

      stage_option "slab" if build.with? "slab"
      stage_option "slab" if build.with? "hooky"
      stage_option "zshaped" if build.with? "zshaped"

      # move into place
      mkdir "iosevka"
      mv Dir["./iosevka-*"], "iosevka/"
      prefix.install "iosevka/"
    end

    # link ttfs into User font folder
    ln_sf Dir[prefix/"iosevka*"], "/Users/#{ENV["USER"]}/Library/Fonts/"
  end

  test do
    opoo "no tests"
  end
end
