local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

_G.UnitedOffensive = _G.UnitedOffensive or {}
UnitedOffensive._path = ModPath
UnitedOffensive._data_path = SavePath .. 'TUO.txt'
UnitedOffensive.settings = UnitedOffensive.settings or {
	UO_Lang = 1,
	UO_mix = true,
	UO_PO = 1,
	UO_HRT = 1,
	UO_SCS = false
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

local _UO = UnitedOffensive.settings

function UnitedOffensive:group_ai(categories, difficulty_index)
	UnitedOffensive:Load()

	--UO Base start
	if difficulty_index == 8 then
		categories.FBI_swat_M4.unit_types.america = _UO.UO_SCS and {
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
			Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")
		} or {
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
			Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")
		}
		categories.FBI_swat_R870.unit_types.america = _UO.UO_SCS and {
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
			Idstring("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"),
			Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")
		} or {
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
			Idstring("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"),
			Idstring("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")
		}
		categories.FBI_heavy_G36.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
			Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
			Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy")
		}
		categories.FBI_heavy_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
			Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
			Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy")
		}
		categories.FBI_shield.unit_types.america = {
			Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"),
			Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
			Idstring("units/payday2/characters/ene_city_shield/ene_city_shield"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")
		}
		categories.CS_tazer.unit_types.america = {
			Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer")
		}
		categories.FBI_tank.unit_types.america = {
			Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
			Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
			Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic")
		}
		categories.spooc.unit_types.america = {
			Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker")
		}
	elseif difficulty_index >= 6 then
		categories.FBI_swat_M4.unit_types.america = _UO.UO_SCS and {
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
			Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
		} or {
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
			Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1")
		}
		categories.FBI_swat_R870.unit_types.america = _UO.UO_SCS and {
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
			Idstring("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"),
			Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2")
		} or {
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
			Idstring("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"),
			Idstring("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870")
		}
		categories.FBI_heavy_G36.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
			Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
			Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36")
		}
		categories.FBI_heavy_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
			Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
			Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870")
		}
		categories.FBI_shield.unit_types.america = {
			Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"),
			Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
			Idstring("units/payday2/characters/ene_city_shield/ene_city_shield")
		}
	elseif difficulty_index >= 4 then
		categories.FBI_swat_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")
		}
		categories.FBI_swat_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2")
		}
		categories.FBI_heavy_G36.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
			Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
		}
		categories.FBI_heavy_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
			Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870")
		}
		categories.FBI_shield.unit_types.america = {
			Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"),
			Idstring("units/payday2/characters/ene_shield_1/ene_shield_1")
		}
	else
		categories.FBI_swat_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")
		}
		categories.FBI_swat_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
		}
	end--america

	categories.FBI_heavy_R870.unit_types.murkywater = {Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun")}
	if difficulty_index >= 6 then
		categories.FBI_swat_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass")
		}
		categories.FBI_swat_R870.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870")
		}
		categories.FBI_heavy_G36.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
		}
		categories.FBI_heavy_R870.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
		}
		categories.FBI_shield.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg")
		}
		categories.FBI_swat_M4.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city")
		}
		categories.FBI_swat_R870.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870")
		}
		categories.FBI_heavy_G36.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36")
		}
	elseif difficulty_index >= 4 then
		categories.FBI_swat_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
		}
		categories.FBI_swat_R870.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870")
		}
		categories.FBI_heavy_G36.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
		}
		categories.FBI_heavy_R870.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
		}
		categories.FBI_shield.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg")
		}
		categories.FBI_swat_M4.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi")
		}
		categories.FBI_swat_R870.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870")
		}
		categories.FBI_heavy_G36.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36")
		}
	else
		categories.FBI_swat_M4.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
		}
		categories.FBI_swat_R870.unit_types.russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
		}
		categories.FBI_swat_M4.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
		}
		categories.FBI_swat_R870.unit_types.murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
		}
	end--russia and murkywater

	if difficulty_index >=4 then
		categories.FBI_swat_M4.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
		}
		categories.FBI_swat_R870.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2")
		}
		categories.FBI_heavy_G36.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1")
		}
		categories.FBI_heavy_R870.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870")
		}
		categories.FBI_shield.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1")
		}
	else
		categories.FBI_swat_M4.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
		}
		categories.FBI_swat_R870.unit_types.zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2")
		}
	end--zombie
	--UO Base end

	--UO Plus start
	if _UO.UO_PO ~= 1 and difficulty_index >= _UO.UO_PO then
		--Police Officer
		table.insert(categories.FBI_swat_M4.unit_types.america, Idstring("units/payday2/characters/ene_cop_2/ene_cop_2"))
		table.insert(categories.FBI_swat_R870.unit_types.america, Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"))
		table.insert(categories.FBI_swat_R870.unit_types.america, Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"))
		table.insert(categories.FBI_swat_R870.unit_types.america, Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"))
		table.insert(categories.FBI_swat_M4.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"))
		table.insert(categories.FBI_swat_M4.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"))
		table.insert(categories.FBI_swat_M4.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"))
		table.insert(categories.FBI_swat_R870.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"))
		table.insert(categories.FBI_swat_M4.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2"))
		table.insert(categories.FBI_swat_R870.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"))
		table.insert(categories.FBI_swat_R870.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"))
		table.insert(categories.FBI_swat_R870.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"))
	end
	if _UO.UO_HRT ~= 1 and difficulty_index >= _UO.UO_HRT then
		--Hostage Rescue Team
		table.insert(categories.FBI_swat_M4.unit_types.america, Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"))
		table.insert(categories.FBI_swat_M4.unit_types.america, Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"))
		table.insert(categories.FBI_swat_M4.unit_types.america, Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"))
		table.insert(categories.FBI_swat_M4.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"))
		table.insert(categories.FBI_swat_M4.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"))
		table.insert(categories.FBI_swat_M4.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"))
	end
	if _UO.UO_mix then
		for _, k in pairs({"america", "russia", "zombie", "murkywater"}) do
			for _, v in pairs(categories.FBI_swat_R870.unit_types[k]) do
				table.insert(categories.FBI_swat_M4.unit_types[k], v)
			end
			categories.FBI_swat_R870.unit_types[k] = categories.FBI_swat_M4.unit_types[k]
			for _, v in pairs(categories.FBI_heavy_R870.unit_types[k]) do
				table.insert(categories.FBI_heavy_G36.unit_types[k], v)
			end
			categories.FBI_heavy_R870.unit_types[k] = categories.FBI_heavy_G36.unit_types[k]
			for _, v in pairs(categories.medic_R870.unit_types[k]) do
				table.insert(categories.medic_M4.unit_types[k], v)
			end
			categories.medic_R870.unit_types[k] = categories.medic_M4.unit_types[k]
		end
	end
	--UO Plus end
end