# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Wikiman < Formula
  desc "Wikiman is a universal offline documentation search engine for manual pages, tldr-pages, ArchWiki, Gentoo Wiki, DevDocs, and FreeBSD documentation"
  homepage "https://github.com/filiparag/wikiman"
  url "https://github.com/paulhdk/wikiman/archive/refs/tags/v2.14.1-macos-homebrew-test.tar.gz"
  sha256 "fafe125dfa3b141e74a8609f1a3d693f08506078a5e81de5e8538fb558954b1e"
  license "MIT"

  on_macos do
    # TODO: Test on X86 macs
    depends_on arch: :arm64
    depends_on "make" => :build
  end

  depends_on "coreutils"
  depends_on "gawk"
  depends_on "findutils"
  depends_on "fzf"
  depends_on "parallel"
  depends_on "ripgrep"
  depends_on "w3m"

  def install 
    system "gmake", "all" 
    bin.install Dir["pkgbuild/usr/bin/*"]
    bash_completion.install Dir["pkgbuild/etc/bash_completion.d/*"]
    etc.install Dir["pkgbuild/etc/wikiman.conf"]
    share.install Dir["pkgbuild/usr/share/*"]
  end

  test do
    system "false"
  end
end
