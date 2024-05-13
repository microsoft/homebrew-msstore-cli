class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.31"
    checksums = {
      "osx-arm64" => "4bcb90cf3ab26ea3be911ae1a196a6819b47edd134f4638eef83cb204b3b8cbe",
      "osx-x64" => "551623bc18094660b10987cf6d1d3d066e7af53266c7eb6672f10c79ddb83237",
      "linux-arm64"  => "140847a3bb0ff5e8a111d414ca1ac9fdec102589ad79f6d210d24215b8f7ae03",
      "linux-x64"  => "5714098ea9415291aa74afad5ebbbc7e492e00360fdf0496a00c3f5bd296c54a"
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
