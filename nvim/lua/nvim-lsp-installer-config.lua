local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server.name == 'angularls' then
	    local cmd = {
	      server.root_dir .. '/node_modules/.bin/ngserver',
	      '--stdio',
	      '--tsProbeLocations',
	      server.root_dir,
	      '--ngProbeLocations',
	      server.root_dir .. '/node_modules/@angular/language-server'
	    }

	    opts.cmd = cmd
	    opts.on_new_config = function(new_config)
	      new_config.cmd = cmd
	    end
    end

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)


