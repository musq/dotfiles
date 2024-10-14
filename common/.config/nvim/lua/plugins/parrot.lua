return {
  "frankroeder/parrot.nvim",
  dependencies = {
    "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim",
  },
  opts = {
    providers = {
      openai = {
        api_key = os.getenv("OPENAI_API_KEY"),
      },
    },
  },
}
