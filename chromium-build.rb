class ChromiumBuild < Formula
  if ENV["CHROMIUM_BREW_REP"]
    OWN_REPO = Pathname.new(ENV["CHROMIUM_BREW_REPO"])
  end

  desc "Formula to build Chromium from source"
  homepage "https://chromium.org"
  head "http://www.chromium.org/_/rsrc/1220197576998/Home/flying_browser.png"

  option "with-own-repo", "Use custom source repository, set CHROMIUM_BREW_REPO environment variable to the folder that contains the `src` directory"
  option "with-proprietary-codecs", "Compile with h.264, mp3 and aac support"

  resource "depot_tools" do
    url "https://chromium.googlesource.com/chromium/tools/depot_tools.git",
      :branch => "master",
      :revision => "bf2a34198e6d4ec0c6403da5cf632b37a2ac8478"
  end

  def install
    resource("depot_tools").stage buildpath/"depot_tools"
    ENV.append_path "PATH", "#{buildpath}/depot_tools"

    if build.with? "own-repo"
      chdir OWN_REPO
    else
      # get chromium source repo
      system "fetch", "--no-history", "chromium"
    end

    chdir "src" do
      # system "gclient", "sync"
      # system "gclient", "runhooks"

      if build.without? "own-repo"
        ohai "Generating build files"
        system "gn", "gen", "out/Default"

        build_args = Pathname.new("#{buildpath}/src/out/Default/args.gn")
        build_args.append_lines("symbol_level = 0")

        if build.with? "proprietary-codecs"
          build_args.append_lines("proprietary_codecs = true")
        end
      end

      opoo "Now starting to compile Chromium. THIS MAY UP TO SEVERAL HOURS!"
      system "ninja", "-C", "out/Default", "chrome"
    end

    # make Chromium.app available to linkapps command
    if build.with? "own-repo"
      libexec.install (OWN_REPO + "src/out/Default/Chromium.app")
    else
      libexec.install Pathname.new("#{buildpath}/src/out/Default/Chromium.app")
    end
  end

  test do
    opoo "no tests"
  end
end
