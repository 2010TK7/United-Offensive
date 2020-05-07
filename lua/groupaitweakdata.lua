local _UO = UnitedOffensive.settings

Hooks:PostHook(GroupAITweakData, "_init_unit_categories", "UO.init_unit_categories", function(self, difficulty_index)
	UO = {}
	UnitedOffensive:Load()
	UO.SWAT = {america = {}, russia = {}, zombie = {}, murkywater = {}}
	self.unit_categories.CS_swat_MP5.unit_types = UO.SWAT
	self.unit_categories.CS_swat_R870.unit_types = UO.SWAT
	self.unit_categories.CS_heavy_M4.unit_types = UO.SWAT
	self.unit_categories.CS_heavy_R870.unit_types = UO.SWAT
	self.unit_categories.CS_heavy_M4_w.unit_types = UO.SWAT
	self.unit_categories.FBI_swat_M4.unit_types = UO.SWAT
	self.unit_categories.FBI_swat_R870.unit_types = UO.SWAT
	self.unit_categories.FBI_heavy_G36.unit_types = UO.SWAT
	self.unit_categories.FBI_heavy_R870.unit_types = UO.SWAT
	self.unit_categories.FBI_heavy_G36_w.unit_types = UO.SWAT
	UO.SHIELD = deep_clone(UO.SWAT)
	if _UO.CM_Phalanx then
		self.unit_categories.CS_shield.unit_types = self.unit_categories.Phalanx_minion.unit_types
		self.unit_categories.FBI_shield.unit_types = self.unit_categories.Phalanx_minion.unit_types
	else
		self.unit_categories.CS_shield.unit_types = UO.SHIELD
		self.unit_categories.FBI_shield.unit_types = UO.SHIELD
	end
	UO.MEDIC = deep_clone(UO.SWAT)
	self.unit_categories.medic_M4.unit_types = UO.MEDIC
	self.unit_categories.medic_R870.unit_types = UO.MEDIC
	UO.TASER = deep_clone(UO.SWAT)
	self.unit_categories.CS_tazer.unit_types = UO.TASER
	UO.DOZER = deep_clone(UO.SWAT)
	self.unit_categories.FBI_tank.unit_types = UO.DOZER
	UO.CLOAKER = deep_clone(UO.SWAT)
	self.unit_categories.spooc.unit_types = UO.CLOAKER
	AR = deep_clone(UO)
	UO.zeal = {SWAT = {}, SHIELD = {}, MEDIC = {}, TASER = {}, DOZER = {}, CLOAKER = {}}

	--Swat & Shield
	table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"))
	table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"))
	table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"))
	table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"))
	table.insert(UO.SHIELD.america, Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"))
	table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"))
	table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"))
	table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"))
	table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"))
	table.insert(UO.SHIELD.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"))
	table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"))
	table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"))
	table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"))
	table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"))
	table.insert(UO.SHIELD.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"))
	table.insert(UO.SWAT.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"))
	table.insert(UO.SWAT.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"))
	table.insert(UO.SWAT.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"))
	table.insert(UO.SWAT.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"))
	table.insert(UO.SHIELD.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"))
	table.insert(UO.zeal.SWAT, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"))
	table.insert(UO.zeal.SWAT, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"))
	table.insert(UO.zeal.SWAT, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"))
	table.insert(UO.zeal.SWAT, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"))
	table.insert(UO.zeal.SHIELD, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"))
	if difficulty_index >= 4 then
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"))
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"))
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"))
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"))
		table.insert(UO.SHIELD.america, Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"))
		table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"))
		table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"))
		table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"))
		table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"))
		table.insert(UO.SHIELD.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"))
		table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"))
		table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"))
		table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"))
		table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"))
		table.insert(UO.SHIELD.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"))
		table.insert(UO.SWAT.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"))
		table.insert(UO.SWAT.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"))
		table.insert(UO.SWAT.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"))
		table.insert(UO.SWAT.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"))
	end
	if difficulty_index >= 6 then
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"))
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"))
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"))
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"))
		table.insert(UO.SHIELD.america, Idstring("units/payday2/characters/ene_city_shield/ene_city_shield"))
		table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"))
		table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"))
		table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"))
		table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"))
		table.insert(UO.SHIELD.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"))
		table.insert(UO.SWAT.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"))
		table.insert(UO.SWAT.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"))
		table.insert(UO.SWAT.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"))
		table.insert(UO.SWAT.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"))
	end

	--Medic
	table.insert(UO.MEDIC.america, Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4"))
	table.insert(UO.MEDIC.america, Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"))
	table.insert(UO.MEDIC.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"))
	table.insert(UO.MEDIC.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"))
	table.insert(UO.MEDIC.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"))
	table.insert(UO.MEDIC.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"))
	table.insert(UO.MEDIC.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"))
	table.insert(UO.MEDIC.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"))

	--Taser
	table.insert(UO.TASER.america, Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"))
	table.insert(UO.TASER.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"))
	table.insert(UO.TASER.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"))
	table.insert(UO.TASER.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"))
	table.insert(UO.zeal.TASER, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"))

	--Dozer
	table.insert(UO.DOZER.america, Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"))
	table.insert(UO.DOZER.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"))
	table.insert(UO.DOZER.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"))
	table.insert(UO.DOZER.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"))
	table.insert(UO.zeal.DOZER, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"))
	if difficulty_index >= 5 or _UO.CM_Dozer_Shot then
		table.insert(UO.DOZER.america, Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"))
		table.insert(UO.DOZER.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"))
		table.insert(UO.DOZER.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"))
		table.insert(UO.DOZER.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"))
		table.insert(UO.zeal.DOZER, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"))
	end
	if difficulty_index >= 7 or _UO.CM_Dozer_Skull then
		table.insert(UO.DOZER.america, Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"))
		table.insert(UO.DOZER.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"))
		table.insert(UO.DOZER.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"))
		table.insert(UO.DOZER.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"))
		table.insert(UO.zeal.DOZER, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"))
	end
	if difficulty_index >= 7 or _UO.CM_Dozer_Mini then
		table.insert(UO.DOZER.america, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
		table.insert(UO.DOZER.russia, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
		table.insert(UO.DOZER.zombie, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
		table.insert(UO.DOZER.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"))
		table.insert(UO.zeal.DOZER, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
	end
	if difficulty_index == 8 or _UO.CM_Dozer_Medic then
		table.insert(UO.DOZER.america, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"))
		table.insert(UO.DOZER.russia, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"))
		table.insert(UO.DOZER.zombie, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"))
		table.insert(UO.DOZER.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"))
		table.insert(UO.zeal.DOZER, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"))
	end

	--Cloaker
	table.insert(UO.CLOAKER.america, Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"))
	table.insert(UO.CLOAKER.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"))
	table.insert(UO.CLOAKER.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"))
	table.insert(UO.CLOAKER.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"))
	table.insert(UO.zeal.CLOAKER, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"))

	--Police Officer
	if _UO.UO_PO ~= 1 and difficulty_index >= _UO.UO_PO then
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"))
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_cop_2/ene_cop_2"))
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"))
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"))
		table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"))
		table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"))
		table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"))
		table.insert(UO.SWAT.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"))
		table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"))
		table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2"))
		table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"))
		table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"))
	end

	--Hostage Rescue Team
	if _UO.UO_HRT ~= 1 and difficulty_index >= _UO.UO_HRT then
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"))
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"))
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"))
		table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"))
		table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"))
		table.insert(UO.SWAT.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"))
	end

	--Special City SWAT
	if _UO.UO_SCS and difficulty_index >= 6 then
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"))
		table.insert(UO.SWAT.america, Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"))
	end

	--CM Heavy
	if _UO.CM_Heavy then
		for _, units in pairs(UO.SWAT) do
			for i, unit_id in ipairs(units) do
				for swap_id, new_id in pairs(UnitedOffensive.CMHeavy) do
					if unit_id == Idstring(swap_id) then
						units[i] = Idstring(new_id)
						break
					end
				end
			end
		end
	end

	--AR United Forces
	for k in pairs(AR) do
		for _, v in pairs(UO[k].america) do
			if _UO.AR_AA then
				table.insert(AR[k].america, v)
			end
			if _UO.AR_RA then
				table.insert(AR[k].russia, v)
			end
			if _UO.AR_ZA then
				table.insert(AR[k].zombie, v)
			end
			if _UO.AR_MA then
				table.insert(AR[k].murkywater, v)
			end
		end
		for _, v in pairs(UO[k].russia) do
			if _UO.AR_AR then
				table.insert(AR[k].america, v)
			end
			if _UO.AR_RR then
				table.insert(AR[k].russia, v)
			end
			if _UO.AR_ZR then
				table.insert(AR[k].zombie, v)
			end
			if _UO.AR_MR then
				table.insert(AR[k].murkywater, v)
			end
		end
		for _, v in pairs(UO[k].zombie) do
			if _UO.AR_AZ then
				table.insert(AR[k].america, v)
			end
			if _UO.AR_RZ then
				table.insert(AR[k].russia, v)
			end
			if _UO.AR_ZZ then
				table.insert(AR[k].zombie, v)
			end
			if _UO.AR_MZ then
				table.insert(AR[k].murkywater, v)
			end
		end
		for _, v in pairs(UO[k].murkywater) do
			if _UO.AR_AM then
				table.insert(AR[k].america, v)
			end
			if _UO.AR_RM then
				table.insert(AR[k].russia, v)
			end
			if _UO.AR_ZM then
				table.insert(AR[k].zombie, v)
			end
			if _UO.AR_MM then
				table.insert(AR[k].murkywater, v)
			end
		end
		if _UO.AR_ZEAL or difficulty_index == 8 then
			for _, v in pairs(UO.zeal[k]) do
				if _UO.AR_AO then
					table.insert(AR[k].america, v)
				end
				if _UO.AR_RO then
					table.insert(AR[k].russia, v)
				end
				if _UO.AR_ZO then
					table.insert(AR[k].zombie, v)
				end
				if _UO.AR_MO then
					table.insert(AR[k].murkywater, v)
				end
			end
		end
		UO[k].america = #AR[k].america ~= 0 and AR[k].america or UO[k].america
		UO[k].russia = #AR[k].russia ~= 0 and AR[k].russia or UO[k].russia
		UO[k].zombie = #AR[k].zombie ~= 0 and AR[k].zombie or UO[k].zombie
		UO[k].murkywater = #AR[k].murkywater ~= 0 and AR[k].murkywater or UO[k].murkywater
	end
end)