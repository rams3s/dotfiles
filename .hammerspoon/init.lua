function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

function resizeFocusedWindow(key)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  if key == "Left" then
    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
  elseif key == "Right" then
    f.x = max.w / 2
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
  elseif key == "Up" then
    f = max
  end

  win:setFrame(f)
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  resizeFocusedWindow("Left")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  resizeFocusedWindow("Right")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
  resizeFocusedWindow("Up")
end)