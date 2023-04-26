class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.24"
    checksums = {
      "osx.12-arm64" => "5b3625c2935f7fe41c673c2afca59ac3e78f7748ec9d3abf46d3fcb7c2cfedf2",
      "osx.12-x64" => "8bc92fb4732271ff73dbb6352f97cedee11159071cdc7dd3b7dac1cdedde89e9",
      "linux-arm64"  => "c903c66546003b56a3c2544502ecb5c55e84f9f53cb34aabf149d99164bcd2ba",
      "linux-x64"  => "79b302e17c9761f6c15a4398eda89f5ed5000bde341de186a8c6c9612cd27f1c"
    }

    os = OS.mac? ? "osx.12" : "linux"
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
