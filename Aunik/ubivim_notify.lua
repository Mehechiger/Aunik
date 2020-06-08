ubiVimNotify = hs.hotkey.modal.new({}, 'F15')

ubiVimNotify.entered = function()
  ubiVimNotify.statusMessage:show()
end
ubiVimNotify.exited = function()
  ubiVimNotify.statusMessage:hide()
end

local msgStr = '\n\nESC ESC ESC        \nUBIQUITOUS VIM MODE\n              I I I\n\n'

local message = require('Aunik.status-message')
ubiVimNotify.statusMessage = message.new(msgStr)

hs.hotkey.bind({}, 'F15', function()
  ubiVimNotify:enter()
end)
ubiVimNotify:bind({}, 'F15', function()
  ubiVimNotify:exit()
end)
