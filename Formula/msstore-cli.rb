class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.22"
    checksums = {
      "osx.12-arm64" => "9cd7bb3d424adec38ab663c4b8d6d94343d5eec71673be09597460da9c7fc64b",
      "osx.12-x64" => "0eb1301215e2275d42ccdcae7b12c0f91ff663159a8d68daf03b5816f76cf4da",
      "linux-arm64"  => "aabdd0351011ddf2704bcbf8509f39a86a4ae80e64a0dc12252a9c4edb55a32a",
      "linux-x64"  => "60998586a1d0d86e6150209dd86c4b95bf022cfe27fbd150cab7c88252854920"
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
