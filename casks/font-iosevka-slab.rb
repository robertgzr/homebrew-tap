cask "font-iosevka-slab" do
  version "1.9.1"
  sha256 "dd8950614acf01b829db5243d1cde5169d4e153b3aece3b13b470632287ca3bd"

  url "https://github.com/be5invis/Iosevka/releases/download/v#{version}/04.iosevka-slab-#{version}.zip"
  name "Iosevka Slab"
  homepage "https://github.com/be5invis/Iosevka/"
  license :ofl

  Dir["#{caskroom_path}/#{version}/*.ttf"].each do |f|
    font f, target: "iosevka-slab/#{f.gsub("#{caskroom_path}/#{version}/", "")}"
  end
end
