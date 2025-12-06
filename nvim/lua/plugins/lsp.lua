return {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },

    config = function()
	vim.lsp.enable('lua_ls')
	vim.lsp.config['lua_ls'] = {
	    -- Command and arguments to start the server.
	    cmd = { 'lua-language-server' },
	    -- Filetypes to automatically attach to.
	    filetypes = { 'lua' },
	    -- Sets the "workspace" to the directory where any of these files is found.
	    -- Files that share a root directory will reuse the LSP server connection.
	    -- Nested lists indicate equal priority, see |vim.lsp.Config|.
	    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
	    -- Specific settings to send to the server. The schema is server-defined.
	    -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	    settings = {
		Lua = {
		    runtime = {
			version = 'LuaJIT',
		    }
		}
	    }
	}

	vim.lsp.enable('pyright')
	vim.lsp.config['pyright'] = {

	    {
		python = {
		    analysis = {
			autoSearchPaths = true,
			diagnosticMode = "openFilesOnly",
			useLibraryCodeForTypes = true
		    }
		}
	    }

	}
    end

}
