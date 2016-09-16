cask "font-iosevka-slab" do
  version "1.9.3"
  sha256 "668a42212b9dcb253f308ba6137deaa8616dece83135635b8c9ce7ff8339014c"

  url "https://github.com/be5invis/Iosevka/releases/download/v#{version}/04.iosevka-slab-#{version}.zip"
  name "Iosevka Slab"
  homepage "https://github.com/be5invis/Iosevka/"
  license :ofl

  Dir["#{caskroom_path}/#{version}/*.ttf"].each do |f|
    font f, target => "iosevka-slab/#{f.gsub("#{caskroom_path}/#{version}/", "")}"
  end
end
