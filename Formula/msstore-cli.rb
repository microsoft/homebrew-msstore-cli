class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.4.4"
    checksums = {
      "osx-arm64" => "5d4849e33b8a64948c82d2b3afc2f332168306bb5cd0c10d806f02e26b624ab3",
      "osx-x64" => "c68860d0bc6cca9a4b3077de6be1d53185b6fad15ef07c93efa1ee3188cd5bf6",
      "linux-arm64"  => "e6b0c20f66f6e2556f51ec8bff80db96aad65c34c81b70e8e2862b6a5f314634",
      "linux-x64"  => "8c1283643530afede36d935c532e252dd69240d30432775794ad1598bce3c162"
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
