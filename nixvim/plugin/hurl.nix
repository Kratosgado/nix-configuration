{
  plugins.hurl.enable = true;
  extraConfigLua = ''
    --- Default configuration for hurl.nvim
    local config = {
      debug = true,
      mode = 'split',
      show_notification = true,
      auto_close = false,
      -- Default split options
      split_position = 'right',
      split_size = '40%',
      -- Default popup options
      popup_position = '50%',
      popup_size = {
        width = 80,
        height = 40,
      },
      env_file = { 'hurl.env' },
      fixture_vars = {
        {
          name = 'random_int_number',
          callback = function()
            return math.random(1, 1000)
          end,
        },
        {
          name = 'random_float_number',
          callback = function()
            local result = math.random() * 10
            return string.format('%.2f', result)
          end,
        },
      },
      formatters = {
        json = { 'jq' },
        html = {
          'prettier',
          '--parser',
          'html',
        },
        xml = {
          'tidy',
          '-xml',
          '-i',
          '-q',
        },
      },
    }
        require("hurl").setup(config)
  '';
}
