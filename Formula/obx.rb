# Homebrew formula for obx, rendered by scripts/homebrew-formula.sh from a
# release's checksums.txt. Publish it in a tap repository
# (github.com/openbrandexchange/homebrew-tap, Formula/obx.rb); then:
#   brew install openbrandexchange/tap/obx
class Obx < Formula
  desc "Publish product images and article data to an Open Brand Exchange portal"
  homepage "https://openbrandexchange.com"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.2.1/obx_darwin_arm64.tar.gz"
      sha256 "1b7abf5d8c1e6d2303d367a51663088f253b996ce979eded0a3dd1d050cf61ee"
    end
    on_intel do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.2.1/obx_darwin_amd64.tar.gz"
      sha256 "40e5ded6cc8bf2692dd5e698ad980bc262a2617c9c837658f0dac1f9e7018c19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.2.1/obx_linux_arm64.tar.gz"
      sha256 "c7f41fc57f23c317a2f56b2ddcfeedba80f3c71433d01bd9fdeb3ca6457143e7"
    end
    on_intel do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.2.1/obx_linux_amd64.tar.gz"
      sha256 "69dbc87b1da26633c8597af627839ee18c22e8768b1e77610a31ef4389f3ebd4"
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
