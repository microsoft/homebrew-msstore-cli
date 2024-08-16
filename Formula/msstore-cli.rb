class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.42"
    checksums = {
      "osx-arm64" => "e39af9cabe7b5b1f11e2df74437212a31db3bec506a42c03f2e11e23f4441c9a",
      "osx-x64" => "9d8a529b7ad3c68e99d267c25a53ed786b9f6f5381fadf10fa671226c5a4c096",
      "linux-arm64"  => "8027e08b8ff4dbaff8eda3a3991d05e429251967ddedf5b9e9d37d45f34de196",
      "linux-x64"  => "6e00b2ebd6a2d3ae687091adee8a33480b8285193fdeb43c51b8e0bd2155001b"
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
