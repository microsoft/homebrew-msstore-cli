class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.32"
    checksums = {
      "osx-arm64" => "74f71443ee1473878b3e677a6be7c9709862c7ac404657301b8a2f2879e596e9",
      "osx-x64" => "de5b6b30cba2d9819452c096a6181d7f1045e2cb1179aaf70b2878ba8e4ab407",
      "linux-arm64"  => "c49e7f6fa050ccd5d9aeb142a5daa15fb39cbd5e426651cb6c9dadabd90feb17",
      "linux-x64"  => "181d14ff40757022953190aa22fffc2878992c63ae7557e5f23023224ced8537"
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
