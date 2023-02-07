local config = require('winbar.config')

local M = {}

function M.setup(opts)
    config.set_options(opts)
    local winbar = require('winbar.winbar')

    local events = { 'DirChanged', 'BufWinEnter', 'BufFilePost', 'BufWritePost' }
    if opts.show_symbols then
      table.insert(events, 'CursorMoved')
      table.insert(events, 'InsertEnter')
    end

    winbar.init()
    if opts.enabled == true then
        vim.api.nvim_create_autocmd(events, {
            callback = function()
                winbar.show_winbar()
            end
        })
    end
end

return M
