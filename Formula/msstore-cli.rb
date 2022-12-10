require_relative "../custom_download_strategy.rb"

class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.13"
    checksums = {
      "osx.12-arm64" => "aa627edb7c1d09320e45338ee13f5706871ef3cd7bc8fa33429e2c600fc30be2",
      "osx.12-x64" => "765d66ccc20f06c5c744fe25fd1e4f22c2e261268c1dbf9cc8b78906739d4301",
      "linux-arm64"  => "1ab08b2a9c9575c54de81d43c44a93cc0d8fe2aa9df6572d53394c2186658665",
      "linux-x64"  => "22fac93863a87dfeb9458f8e7ee8765115ce7e1df61d4cfc2665bd14503a484d"
    }

    os = OS.mac? ? "osx.12" : "linux"
    arch = case Hardware::CPU.arch
    when :x86_64 then "x64"
    when :arm64 then "arm64"
    else
      raise "Unsupported arch #{Hardware::CPU.arch}"
    end

    url "https://github.com/microsoft/msstore-cli/releases/download/v#{version}/MSStoreCLI-#{os}-#{arch}.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 checksums["#{os}-#{arch}"]

    def install
      bin.install "msstore"
    end
end
