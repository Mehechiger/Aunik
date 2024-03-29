hs.window.animationDuration = 0

function quitApplication(win)
  hs.eventtap.keyStroke("command", "q", 100)
end

function maximize(win)
  win:maximize()
end

-- +-----------------+
-- |        |        |
-- |  HERE  |        |
-- |        |        |
-- +-----------------+
function left(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |        |        |
-- |        |  HERE  |
-- |        |        |
-- +-----------------+
function right(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |      HERE       |
-- +-----------------+
-- |                 |
-- +-----------------+
function up(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.w = max.w
  f.y = max.y
  f.h = max.h / 2
  win:setFrame(f)
end

-- +-----------------+
-- |                 |
-- +-----------------+
-- |      HERE       |
-- +-----------------+
function down(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.w = max.w
  f.y = max.y + (max.h / 2)
  f.h = max.h / 2
  win:setFrame(f)
end

-- +-----------------+
-- |  HERE  |        |
-- +--------+        |
-- |                 |
-- +-----------------+
function upLeft(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x
  f.y = max.y
  f.w = max.w/2
  f.h = max.h/2
  win:setFrame(f)
end

-- +-----------------+
-- |                 |
-- +--------+        |
-- |  HERE  |        |
-- +-----------------+
function downLeft(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w/2
  f.h = max.h/2
  win:setFrame(f)
end

-- +-----------------+
-- |                 |
-- |        +--------|
-- |        |  HERE  |
-- +-----------------+
function downRight(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + (max.h / 2)
  f.w = max.w/2
  f.h = max.h/2

  win:setFrame(f)
end

-- +-----------------+
-- |        |  HERE  |
-- |        +--------|
-- |                 |
-- +-----------------+
function upRight(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w/2
  f.h = max.h/2
  win:setFrame(f)
end

-- +--------------+
-- |  ----------  |
-- |  |  HERE  |  |
-- |  ----------  |
-- +---------------+
function centerWithFullHeight(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x + (max.w / 5)
  f.w = max.w * 3/5
  f.y = max.y + (max.h / 10)
  f.h = max.h * 8/10
  win:setFrame(f)
end

-- +-----------------+
-- |      |          |
-- | HERE |          |
-- |      |          |
-- +-----------------+
function left40(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w * 0.4
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |           |     |
-- |    HERE   |     |
-- |           |     |
-- +-----------------+
function left60(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w * 0.6
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |          |      |
-- |          | HERE |
-- |          |      |
-- +-----------------+
function right40(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 0.6)
  f.y = max.y
  f.w = max.w * 0.4
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |      |          |
-- |      |   HERE   |
-- |      |          |
-- +-----------------+
function right60(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 0.4)
  f.y = max.y
  f.w = max.w * 0.6
  f.h = max.h
  win:setFrame(f)
end

function nextScreen(win)
  local currentScreen = win:screen()
  local allScreens = hs.screen.allScreens()
  currentScreenIndex = hs.fnutils.indexOf(allScreens, currentScreen)
  nextScreenIndex = currentScreenIndex + 1

  if allScreens[nextScreenIndex] then
    win:moveToScreen(allScreens[nextScreenIndex])
  else
    win:moveToScreen(allScreens[1])
  end
end

--windowLayoutMode = hs.hotkey.modal.new({})

--windowLayoutMode.entered = function()
--  windowLayoutMode.statusMessage:show()
--end
--windowLayoutMode.exited = function()
--  windowLayoutMode.statusMessage:hide()
--end

-- Bind the given key to call the given function and exit WindowLayout mode
--function windowLayoutMode.bindWithAutomaticExit(mode, modifiers, key, fn)
--  mode:bind(modifiers, key, function()
--    mode:exit()
--    fn()
--  end)
--end

local status, windowMappings = pcall(require, 'Aunik.windows-bindings')

if not status then
  windowMappings = require('Aunik.windows-bindings-defaults')
end

--local modifiers = windowMappings.modifiers
--local showHelp  = windowMappings.showHelp
--local trigger   = windowMappings.trigger
local mappings  = windowMappings.mappings

--function getModifiersStr(modifiers)
--  local modMap = { shift = '⇧', ctrl = '⌃', alt = '⌥', cmd = '⌘' }
--  local retVal = ''
--
--  for i, v in ipairs(modifiers) do
--    retVal = retVal .. modMap[v]
--  end
--
--  return retVal
--end

--local msgStr = getModifiersStr(modifiers)
--msgStr = 'Window Layout Mode (' .. msgStr .. (string.len(msgStr) > 0 and '+' or '') .. trigger .. ')'

for i, mapping in ipairs(mappings) do
  local modifiers, trigger, winFunction = table.unpack(mapping)
--  local hotKeyStr = getModifiersStr(modifiers)

  hs.hotkey.bind(modifiers, trigger, function()
    local fw = hs.window.focusedWindow()
    _G[winFunction](fw)
  end)
--  if showHelp == true then
--    if string.len(hotKeyStr) > 0 then
--      msgStr = msgStr .. (string.format('\n%10s+%s => %s', hotKeyStr, trigger, winFunction))
--    else
--      msgStr = msgStr .. (string.format('\n%11s => %s', trigger, winFunction))
--    end
--  end

--  windowLayoutMode:bindWithAutomaticExit(modifiers, trigger, function()
--    --example: hs.window.focusedWindow():upRight()
--    local fw = hs.window.focusedWindow()
--    _G[winFunction](fw)
--  end)
end

--local message = require('Aunik.status-message')
--windowLayoutMode.statusMessage = message.new(msgStr)

-- Use modifiers+trigger to toggle WindowLayout Mode
--hs.hotkey.bind(modifiers, trigger, function()
--  windowLayoutMode:enter()
--end)
--windowLayoutMode:bind(modifiers, trigger, function()
--  windowLayoutMode:exit()
--end)
