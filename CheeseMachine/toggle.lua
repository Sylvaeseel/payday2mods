toggle_autometh = not toggle_autometh
if toggle_autometh then
    managers.hud:show_hint({text = "Auto Mode On"})
elseif not toggle_ingredients_chat then
    managers.hud:show_hint({text = "Auto Mode Off"})
end