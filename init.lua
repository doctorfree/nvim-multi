local settings = require("configuration")
local utils = require("utils.functions")
local luadir = vim.fn.stdpath("config") .. "/lua/"
local config = luadir .. settings.config
-- Create a symbolic link to the configuratin config folder
-- to enable Lazy to automatically locate config files
local configdir = config .. "/config"
if vim.fn.isdirectory(configdir) ~= 0 then
  os.execute("rm -f " .. luadir .. "config")
  os.execute("ln -s " .. configdir .. " " .. luadir .. "config")
end
if utils.file_or_dir_exists(config .. "/core/lazy.lua") then
  require(settings.config .. ".core.lazy")
else
  require(settings.config .. ".config.lazy")
end
