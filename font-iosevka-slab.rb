cask "font-iosevka-slab" do
  version "1.8.5"
  sha256 "5df02e6cb341ca4f33e591955ed0152c17457eca76b04d085a4d40ee5858c952"

  url "https://github.com/be5invis/Iosevka/releases/download/v#{version}/04.iosevka-slab-#{version}.zip"
  name "Iosevka Slab"
  homepage "https://github.com/be5invis/Iosevka/"
  license :ofl

  Dir["/opt/homebrew-cask/Caskroom/font-iosevka-slab/#{version}/*.ttf"].each do |f|
    font f, target: "iosevka-slab/#{f.gsub("/opt/homebrew-cask/Caskroom/font-iosevka-slab/1.8.5/", "")}"
  end
end
