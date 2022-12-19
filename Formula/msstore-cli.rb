require_relative "../custom_download_strategy.rb"

class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.14"
    checksums = {
      "osx.12-arm64" => "ed2994708b139fa1c6f95ceda98777f04efa9c2b55161391a0e4377862f74e82",
      "osx.12-x64" => "4c4c244cf0fa943f3303e3b665f89a13e41476b9f4d78e7f34cc451933f9e260",
      "linux-arm64"  => "a4714ea7dff9e98b098bd58c9859c2d18630a6fb1dea450dbdcdee7493a3f9ca",
      "linux-x64"  => "b2f0036a627012d5894506ecaa2233a448e984fee43f1badbd5078b4ea050339"
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
