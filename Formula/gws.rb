class Gws < Formula
  desc "Manage workspaces composed of git repositories"
  homepage "https://streakycobra.github.io/gws/"
  url "https://github.com/StreakyCobra/gws/archive/0.1.10.tar.gz"
  sha256 "816592f3fec8c437ba96d17dbbfa911d88d1fa70071d3d127efc64f73551f747"

  bottle :unneeded

  depends_on "bash"

  def install
    bin.install "src/gws"

    bash_completion.install "completions/bash"
    zsh_completion.install "completions/zsh"
  end

  test do
    system "git", "init", "project"
    system "#{bin}/gws", "init"
    output = shell_output("#{bin}/gws status")
    assert_equal "project:\n                              Clean [Local only repository]\n", output
  end
end
