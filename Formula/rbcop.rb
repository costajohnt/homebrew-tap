class Rbcop < Formula
  desc "RuboCop reimplemented in Rust, aiming for byte-identical output"
  homepage "https://github.com/costajohnt/rbcop"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.1.4/rbcop-0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "f0a23d0dbe31ebc013c2450941321366c383565610a9b9cee381b83d0a1710a8"
    end
    on_intel do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.1.4/rbcop-0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "e6c4be15199c400d4dd2013f1fee80ec159f4359f5ac8de8bd4ab64a8b3a14ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.1.4/rbcop-0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a78d0bb0486f9ee4b4ac02c0311f6713251f1e714b43b011caeb14a5d7319e8"
    end
    on_intel do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.1.4/rbcop-0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2b3f779cae0ee816b4ab81ed8a770be34d4296e139abe4f5ceb7c31afd85ee3b"
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
