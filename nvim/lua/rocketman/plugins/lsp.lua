return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  },

  config = function()
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
      local opts = {buffer = bufnr, remap = false}

      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {'ts_ls', 'rust_analyzer'},
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end,
        ts_ls = function()
          require('lspconfig').ts_ls.setup({
            init_options = {
              preferences = {
                importModuleSpecifierPreference = 'non-relative',
                quoteStyle = 'single',
              },
            }
          })
        end,
        rust_analyzer = function()
          require('lspconfig').rust_analyzer.setup({
            settings = {
              ['rust-analyzer'] = {
                cargo = { features = { "dev" } },
                diagnostics = {
                  enable = true,
                  experimental = {
                    enable = true,
                  },
                },
                checkOnSave = {
                  command = "clippy", -- или "check"
                },
              },
            },
            flags = {
              allow_incremental_sync = true,
            },
          })
        end,
      }
    })

    local cmp = require('cmp')
    local cmp_select = {behavior = cmp.SelectBehavior.Select}

    cmp.setup({
      sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'buffer'},
      },
      formatting = lsp_zero.cmp_format(),
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Return>'] = cmp.mapping.confirm({ select = true }),
        ['<M-Space>'] = cmp.mapping.complete(),
      }),
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

    function import_identifier_under_cursor()
      local params = vim.lsp.util.make_range_params()
      params.context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
      
      vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(err, result, ctx)
        if err then
          print("LSP error:", err)
          return
        end

        if result and #result > 0 then
          -- Предполагаем, что первое действие является нужным (это может варьироваться в зависимости от LSP)
          local action = result[1]

          if action.edit or type(action.command) == "table" then
            if action.edit then
              vim.lsp.util.apply_workspace_edit(action.edit)
            end
            if type(action.command) == "table" then
              vim.lsp.buf.execute_command(action.command)
            end
          else
            vim.lsp.buf.execute_command(action)
          end
        else
          print("No import actions available for the identifier.")
        end
      end)
    end

    vim.api.nvim_set_keymap('n', '<M-i>', '<Cmd>lua import_identifier_under_cursor()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('i', '<M-i>', '<Cmd>lua import_identifier_under_cursor()<CR>', { noremap = true, silent = true })
  end
}
