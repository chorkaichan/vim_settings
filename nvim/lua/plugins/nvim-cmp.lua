return {
  "nvim-cmp",
  dependencies = {
    -- copilot settings
    {
      "zbirenbaum/copilot-cmp",
      dependencies = "copilot.lua",
      opts = {},
      config = function(_, opts)
        local copilot_cmp = require("copilot_cmp")
        copilot_cmp.setup(opts)
        -- attach cmp source whenever copilot attaches
        -- fixes lazy-loading issues with the copilot cmp source
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "copilot" then
            copilot_cmp._on_insert_enter({})
          end
        end)
      end,
    },
    -- rust settings
    {
      "Saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      opts = {
        src = {
          cmp = { enabled = true },
        },
      },
    },
    -- snippet settings
    {
      "saadparwaiz1/cmp_luasnip",
    },
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    -- copilit settings
    table.insert(opts.sources, 1, {
      name = "copilot",
      group_index = 1,
      priority = 100,
    })
    -- rust settings
    opts.sources = opts.sources or {}
    table.insert(opts.sources, { name = "crates" })
    -- tailwindcss settings
    local format_kinds = opts.formatting.format
    opts.formatting.format = function(entry, item)
      format_kinds(entry, item) -- add icons
      return require("tailwindcss-colorizer-cmp").formatter(entry, item)
    end
    -- snippet settings
    opts.snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    }
    table.insert(opts.sources, { name = "luasnip" })
  end,
}
