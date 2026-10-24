vim.api.nvim_create_user_command('BufferCount', function()
    local cnt = 0
    local all_buffers = vim.api.nvim_list_bufs()
    for _, bufnr in pairs(all_buffers) do
        if vim.bo[bufnr].buflisted then
            cnt = cnt + 1
        end
    end
    print(cnt)
end, {})
