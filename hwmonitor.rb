class Hwmonitor < Formula
  desc "Access information from hardware sensors available on your Mac"
  homepage "https://github.com/kozlek/HWSensors"
  url "https://github.com/kozlek/HWSensors/archive/6.19.tar.gz"
  sha256 "d195c7e56aaabb64bd432b1023769df4ffa9922bd9422c28f2c80c90ce229d77"

  head "https://github.com/kozlek/HWSensors"

  depends_on :macos => :lion
  depends_on :xcode => :build

  def install
    xcodebuild "-project", "Versioning And Distribution.xcodeproj",
        "-configuration", "Release",
        "clean", "build",
        "SYSROOT=build"
    xcodebuild "-project", "HWMonitor.xcodeproj",
        "-configuration", "Release",
        "clean", "build",
        "SYMROOT=build"
    prefix.install "Binaries/HWMonitor.app"
  end

  test do
  end
end
