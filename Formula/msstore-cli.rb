require_relative "../custom_download_strategy.rb"

class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.19"
    checksums = {
      "osx.12-arm64" => "ec10227b149bf47998aee2468a394b0e8515eb1586038f0c4bc0e93ff4425041",
      "osx.12-x64" => "598a2481b96a09996c58696f007718cc5bc938aee9220fbad591b628359a8ab8",
      "linux-arm64"  => "8655565699e993b7c3cb64198a19250ca02fb0b407c00f4e4f3d9f22e81784b5",
      "linux-x64"  => "41830dc1c6e7c81cb385b79e95ff4049d1d91ebb944f03c151086bb459da608c"
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
