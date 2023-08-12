-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
lvim.plugins = {
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      local nvim_tmux_nav = require('nvim-tmux-navigation')
      nvim_tmux_nav.setup {
        disable_when_zoomed = true -- defaults to false
      }

      vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      --vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      --vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  }
}

lvim.colorscheme = "rose-pine"
lvim.format_on_save = true
lvim.transparent_window = true
lvim.builtin.terminal.open_mapping = nil

lvim.builtin.nvimtree.setup.respect_buf_cwd = true
lvim.keys.normal_mode['<C-\\>'] = ":NvimTreeToggle<CR>"
lvim.keys.normal_mode['<leader>w'] = nil
-- lvim.builtin.which_key.mappings["\\"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" }

vim.keymap.set("n", "<leader>w", ":BufferKill<CR>")
vim.keymap.set("n", "gt", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "gT", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "vv", "<C-w>v<CR>")
vim.keymap.set("n", "ss", "<C-w>s<CR>")
vim.keymap.set("n", "<Leader><Leader>", "<c-^>")
vim.keymap.set("n", "<leader>//", ":nohlsearch<CR>")

vim.wo.colorcolumn     = "80"
vim.wo.wrap            = true
vim.wo.list            = true

vim.opt.swapfile       = true
vim.opt.termguicolors  = true
vim.opt.relativenumber = true
vim.opt.showcmd        = true
vim.opt.scrolloff      = 12
vim.opt.signcolumn     = "yes"
vim.opt.wrap           = false
vim.opt.textwidth      = 80
vim.opt.showmode       = true


vim.api.nvim_set_keymap('n', '<C-g>', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })

vim.diagnostic.config({
  virtual_text = false
})


vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
