# Rendered by packaging/homebrew/render.sh; edit the template, not the output.
class Groovyfmt < Formula
  desc "Fast formatter and linter for Groovy, Gradle build scripts, and Jenkinsfiles"
  homepage "https://github.com/costajohnt/groovyfmt"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "27924159133bcfde14c740b0fa31dd5ec1b6b07eca9f04b0ed28aaf7a1586eb2"
    end
    on_intel do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "21dad25082f4d75182065fa3baf7392bc4c80807ee5121a6252e8ccd2a5eee3d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8a4ddf48ad8a1dd98f1e5e42fde6df2157ba65edffc124314122cf74abd945a6"
    end
    on_intel do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "425c959258ede8b4529c14a654c5888ecd87c8b46265bb4ef334fa389d371263"
    end
  end

  def install
    bin.install "groovyfmt"
  end

  test do
    assert_equal "groovyfmt #{version}", shell_output("#{bin}/groovyfmt --version").strip
    (testpath/"A.groovy").write "class A {\ndef f() {\nprintln 1\n}\n}\n"
    system bin/"groovyfmt", "A.groovy"
    assert_equal "class A {\n    def f() {\n        println 1\n    }\n}\n", (testpath/"A.groovy").read
  end
end
