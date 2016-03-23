class Iosevka < Formula
  version "1.8.3"
  desc "Spatial efficient monospace font family for programming. Built from code."
  homepage "http://be5invis.github.io/Iosevka"
  url "https://github.com/be5invis/Iosevka/releases/download/v#{version}/01.iosevka-#{version}.zip"
  # sha256 "081d74b60d47dc0cfd27abb8db0207e743ca85a3a3e2a2de00f0990db1761971"

  head "https://github.com/be5invis/Iosevka.git"

  if build.head?
    depends_on "node"
    depends_on "fontforge"
    depends_on "ttfautohint"
    depends_on "fonttools"
  end

  env :std

  def install

    unless Dir.exist?("/Library/Fonts/Iosevka")
      Dir.mkdir("/Library/Fonts/Iosevka")
    end

    unless build.head?
      Dir.glob('./*.ttf') do |font|
        system "cp", "-fv", font, "/Library/Fonts/Iosevka"
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
