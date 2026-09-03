class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.4.2"
    checksums = {
      "osx-arm64" => "136eb0f637d0e9879eb509b84ff5be878792be8f7fbf13fd29a4693934aecbfc",
      "osx-x64" => "28ad4e3c5b686b52745c3f25dd0a23f2c9498f5ba54994bd3ed69154790bdf88",
      "linux-arm64"  => "4e34634b71f37a8844a409867e8be40a290f43d3d9a0b5145d0b9ba07f7da467",
      "linux-x64"  => "2810cb60c4688351136bbffa321d368153c003027aec60ae1346644fd6b392e2"
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
