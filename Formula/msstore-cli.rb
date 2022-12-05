# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

class MSStoreCLI < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    url 
    url Hardware::CPU.arch == :arm64 ? "https://github.com/microsoft/msstore-cli/releases/download/v0.1.8/MSStoreCLI-osx.12-arm64.tar.gz" :
                                       "https://github.com/microsoft/msstore-cli/releases/download/v0.1.8/MSStoreCLI-osx.12-x64.tar.gz"
    sha256 Hardware::CPU.arch == :arm64 ? "2667d7e73a1a44c2a1549fdd33376ed7ced8e3718ec8703171df8e3178b32f0e" :
                                        "d2ff11f95975312dc25d0332d655589018af841947e8730c58fb7947afb49891"
    license "MIT"
    version "0.1.8"

    def install
      bin.install "msstore"
    end
end
