# Homebrew formula for obx, rendered by scripts/homebrew-formula.sh from a
# release's checksums.txt. Publish it in a tap repository
# (github.com/openbrandexchange/homebrew-tap, Formula/obx.rb); then:
#   brew install openbrandexchange/tap/obx
class Obx < Formula
  desc "Publish product images and article data to an Open Brand Exchange portal"
  homepage "https://openbrandexchange.com"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.2.0/obx_darwin_arm64.tar.gz"
      sha256 "69804b9ca82d57b3fa27fd52303d88dc18378eb86884e91d9782441a61c93c3f"
    end
    on_intel do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.2.0/obx_darwin_amd64.tar.gz"
      sha256 "78206186e5b5dc667c6eddf81c33cbfd73a9aeed534b6cc43308044017a513c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.2.0/obx_linux_arm64.tar.gz"
      sha256 "4544eda5d798a9ba3b50dca8680a2a608dd365c081ba61462d23232a2ac46d2e"
    end
    on_intel do
      url "https://github.com/openbrandexchange/obx-go/releases/download/v0.2.0/obx_linux_amd64.tar.gz"
      sha256 "04872fb4e76219c7f7fd29e1af72a1cc115947dfb5ed9112858e8105c4516b6f"
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
