class Bootloadhid < Formula
  desc "USB boot loader for AVR microcontrollers."
  homepage "https://github.com/robertgzr/bootloadHID"
  head "https://github.com/robertgzr/bootloadHID.git"

  depends_on "libusb" => :build
  depends_on "libusb-compat" => :build

  def install
    args = %W[
      VENDORID=0x16c0
      PRODUCTID=0x05DF
    ]
    Dir.chdir "commandline"
    system "make", *args
    bin.install "bootloadHID"
  end

  test do
    system "bootloadHID"
  end
end
