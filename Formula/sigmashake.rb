# typed: false
# frozen_string_literal: true

# Homebrew formula for SigmaShake CLI
# Install: brew tap sigmashakeinc/sigmashake && brew install sigmashake
#
# SHA256 hashes below are per-platform placeholders. Each platform produces a
# different binary, so each hash MUST be unique. The sigmashake-ci release
# pipeline (HomebrewUpdater) replaces these automatically when cutting a
# release. Do NOT set all hashes to the same value.
class Sigmashake < Formula
  desc "AI-native infrastructure platform CLI"
  homepage "https://sigmashake.com"
  version "1.0.0"
  license "MIT"

  on_macos do
    # TODO(release): sha256 placeholder — replaced by sigmashake-ci HomebrewUpdater
    on_arm do
      url "https://github.com/sigmashakeinc/sigmashake/releases/download/v#{version}/sigmashake-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "aa00000000000000000000000000000000000000000000000000000000000001"
    end
    # TODO(release): sha256 placeholder — replaced by sigmashake-ci HomebrewUpdater
    on_intel do
      url "https://github.com/sigmashakeinc/sigmashake/releases/download/v#{version}/sigmashake-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "bb00000000000000000000000000000000000000000000000000000000000002"
    end
  end

  on_linux do
    # TODO(release): sha256 placeholder — replaced by sigmashake-ci HomebrewUpdater
    on_arm do
      url "https://github.com/sigmashakeinc/sigmashake/releases/download/v#{version}/sigmashake-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc00000000000000000000000000000000000000000000000000000000000003"
    end
    # TODO(release): sha256 placeholder — replaced by sigmashake-ci HomebrewUpdater
    on_intel do
      url "https://github.com/sigmashakeinc/sigmashake/releases/download/v#{version}/sigmashake-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd00000000000000000000000000000000000000000000000000000000000004"
    end
  end

  def install
    bin.install "sigmashake"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sigmashake --version")
  end
end
