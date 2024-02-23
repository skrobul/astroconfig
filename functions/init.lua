vim.api.nvim_create_user_command("KrokiDecode", function(opts)
  local decoded = {}

  local replace = function(_, _, _)
    local row = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_text(0, row - 1, 0, row, 0, decoded)
  end

  local process_stdout = function(_, data, _)
      for _, line in ipairs(data) do
        table.insert(decoded, line)
      end
  end
  local process_error = function(_, data, _) print(vim.inspect(data)) end

  local selected_lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, true)
  for _, line in ipairs(selected_lines) do
    local _, _, encoded_diagram = string.find(line, ".*/svg/([A-Za-z0-9+=_-]+)")
    vim.fn.jobstart(
      { "kroki", "decode", encoded_diagram },
      {
        on_exit = replace,
        on_stdout = process_stdout,
        on_stderr = process_error,
      }
    )
  end
end, { nargs = 0, range = false })
