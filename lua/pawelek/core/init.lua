local M = {}


M.setup = function(opts)
    require "pawelek.core.settings"
    require("pawelek.core.colors").setup()
    M.load_mappings()
end

M.setup_utils = function(opts)
    require "pawelek.core.utils"
end


M.load_mappings = function(section, opts)
  local mappings_congig = require("pawelek.core.mappings")

  local mappings = section ~= nil  and mappings_congig[section] or mappings_congig["general"]

  local mappings_opts = opts ~= nil and opts or { noremap = false, silent = false }
  for mode, bindings in pairs(mappings) do
      for key, command in pairs(bindings) do
          mappings_opts["desc"] = command[2]
          vim.keymap.set(mode, key, command[1], mappings_opts)
      end
  end
end


return M
