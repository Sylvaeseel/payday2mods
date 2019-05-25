
local function nukeunit(pawn)
    local col_ray = { }
    col_ray.ray = Vector3(1, 0, 0)
    col_ray.position = pawn.unit:position()
    local action_data = {}
    action_data.variant = "explosion"
    action_data.damage = 1000
    action_data.attacker_unit = managers.player:player_unit()
    action_data.col_ray = col_ray
    pawn.unit:character_damage():damage_explosion(action_data)
end

for u_key,u_data in pairs(managers.enemy:all_civilians()) do
    nukeunit(u_data)
end
for u_key,u_data in pairs(managers.enemy:all_enemies()) do
    u_data.char_tweak.has_alarm_pager = nil
    nukeunit(u_data)        
end

if isHost then 
    function GroupAIStateBase:on_successful_alarm_pager_bluff() 
    end
end

function MoneyManager.get_civilian_deduction() return 0 end

function MoneyManager.civilian_killed() return end

local killemall = {}
local id
for _,v in pairs(managers.interaction._interactive_objects) do
    if v:interaction().tweak_data == "corpse_alarm_pager" 
    or v:interaction().tweak_data == "corpse_dispose" then
        table.insert(killemall, v:interaction())
    end 
for _,v in pairs(killemall) do v:interact(managers.player:player_unit()) end
end 
showHint("ULTIMATE KILL") 
