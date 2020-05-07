Hooks:Add('LocalizationManagerPostInit', 'UO_LocalizationManagerPostInit', function(loc)
	UnitedOffensive:Load()
	if UnitedOffensive.settings.UO_Lang == 2 then
		loc:load_localization_file(UnitedOffensive._path .. 'loc/zh_cn.txt', false)
	else
		loc:load_localization_file(UnitedOffensive._path .. 'loc/en.txt', false)
	end
end)

Hooks:Add('MenuManagerInitialize', 'UO_MenuManagerInitialize', function(menu_manager)
	MenuCallbackHandler.UOCheck = function(this, item)
		UnitedOffensive.settings[item:name()] = item:value() == 'on'
		UnitedOffensive:Save()
	end

	MenuCallbackHandler.UOLang = function(this, item)
		UnitedOffensive.settings.UO_Lang = tonumber(item:value())
		UnitedOffensive:Save()
	end

	MenuCallbackHandler.UOSpawnPO = function(this, item)
		UnitedOffensive.settings.UO_PO = tonumber(item:value())
		UnitedOffensive:Save()
	end

	MenuCallbackHandler.UOSpawnHRT = function(this, item)
		UnitedOffensive.settings.UO_HRT = tonumber(item:value())
		UnitedOffensive:Save()
	end

	MenuCallbackHandler.UOSave = function(this, item)
		UnitedOffensive:Save()
	end

	UnitedOffensive:Load()
	MenuHelper:LoadFromJsonFile(UnitedOffensive._path .. 'menu/UO_options.txt', UnitedOffensive, UnitedOffensive.settings)
	MenuHelper:LoadFromJsonFile(UnitedOffensive._path .. 'menu/AR_options.txt', UnitedOffensive, UnitedOffensive.settings)
	MenuHelper:LoadFromJsonFile(UnitedOffensive._path .. 'menu/CM_options.txt', UnitedOffensive, UnitedOffensive.settings)
end)