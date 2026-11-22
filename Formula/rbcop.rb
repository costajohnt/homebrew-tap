class Rbcop < Formula
  desc "RuboCop reimplemented in Rust, aiming for byte-identical output"
  homepage "https://github.com/costajohnt/rbcop"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.3.0/rbcop-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "97e1b599afef2d17c746e17774f704c22b9626183f00b560e1e919ce0903a69c"
    end
    on_intel do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.3.0/rbcop-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "4684619cf744ebe9fa20dbf082c66077ab4c91a81be6ae91cf612e305a51c6ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.3.0/rbcop-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83d63b51a5f3b73bd7b0f39acecb524b5028f3295e87918b9743e1675f01e1b1"
    end
    on_intel do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.3.0/rbcop-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "48adb2f93ed2aff0824cc91753a48dad1231892df2c99a5cedb12bfcc29881c3"
    end
  end

  def install
    bin.install "rbcop"
    prefix.install "LICENSE", "README.md", "licenses"
  end

  test do
    (testpath/"Gemfile").write ""
    (testpath/"a.rb").write "x = \"a\"\nputs x\n"
    assert_equal "1.92.2\n", shell_output("#{bin}/rbcop -v")
    assert_match "Style/StringLiterals", shell_output("#{bin}/rbcop -f e a.rb", 1)
  end
end
