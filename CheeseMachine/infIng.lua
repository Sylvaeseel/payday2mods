function cookinteract(drugs)
	local coolers = {}
	local player = managers.player:local_player()
	if not player then return end

	if drugs == "taking_meth" then
		--ServerSpawnRatBag("meth")
		--managers.player:clear_carry()
		managers.player:add_special( { name = "caustic_soda", silent = true, amount = 1 } )
		managers.player:add_special( { name = "hydrogen_chloride", silent = true, amount = 1 } )
		managers.player:add_special( { name = "acid", silent = true, amount = 1 } )
	else
		for _,unit in pairs(managers.interaction._interactive_units) do
			local interact = unit:interaction()
			if interact.tweak_data == drugs then
				unit:interaction():interact(player)
				break
			end    
		end 
	end
end

ingcount = 0
local queue_dialog_original = DialogManager.queue_dialog
function DialogManager:queue_dialog(id, params)
	if toggle_autometh then
		if id == "pln_rt1_22" or id == "pln_rat_stage1_22" then 
			cookinteract("methlab_caustic_cooler")
			log("Soda Added")
		elseif id == "pln_rt1_20" or id == "pln_rat_stage1_20" then 
			cookinteract("methlab_bubbling")
			log("Acid Added")
		elseif id == "pln_rt1_24" or id == "pln_rat_stage1_24" then 
			cookinteract("methlab_gas_to_salt")
			log("HCl Added")
		elseif id == "pln_rt1_12" then
			ingcount = ingcount+1
			if ingcount >= 3 then 
				ingcount = 0
				cookinteract("taking_meth")
			end
		end	
	end
	return queue_dialog_original(self, id, params)
end