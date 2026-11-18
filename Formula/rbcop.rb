class Rbcop < Formula
  desc "RuboCop reimplemented in Rust, aiming for byte-identical output"
  homepage "https://github.com/costajohnt/rbcop"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.2.0/rbcop-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "36d02c4008d0d772257ef7e6b07a710324a5a650c82b8a2295d042672edbf08a"
    end
    on_intel do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.2.0/rbcop-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "e52619ccfb304e484b586e3fd38b03329272d283085e4bc11469f24b5f1b5e6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.2.0/rbcop-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83081d993b337cc5bdcb34f060ea342da90e80153b04a0666ea3acf121ff07ba"
    end
    on_intel do
      url "https://github.com/costajohnt/rbcop/releases/download/v0.2.0/rbcop-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b90d05f76dc9f89f75f9e20bc823d258b7b313a9c97402b51ab22f200138b0b"
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
