cask "font-iosevka" do
  version "1.8.5"
  sha256 "abc7531632907bd7df017a7870c4fdf82d55331fb78d3f246d0b7bca48764291"

  url "https://github.com/be5invis/Iosevka/releases/download/v#{version}/01.iosevka-#{version}.zip"
  name "Iosevka"
  homepage "https://github.com/be5invis/Iosevka/"
  license :ofl

  Dir["/opt/homebrew-cask/Caskroom/font-iosevka/#{version}/*.ttf"].each do |f|
    font f, target: "iosevka/#{f.gsub("/opt/homebrew-cask/Caskroom/font-iosevka/1.8.5/", "")}"
  end
end
