class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.29"
    checksums = {
      "osx-arm64" => "05cf250584107253c5cb96f44f17df8d57142949b94795b4d92a5ec2b2b62ab3",
      "osx-x64" => "3b3053f423ad56f29dbdce873dfc21f08750ce39c48431d6f93fdaafe2fc7021",
      "linux-arm64"  => "e5913cb2bb8d5e855c37344e0093f8bc135b3d33919321efeffe83add55e22dc",
      "linux-x64"  => "533e487b59520bd09946873f7a07177587a98bc383d4d2f5df2138de3588eb65"
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
