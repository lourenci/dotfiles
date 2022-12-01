require("zen-mode").setup {
  window = {
    backdrop = 1
  },
  on_open = function(_)
    -- workaround to autoclose vim on zenmode close
    vim.cmd 'cabbrev <buffer> q let b:quitting = 1 <bar> q'
    vim.cmd 'cabbrev <buffer> x let b:quitting = 1 <bar> x'
  end,
  on_close = function()
    -- workaround to autoclose vim on zenmode close
    if vim.b.quitting == 1 then
      vim.b.quitting = 0
      vim.cmd 'q'
    end
  end,
}
