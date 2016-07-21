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

  ieee_url = "https://standards.ieee.org/downloads/1076/1076.2-1996"

  resource "math_complex-body" do
    url "#{ieee_url}/math_complex-body.vhdl"
    sha256 "9dbdfaeb790f7afea854d52b84d20406717a6cff897ccc7720f10df53581c597"
  end

  resource "math_complex" do
    url "#{ieee_url}/math_complex.vhdl"
    sha256 "118a2c237befb730c7de09c2875a9f0cc3894e53d1d4c0c1c2779b8bc6dd0a31"
  end

  resource "math_real-body" do
    url "#{ieee_url}/math_real-body.vhdl"
    sha256 "384516ee1ec0488a2e765c1b3cd6ab2212361f30195a46b6e044a408db4ba99a"
  end

  resource "math_real" do
    url "#{ieee_url}/math_real.vhdl"
    sha256 "c09a96f905221da58f24c922ebdac886f69c2e80f102b6f29bb33c6bd9bd4c76"
  end

  resource "numeric_bit-body" do
    url "#{ieee_url}/numeric_bit-body.vhdl"
    sha256 "5e0734c0b4eb70d7e6c776b6d639c526eff770eb8177f94d510678bc76c5b1c3"
  end

  resource "numeric_bit" do
    url "#{ieee_url}/numeric_bit.vhdl"
    sha256 "3f4dfa268a0286eb24f89f4c1fe6d6122424acde93da0369fde53cce3d7e2b94"
  end

  resource "numeric_std-body" do
    url "#{ieee_url}/numeric_std-body.vhdl"
    sha256 "739b4a68a27629b6e82b4e83a0f2cbd6127a70fe7b0ffd9e513d148bab5064ad"
  end

  resource "numeric_std" do
    url "#{ieee_url}/numeric_std.vhdl"
    sha256 "1736e832e2d1ac2e94103f8199f0a83fd6070edf9fe5c1600c16189de6dd2672"
  end

  resource "std_logic_1164-body" do
    url "#{ieee_url}/std_logic_1164-body.vhdl"
    sha256 "10f391f90869db4a05c2087d434d270b24fa8427218b64b68a827e270c47acc1"
  end

  resource "std_logic_1164" do
    url "#{ieee_url}/std_logic_1164.vhdl"
    sha256 "c6359df78524b69052c8a6f8c485effbedb152b2bb5eecd0d38043b8013658c3"
  end

  resource "vital2000" do
    url "http://svn.gna.org/svn/ghdl/trunk/libraries/vital2000", :revision => "151"
  end

  resource "test-vdhl_examples" do
    url "https://github.com/suoto/vim-hdl-examples.git",
    :revision => "232d28a9279bc80d2797afef212749434a78be6a"
  end

  def install
    args = %W[
      --with-llvm=#{Formula["llvm"].opt_bin}/llvm-config
      --prefix=#{prefix}
    ]

    resources.each do |r|
      r.stage buildpath/"lib/ieee"
    end

    inreplace "#{buildpath}/lib/ieee/std_logic_1164.vhdl" do |s|
      i=1
      lines = s.lines
      lines.each do |l|
        l.gsub!(/^--\s\s/, "") if (i==89) || (i>=119 && i<=120)
        i+=1
      end
      s.replace(lines.join)
    end

    inreplace "#{buildpath}/lib/ieee/std_logic_1164-body.vhdl" do |s|
      i=1
      lines = s.lines
      lines.each do |l|
        l.gsub!(/^--\s\s/, "") if (i>=165 && i<=168) || (i>=367 && i<=382) || (i>=384 && i<=399)
        i+=1
      end
      s.replace(lines.join)
    end

    if build.head?
      system "./autogen.sh"
      mkdir "build" do
        system "../configure", *args
      end
    else
      system "./configure", *args
    end

    system "make"
    system "make", "install"
  end

  test do
    resource("test-vhdl_examples").stage testpath
    system "#{bin}/nvc", "-a", "#{testpath}/basic_library/very_common_pkg.vhd"
  end
end
