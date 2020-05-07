local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

_G.UnitedOffensive = _G.UnitedOffensive or {}
UnitedOffensive._path = ModPath
UnitedOffensive._data_path = SavePath .. 'UO_save.txt'
UnitedOffensive.settings = {
	UO_AR = false,
	UO_cops = 2,
	UO_HRT = 4,
	UO_ZEAL_Sniper = true
}

function UnitedOffensive:Save()
	local file = io.open(self._data_path, 'w+')
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

function UnitedOffensive:Load()
	local file = io.open(self._data_path, 'r')
	if file then
		for k, v in pairs(json.decode(file:read('*all')) or {}) do
			self.settings[k] = v
		end
		file:close()
	end
end

Hooks:Add('LocalizationManagerPostInit', 'UO_LocalizationManagerPostInit', function(loc)
	loc:load_localization_file(UnitedOffensive._path .. 'english.txt', false)
end)

Hooks:Add('MenuManagerInitialize', 'UO_MenuManagerInitialize', function(menu_manager)
	MenuCallbackHandler.UOSpawnCop = function(this, item)
		UnitedOffensive.settings.UO_cops = tonumber(item:value())
		UnitedOffensive:Save()
	end

	MenuCallbackHandler.UOSpawnHRT = function(this, item)
		UnitedOffensive.settings.UO_HRT = tonumber(item:value())
		UnitedOffensive:Save()
	end

	MenuCallbackHandler.UOSpawnBool = function(this, item)
		UnitedOffensive.settings[item:name()] = item:value() == 'on'
		UnitedOffensive:Save()
	end

	MenuCallbackHandler.UOSave = function(this, item)
		UnitedOffensive:Save()
	end

	UnitedOffensive:Load()
	MenuHelper:LoadFromJsonFile(UnitedOffensive._path .. 'options.txt', UnitedOffensive, UnitedOffensive.settings)
end)

local _UO = UnitedOffensive.settings

Hooks:PostHook(GroupAITweakData, "_init_unit_categories", "UO_init_unit_categories", function(self, difficulty_index)
	UO_SWAT = {america = {}, russia = {}, zombie = {}}
	SHIELDS = deep_clone(UO_SWAT)
	UnitedOffensive:Load()

	--Police Officer
	if _UO.UO_cops ~= 1 and difficulty_index >= _UO.UO_cops then
		table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"))
		table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_cop_2/ene_cop_2"))
		table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"))
		table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"))
		if _UO.UO_AR then
			table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"))
			table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"))
		else
			table.insert(UO_SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"))
			table.insert(UO_SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"))
		end
		table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"))
		table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2"))
		table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"))
		table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"))
	end

	--HRT
	if _UO.UO_HRT ~= 1 and difficulty_index >= _UO.UO_HRT then
		table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"))
		table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"))
		table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"))
		if _UO.UO_AR then
			table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"))
			table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"))
		else
			table.insert(UO_SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"))
			table.insert(UO_SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"))
		end
		table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"))
		table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"))
		table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"))
	end

	--LEVEL_1
	table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"))
	table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"))
	table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"))
	table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"))
	table.insert(SHIELDS.america, Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"))
	if _UO.UO_AR then
		table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"))
		table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"))
		table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"))
		table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"))
		table.insert(SHIELDS.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"))
	else
		table.insert(UO_SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"))
		table.insert(UO_SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"))
		table.insert(UO_SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"))
		table.insert(UO_SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"))
		table.insert(SHIELDS.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"))
	end
	table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"))
	table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"))
	table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"))
	table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"))
	table.insert(SHIELDS.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"))

	self.unit_categories.CS_swat_MP5.unit_types.america = UO_SWAT.america
	self.unit_categories.CS_swat_MP5.unit_types.russia = UO_SWAT.russia
	self.unit_categories.CS_swat_MP5.unit_types.zombie = UO_SWAT.zombie
	self.unit_categories.CS_swat_R870.unit_types.america = UO_SWAT.america
	self.unit_categories.CS_swat_R870.unit_types.russia = UO_SWAT.russia
	self.unit_categories.CS_swat_R870.unit_types.zombie = UO_SWAT.zombie
	self.unit_categories.CS_heavy_M4.unit_types.america = UO_SWAT.america
	self.unit_categories.CS_heavy_M4.unit_types.russia = UO_SWAT.russia
	self.unit_categories.CS_heavy_M4.unit_types.zombie = UO_SWAT.zombie
	self.unit_categories.CS_heavy_R870.unit_types.america = UO_SWAT.america
	self.unit_categories.CS_heavy_R870.unit_types.russia = UO_SWAT.russia
	self.unit_categories.CS_heavy_R870.unit_types.zombie = UO_SWAT.zombie
	self.unit_categories.CS_heavy_M4_w.unit_types.america = UO_SWAT.america
	self.unit_categories.CS_heavy_M4_w.unit_types.russia = UO_SWAT.russia
	self.unit_categories.CS_heavy_M4_w.unit_types.zombie = UO_SWAT.zombie
	self.unit_categories.CS_shield.unit_types.america = SHIELDS.america
	self.unit_categories.CS_shield.unit_types.russia = SHIELDS.russia
	self.unit_categories.CS_shield.unit_types.zombie = SHIELDS.zombie

	--LEVEL_2
	table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"))
	table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"))
	table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"))
	table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"))
	table.insert(SHIELDS.america, Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"))
	if _UO.UO_AR then
		table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"))
		table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"))
		table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"))
		table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"))
		table.insert(SHIELDS.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"))
	else
		table.insert(UO_SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"))
		table.insert(UO_SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"))
		table.insert(UO_SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"))
		table.insert(UO_SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"))
		table.insert(SHIELDS.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"))
	end
	table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"))
	table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"))
	table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"))
	table.insert(UO_SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"))
	table.insert(SHIELDS.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"))

	--LEVEL_3, no zombie =(
	if difficulty_index >= 6 then
		table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"))
		table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"))
		table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"))
		table.insert(UO_SWAT.america, Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"))
		table.insert(SHIELDS.america, Idstring("units/payday2/characters/ene_city_shield/ene_city_shield"))
		if _UO.UO_AR then
			table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"))
			table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"))
			table.insert(SHIELDS.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"))
		else
			table.insert(UO_SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"))
			table.insert(UO_SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"))
			table.insert(SHIELDS.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"))
		end
	end

	--LEVEL_4
	if difficulty_index == 8 then
		table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"))
		table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"))
		if _UO.UO_ZEAL_Sniper then
			table.insert(UO_SWAT.america, Idstring("units/pd2_dlc_drm/characters/ene_zeal_swat_heavy_sniper/ene_zeal_swat_heavy_sniper"))
		end
		table.insert(SHIELDS.america, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"))
		table.insert(self.unit_categories.spooc.unit_types.america, Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"))
		table.insert(self.unit_categories.CS_tazer.unit_types.america, Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"))
		table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"))
		table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"))
		table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"))
		table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"))

		self.unit_categories.CS_swat_MP5.unit_types.america = UO_SWAT.america
		self.unit_categories.CS_swat_MP5.unit_types.russia = UO_SWAT.russia
		self.unit_categories.CS_swat_MP5.unit_types.zombie = UO_SWAT.zombie
		self.unit_categories.CS_swat_R870.unit_types.america = UO_SWAT.america
		self.unit_categories.CS_swat_R870.unit_types.russia = UO_SWAT.russia
		self.unit_categories.CS_swat_R870.unit_types.zombie = UO_SWAT.zombie
		self.unit_categories.CS_heavy_M4.unit_types.america = UO_SWAT.america
		self.unit_categories.CS_heavy_M4.unit_types.russia = UO_SWAT.russia
		self.unit_categories.CS_heavy_M4.unit_types.zombie = UO_SWAT.zombie
		self.unit_categories.CS_heavy_R870.unit_types.america = UO_SWAT.america
		self.unit_categories.CS_heavy_R870.unit_types.russia = UO_SWAT.russia
		self.unit_categories.CS_heavy_R870.unit_types.zombie = UO_SWAT.zombie
		self.unit_categories.CS_heavy_M4_w.unit_types.america = UO_SWAT.america
		self.unit_categories.CS_heavy_M4_w.unit_types.russia = UO_SWAT.russia
		self.unit_categories.CS_heavy_M4_w.unit_types.zombie = UO_SWAT.zombie
		self.unit_categories.CS_shield.unit_types.america = SHIELDS.america
		self.unit_categories.CS_shield.unit_types.russia = SHIELDS.russia
		self.unit_categories.CS_shield.unit_types.zombie = SHIELDS.zombie
	end

	self.unit_categories.FBI_swat_M4.unit_types.america = UO_SWAT.america
	self.unit_categories.FBI_swat_M4.unit_types.russia = UO_SWAT.russia
	self.unit_categories.FBI_swat_M4.unit_types.zombie = UO_SWAT.zombie
	self.unit_categories.FBI_swat_R870.unit_types.america = UO_SWAT.america
	self.unit_categories.FBI_swat_R870.unit_types.russia = UO_SWAT.russia
	self.unit_categories.FBI_swat_R870.unit_types.zombie = UO_SWAT.zombie
	self.unit_categories.FBI_heavy_G36.unit_types.america = UO_SWAT.america
	self.unit_categories.FBI_heavy_G36.unit_types.russia = UO_SWAT.russia
	self.unit_categories.FBI_heavy_G36.unit_types.zombie = UO_SWAT.zombie
	self.unit_categories.FBI_heavy_R870.unit_types.america = UO_SWAT.america
	self.unit_categories.FBI_heavy_R870.unit_types.russia = UO_SWAT.russia
	self.unit_categories.FBI_heavy_R870.unit_types.zombie = UO_SWAT.zombie
	self.unit_categories.FBI_heavy_G36_w.unit_types.america = UO_SWAT.america
	self.unit_categories.FBI_heavy_G36_w.unit_types.russia = UO_SWAT.russia
	self.unit_categories.FBI_heavy_G36_w.unit_types.zombie = UO_SWAT.zombie
	self.unit_categories.FBI_shield.unit_types.america = SHIELDS.america
	self.unit_categories.FBI_shield.unit_types.russia = SHIELDS.russia
	self.unit_categories.FBI_shield.unit_types.zombie = SHIELDS.zombie

	if _UO.UO_AR then
		table.insert(self.unit_categories.spooc.unit_types.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"))
		table.insert(self.unit_categories.CS_tazer.unit_types.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"))
		table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"))
		if difficulty_index >= 5 then
			table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"))
		end
		if difficulty_index >= 7 then
			table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"))
			table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
		end
		if difficulty_index == 8 then
			table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"))
		end
		table.insert(self.unit_categories.medic_M4.unit_types.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"))
		table.insert(self.unit_categories.medic_R870.unit_types.america, Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"))

		for k, v in pairs(self.unit_categories or {}) do
			if v.unit_types and v.unit_types.america and v.unit_types.russia then
				self.unit_categories[k].unit_types.russia = v.unit_types.america
			end
		end
	end
end)