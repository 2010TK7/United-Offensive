Hooks:Add('LocalizationManagerPostInit', 'UO_LocalizationManagerPostInit', function(loc)
	UnitedOffensive:Load()
	if UnitedOffensive.settings.UO_Lang == 2 then
		loc:load_localization_file(UnitedOffensive._path .. 'loc/zh_cn.json', false)
	else
		loc:load_localization_file(UnitedOffensive._path .. 'loc/en.json', false)
	end
end)

Hooks:Add('MenuManagerInitialize', 'UO_MenuManagerInitialize', function(menu_manager)
	MenuCallbackHandler.UOCheckOn = function(this, item)
		UnitedOffensive.settings[item:name()] = item:value() == 'on'
		UnitedOffensive:Save()
	end

	MenuCallbackHandler.UOCheckNum = function(this, item)
		UnitedOffensive.settings[item:name()] = tonumber(item:value())
		UnitedOffensive:Save()
	end

	MenuCallbackHandler.UOSave = function(this, item)
		UnitedOffensive:Save()
	end

	UnitedOffensive:Load()
	MenuHelper:LoadFromJsonFile(UnitedOffensive._path .. 'menu.json', UnitedOffensive, UnitedOffensive.settings)
end)