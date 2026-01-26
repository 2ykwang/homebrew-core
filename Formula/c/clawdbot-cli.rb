class ClawdbotCli < Formula
  desc "Your own personal AI assistant"
  homepage "https://clawd.bot"
  url "https://registry.npmjs.org/clawdbot/-/clawdbot-2026.1.24-3.tgz"
  sha256 "a00acd33ac20787fbd342db2bc36db15b2483f88e1f8b159cf1bc37a6eb1a828"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")

    node_modules = libexec/"lib/node_modules/clawdbot/node_modules/"
    deuniversalize_machos node_modules/"@mariozechner/clipboard-darwin-universal/clipboard.darwin-universal.node"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clawdbot --version")

    output = shell_output("#{bin}/clawdbot status")
    assert_match "Clawdbot status", output
  end
end
