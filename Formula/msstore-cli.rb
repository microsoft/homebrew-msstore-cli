class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.41"
    checksums = {
      "osx-arm64" => "ae1d4c087e0910bd8a7dc0a8ebf0aeec5cd310221e48f5b7565b765ea7e3296a",
      "osx-x64" => "dcc9fe253b15dfc16411fe6dededa9c6eaecea900fc48f0e0945c8a03c767019",
      "linux-arm64"  => "96846928f5ad320a4890b662100f608f62dd6f360c55403144ab7d902843eae7",
      "linux-x64"  => "d2618daaf841cd5c9deca0ac78686cb52a45c39993d12f479484457e8a33ef53"
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
