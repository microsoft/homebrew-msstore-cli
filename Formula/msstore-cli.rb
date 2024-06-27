class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.36"
    checksums = {
      "osx-arm64" => "567fa64cac48f44ccb2ed88fd9657bf7193c76f5dd1ed73e5ca700fa52974c78",
      "osx-x64" => "d2cd30106e01ab96027cfcb0ff34be7958720fd187169008084b037ea8f6b07e",
      "linux-arm64"  => "28022a8685ede64ad3e50dea7dd1e81110085a962996ea7fc10d26dc23aa9769",
      "linux-x64"  => "32fb09f2754e450726d5da7934adacd7a7a0a941b8180b02b2698119293683fb"
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
