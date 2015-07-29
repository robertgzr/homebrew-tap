class Formalfridayclub < Formula
  desc "Homebrew tap test formula"
  homepage "https://github.com/robertgzr/formalfridayclub"
  url "https://github.com/robertgzr/formalfridayclub/archive/1.0.0.tar.gz"
  sha256 "76531c28b3850274d834c40444d96d5eaa9b1cc24f577378a28831525ab1fee8"

  def install
    bin.install "formalfriday"
  end
end
