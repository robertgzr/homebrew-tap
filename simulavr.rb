class Simulavr < Formula
  desc "Simulator for the Atmel AVR 8-bit risc microcontrollers"
  homepage "https://savannah.nongnu.org/projects/simulavr/"
  # url "http://download.savannah.gnu.org/releases/simulavr/simulavr-1.0.0.tar.gz"
  # sha256 "39d93faa3eeae2bee15f682dd6a48fb4d4366addd12a2abebb04c99f87809be7"

  head "git://git.savannah.nongnu.org/simulavr.git"

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "libtool" => :build

  def install
    system "./bootstrap"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "simulavr -V"
  end
end
