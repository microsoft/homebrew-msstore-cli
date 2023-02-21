require_relative "../custom_download_strategy.rb"

class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.18"
    checksums = {
      "osx.12-arm64" => "31639cfa35b397d457525edaf04cb0ab3b65a983a0556544b1618032e9f81c0e",
      "osx.12-x64" => "7b132fd85fe3e6c26e2c95e253a7fd8bc11b8bfdc2a5b90c7d34d8aee7df072c",
      "linux-arm64"  => "f6b5a2f9c28e3ded6be687e67f9391540643538a975778b2e92cce04d16ee0e9",
      "linux-x64"  => "3282804d99b85a33a174e0735a961ec23eacfe4681028e9f4f9220846576e2ef"
    }

    os = OS.mac? ? "osx.12" : "linux"
    arch = case Hardware::CPU.arch
    when :x86_64 then "x64"
    when :arm64 then "arm64"
    else
      raise "Unsupported arch #{Hardware::CPU.arch}"
    end

    url "https://github.com/microsoft/msstore-cli/releases/download/v#{version}/MSStoreCLI-#{os}-#{arch}.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 checksums["#{os}-#{arch}"]

    def install
      bin.install "msstore"
    end
end
