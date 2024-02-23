vim.api.nvim_create_user_command("KrokiDecode", function(opts)
  -- print(string.upper(opts.line1))
  -- print(string.upper(opts.range))
  local decoded = {}

  local replace = function(_, _, _)
    -- print(vim.inspect(decoded))
-- nvim_buf_set_text({buffer}, {start_row}, {start_col}, {end_row}, {end_col}, {replacement})
    vim.api.nvim_buf_set_text(0, opts.line1 - 1, 0, opts.line2 - 1, 0, decoded)
  end

  local replace_line = function(i, j)
    return function(_, _, _)
    end
  end

  local process_stdout = function(_, data, _)
    for _, line in ipairs(data) do
      table.insert(decoded, line)
    end
  end
  local process_error = function(_, data, _)
    print(vim.inspect(data))
  end


  local selected_lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, true)
  for idx, line in ipairs(selected_lines) do
    local i, j, diagram_text = string.find(line, ".*/svg/([A-Za-z0-9+=_-]+)")
    decoded = {}
    local job = vim.fn.jobstart({"kroki", "decode", diagram_text}, { on_exit=replace, on_stdout=process_stdout, on_stderr=process_error})
  end
  -- vim.cmd("!kroki decode " .. current_line)
end, { nargs = 0, range = true })
