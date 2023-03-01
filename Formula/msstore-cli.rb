class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.20"
    checksums = {
      "osx.12-arm64" => "d16e2df7fd1bc9522e2575bafed0da2efd39c017376f0371519d446e640c234e",
      "osx.12-x64" => "f1fe0cd9a1cfc72b9b6965ec91faa888888f0205c338d3e6eca3e9c48ca9f10f",
      "linux-arm64"  => "c4f94ada073c61390df96bf7ce504f33448024e0cb9d9790da5df4ce30b95f51",
      "linux-x64"  => "e2de319a402703cb617d3cd4e301e601094926c27bbf7ed7b162caf3d615fe9c"
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
