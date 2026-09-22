class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.4.3"
    checksums = {
      "osx-arm64" => "54e9ef96c09ba866d636e4c321000f66c717bcf892602aa016953b39a501026f",
      "osx-x64" => "70ebeb5b24c47f85cb25273e03e7cf0131d071314be1418a8c6408729708e4d3",
      "linux-arm64"  => "4c6ceebadb1921702486e694462e8dd0a797feb88caaea9429f8d1e32c1ffcb9",
      "linux-x64"  => "5ec484e2d0eb5105d5fd0274a6c7a5a46177b0f4f8def105f3e90fcd6dfdef14"
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
