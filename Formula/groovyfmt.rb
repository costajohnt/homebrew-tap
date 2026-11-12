# Rendered by packaging/homebrew/render.sh; edit the template, not the output.
class Groovyfmt < Formula
  desc "Fast formatter and linter for Groovy, Gradle build scripts, and Jenkinsfiles"
  homepage "https://github.com/costajohnt/groovyfmt"
  version "0.9.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "22b5bbf803dc06a9241b4175d893bfc0c000ee3be5d3287ed8305dd2f95ef69b"
    end
    on_intel do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "552156fbc6969d991ec9f087b3f351ddd40ca05a834ad70314327087cb11a645"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "45c7a012157ee82e2f2f8d570d1bf961ae854e39334bcc6188cb72dab9162918"
    end
    on_intel do
      url "https://github.com/costajohnt/groovyfmt/releases/download/v#{version}/groovyfmt-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1b5d0f1e7986c6c2d2f887fdfc356ffa361a7e99a16df3569825f4316f2f39b2"
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
