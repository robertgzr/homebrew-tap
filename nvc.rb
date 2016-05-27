class Nvc < Formula
  desc "VHDL compiler and simulator"
  homepage "https://github.com/nickg/nvc"
  url "https://github.com/nickg/nvc/releases/download/r1.0.0/nvc-1.0.0.tar.gz"
  sha256 "a60478636268a7d1cad2d1c90e775cfd938199dba6b9c407badbef32753dc30f"

  head do
    url "https://github.com/nickg/nvc.git"

    depends_on "automake" => :build
    depends_on "autoconf" => :build
  end

  depends_on "llvm" => :build
  depends_on "check" => :build

  def install
    args = [
      "--with-llvm=/usr/local/opt/llvm/bin/llvm-config",
      "--prefix=#{prefix}",
    ]

    system "./tools/fetch-ieee.sh"

    if build.head?
      system "./autogen.sh"
      mkdir "build"
      Dir.chdir "build"
      system "../configure", *args
    end

    system "./configure", *args unless build.head?
    system "make"
    system "make", "install"
  end

  test do
  end
end
