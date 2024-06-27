class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.37"
    checksums = {
      "osx-arm64" => "30417b9c20e4a093f9bc2bd5058b97153c321a72ff9b2d5917d867b5f98750ac",
      "osx-x64" => "0b7892eb9c318f1b561b84cd345a04e46157c62ce7377086a0e691cad54c4c0d",
      "linux-arm64"  => "b5b0f156983c028839d5ce4febb40ce6770b37f4c7f24cc50294019ae0260254",
      "linux-x64"  => "9c58da749666589062afcc75762aa523830f41c8fa9af6e132062ed26f9fbcc8"
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
