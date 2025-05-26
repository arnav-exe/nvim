-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {
    autocmds = require("configs.autocmds")
}

M.base46 = {
	theme = "material-darker",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

-- startup dashboard
M.nvdash = { load_on_startup = true }
M.ui = {
      tabufline = {
         lazyload = false
     }
}

-- configure term sizes
M.term = {
   sizes = { sp = 0.35, vsp = 0.4},
 }

return M
