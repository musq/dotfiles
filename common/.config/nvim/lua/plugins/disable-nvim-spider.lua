-- Use the w, e, b motions like a spider. Move by subwords and skip
-- insignificant punctuation.

return {
  "chrisgrieser/nvim-spider",
  enabled = false,
  keys = {
    {
      "w",
      "<cmd>lua require('spider').motion('w')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider - Move to start of next word",
    },
    {
      "e",
      "<cmd>lua require('spider').motion('e')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider - Move to end of word",
    },
    {
      "b",
      "<cmd>lua require('spider').motion('b')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider - Move to start of previous word",
    },
  },
}
