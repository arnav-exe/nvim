return {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--no-ignore",
      "--follow",
    },
    file_ignore_patterns = {},
  },

  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
      follow = true,
    },
  },
}

