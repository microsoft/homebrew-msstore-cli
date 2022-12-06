# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

class MSStoreCLI < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    url 
    url Hardware::CPU.arch == :arm64 ? "https://github.com/microsoft/msstore-cli/releases/download/v0.1.9/MSStoreCLI-osx.12-arm64.tar.gz" :
                                       "https://github.com/microsoft/msstore-cli/releases/download/v0.1.9/MSStoreCLI-osx.12-x64.tar.gz"
    sha256 Hardware::CPU.arch == :arm64 ? "b4c082952bac37481d9ea8ad3a102719aad910600975b0d5e6d2d42326c0e6db" :
                                        "df4e1c6c5c797c889eb1ce175fba574a54e4157491277ad662033ac5dd529983"
    license "MIT"
    version "0.1.9"

    def install
      bin.install "msstore"
    end
end
