-- Loader.lua — окно через 15–20 секунд после входа

local imgui = require 'mimgui'
local window = imgui.new.bool(false)

function main()
    wait(17000)  -- 17 секунд после загрузки скрипта (можно изменить на 15000–20000)

    print("[Loader] Прошло 17 секунд — показываем окно")

    window[0] = true

    imgui.OnFrame(function() return window[0] end, function()
        local resX, resY = getScreenResolution()
        
        imgui.SetNextWindowPos(imgui.ImVec2(0, 0))
        imgui.SetNextWindowSize(imgui.ImVec2(resX, resY))
        
        imgui.Begin("ПРЕДУПРЕЖДЕНИЕ", window, 
            imgui.WindowFlags.NoTitleBar +
            imgui.WindowFlags.NoResize +
            imgui.WindowFlags.NoMove +
            imgui.WindowFlags.NoCollapse +
            imgui.WindowFlags.NoScrollbar +
            imgui.WindowFlags.NoBringToFrontOnFocus +
            imgui.WindowFlags.NoSavedSettings +
            imgui.WindowFlags.NoFocusOnAppearing
        )
        
        imgui.SetCursorPos(imgui.ImVec2(resX / 2 - 320, resY / 2 - 80))
        imgui.TextColored(imgui.ImVec4(1, 0.1, 0.1, 1), "НЕ УСТАНАВЛИВАЙ СКРИПТЫ БЕЗ ПРОВЕРКИ!")
        imgui.Spacing()
        imgui.TextColored(imgui.ImVec4(1, 0.4, 0.4, 1), "ТУТ МОГ БЫТЬ СТИЛЛЕР")
        imgui.TextColored(imgui.ImVec4(1, 0.7, 0.2, 1), "МИНУС ТВОЙ АККАУНТ")
        imgui.Spacing()
        imgui.Text("Ты сам это установил. Окно не закроешь.")
        
        imgui.End()
        
        window[0] = true  -- окно нельзя закрыть
    end)
end
