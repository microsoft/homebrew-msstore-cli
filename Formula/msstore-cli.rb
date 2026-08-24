class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.4.0"
    checksums = {
      "osx-arm64" => "f190f02db6660e40a52fca289ebf82ce6e97ce51d930e3daff4172fa9a524a8b",
      "osx-x64" => "2414cf9b0dee3ddc196520c0fad1c570a7dfbdc3895ad5b328e438a3b05f1023",
      "linux-arm64"  => "a18ab89bfdf0dcb8728817926ee0f36b3a3d8f3feda30c02a891f15461324343",
      "linux-x64"  => "acddaebd3e61472c4946b29bbdb0f489cf27441dfbcf98e1a0b5ada9e03584d7"
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
