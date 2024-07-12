local c = GET_PARADISE_COLORS()
require('base16-colorscheme').setup(c)

vim.cmd('set termguicolors')

local function hl(highlight, fg, bg)
    if fg == nil then fg = "none" end
    if bg == nil then bg = "none" end
    vim.cmd("hi " .. highlight .. " guifg=" .. fg .. " guibg=" .. bg)
end

local function hl_italic(highlight)
    vim.cmd("hi " .. highlight .. " cterm=italic gui=italic")
end


--hl_italic("BufferLineWarningSelected")

-- Alpha
hl("AlphaHeader", c.base08)
hl("AlphaQuote", c.base04)
hl("AlphaButtons", c.base04)
hl('AlphaButtonShortcut', c.base08)
hl_italic("AlphaButtonShortcut")

-- Notify
hl("NotifyERRORBorder", c.base08)
hl("NotifyWARNBorder", c.base0A)
hl("NotifyINFOBorder", c.base0C)
hl("NotifyDEBUGBorder", c.base0B)
hl("NotifyTRACEBorder", c.base04)
hl("NotifyERRORIcon", c.base08)
hl("NotifyWARNIcon", c.base0A)
hl("NotifyINFOIcon", c.base0C)
hl("NotifyDEBUGIcon", c.base0B)
hl("NotifyTRACEIcon", c.base04)
hl("NotifyERRORTitle", c.base08)
hl("NotifyWARNTitle", c.base0A)
hl("NotifyINFOTitle", c.base0C)
hl("NotifyDEBUGTitle", c.base0B)
hl("NotifyTRACETitle", c.base04)

-- Treesitter italics
hl_italic("TSComment")
hl_italic("TSNone")
hl_italic("TSKeyword")
hl_italic("TSKeywordFunction")
hl_italic("TSFuncMacro")
hl_italic("TSInclude")
hl_italic("TSType")
hl_italic("TSKeywordOperator")
hl("TSKeyword", c.base0E)
hl("TSKeywordFunction", c.base0E)
hl("TSNone", c.base08)

-- Diagnostics
hl("DiagnosticVirtualTextWarn", c.base0A)
hl("DiagnosticWarn", c.base0A)
hl("TroubleNormal", nil, c.base000)
hl("TroubleWarning", c.base0A)
hl("TroubleFoldIcon", c.base04)

hl("StatusLineNC", c.base000, c.base000)
hl("StatusLine", c.base000, c.base000)

-- Gutter
hl("DiagnosticSignInfo", c.base04)
hl("EndOfBuffer", c.base00)

-- NeoTree
hl("NeoTreeDirectoryIcon", c.base0A)
hl("NeoTreeDirectoryName", c.base05)
hl("NeoTreeGitModified", c.base0E)
hl("NeoTreeGitAdded", c.base0B)
hl("NeoTreeGitDeleted", c.base08)
hl("NeoTreeGitIgnored", c.base03)
hl("NeoTreeGitStaged", c.base08)
hl("NeoTreeGitUntracked", c.base0B)
hl("NeoTreeGitUnstaged", c.base04)
hl("NeoTreeNormal", nil, c.base000)
hl("NeoTreeNormalNC", nil, c.base000)
hl("NeoTreeCursorLine", nil, c.base00)
hl("NeoTreeVertSplit", c.base08, c.base08)
hl_italic("NeoTreeCursorLine")

-- Bufferline
hl("BufferLineOffset", c.base0C, c.base000)
hl("TabLineSel", c.base0C)
hl_italic("BufferLineOffset")

-- Telescope
hl("TelescopeBorder", c.base04, c.base00)
hl("TelescopeTitle", c.base00, c.base05)
hl("TelescopeResultsTitle", c.base00, c.base0C)
hl("TelescopeSelection", nil, c.base01)
hl("TelescopePromptBorder", c.base04, c.base00)
hl("TelescopePromptPrefix", c.base0D, c.base00)
hl("TelescopePromptNormal", nil, c.base00)
hl("TelescopeNormal", nil, c.base00)

-- Menues
hl("Pmenu", nil, c.base00)
hl("PmenuSbar", nil, c.base01)
hl("PmenuThumb", nil, c.base01)
hl("PmenuSel", nil, c.base02)

-- CMP
hl("CmpItemAbbrMatch", c.base0D)
hl("CmpItemAbbrMatchFuzzy", c.base0D)
hl("CmpItemAbbr", c.base04)
hl("CmpItemKind", c.base0E)
hl("CmpItemMenu", c.base0E)

-- Line Numbers and Cursor
hl("CursorLine", nil, c.base000)
hl("CursorLineNR", nil, c.base000)
hl("LineNr", c.base03, c.base000)

hl("CursorLine")
hl("CursorLineNR")
hl("LineNr", c.base03)

-- Others
hl("NormalFloat", nil, c.base00)
hl("FloatBorder", c.base05, c.base00)
hl("VertSplit", c.base000)
