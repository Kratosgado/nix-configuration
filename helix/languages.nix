{
  
programs.helix.languages = {
      # grammar = [{
      #   name = "http";

      # }];
      # language-server = {
      #   jdtls = { command = "jdtls"; };
      #   language-server = {
      #     command = "jdtls";
      #     args = [ "-data" "/home/kratosgado/.cache/jdtls/workspace" ];
      #   };
      # };
      language-server = {
        ruff = {
          command = "ruff";
          args = [ "server" ];
        };
        pylyzer = {
          command = "pylyzer";
          args = [ "--server" ];
        };
        pyright.config.python.analysis.typeCheckingMode = "basic";
        rust-analyzer.config = {
          check.command = "clippy";
          cargo.features = "all";
        };
        # typescript-language-server.config.plugins = [{
        #   name = "@vue/typescript-plugin"
        #   location = "/home/kratosgado/node_modules/@vue/language-server/";
        #   languages = [ "vue" ];
        # }];
        tailwindcss-ls = {
          command = "tailwindcss-language-server";
          args = [ "--stdio" ];
          # config = {
          #   userLanguages = {
          #     rust = "html";
          #     "*.rs" = "html";
          #   };
          # };
        };
        sql-language-server = {
          command = "sql-language-server";
          args = [ "up" "--method" "stdio" ];
        };
      };
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = { command = "nixpkgs-fmt"; };
        }
        {
          name = "rust";
          auto-format = true;
          # language-servers = [ "rust-analyzer" "tailwindcss-ls" ];
        }
        {
          name = "typescript";
          auto-format = true;
        }
        {
          name = "tsx";
          auto-format = true;
          language-servers = [ "typescript-language-server" "tailwindcss-ls" ];
        }

        {
          name = "jsx";
          auto-format = true;
          language-servers = [ "typescript-language-server" "tailwindcss-ls" ];
        }
        {
          name = "html";
          language-servers = [ "vscode-html-language-server" "tailwindcss-ls" ];
        }
        {
          name = "css";
          auto-format = true;
          language-servers = [ "vscode-css-language-server" "tailwindcss-ls" ];
        }
        # { name = "cpp"; }
        {
          name = "java";
          auto-format = true;
          scope = "source.java";
          injection-regex = "java";
          file-types = [ "java" ];
          roots = [ "pom.xml" "build.gradle" ];
          indent = {
            tab-width = 2;
            unit = "  ";
          };
          language-servers = [ "jdtls" ];
        }
        { name = "kotlin"; }
        {
          name = "svelte";
          auto-format = true;
          language-servers = [ "svelteserver" "tailwindcss-ls" ];
          formatter = {
            command = "prettier";
            args = [ "--parser=svelte" ];
          };
        }
        {
          name = "vue";
          auto-format = true;
          formatter = {
            command = "prettier";
            args = [ "--parser" "vue" ];
          };
          language-servers = [ "typescript-language-server" ];
        }
        {
          name = "gts";
          auto-format = true;
          formatter = {
            command = "prettier";
            args = [ "--parser=typescript" ];
          };
        }
        {
          name = "prisma";
          auto-format = true;
        }
        {
          name = "python";
          language-servers = [ "ruff" "pyright" "pylyzer" ];
          auto-format = true;
        }
        {
          name = "toml";
          auto-format = true;
          formatter = {
            command = "taplo";
            args = [ "fmt" "-" ];
          };
        }
        { name = "dockerfile"; }
        { name = "docker-compose"; }
        { name = "env"; }
        {
          name = "bash";
          formatter = {
            command = "shfmt";
            args = [ "-i" "2" "-ci" ];
          };
        }
        { name = "lua"; }
        { name = "json"; }
        { name = "markdown"; }
        {
          name = "sql";
          language-servers = "sql-language-server";
        }
      ];
    };}
