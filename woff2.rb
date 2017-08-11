class Woff2 < Formula
  desc "Compressing and decompressing woff fonts"
  homepage "https://github.com/google/woff2"

  head do
    url "https://github.com/google/woff2.git"

    patch do
      url "https://github.com/google/woff2/pull/72.diff"
      sha256 "8bdc2673d0ab082bfec208d232870829172d48c3ad93149c6375e45ce6951bf3"
    end
  end

  def install
    system "make"

    bin.install "woff2_compress"
    bin.install "woff2_decompress"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test woff`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
