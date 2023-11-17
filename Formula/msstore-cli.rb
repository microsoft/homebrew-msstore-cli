class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.26"
    checksums = {
      "osx-arm64" => "fca3222f3ce36e81d8d9e8e06a0a1128c7a9348123a859fd752052fced73ac64",
      "osx-x64" => "5b21d623d44260956ed7d71e27a92a40609e03e69025137bc997530248ac6539",
      "linux-arm64"  => "3f059c1c9017541cc986f208d6e37171596ac8cd827253590525feb6a5357823",
      "linux-x64"  => "ec14b3dad5de0935ed4aed16f98d00bfb88fe04064d6af7d2b839f14a291b1e0"
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
