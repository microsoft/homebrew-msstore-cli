class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.23"
    checksums = {
      "osx.12-arm64" => "7ceaf1fdbbeee5efb788a7ce590c53a3f66ca4ddee0cba5d2e12305967bf7999",
      "osx.12-x64" => "ad16acf9ce95e4d14985d9e5fba0352d7ca1931d79926c5ec5d92ed9d7f70a89",
      "linux-arm64"  => "9cc00bd32312b853f285c34c3e67480f497e184a366c79f90c09c494c945f1ee",
      "linux-x64"  => "8961bb170053da1566abce53f8e9a8af5e033637b78976ee16857dd7c4528dde"
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
