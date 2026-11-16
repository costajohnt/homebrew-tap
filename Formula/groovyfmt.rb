# Rendered by packaging/homebrew/render.sh; edit the template, not the output.
class Groovyfmt < Formula
  desc "Fast formatter and linter for Groovy, Gradle build scripts, and Jenkinsfiles"
  homepage "https://github.com/costajohnt/groovyfmt"
  version "0.20.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2e608928d8eb2480fdb9ead1be83643e59e583204dba33cef3034030576cd678"
    end
    on_intel do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "61b6e6e9542beb7963a4953c17890c2956ea8c64cc80d57d16a8517f8e81f181"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b433c465e08be1c6dd6212ac76dad30820fff3e4896d0e2d40fe8df83fc9f5a7"
    end
    on_intel do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b3a2fd13a091f84cd8df5a2546c28ba19f5042dc3da5f8cb8037663a7f01fabb"
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
