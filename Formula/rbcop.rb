class Rbcop < Formula
  desc "RuboCop reimplemented in Rust, aiming for byte-identical output"
  homepage "https://github.com/costajohnt/rbcop"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.1.2/rbcop-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "6d0cf329a6fd5e5883fd1b28b205d545b47e982c98752f8085c01f70066d44e9"
    end
    on_intel do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.1.2/rbcop-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "634209744a5a762e1b13a78617a2a3366280e1bbaaea6ab6167a7448e628920a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.1.2/rbcop-0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0ed25775516d20957cb4b8e239f603beac8e5d6a35f8570901470ea8208edc34"
    end
    on_intel do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.1.2/rbcop-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "15b24834b6148efa2d46f6ead6c02043548732a155daf30cf268d2bb0ef986f7"
    end
  end

  def install
    bin.install "rbcop"
    prefix.install "LICENSE", "README.md", "licenses"
  end

  test do
    (testpath/"Gemfile").write ""
    (testpath/"a.rb").write "x = \"a\"\nputs x\n"
    assert_equal "1.91.0\n", shell_output("#{bin}/rbcop -v")
    assert_match "Style/StringLiterals", shell_output("#{bin}/rbcop -f e a.rb", 1)
  end
end
