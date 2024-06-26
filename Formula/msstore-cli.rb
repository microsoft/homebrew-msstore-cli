class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.35"
    checksums = {
      "osx-arm64" => "727454e234c7a0644b6bdf538355c00203e4bb8992781fb05d2870e9c74e4ed5",
      "osx-x64" => "fe825070bcfe911c13c2bb78391ca25722fc5ffa588454c8993e9b3377cd004e",
      "linux-arm64"  => "6e223c158085b6f33879992699537cdbf59a40081b438a57208a11651034ec29",
      "linux-x64"  => "5f89a08342e4ff06ac8f93a71699ff71a8bb682a4efea08af3fc1eb8fbd0d310"
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
