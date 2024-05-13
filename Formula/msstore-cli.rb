class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.30"
    checksums = {
      "osx-arm64" => "c04da238b969142ed6d2661a0383758e879be51455c00c8beae050ee44f86ab8",
      "osx-x64" => "fb9c48fc11bc84063563d592422ecd7ee93ca6043780e3708d0a45df1fc02151",
      "linux-arm64"  => "dd594ea906204e14d997a6e0d1049e81daeb88eca97b8f6945e9712d2685f767",
      "linux-x64"  => "2a6b30f7c19ca059098da07d1c6178193bba4c42ebe7ef2052d382426bd0c71e"
    }

    os = OS.mac? ? "osx" : "linux"
    arch = case Hardware::CPU.arch
    when :x86_64 then "x64"
    when :arm64 then "arm64"
    else
      raise "Unsupported arch #{Hardware::CPU.arch}"
    end

    url "https://github.com/microsoft/msstore-cli/releases/download/v#{version}/MSStoreCLI-#{os}-#{arch}.tar.gz"
    sha256 checksums["#{os}-#{arch}"]

    def install
      bin.install "msstore"
    end
end
