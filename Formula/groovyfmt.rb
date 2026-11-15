# Rendered by packaging/homebrew/render.sh; edit the template, not the output.
class Groovyfmt < Formula
  desc "Fast formatter and linter for Groovy, Gradle build scripts, and Jenkinsfiles"
  homepage "https://github.com/costajohnt/groovyfmt"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1000a1b4d72f5ea99689ba693dc6b7bee4f0d7d681b45a2eae50ee7b881e54a3"
    end
    on_intel do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ef5f9d663f3f720d49987911ca474ad98effd399817dd50429eb475908e9f19e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "94d3e77d1ee92b0088803ae9619dc2804c9eb9cd30023459b67d4c25b765a584"
    end
    on_intel do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "04232c4ae9955d61c4ff3866c0afdc948e696116730cb4a24e1193810f91e5c9"
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
