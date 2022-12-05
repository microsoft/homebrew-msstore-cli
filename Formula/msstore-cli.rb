# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

class MSStoreCLI < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    url 
    url Hardware::CPU.arch == :arm64 ? "https://github.com/microsoft/msstore-cli/releases/download/v0.1.8/MSStoreCLI-osx.12-arm64.tar.gz" :
                                       "https://github.com/microsoft/msstore-cli/releases/download/v0.1.8/MSStoreCLI-osx.12-x64.tar.gz"
    sha256 Hardware::CPU.arch == :arm64 ? "3247de22a73054521ab86e5a8b0fdb476cf6c9cd242c1fd3470a5d272a9e20a9" :
                                        "26a8cbe52f56e8304936d2a48736c4196f27169d345ef2e7c9fa20ddf8c495db"
    license "MIT"
    version "0.1.8"

    def install
      bin.install "msstore"
    end
end
