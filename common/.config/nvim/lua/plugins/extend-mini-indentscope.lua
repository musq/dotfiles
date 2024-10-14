return {
  "echasnovski/mini.indentscope",
  opts = {

    -- Draw options
    draw = {
      -- Animation rule for scope's first drawing. A function which, given
      -- next and total step numbers, returns wait time (in ms). See
      -- |MiniIndentscope.gen_animation| for builtin options. To disable
      -- animation, use `require('mini.indentscope').gen_animation.none()`.
      animation = require("mini.indentscope").gen_animation.none(),
      -- Delay (in ms) between event and start of drawing scope indicator
      delay = 50,
    },
    -- Which character to use for drawing scope indicator
    symbol = "▏",
  },
}
