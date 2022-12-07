require_relative "../custom_download_strategy.rb"

class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.12"
    checksums = {
      "osx.12-arm64" => "848887f7a34cbb5bae102deeff6094f29adb8160ec474d2290546b3fa086d374",
      "osx.12-x64" => "4e2f7901ff5b30698a3e5cb11c215b15afe2276da8a1e4e176663d743b87788d",
      "linux-arm64"  => "6b89a6698e1f88e6c2539a7ccde8ff5eeae1d3e029e13073f6909cd0ef60ad2f",
      "linux-x64"  => "6cab782752f200b8ec9ba69ab98804bd79992ada675734db96ef5c8876f4bbcb"
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
