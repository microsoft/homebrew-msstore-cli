require_relative "../custom_download_strategy.rb"

class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.15"
    checksums = {
      "osx.12-arm64" => "416b0634e4bb4ca7d2e6d8d5a0a13c961b68a59c8cef5c302cdf14be036f1f31",
      "osx.12-x64" => "7135f43e1c23a8c28afa1562bc00eaf36acbd38da3c3ce11e6ed5fc81a83e190",
      "linux-arm64"  => "e3dd3b590d10e94e615282ce4cec003788b9e27a37eba86ce07e3ef71396ee41",
      "linux-x64"  => "baf17be8d678f8b5f1cfbd1b0b3fde1ebf38c71b3aaca1bf8016bb3787d8c9c2"
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
