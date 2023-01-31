require_relative "../custom_download_strategy.rb"

class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.17"
    checksums = {
      "osx.12-arm64" => "b903fcad3b85fc23973226c8cb1f95ca5f3613ba3e905ac737e627172fd2e87e",
      "osx.12-x64" => "05b0d320744b583e1147369b9b716be97ac21baa3be973f946c9f983fcbbcaa1",
      "linux-arm64"  => "eecf522c5f3e4386cf868e3f27e792ebac341531a75363887693fc27fd3a89d3",
      "linux-x64"  => "513484d0456d58125e95f78f25af94bd1ebecd2ea2769cbf247efb29bbf5de35"
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
