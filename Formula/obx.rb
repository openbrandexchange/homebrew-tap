# Homebrew formula for obx, rendered by scripts/homebrew-formula.sh from a
# release's checksums.txt. Publish it in a tap repository
# (github.com/openbrandexchange/homebrew-tap, Formula/obx.rb); then:
#   brew install openbrandexchange/tap/obx
class Obx < Formula
  desc "Publish product images and article data to an Open Brand Exchange portal"
  homepage "https://openbrandexchange.com"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.1.0/obx_darwin_arm64.tar.gz"
      sha256 "89284be146dc7a20c04290f9376c000f0acd8d85691e6768a7c45b60f71fbae7"
    end
    on_intel do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.1.0/obx_darwin_amd64.tar.gz"
      sha256 "6eab899cb05d45c27211cc1eda5d83e27b5047f0e9121198dc2add043bc508ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.1.0/obx_linux_arm64.tar.gz"
      sha256 "293b195ebb7ff96742a89bb58db773b035d532268512b726077ab4c074fd0b93"
    end
    on_intel do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.1.0/obx_linux_amd64.tar.gz"
      sha256 "d2fd2372ef1c0979fafc8b0ad963a5b5482b3c2702eb1b3a561020dee0d0f6d3"
    end
  end

  def install
    bin.install "obx"
    bash_completion.install "completions/obx.bash" => "obx"
    zsh_completion.install "completions/obx.zsh" => "_obx"
    fish_completion.install "completions/obx.fish"
  end

  test do
    assert_match "obx #{version}", shell_output("#{bin}/obx version")
    assert_match "obx push", shell_output("#{bin}/obx help")
  end
end
