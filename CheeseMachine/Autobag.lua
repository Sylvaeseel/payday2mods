old_update = old_update or ObjectInteractionManager.update
function ObjectInteractionManager:update(t, dt)
    old_update(self, t, dt)
    
    --in-game check
    if BaseNetworkHandler and BaseNetworkHandler._gamestate_filter.any_ingame_playing[game_state_machine:last_queued_state_name()] then      
        -- Auto-bag
        for _,unit in pairs(self._interactive_units) do
            local interact = unit:interaction()
            if interact.tweak_data == "taking_meth" then

                unit:interaction():interact(managers.player:local_player())

            end
        end
    end
end