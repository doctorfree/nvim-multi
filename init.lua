local settings = require("configuration")
local utils = require("utils.functions")
local luadir = vim.fn.stdpath("config") .. "/lua/"
local config = luadir .. settings.config

-- Watch the lua/configuration.lua for changes and
-- re-initialize when changes to that file are detected
if File_watchers == nil then
    File_watchers = {}
end
local watch_file_augroup = 'watch_file_augroup'
vim.api.nvim_create_augroup(watch_file_augroup, {clear=true})
vim.api.nvim_create_autocmd('VimLeave', {
    group = watch_file_augroup,
    callback = function()
        for _, watcher in pairs(File_watchers) do
            watcher:stop()
        end
    end
})
local function watch_file(fname, cb, time)
    if File_watchers[fname] then
        File_watchers[fname]:stop()
        File_watchers[fname] = nil
    end

    File_watchers[fname] = vim.loop.new_fs_poll()
    File_watchers[fname]:start(fname, time, vim.schedule_wrap(cb))
end

local init_lua = vim.fn.stdpath('config')..'/init.lua'
local conf_lua = vim.fn.stdpath('config')..'/lua/configuration.lua'

watch_file(conf_lua, function()
    dofile(init_lua)
    vim.notify('Reloaded init.lua', vim.diagnostic.severity.INFO)
end, 500)

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
