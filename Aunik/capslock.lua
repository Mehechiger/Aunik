capsToggle = hs.hotkey.modal.new({})

capsToggle.entered = function()
	capsToggle.statusMessage:show()
end
capsToggle.exited = function()
	capsToggle.statusMessage:hide()
end

local msgStr = '^ CAPS LOCK ^'

local message = require('Aunik.status-message')
capsToggle.statusMessage = message.new(msgStr)

-- Use modifiers+trigger to toggle WindowLayout Mode
hs.hotkey.bind({}, 'f16', function()
	if (hs.hid.capslock.toggle()) then
		capsToggle:enter()
	end
end)
capsToggle:bind({}, 'f16', function()
	if not (hs.hid.capslock.toggle()) then
		capsToggle:exit()
	end
end)
