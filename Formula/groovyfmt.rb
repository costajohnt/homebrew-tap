# Rendered by packaging/homebrew/render.sh; edit the template, not the output.
class Groovyfmt < Formula
  desc "Fast formatter and linter for Groovy, Gradle build scripts, and Jenkinsfiles"
  homepage "https://github.com/costajohnt/groovyfmt"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "909c4176890f82ac1f0549df13ffe775cd0ede37fb2c11f031778c703ab06ded"
    end
    on_intel do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0fefe88cf3094d065258878e7547f0c092cf6d17c4730c7eee64d7b59d580674"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "831b7a2960ee83804b54ed095c2156b3ca60237e5c93e280c74c4a45a00d17ee"
    end
    on_intel do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bfedb9dee2f7fb5d00ca65ec213c1804243bab9503c0b36126d45f705ff693fa"
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
