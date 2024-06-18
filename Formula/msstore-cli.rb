class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.34"
    checksums = {
      "osx-arm64" => "f17d1256eafca627ecbcb69b1f3e78d98ea570dd9478a2d75991b43b75b61385",
      "osx-x64" => "77a83f497cbe6efb2b8e8f215c91978514118f49687021d2e72eec3ce9f73d8e",
      "linux-arm64"  => "36672965306f3f9f3a36769b58488e904d912ef15d2f7c002160f21c7231faf3",
      "linux-x64"  => "d399765fb1e1bb0015de937977e6b3e390ddd60f4d9f9e767c97ef6558b80124"
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
