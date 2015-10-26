require "formula"

class Bootloadhid < Formula
    homepage "https://github.com/ajd4096/bootloadHID"
    head     "https://github.com/ajd4096/bootloadHID.git"

    def install
        system "cd", "commandline"
        system "make"
    end
end