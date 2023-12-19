class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.28"
    checksums = {
      "osx-arm64" => "44c649488a232d4fee05ba6497d39c5eb66847ffed79a381d3235845c1d280e1",
      "osx-x64" => "2cb492678b3d0bfa2ac3a43bad537431dafda9623bbad109561760d45b668cd8",
      "linux-arm64"  => "1a005dcd6c771e9e22467001dff57ef2b44e8382924d8040bfea35356d328661",
      "linux-x64"  => "1c4ea09a67f85676c51076a333c100a02b65beb4a407dde9aa25bbeecf8e7d30"
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
