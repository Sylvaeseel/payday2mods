for k,v in pairs(Global.job_manager.heat) do
    managers.job:set_job_heat(k, 500)
end