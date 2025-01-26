local M = {}

function M.setup()
    local whichkey = require "which-key"

    local conf = {
        win = {
            border = "single",   -- none, single, double, shadow
            position = "bottom", -- bottom, top
        },
    }

    local opts = {
        mode = "n",     -- Normal mode
        prefix = "<leader>",
        buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true,  -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = false, -- use `nowait` when creating keymaps
    }

    local mappings = {
        ["w"] = { "<cmd>update!<CR>", "Save" },
        ["Q"] = { "<cmd>q!<CR>", "Quit" },
        ["q"] = { "<Cmd>bd!<Cr>", "Close current buffer" },

        f = {
            name = "Find",
            f = { "<cmd>Telescope find_files<cr>", "Find files" },
            g = { "<cmd>Telescope live_grep<cr>", "Find all text" },
            m = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
        },

        b = {
            name = "Buffer",
            D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
            l = { "<cmd>Telescope buffers<cr>", "List buffers" }
        },

        z = {
            name = "Packer",
            c = { "<cmd>PackerCompile<cr>", "Compile" },
            i = { "<cmd>PackerInstall<cr>", "Install" },
            s = { "<cmd>PackerSync<cr>", "Sync" },
            S = { "<cmd>PackerStatus<cr>", "Status" },
            u = { "<cmd>PackerUpdate<cr>", "Update" },
        },

        g = {
            name = "Git",
            s = { "<cmd>Neogit<CR>", "Status" },
        },
    }

    whichkey.setup(conf)
    whichkey.register(mappings, opts)
end

return M
