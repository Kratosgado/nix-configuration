-- In lua/plugins/kotlin.lua
return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = {
          filetypes = { "kotlin", "kt", "kts" },
          root_dir = require("lspconfig.util").root_pattern(
            "settings.gradle",
            "settings.gradle.kts",
            "build.gradle",
            "build.gradle.kts",
            ".git"
          ),
          cmd = { "kotlin-language-server" }, -- Using the system-installed version
          init_options = {
            storagePath = "/tmp/kotlin-language-server",
            clientInfo = {
              name = "LazyVim",
              version = "1.0.0",
            },
          },
          settings = {
            kotlin = {
              compiler = {
                jvm = {
                  target = "21", -- Match your JDK version
                },
              },
              debugAdapter = {
                enabled = true,
              },
              completion = {
                snippets = {
                  enabled = true,
                },
              },
              -- Explicitly set JAVA_HOME for the server
              javaHome = vim.fn.expand("$JAVA_HOME"),
            },
          },
        },
      },
    },
  },
  -- Explicitly disable Mason auto-installs for these tools
  {
    "williamboman/mason.nvim",
    opts = {
      -- Setup a list of tools to NOT install via Mason
      -- since they're managed by Nix
      registries = {
        -- This tells Mason not to manage these
        ["kotlin-language-server"] = false,
        ["ktlint"] = false,
        ["kotlin-debug-adapter"] = false,
      },
    },
  },

  -- Debug adapter configuration
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")

      -- Using system JDB for debugging
      dap.adapters.kotlin = {
        type = "executable",
        command = "jdb",
        args = {},
      }

      dap.configurations.kotlin = {
        {
          type = "kotlin",
          request = "launch",
          name = "Launch Kotlin Program",
          projectRoot = "${workspaceFolder}",
          mainClass = function()
            return vim.fn.input("Main class: ", "", "file")
          end,
          classPaths = function()
            -- Generate class paths dynamically from gradle
            local job = vim.fn.jobstart("gradle -q :printClasspath", {
              stdout_buffered = true,
              on_stdout = function(_, data)
                if data then
                  return data[1]
                end
                return ""
              end,
            })

            -- Return a sample path as fallback
            return { "build/classes/kotlin/main" }
          end,
        },
      }
    end,
  },

  -- Format on save
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        kotlin = { "ktlint" },
      },
      formatters = {
        ktlint = {
          command = "ktlint",
          args = { "--format", "--stdin" },
          stdin = true,
        },
      },
    },
  },

  -- Test framework
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "rcasia/neotest-java",
    },
    opts = {
      adapters = {
        ["neotest-java"] = {
          -- Will use system JUnit and Gradle
        },
      },
    },
  },
}
