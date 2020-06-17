local drawing = require 'hs.drawing'
local geometry = require 'hs.geometry'
local screen = require 'hs.screen'
local styledtext = require 'hs.styledtext'

local statusmessage = {}
statusmessage.new = function(messageText, ...)
	local textColor = { red = 1, green = 1, blue = 1, alpha=0.5 }
	local backgroundColor = { red = 0, green = 0, blue = 0, alpha=0.8 }
	if ... ~= nil then
		textColor, backgroundColor = ...
	end
	local buildParts = function(messageText, textSize)
		local frame = screen.primaryScreen():frame()

		local styledTextAttributes = {
			font = { name = 'Source Code Pro for Powerline', size = 48 },
			color = textColor
		}

		local styledText = styledtext.new(messageText, styledTextAttributes)

		local styledTextSize = drawing.getTextDrawingSize(styledText)
		local textRect = {
			x = frame.w - styledTextSize.w - 40,
			y = frame.h - styledTextSize.h,
			w = styledTextSize.w + 40,
			h = styledTextSize.h + 40,
		}
		local text = drawing.text(textRect, styledText)
		--text:setTextColor(textColor)

		local background = drawing.rectangle(
			{
				x = frame.w - styledTextSize.w - 55,
				y = frame.h - styledTextSize.h + 21,
				w = styledTextSize.w + 30,
				h = styledTextSize.h - 30
			}
		)
		background:setRoundedRectRadii(5, 5)
		background:setFillColor(backgroundColor)

		return background, text
	end

	return {
		_buildParts = buildParts,
		show = function(self)
			self:hide()

			self.background, self.text = self._buildParts(messageText, textSize)
			self.background:show()
			self.text:show()
		end,
		hide = function(self)
			if self.background then
				self.background:delete()
				self.background = nil
			end
			if self.text then
				self.text:delete()
				self.text = nil
			end
		end,
		notify = function(self, seconds)
			local seconds = seconds or 1
			self:show()
			hs.timer.delayed.new(seconds, function() self:hide() end):start()
		end
	}
end

return statusmessage
