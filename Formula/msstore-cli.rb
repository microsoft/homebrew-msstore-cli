class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.33"
    checksums = {
      "osx-arm64" => "a24b936093b4eabcd305d3cd5a928c32179801f70e12473848d3a7f9b882e0c7",
      "osx-x64" => "af64e6f48291aa55ec12b445793319afa2a0ea1e3cdddcfbee957e71dd902c48",
      "linux-arm64"  => "288ab9ef1c06d0c935dd2f30443aa62819019d4a0a6115617aa2161ffa38ba78",
      "linux-x64"  => "a8be6e5f6fd08a473c2ddf9a07bf5a4e520c8ab8eeab801f8375e6526692416b"
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
