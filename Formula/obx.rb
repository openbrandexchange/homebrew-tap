# Homebrew formula for obx, rendered by scripts/homebrew-formula.sh from a
# release's checksums.txt. Publish it in a tap repository
# (github.com/openbrandexchange/homebrew-tap, Formula/obx.rb); then:
#   brew install openbrandexchange/tap/obx
class Obx < Formula
  desc "Publish product images and article data to an Open Brand Exchange portal"
  homepage "https://openbrandexchange.com"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.3.1/obx_darwin_arm64.tar.gz"
      sha256 "e4b2dc67ae3b06031a599bad49269f459588677fe2907676e45c2cd478198fe5"
    end
    on_intel do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.3.1/obx_darwin_amd64.tar.gz"
      sha256 "351f3bacef237202d5881ebc97033acb7b27f2fd24ae839dc90b5d3110c17deb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.3.1/obx_linux_arm64.tar.gz"
      sha256 "71d695158c45415c784e731856a721798a47f8292407d4f035a0bd23bf9272f9"
    end
    on_intel do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.3.1/obx_linux_amd64.tar.gz"
      sha256 "c84808a5440ddb4ffdbf56ecbb05580d4a26c6a1af8cea64802658fd30dafd3a"
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
