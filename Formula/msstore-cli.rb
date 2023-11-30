class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.1.27"
    checksums = {
      "osx-arm64" => "11cc5695624098dbcc73cc8748a71c3f674b6afcc33b380c5c8af7f17e3fbf5b",
      "osx-x64" => "6704931265cf3f75aadfd234b6246fbcceded35a7e868b4295a0754c53a3cdef",
      "linux-arm64"  => "3727cd12dd0fc3510c7f3bb971f97c80cc8abfe5df056e25b93c8e59f7af575f",
      "linux-x64"  => "4f27d6c7a3d30cbc77f38d37fec2faf53c1e4e7806191919e2a84e59acb8050e"
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
