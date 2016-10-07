cask 'font-noto-mono' do
  version :latest
  sha256 :no_check

  url 'https://noto-website.storage.googleapis.com/pkgs/NotoMono-hinted.zip'
  name 'Noto Mono'
  homepage 'https://www.google.com/get/noto/#mono-mono'
  license :ofl

  font 'NotoMono-Regular.ttf'
end
