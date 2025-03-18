class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.2.0"
    checksums = {
      "osx-arm64" => "016bdc549679204caadfc157bbc78be79d3300f0a104832779dbf03e6815975f",
      "osx-x64" => "4b7f53ec1f2569e9f7b7276f43a0d76fe26f1ae5a5e83c71b1acdb03c013d085",
      "linux-arm64"  => "4f36ee6287ba67423fc97e812fcca4ff5e334ecabc56cf6bf5ffa726837fd7e7",
      "linux-x64"  => "74be09e0616a883b2ba08525af3edb8578973b34bb6cafe027debe2e14d9382e"
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
