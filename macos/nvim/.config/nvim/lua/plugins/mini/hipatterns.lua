local hipatterns = require("mini.hipatterns")

hipatterns.setup({
  highlighters = {
    -- Whole-word FIXME, HACK, TODO and NOTE
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

    -- Hex colors (#rrggbb) shown in their own color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})
