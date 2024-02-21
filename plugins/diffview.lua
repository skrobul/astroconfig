return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewFileHistory", "DiffviewOpen", "DiffviewFocusFiles", "DiffviewLog" },
    event = "User AstroGitFile",
    keys = {
      { "<leader>c", false, buffer=true, desc="Conflict resolution" },
    }
  }
}
