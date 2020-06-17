-- Default keybindings for launching apps in Hyper Mode
--
-- To launch _your_ most commonly-used apps via Hyper Mode, create a copy of
-- this file, save it as `hyper-apps.lua`, and edit the table below to configure
-- your preferred shortcuts.
return {
  { 'b', 'Google Chrome', 'tell application "/Applications/Google Chrome.app"\n  make new window\n  activate\nend tell' },     -- "B" for "Browser"
  { 'f', 'Finder', 'tell application "Finder"\n  make new Finder window\n  activate\nend tell' },            -- "F" for "Finder"
  { 't', 'iTerm', 'tell application "iTerm2"\n  create window with default profile\nend tell' },             -- "T" for "Terminal"
  { 'd', 'Pycharm CE', '' },             -- "D" for "IDE"
  { 'a', 'Activity Monitor', '' },             -- "A" for "Activity Monitor"
  { 'e', 'Mail', '' },             -- "E" for "E-Mail"
}
--  { 'a', 'Music' },             -- "A" for "Apple Music"
--  { 'c', 'Slack' },             -- "C for "Chat"
--  { 'd', 'Remember The Milk' }, -- "D" for "Do!" ... or "Done!"
--  { 'e', 'Atom' },              -- "E" for "Editor"
--  { 'g', 'Mailplane 3' },       -- "G" for "Gmail"
