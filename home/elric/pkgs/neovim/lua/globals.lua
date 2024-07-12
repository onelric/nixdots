function CLOSE_TAB()
    vim.api.nvim_command('Neotree close')
    vim.api.nvim_command('bd!')
    vim.api.nvim_command('Neotree left')
    vim.api.nvim_command('wincmd l')
end

function TOGGLE_TERM()
    vim.api.nvim_command('Neotree close')
    vim.api.nvim_command('ToggleTerm')
    vim.api.nvim_command('Neotree left')
end

function TOGGLE_TROUBLE()
    vim.api.nvim_command('Neotree close')
    vim.api.nvim_command('TroubleToggle')
    vim.api.nvim_command('Neotree left')
    vim.api.nvim_command('wincmd l')
end

function FORMAT_DOCUMENT()
    vim.cmd 'lua vim.diagnostic.hide()'
    vim.cmd 'lua vim.lsp.buf.format()'
    vim.cmd 'lua vim.diagnostic.show()'
end

function ALPHA_QUOTES()
    local quotes = {
        '冬後の桜',
        '桜の木はピンク',
        '樹皮は茶色',
    }
    math.randomseed(os.time())
    local index = math.random(#quotes)
    return quotes[index]
end

function GET_LSP_SERVERS()
    return {
        'pylsp',
        'rust_analyzer',
        'cmake',
        'html',
        'cssls',
        'eslint',
        'lua_ls',
        'nixd'
    }
end

function GET_PARADISE_COLORS()
    return {
        base000 = "#111111",
        base00 = "#151515",
        base01 = "#1f1f1f",
        base02 = "#2e2e2e",
        base03 = "#424242",
        base04 = "#bbb6b6",
        base05 = "#e8e3e3",
        base06 = "#e8e3e3",
        base07 = "#e8e3e3",
        base08 = "#b66467",
        base09 = "#d9bc8c",
        base0A = "#d9bc8c",
        base0B = "#8c977d",
        base0C = "#8aa6a2",
        base0D = "#8da3b9",
        base0E = "#a988b0",
        base0F = "#bbb6b6",
    }
end
