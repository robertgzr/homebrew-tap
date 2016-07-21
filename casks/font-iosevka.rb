cask "font-iosevka" do
  version "1.9.1"
  sha256 "aa75fc2365fe302ade7a4bf2eb575519e60b61dbccc94c46983f4fa62f1c2ad7"

  url "https://github.com/be5invis/Iosevka/releases/download/v#{version}/01.iosevka-#{version}.zip"
  name "Iosevka"
  homepage "https://github.com/be5invis/Iosevka/"
  license :ofl

  Dir["#{caskroom_path}/#{version}/*.ttf"].each do |f|
    font f, target: "iosevka/#{f.gsub("#{caskroom_path}/#{version}/", "")}"
  end
end
