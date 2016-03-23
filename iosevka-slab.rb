class IosevkaSlab < Formula
  version "1.8.3"
  desc "Spatial efficient monospace font family for programming. Built from code."
  homepage "http://be5invis.github.io/Iosevka"
  url "https://github.com/be5invis/Iosevka/releases/download/v#{version}/04.iosevka-slab-#{version}.zip"
  # sha256 "63be44ad6323c68c34f39437e867660fd6dddbffe39cceee457611412317710f"

  head "https://github.com/be5invis/Iosevka.git"

  if build.head?
    depends_on "node"
    depends_on "fontforge"
    depends_on "ttfautohint"
    depends_on "fonttools"
  end

  env :std

  def install

    unless Dir.exist?("/Library/Fonts/Iosevka-Slab")
      Dir.mkdir("/Library/Fonts/Iosevka-Slab")
    end

    unless build.head?
      Dir.glob('./*.ttf') do |font|
        system "cp", "-fv", font, "/Library/Fonts/Iosevka-Slab"
      end
    end

    if build.head?
      ohai "not yet"
      # system "npm", "install"
      # system "make"

      # Dir.glob('./*') do |font|
      #   system "cp", "-fv", font, "/Library/Fonts/"
      # end
    end

  end

  test do
  end
end
