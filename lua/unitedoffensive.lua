local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

_G.UnitedOffensive = _G.UnitedOffensive or {}
UnitedOffensive._path = ModPath
UnitedOffensive._data_path = SavePath .. 'TUO.txt'
UnitedOffensive.settings = UnitedOffensive.settings or {
	UO_Lang = 1,
	UO_PO = 2,
	UO_HRT = 4,
	UO_SCS = true
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