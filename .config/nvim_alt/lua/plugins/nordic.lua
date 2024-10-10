return {
    'AlexvZyl/nordic.nvim',
    enabled = false,
    priority = 1000,
    config = function()
        require('nordic').setup({
            transparent_bg = true,
            -- reduced_blue = true,
        })
        vim.cmd([[colorscheme nordic]])
    end,
}
