hs.grid.setGrid("2x2")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Hello World!")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")   -- here because reload would destroy the interpreter




hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.x = max.x + max.w / 2
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K", function()
  local win = hs.window.focusedWindow()
--   hs.grid.pushWindowUp(win)
  win:setFrame(win:screen():frame())
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.w = max.w / 2
  f.h = max.h / 2
  f.x = max.w / 2 - f.w / 2
  f.y = max.h / 2 - f.h / 2
  win:setFrame(f)
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Y", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.w = max.w / 2
  f.h = max.h / 2
  f.x = max.x
  f.y = max.y
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Y", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.w = max.w / 2
  f.h = max.h / 2
  f.x = max.x
  f.y = max.y
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Y", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.w = max.w / 2
  f.h = max.h / 2
  f.x = max.x
  f.y = max.y
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Y", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.w = max.w / 2
  f.h = max.h / 2
  f.x = max.x
  f.y = max.y
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.w = max.w / 2
  f.h = max.h / 2
  f.x = max.x + f.w
  f.y = max.y
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.w = max.w / 2
  f.h = max.h / 2
  f.x = max.x + f.w
  f.y = max.y + f.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "B", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.w = max.w / 2
  f.h = max.h / 2
  f.x = max.x
  f.y = max.y + f.h
  win:setFrame(f)
end)

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "3", function()
--   local win = hs.window.focusedWindow()
--   local spaces = hs.spaces.allSpaces()
--   for key, value in pairs(spaces) do
--     if (3) < #value then
--       local id = value[3]
--       print(id)
--       print(hs.spaces.windowSpaces(win))
--       hs.spaces.moveWindowToSpace(win, id)
--     end
--     break
--   end
--   -- hs.spaces.moveWindowToSpace(win, 2)
--   -- hs.spaces.switchToSpace(2)
-- end)


--
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()
--   local win = hs.window.focusedWindow()
--   hs.grid.pushWindowDown(win)
-- end)
--
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "=", function()
--   local win = hs.window.focusedWindow()
--   hs.grid.resizeWindowTaller(win)
-- end)
--
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "-", function()
--   local win = hs.window.focusedWindow()
--   hs.grid.resizeWindowShorter(win)
-- end)
