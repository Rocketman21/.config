return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = function()
        local presets = require("markview.presets")
        local opts = presets.no_nerd_fonts
        opts.markdown.tables = presets.tables.single

        return opts
    end,
}
