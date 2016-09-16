cask "font-iosevka" do
  version "1.9.3"
  sha256 "9ea3796fe4c483b45cf52a23657a1adb3b0b6e3cb7b3ebc285435eb63cd84f04"

  url "https://github.com/be5invis/Iosevka/releases/download/v#{version}/01.iosevka-#{version}.zip"
  name "Iosevka"
  homepage "https://github.com/be5invis/Iosevka/"
  license :ofl

  Dir["#{caskroom_path}/#{version}/*.ttf"].each do |f|
    font f, target => "iosevka/#{f.gsub("#{caskroom_path}/#{version}/", "")}"
  end
end
