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
  version "0.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sigmashakeinc/ssg/releases/download/v0.4.1/ssg-darwin-arm64.tar.gz"
      sha256 "e426b6b6b4c5527b24915a5113cf01da80bbdc4a86b030abb25778854a553fbf"
    else
      url "https://github.com/sigmashakeinc/ssg/releases/download/v0.4.1/ssg-darwin-x64.tar.gz"
      sha256 "0cc90d047e165d6e036827ea8158dce695aeedef79010a2ff499ce75c7b60e95"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/sigmashakeinc/ssg/releases/download/v0.4.1/ssg-linux-arm64.tar.gz"
      sha256 "4f41953d742dbb10f38bc31feb4507e2a657a412a03995de116daa4a71f3bebc"
    else
      url "https://github.com/sigmashakeinc/ssg/releases/download/v0.4.1/ssg-linux-x64.tar.gz"
      sha256 "4baac6113d0d3420f470f07e2701c1f71fbc3bf733f8d307468377dd7d71daec"
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
