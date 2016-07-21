cask "font-iosevka-inziu" do
  version "1.9.1"
  sha256 "aa75fc2365fe302ade7a4bf2eb575519e60b61dbccc94c46983f4fa62f1c2ad7"

  url "http://7xpdnl.dl1.z0.glb.clouddn.com/inziu-iosevka-ttfs-#{version}.7z"
  name "Iosevka"
  homepage "https://be5invis.github.io/Iosevka/inziu.html"
  license :ofl

  Dir["#{caskroom_path}/#{version}/*.ttf"].each do |f|
    font f, target: "iosevka-inziu/#{f.gsub("#{caskroom_path}/#{version}/", "")}"
  end
end
