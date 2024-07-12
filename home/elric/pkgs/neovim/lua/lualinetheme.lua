local c = GET_PARADISE_COLORS()

local colors = {
    fg = c.base05,
    gray = c.base03,
    innerbg = nil,
    outerbg = c.base02,
    normal = c.base0D,
    insert = c.base0B,
    visual = c.base0E,
    replace = c.base0C,
    command = c.base08
}

return {
    inactive = {
        a = { fg = colors.fg, bg = colors.outerbg },
        b = { fg = colors.fg, bg = colors.outerbg },
        c = { fg = colors.fg, bg = colors.innerbg }
    },
    visual = {
        a = { fg = colors.gray, bg = colors.visual, gui = "bolditalic" },
        b = { fg = colors.fg, bg = colors.outerbg },
        c = { fg = colors.fg, bg = colors.innerbg }
    },
    replace = {
        a = { fg = colors.gray, bg = colors.replace, gui = "bolditalic" },
        b = { fg = colors.fg, bg = colors.outerbg },
        c = { fg = colors.fg, bg = colors.innerbg }
    },
    normal = {
        a = { fg = colors.gray, bg = colors.normal, gui = "bolditalic" },
        b = { fg = colors.fg, bg = colors.outerbg },
        c = { fg = colors.fg, bg = colors.innerbg }
    },
    insert = {
        a = { fg = colors.gray, bg = colors.insert, gui = "bolditalic" },
        b = { fg = colors.fg, bg = colors.outerbg },
        c = { fg = colors.fg, bg = colors.innerbg }
    },
    command = {
        a = { fg = colors.gray, bg = colors.command, gui = "bolditalic" },
        b = { fg = colors.fg, bg = colors.outerbg },
        c = { fg = colors.fg, bg = colors.innerbg }
    }
}
