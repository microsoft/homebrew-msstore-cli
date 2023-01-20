require_relative "../custom_download_strategy.rb"

class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.16"
    checksums = {
      "osx.12-arm64" => "1be879c27cfc82ab572f7ae968cba1b535973dfd5a63b64cf52433cff3307ed3",
      "osx.12-x64" => "96a8638b95ae369f001adfac90651f9712b437c84938648188d694462933daca",
      "linux-arm64"  => "7837d9f6cd88a6ad3c4df759749c6daf4825d105dec2aa20d7200390d5827ed6",
      "linux-x64"  => "538f90ffbefdff6ea556a42b80c76a08badfacdf6306064aa798971b0228747e"
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
