cnToggle = hs.hotkey.modal.new({})

cnToggle.entered = function()
	cnToggle.statusMessage:show()
end
cnToggle.exited = function()
	cnToggle.statusMessage:hide()
end

local msgStr = '中文'

local message = require('Aunik.status-message')
cnToggle.statusMessage = message.new(msgStr)

-- Use modifiers+trigger to toggle WindowLayout Mode
-- 目前中文法语的layout都是French
hs.hotkey.bind({}, 'f7', function()
	if (hs.keycodes.currentMethod() == nil) then  -- 法语的时候method是nil
		hs.keycodes.setMethod("搜狗拼音")
		cnToggle:enter()
	elseif (hs.keycodes.currentMethod() == "搜狗拼音") then
		hs.keycodes.setLayout("French")  -- 重设Layout切换回法语
		cnToggle:exit()
	end
end)
--cnToggle:bind({}, 'f7', function()
--	end
--end)
