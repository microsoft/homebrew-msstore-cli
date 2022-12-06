# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

require_relative "../custom_download_strategy.rb"

class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.9"
    checksums = {
      "osx.12-arm64" => "d22d8fb336cc6d99a043fb3983238d56e486a7e6a95256cd3ffd30e9216bb8f0",
      "osx.12-x64" => "46449452e1d35f38815468d68d622a45b35239b7eba85a5560fa3398ccc7b69c",
      "linux-arm64"  => "b4c082952bac37481d9ea8ad3a102719aad910600975b0d5e6d2d42326c0e6db",
      "linux-x64"  => "df4e1c6c5c797c889eb1ce175fba574a54e4157491277ad662033ac5dd529983"
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
