-- Default keybindings for launching apps in Hyper Mode
--
-- To launch _your_ most commonly-used apps via Hyper Mode, create a copy of
-- this file, save it as `hyper-apps.lua`, and edit the table below to configure
-- your preferred shortcuts.
return {
  { 'b',
  'Google Chrome',
  [[
tell application "/Applications/Google Chrome.app"
	make new window
	activate
end tell
  ]],
  ''
  },     -- "B" for "Browser"

--  { 'b',
--  'Google Chrome',
--  '',
--  'open -na "Google Chrome" --args --new-window "chrome://newtab"'
--  },     -- "B" for "Browser"

  { 'v',
  'Google Chrome',
  [[
on replace_chars(this_text, search_string, replacement_string)
	set AppleScript's text item delimiters to the search_string
	set the item_list to every text item of this_text
	set AppleScript's text item delimiters to the replacement_string
	set this_text to the item_list as string
	set AppleScript's text item delimiters to ""
	return this_text
end replace_chars

set search to the clipboard as text
set search to replace_chars(search, " ", "+")
set search to "https://www.google.com/search?q=" & search

tell application "/Applications/Google Chrome.app"
	make new window
	activate
	set URL of tab 1 of window 1 to search
end tell
  ]],
  ''
  },     -- "V" for "ctrl+V"

  { 'f',
  'Finder',
  '',
  'open -a Finder ~/',
  },            -- "F" for "Finder"

  { 'g',
  'iTerm',
  [[
tell application "Finder" to set p to POSIX path of (insertion location as string)
tell application "iTerm"
	set newWindow to (create window with default profile)
	tell current session of newWindow
		write text "cd " & quoted form of p
	end tell
end tell
  ]],
  'open -a iTerm ~/'
  },             -- "G" for terminal in current path

{ 't',
  'iTerm',
--  '',
  [[
tell application "iTerm"
	set newWindow to (create window with default profile)
end tell
  ]],
  'open -a iTerm ~/'
  },             -- "T" for "Terminal"

--  { 'd', 'Pycharm', '', '' },             -- "D" for "iDe"
--  { 'a', 'Activity Monitor', '', '' },             -- "A" for "Activity Monitor"
{ 'a', 
  'htop',
  [[
tell application "iTerm"
	set newWindow to (create window with default profile)
	tell current session of newWindow
		write text "htop"
	end tell
end tell
  ]],
  '',
  },             -- "A" for "Activity Monitor"
  { 'e',
  'Mail',
  '',
  ''
  },             -- "E" for "E-Mail"
  { 's',
  'Messages',
  '',
  ''
  },             -- "S" for "meSSages"
  { 'd',
  'WebPomodoro',
  '',
  ''
  },             -- "d" for "pomoDoro"
  { 'r',
  'reMarkable',
  '',
  ''
  },             -- "r" for "Remarkable"
  { 'z',
  'zotero',
  '',
  ''
  },             -- "z" for "zotero"
  { 'c',
  'calendar',
  '',
  ''
  },             -- "c" for "calendar"
}
