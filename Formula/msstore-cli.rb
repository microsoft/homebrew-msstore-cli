class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.25"
    checksums = {
      "osx.12-arm64" => "21d142f57d6f9827e8786c041ff7479b55436164873f24f1598b2a5fb0614b88",
      "osx.12-x64" => "9fbb485ec355a60fd5c8aaf9fe5ff83a2d9d2ef1cd1b544c09ac96359aa5a76c",
      "linux-arm64"  => "8a7051908036dac6c7478c82459cc64342c100da806713253695ba9aed154076",
      "linux-x64"  => "000dea05eabd7dca8f7f38b7e270b252b3bbbc873460380d62dc6e04d134ee21"
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
