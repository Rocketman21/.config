return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '/Users/Shared/orgfiles/**/*',
      org_default_notes_file = '/Users/Shared/orgfiles/refile.org',
      org_archive_location = './archive/%s_archive::'
    })
  end,
}
