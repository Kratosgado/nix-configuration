{
  plugins = {
    copilot-vim = { enable = false; };

    copilot-chat = {
      enable = true;
      settings = {
        answer_header = "## Copilot ";
        auto_follow_cursor = false;
        error_header = "## Error ";
        context = "buffers";
        # model = "gpt-3.5-turbo"; # gpt-4
        window = { width = 0.4; };
        mappings = {
          accept_diff = {
            insert = "<C-y>";
            normal = "<C-y>";
          };
          jump_to_diff = { normal = "gj"; };
          quickfix_diffs = { normal = "gq"; };
          reset = {
            insert = "<C-l>";
            normal = "<C-l>";
          };
          show_context = { normal = "gc"; };
          show_diff = { normal = "gd"; };
          show_help = { normal = "gh"; };
          show_info = { normal = "gi"; };
          submit_prompt = {
            insert = "<C-s>";
            normal = "<CR>";
          };
          toggle_sticky = {
            detail = "Makes line under cursor sticky or deletes sticky line.";
            normal = "gr";
          };
          yank_diff = {
            normal = "gy";
            register = ''"'';
          };
          close = {
            insert = "<C-c>";
            normal = "q";
          };
          complete = {
            detail = "Use @<Tab> or /<Tab> for options.";
            insert = "<Tab>";
          };
        };
        prompts = {
          Explain = "Please explain how the following code works.";
          Review =
            "Please review the following code and provide suggestions for improvement.";
          Tests =
            "Please explain how the selected code works, then generate unit tests for it.";
        };
        question_header = "## User ";
        show_help = false;
      };
    };
    copilot-cmp = { enable = true; };
  };
}
