# Homebrew formula for ssg — AI Agent Governance CLI
# Hosted in: sigmashakeinc/homebrew-tap
# Install: brew install sigmashakeinc/tap/ssg
#
# To update this formula for a new release, run:
#   bash sigmashake-dist/homebrew/update-formula.sh
#
# Then copy the updated formula to the tap repo:
#   cp sigmashake-dist/homebrew/ssg.rb <path-to-homebrew-tap>/Formula/ssg.rb

class Ssg < Formula
  desc "AI Agent Governance CLI — evaluate tool calls against rules, block dangerous operations"
  homepage "https://sigmashake.com"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sigmashakeinc/ssg/releases/download/v0.4.0/ssg-darwin-arm64.tar.gz"
      sha256 "18ad2afc9b4360a42ad2c4babf0abe6eeef619ea5a8ec413f74d5871e07de442"
    else
      url "https://github.com/sigmashakeinc/ssg/releases/download/v0.4.0/ssg-darwin-x64.tar.gz"
      sha256 "5da59cf794371dbc06b08a5150f19980ce9527499570920fc28c0af031264c4d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/sigmashakeinc/ssg/releases/download/v0.4.0/ssg-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER_SSG_LINUX_ARM64"
    else
      url "https://github.com/sigmashakeinc/ssg/releases/download/v0.4.0/ssg-linux-x64.tar.gz"
      sha256 "ea4f6de195b00a28ea58af823985479039b32584f6b41b8ecb92c24a18f899dc"
    end
  end

  def install
    bin.install "ssg"
  end

  test do
    output = shell_output("#{bin}/ssg --version 2>&1")
    assert_match version.to_s, output
  end
end
