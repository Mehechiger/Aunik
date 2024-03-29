local status, hyperModeAppMappings = pcall(require, 'Aunik.hyper-apps')

if not status then
  hyperModeAppMappings = require('Aunik.hyper-apps-defaults')
end

for i, mapping in ipairs(hyperModeAppMappings) do
  local key = mapping[1]
  local app = mapping[2]
  local osa = mapping[3]
  local sh = mapping[4]
  hs.hotkey.bind({'shift', 'ctrl', 'alt', 'cmd'}, key, function()
    if (type(app) == 'string') then
      if (osa == '' and sh == '') then
	hs.application.open(app)
      elseif (osa ~= '') then
	hs.osascript.applescript(osa)
      else
	hs.execute(sh)
      end
    elseif (type(app) == 'function') then
      app()
    else
      hs.logger.new('hyper'):e('Invalid mapping for Hyper +', key)
    end
  end)
end
