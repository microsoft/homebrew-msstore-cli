class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.4.1"
    checksums = {
      "osx-arm64" => "e1e3c6cb65517875a853f6d8180c69d595129ec7df11ccab76dcc55d5dd73a51",
      "osx-x64" => "a1d64660c1ea34dcdd3b00122f079a9d58a71431e8c6a6cc637e8ff6bc1638d8",
      "linux-arm64"  => "9800af22011f9d1a6643da8b2707e98fdb79d839873a081257e21766b1de66c8",
      "linux-x64"  => "5d0786fd1f857b1cc07b4073ae5403317588fc3211629c35b9823475fe5a5a66"
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
