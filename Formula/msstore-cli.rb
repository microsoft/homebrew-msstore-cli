require_relative "../custom_download_strategy.rb"

class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.11"
    checksums = {
      "osx.12-arm64" => "fb760432d12a49914dd6cefe49f8803a999689e4c79ea9072be106c6b65c735d",
      "osx.12-x64" => "37807101721cc61bed2979fc6f286276ea4933ce7395d6e1850e4505685f7824",
      "linux-arm64"  => "32d97fd3376c13d300e58569ba80436974a320f36fcd556c52b2169b798008b9",
      "linux-x64"  => "a4127824fba04ce1bc38ce26e0f1dcc9083ea786ab7d7d22d381a087bf859966"
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
