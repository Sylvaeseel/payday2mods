toggle_godmode = not toggle_godmode
if toggle_godmode then
    managers.player:player_unit():character_damage():set_invulnerable( true )
    managers.hud:show_hint({text = "God Mode On"})
elseif not toggle_godmode then
    managers.player:player_unit():character_damage():set_invulnerable( false )
    managers.hud:show_hint({text = "God Mode Off"})
end