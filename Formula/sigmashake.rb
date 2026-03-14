# typed: false
# frozen_string_literal: true

# Homebrew formula for SigmaShake CLI
# Install: brew tap sigmashakeinc/sigmashake && brew install sigmashake
class Sigmashake < Formula
  desc "AI-native infrastructure platform CLI"
  homepage "https://sigmashake.com"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sigmashakeinc/sigmashake/releases/download/v#{version}/sigmashake-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/sigmashakeinc/sigmashake/releases/download/v#{version}/sigmashake-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sigmashakeinc/sigmashake/releases/download/v#{version}/sigmashake-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/sigmashakeinc/sigmashake/releases/download/v#{version}/sigmashake-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "sigmashake"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sigmashake --version")
  end
end
