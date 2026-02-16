local lsp = require('lspconfig')

local on_attach = function(client)
    -- require('completion').on_attach(client)
end

-- ---- Ccls ----
lsp.ccls.setup({
    autostart = false,
})

-- ---- Clangd ----
lsp.clangd.setup {
    cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
        --"--include-directory=include/"
    },
    filetypes = { "c", "cc", "cpp", "c++", "objc", "objcpp" },
    root_dir = require('lspconfig').util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
}

-- ---- Rust Analyzer ----
lsp.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = false
            },
        }
    }
})

-- This shit does not work or do anything
lsp.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'love' },
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('/nix/store/c90gkchwhb6bimq0ziskdn4wv6srmxii-love-11.5')] = true, -- Replace with your actual path
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
local servers = GET_LSP_SERVERS()
for _, v in ipairs(servers) do
    lsp[v].setup {
        on_attach = on_attach,
        autostart = true
    }
end
