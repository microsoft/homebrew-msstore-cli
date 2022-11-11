# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

class MSStoreCLI < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    url 
    url Hardware::CPU.arch == :arm64 ? "https://github.com/microsoft/msstore-cli/releases/download/v0.1.1/msstore_arm64.tar.gz" :
                                       "https://github.com/microsoft/msstore-cli/releases/download/v0.1.1/msstore_x64.tar.gz"
    sha256 Hardware::CPU.arch == :arm64 ? "" :
                                        ""
    license "MIT"
    version "0.1.1"

    def install
      bin.install "msstore"
    end
end