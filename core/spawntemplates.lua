env.info( "[JTF-1] spawntemplates" )
--------------------------------------------
--- Spawn Templates Defined in this file
--------------------------------------------
--
-- This file contains a library of templates to be used for spawn objects 
-- created for various modules and *MUST* be loaded prior to the 
-- calling module's Start() call (either in the module, or in the [module]_data.lua).
--

SPAWNTEMPLATES = {}
SPAWNTEMPLATES.traceTitle = "[JTF-1 SPAWNTEMPLATES] "
SPAWNTEMPLATES.version = "0.1"

SPAWNTEMPLATES.templates = {
	------------------------ BVR AIRCRAFT ------------------------
	["BVR_MIG23"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "CAP",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 84,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 5.5555555555556,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 531510.26758081,
					["x"] = 154464.47749365,
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 577,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 84,
				["alt_type"] = "BARO",
				["skill"] = "Random",
				["speed"] = 5.5555555555556,
				["type"] = "MiG-23MLD",
				["unitId"] = 1566,
				["psi"] = 0,
				["y"] = 531510.26758081,
				["x"] = 154464.47749365,
				["name"] = "Aerial-1-1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[2] = 
						{
							["CLSID"] = "{6980735A-44CC-4BB9-A1B5-591532F1DC69}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B0DBC591-0F52-4F7D-AD7B-51E67725FB81}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{275A2855-4A79-4B2D-B082-91EA2ADF4691}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
						}, -- end of [6]
					}, -- end of ["pylons"]
					["fuel"] = "3800",
					["flare"] = 60,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 2.6040783413585,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					["name"] = "Enfield11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "010",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 531510.26758081,
		["x"] = 154464.47749365,
		["name"] = "BVR_MIG23",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,
	}, -- end of ["BVR_MIG23"]
	["BVR_SU25"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "CAS",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 107,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 5.5555555555556,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 534989.23663351,
					["x"] = 154562.4766219,
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 578,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 107,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["skill"] = "Random",
				["speed"] = 5.5555555555556,
				["type"] = "Su-25T",
				["unitId"] = 1567,
				["psi"] = 0,
				["y"] = 534989.23663351,
				["x"] = 154562.4766219,
				["name"] = "Aerial-2-1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{D5435F26-F120-4FA3-9867-34ACE562EF1B}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{D5435F26-F120-4FA3-9867-34ACE562EF1B}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
						}, -- end of [5]
						[7] = 
						{
							["CLSID"] = "{E8D4652F-FD48-45B7-BA5B-2AE05BB5A9CF}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{D5435F26-F120-4FA3-9867-34ACE562EF1B}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{D5435F26-F120-4FA3-9867-34ACE562EF1B}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{637334E4-AB5A-47C0-83A6-51B7F1DF3CD5}",
						}, -- end of [10]
						[11] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [11]
					}, -- end of ["pylons"]
					["fuel"] = "3790",
					["flare"] = 128,
					["chaff"] = 128,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 2.6040783413585,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 1,
					["name"] = "Springfield11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "011",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 534989.23663351,
		["x"] = 154562.4766219,
		["name"] = "BVR_SU25",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 124,
	}, -- end of ["BVR_SU25"]
	["BVR_MIG29A"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "CAP",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 112,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 5.5555555555556,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 540071.18145709,
					["x"] = 154817.69397565,
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 579,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 112,
				["alt_type"] = "BARO",
				["skill"] = "Random",
				["speed"] = 5.5555555555556,
				["type"] = "MiG-29A",
				["unitId"] = 1568,
				["psi"] = 0,
				["y"] = 540071.18145709,
				["x"] = 154817.69397565,
				["name"] = "Aerial-3-1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
						}, -- end of [7]
					}, -- end of ["pylons"]
					["fuel"] = "3376",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 2.6040216030156,
				["callsign"] = 
				{
					[1] = 3,
					[2] = 1,
					["name"] = "Uzi11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "012",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 540071.18145709,
		["x"] = 154817.69397565,
		["name"] = "BVR_MIG29A",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 124,
	}, -- end of ["BVR_MIG29A"]
	["BVR_SU27"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "CAP",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 95,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 5.5555555555556,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 546218.38317547,
					["x"] = 154400.21235032,
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 580,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 95,
				["alt_type"] = "BARO",
				["skill"] = "Random",
				["speed"] = 5.5555555555556,
				["type"] = "Su-27",
				["unitId"] = 1569,
				["psi"] = 0,
				["y"] = 546218.38317547,
				["x"] = 154400.21235032,
				["name"] = "Aerial-4-1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
						}, -- end of [10]
					}, -- end of ["pylons"]
					["fuel"] = 5590.18,
					["flare"] = 96,
					["chaff"] = 96,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 2.615711114444,
				["callsign"] = 
				{
					[1] = 4,
					[2] = 1,
					["name"] = "Colt11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "013",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 546218.38317547,
		["x"] = 154400.21235032,
		["name"] = "BVR_SU27",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 127.5,
	}, -- end of ["BVR_SU27"]
	["BVR_F4"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "CAP",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 85,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 5.5555555555556,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 550833.11560466,
					["x"] = 154539.36809252,
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 581,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 85,
				["alt_type"] = "BARO",
				["skill"] = "Random",
				["speed"] = 5.5555555555556,
				["type"] = "F-4E",
				["unitId"] = 1570,
				["psi"] = 0,
				["y"] = 550833.11560466,
				["x"] = 154539.36809252,
				["name"] = "Aerial-5-1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [4]
						[6] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{9DDF5297-94B9-42FC-A45E-6E316121CD85}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{7B4B122D-C12C-4DB4-834E-4D8BB4D863A8}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = "4864",
					["flare"] = 30,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 2.6231431729977,
				["callsign"] = 
				{
					[1] = 5,
					[2] = 1,
					["name"] = "Dodge11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "014",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 550833.11560466,
		["x"] = 154539.36809252,
		["name"] = "BVR_F4",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,
	}, -- end of ["BVR_F4"]
	["BVR_F16"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "CAP",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 124.89419889801,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 220.97222222222,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["key"] = "CAP",
									["id"] = "EngageTargets",
									["number"] = 1,
									["auto"] = true,
									["params"] = 
									{
										["targetTypes"] = 
										{
											[1] = "Air",
										}, -- end of ["targetTypes"]
										["priority"] = 0,
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 17,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 4,
												["name"] = 18,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 4,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 19,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
								[5] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 5,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["targetTypes"] = 
												{
												}, -- end of ["targetTypes"]
												["name"] = 21,
												["value"] = "none;",
												["noTargetTypes"] = 
												{
													[1] = "Fighters",
													[2] = "Multirole fighters",
													[3] = "Bombers",
													[4] = "Helicopters",
													[5] = "UAVs",
													[6] = "Infantry",
													[7] = "Fortifications",
													[8] = "Tanks",
													[9] = "IFV",
													[10] = "APC",
													[11] = "Artillery",
													[12] = "Unarmed vehicles",
													[13] = "AAA",
													[14] = "SR SAM",
													[15] = "MR SAM",
													[16] = "LR SAM",
													[17] = "Aircraft Carriers",
													[18] = "Cruisers",
													[19] = "Destroyers",
													[20] = "Frigates",
													[21] = "Corvettes",
													[22] = "Light armed ships",
													[23] = "Unarmed ships",
													[24] = "Submarines",
													[25] = "Cruise missiles",
													[26] = "Antiship Missiles",
													[27] = "AA Missiles",
													[28] = "AG Missiles",
													[29] = "SA Missiles",
												}, -- end of ["noTargetTypes"]
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [5]
								[6] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 6,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 29,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [6]
								[7] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 7,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [7]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 523278.34080823,
					["x"] = 154709.47531426,
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 676,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 124.89419889801,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "18th agrs splinter",
				["skill"] = "Random",
				["speed"] = 220.97222222222,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-16C_50",
				["unitId"] = 1777,
				["psi"] = 0,
				["y"] = 523278.34080823,
				["x"] = 154709.47531426,
				["name"] = "BVR_F16-1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "ALQ_184_Long",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 2.6040783413585,
				["callsign"] = 
				{
					[1] = 6,
					[2] = 1,
					["name"] = "Ford11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "015",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 523278.34080823,
		["x"] = 154709.47531426,
		["name"] = "BVR_F16",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 305,
	}, -- end of ["BVR_F16"]
    ["BVR_F18"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "CAP",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 124.89419889801,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 179.86111111111,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["key"] = "CAP",
									["id"] = "EngageTargets",
									["number"] = 1,
									["auto"] = true,
									["params"] = 
									{
										["targetTypes"] = 
										{
											[1] = "Air",
										}, -- end of ["targetTypes"]
										["priority"] = 0,
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 17,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 4,
												["name"] = 18,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 4,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 19,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
								[5] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 5,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["targetTypes"] = 
												{
												}, -- end of ["targetTypes"]
												["name"] = 21,
												["value"] = "none;",
												["noTargetTypes"] = 
												{
													[1] = "Fighters",
													[2] = "Multirole fighters",
													[3] = "Bombers",
													[4] = "Helicopters",
													[5] = "UAVs",
													[6] = "Infantry",
													[7] = "Fortifications",
													[8] = "Tanks",
													[9] = "IFV",
													[10] = "APC",
													[11] = "Artillery",
													[12] = "Unarmed vehicles",
													[13] = "AAA",
													[14] = "SR SAM",
													[15] = "MR SAM",
													[16] = "LR SAM",
													[17] = "Aircraft Carriers",
													[18] = "Cruisers",
													[19] = "Destroyers",
													[20] = "Frigates",
													[21] = "Corvettes",
													[22] = "Light armed ships",
													[23] = "Unarmed ships",
													[24] = "Submarines",
													[25] = "Cruise missiles",
													[26] = "Antiship Missiles",
													[27] = "AA Missiles",
													[28] = "AG Missiles",
													[29] = "SA Missiles",
												}, -- end of ["noTargetTypes"]
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [5]
								[6] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 6,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 30,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [6]
								[7] = 
								{
									["number"] = 7,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [7]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 527394.30419452,
					["x"] = 154758.47487839,
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 677,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 124.89419889801,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "nawdc black",
				["skill"] = "Random",
				["speed"] = 179.86111111111,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "FA-18C_hornet",
				["unitId"] = 1778,
				["psi"] = 0,
				["dataCartridge"] = 
				{
					["GroupsPoints"] = 
					{
						["PB"] = 
						{
						}, -- end of ["PB"]
						["Sequence 2 Red"] = 
						{
						}, -- end of ["Sequence 2 Red"]
						["Sequence 3 Yellow"] = 
						{
						}, -- end of ["Sequence 3 Yellow"]
						["Sequence 1 Blue"] = 
						{
						}, -- end of ["Sequence 1 Blue"]
						["Start Location"] = 
						{
						}, -- end of ["Start Location"]
						["A/A Waypoint"] = 
						{
						}, -- end of ["A/A Waypoint"]
						["PP"] = 
						{
						}, -- end of ["PP"]
						["Initial Point"] = 
						{
						}, -- end of ["Initial Point"]
					}, -- end of ["GroupsPoints"]
					["Points"] = 
					{
					}, -- end of ["Points"]
				}, -- end of ["dataCartridge"]
				["y"] = 527394.30419452,
				["x"] = 154758.47487839,
				["name"] = "BVR_F18-1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{LAU-115 - AIM-7M}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{FPU_8A_FUEL_TANK}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{FPU_8A_FUEL_TANK}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{LAU-115 - AIM-7M}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = 4900,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 2.6040783413585,
				["callsign"] = 
				{
					[1] = 7,
					[2] = 1,
					["name"] = "Chevy11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "016",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 527394.30419452,
		["x"] = 154758.47487839,
		["name"] = "BVR_F18_X",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 305,
	},	 -- end of ["BVR_F18"]
	------------------------ CAS AIRCRAFT ------------------------
	["CAS_MQ9"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "CAS",
		["uncontrolled"] = false,
		["taskSelected"] = true,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 2000,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 82.222222222222,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetUnlimitedFuel",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["key"] = "CAS",
									["id"] = "EngageTargets",
									["enabled"] = true,
									["auto"] = true,
									["params"] = 
									{
										["targetTypes"] = 
										{
											[1] = "Helicopters",
											[2] = "Ground Units",
											[3] = "Light armed ships",
										}, -- end of ["targetTypes"]
										["priority"] = 0,
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 2,
												["name"] = 1,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["number"] = 4,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 1,
												["name"] = 3,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
								[5] = 
								{
									["number"] = 5,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["variantIndex"] = 2,
												["name"] = 5,
												["formationIndex"] = 2,
												["value"] = 131074,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [5]
								[6] = 
								{
									["number"] = 6,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 15,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [6]
								[7] = 
								{
									["number"] = 7,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["targetTypes"] = 
												{
												}, -- end of ["targetTypes"]
												["name"] = 21,
												["value"] = "none;",
												["noTargetTypes"] = 
												{
													[1] = "Fighters",
													[2] = "Multirole fighters",
													[3] = "Bombers",
													[4] = "Helicopters",
													[5] = "UAVs",
													[6] = "Infantry",
													[7] = "Fortifications",
													[8] = "Tanks",
													[9] = "IFV",
													[10] = "APC",
													[11] = "Artillery",
													[12] = "Unarmed vehicles",
													[13] = "AAA",
													[14] = "SR SAM",
													[15] = "MR SAM",
													[16] = "LR SAM",
													[17] = "Aircraft Carriers",
													[18] = "Cruisers",
													[19] = "Destroyers",
													[20] = "Frigates",
													[21] = "Corvettes",
													[22] = "Light armed ships",
													[23] = "Unarmed ships",
													[24] = "Submarines",
													[25] = "Cruise missiles",
													[26] = "Antiship Missiles",
													[27] = "AA Missiles",
													[28] = "AG Missiles",
													[29] = "SA Missiles",
												}, -- end of ["noTargetTypes"]
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [7]
								[8] = 
								{
									["number"] = 8,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 19,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [8]
								[9] = 
								{
									["number"] = 9,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 1,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [9]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 378428.12563875,
					["x"] = -11230.450562956,
					["speed_locked"] = true,
					["formation_template"] = "",
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 319,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["skill"] = "High",
				["speed"] = 82.222222222222,
				["type"] = "MQ-9 Reaper",
				["unitId"] = 3086,
				["psi"] = 0,
				["onboard_num"] = "010",
				["y"] = 378428.12563875,
				["x"] = -11230.450562956,
				["name"] = "_MQ9",
				["payload"] = 
				{
					["pylons"] = 
					{
						[2] = 
						{
							["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
						}, -- end of [3]
					}, -- end of ["pylons"]
					["fuel"] = 1300,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = -1.8785757343974,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					["name"] = "Enfield11",
					[3] = 1,
				}, -- end of ["callsign"]
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 378428.12563875,
		["x"] = -11230.450562956,
		["name"] = "_MQ9",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 305,
	}, -- end of ["BVR_MQ9"]
	["CAS_WINGLOON"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "CAS",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 2000,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 61.666666666667,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetUnlimitedFuel",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["key"] = "CAS",
									["id"] = "EngageTargets",
									["enabled"] = true,
									["auto"] = true,
									["params"] = 
									{
										["targetTypes"] = 
										{
											[1] = "Helicopters",
											[2] = "Ground Units",
											[3] = "Light armed ships",
										}, -- end of ["targetTypes"]
										["priority"] = 0,
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 2,
												["name"] = 1,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["number"] = 4,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 1,
												["name"] = 3,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
								[5] = 
								{
									["number"] = 5,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["variantIndex"] = 2,
												["name"] = 5,
												["formationIndex"] = 2,
												["value"] = 131074,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [5]
								[6] = 
								{
									["number"] = 6,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 15,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [6]
								[7] = 
								{
									["number"] = 7,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["targetTypes"] = 
												{
												}, -- end of ["targetTypes"]
												["name"] = 21,
												["value"] = "none;",
												["noTargetTypes"] = 
												{
													[1] = "Fighters",
													[2] = "Multirole fighters",
													[3] = "Bombers",
													[4] = "Helicopters",
													[5] = "UAVs",
													[6] = "Infantry",
													[7] = "Fortifications",
													[8] = "Tanks",
													[9] = "IFV",
													[10] = "APC",
													[11] = "Artillery",
													[12] = "Unarmed vehicles",
													[13] = "AAA",
													[14] = "SR SAM",
													[15] = "MR SAM",
													[16] = "LR SAM",
													[17] = "Aircraft Carriers",
													[18] = "Cruisers",
													[19] = "Destroyers",
													[20] = "Frigates",
													[21] = "Corvettes",
													[22] = "Light armed ships",
													[23] = "Unarmed ships",
													[24] = "Submarines",
													[25] = "Cruise missiles",
													[26] = "Antiship Missiles",
													[27] = "AA Missiles",
													[28] = "AG Missiles",
													[29] = "SA Missiles",
												}, -- end of ["noTargetTypes"]
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [7]
								[8] = 
								{
									["number"] = 8,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 19,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [8]
								[9] = 
								{
									["number"] = 9,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 2,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [9]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 374191.87334164,
					["x"] = -10920.480882679,
					["speed_locked"] = true,
					["formation_template"] = "",
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 320,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "plaaf",
				["skill"] = "High",
				["speed"] = 61.666666666667,
				["type"] = "WingLoong-I",
				["unitId"] = 3087,
				["psi"] = 0,
				["onboard_num"] = "010",
				["y"] = 374191.87334164,
				["x"] = -10920.480882679,
				["name"] = "wingloon",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "DIS_AKD-10",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "DIS_AKD-10",
						}, -- end of [2]
					}, -- end of ["pylons"]
					["fuel"] = 400,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 100,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 374191.87334164,
		["x"] = -10920.480882679,
		["name"] = "wingloon",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 305,
	}, -- end of ["BVR_WINGLOON"]
    ------------------------ SEAD AIRCRAFT------------------------
	["SEAD_F16"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "SEAD",
		["uncontrolled"] = false,
		["taskSelected"] = true,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 124.89419889801,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 220.97222222222,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["key"] = "SEAD",
									["id"] = "EngageTargets",
									["enabled"] = true,
									["auto"] = true,
									["params"] = 
									{
										["targetTypes"] = 
										{
											[1] = "Air Defence",
										}, -- end of ["targetTypes"]
										["priority"] = 0,
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 2,
												["name"] = 1,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 2,
												["name"] = 13,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["number"] = 4,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 19,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
								[5] = 
								{
									["number"] = 5,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["targetTypes"] = 
												{
													[1] = "Air Defence",
												}, -- end of ["targetTypes"]
												["name"] = 21,
												["value"] = "Air Defence;",
												["noTargetTypes"] = 
												{
													[1] = "Fighters",
													[2] = "Multirole fighters",
													[3] = "Bombers",
													[4] = "Helicopters",
													[5] = "UAVs",
													[6] = "Infantry",
													[7] = "Fortifications",
													[8] = "Tanks",
													[9] = "IFV",
													[10] = "APC",
													[11] = "Artillery",
													[12] = "Unarmed vehicles",
													[13] = "Aircraft Carriers",
													[14] = "Cruisers",
													[15] = "Destroyers",
													[16] = "Frigates",
													[17] = "Corvettes",
													[18] = "Light armed ships",
													[19] = "Unarmed ships",
													[20] = "Submarines",
													[21] = "Cruise missiles",
													[22] = "Antiship Missiles",
													[23] = "AA Missiles",
													[24] = "AG Missiles",
													[25] = "SA Missiles",
												}, -- end of ["noTargetTypes"]
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [5]
								[6] = 
								{
									["number"] = 6,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 31,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [6]
								[7] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 7,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [7]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 523033.34298762,
					["x"] = 159609.43172652,
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 678,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 124.89419889801,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "IAF 101st squadron",
				["skill"] = "Random",
				["speed"] = 220.97222222222,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "F-16C_50",
				["unitId"] = 1779,
				["psi"] = 0,
				["y"] = 523033.34298762,
				["x"] = 159609.43172652,
				["name"] = "SEAD_F16-1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "ALQ_184_Long",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [9]
						[10] = 
						{
							["CLSID"] = "{AN_ASQ_213}",
						}, -- end of [10]
						[11] = 
						{
							["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
						}, -- end of [11]
					}, -- end of ["pylons"]
					["fuel"] = 3249,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 2.6040783413585,
				["callsign"] = 
				{
					[1] = 8,
					[2] = 1,
					["name"] = "Pontiac11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "017",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 523033.34298762,
		["x"] = 159609.43172652,
		["name"] = "SEAD_F16",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 305,
	}, -- end of ["SEAD_F16"]
	["SEAD_F18"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "SEAD",
		["uncontrolled"] = false,
		["taskSelected"] = true,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 151.17015748595,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 179.86111111111,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["key"] = "SEAD",
									["id"] = "EngageTargets",
									["number"] = 1,
									["auto"] = true,
									["params"] = 
									{
										["targetTypes"] = 
										{
											[1] = "Air Defence",
										}, -- end of ["targetTypes"]
										["priority"] = 0,
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 2,
												["name"] = 1,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 2,
												["name"] = 13,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 4,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 19,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
								[5] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 5,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["targetTypes"] = 
												{
													[1] = "Air Defence",
												}, -- end of ["targetTypes"]
												["name"] = 21,
												["value"] = "Air Defence;",
												["noTargetTypes"] = 
												{
													[1] = "Fighters",
													[2] = "Multirole fighters",
													[3] = "Bombers",
													[4] = "Helicopters",
													[5] = "UAVs",
													[6] = "Infantry",
													[7] = "Fortifications",
													[8] = "Tanks",
													[9] = "IFV",
													[10] = "APC",
													[11] = "Artillery",
													[12] = "Unarmed vehicles",
													[13] = "Aircraft Carriers",
													[14] = "Cruisers",
													[15] = "Destroyers",
													[16] = "Frigates",
													[17] = "Corvettes",
													[18] = "Light armed ships",
													[19] = "Unarmed ships",
													[20] = "Submarines",
													[21] = "Cruise missiles",
													[22] = "Antiship Missiles",
													[23] = "AA Missiles",
													[24] = "AG Missiles",
													[25] = "SA Missiles",
												}, -- end of ["noTargetTypes"]
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [5]
								[6] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 6,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 32,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [6]
								[7] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 7,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [7]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 527051.30724566,
					["x"] = 159560.4321624,
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 679,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 151.17015748595,
				["hardpoint_racks"] = true,
				["alt_type"] = "BARO",
				["livery_id"] = "nawdc black",
				["skill"] = "Random",
				["speed"] = 179.86111111111,
				["AddPropAircraft"] = 
				{
				}, -- end of ["AddPropAircraft"]
				["type"] = "FA-18C_hornet",
				["unitId"] = 1780,
				["psi"] = 0,
				["y"] = 527051.30724566,
				["x"] = 159560.4321624,
				["name"] = "SEAD_F18-1",
				["payload"] = 
				{
					["pylons"] = 
					{
						[1] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [1]
						[2] = 
						{
							["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
						}, -- end of [2]
						[3] = 
						{
							["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
						}, -- end of [3]
						[4] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [4]
						[5] = 
						{
							["CLSID"] = "{FPU_8A_FUEL_TANK}",
						}, -- end of [5]
						[6] = 
						{
							["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
						}, -- end of [6]
						[7] = 
						{
							["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
						}, -- end of [7]
						[8] = 
						{
							["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
						}, -- end of [8]
						[9] = 
						{
							["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
						}, -- end of [9]
					}, -- end of ["pylons"]
					["fuel"] = 4900,
					["flare"] = 60,
					["ammo_type"] = 1,
					["chaff"] = 60,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 2.6040783413585,
				["callsign"] = 
				{
					[1] = 9,
					[2] = 1,
					["name"] = "Hornet11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "018",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 527051.30724566,
		["x"] = 159560.4321624,
		["name"] = "SEAD_F18",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 305,
	}, -- end of ["SEAD_F18"]
	--------------------SUPPORT AIRCRAFT---------------------
	["KC-135"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "Refueling",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 2000,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 220.97222222222,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetUnlimitedFuel",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetInvisible",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = true,
									["id"] = "Tanker",
									["enabled"] = true,
									["params"] = 
									{
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["number"] = 4,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "ActivateBeacon",
											["params"] = 
											{
												["type"] = 4,
												["AA"] = false,
												["callsign"] = "TKR",
												["system"] = 4,
												["channel"] = 1,
												["modeChannel"] = "X",
												["bearing"] = true,
												["frequency"] = 962000000,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
								[5] = 
								{
									["number"] = 5,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 1,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [5]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = -8563.6832781353,
					["x"] = -395281.46534495,
					["speed_locked"] = true,
					["formation_template"] = "",
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 1,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2000,
				["alt_type"] = "BARO",
				["livery_id"] = "Standard USAF",
				["skill"] = "High",
				["speed"] = 220.97222222222,
				["AddPropAircraft"] = 
				{
					["VoiceCallsignLabel"] = "TO",
					["VoiceCallsignNumber"] = "11",
					["STN_L16"] = "07101",
				}, -- end of ["AddPropAircraft"]
				["type"] = "KC-135",
				["unitId"] = 1,
				["psi"] = 0,
				["onboard_num"] = "010",
				["y"] = -8563.6832781353,
				["x"] = -395281.46534495,
				["name"] = "KC-135-1",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 90700,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					["name"] = "Texaco11",
					[3] = 1,
				}, -- end of ["callsign"]
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = -8563.6832781353,
		["x"] = -395281.46534495,
		["name"] = "KC-135",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,
	}, -- end of [KC-135]
	["KC-135MPRS"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = true,
		["task"] = "Refueling",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 6096,
					["action"] = "Fly Over Point",
					["alt_type"] = "BARO",
					["speed"] = 164.44444444444,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "Tanker",
									["number"] = 1,
									["params"] = 
									{
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "ActivateBeacon",
											["params"] = 
											{
												["type"] = 4,
												["AA"] = false,
												["callsign"] = "RTB",
												["modeChannel"] = "Y",
												["channel"] = 60,
												["system"] = 5,
												["unitId"] = 20565,
												["bearing"] = true,
												["frequency"] = 1147000000,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetInvisible",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["number"] = 4,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 6,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = -87560.730212787,
					["x"] = -129296.58141675,
					["name"] = "",
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 1,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 6096,
				["alt_type"] = "BARO",
				["livery_id"] = "22nd ARW",
				["skill"] = "Excellent",
				["speed"] = 164.44444444444,
				["type"] = "KC135MPRS",
				["unitId"] = 1,
				["psi"] = 1.0660373467781,
				["y"] = -87560.730212787,
				["x"] = -129296.58141675,
				["name"] = "KC-135MPRS",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 90700,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = -1.0660373467782,
				["callsign"] = 
				{
					[1] = 3,
					[2] = 1,
					["name"] = "Shell11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "089",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = -87560.730212787,
		["x"] = -129296.58141675,
		["name"] = "KC-135MPRS",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,
	}, -- end of [KC-135MPRS]
	["KC-130"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = true,
		["task"] = "Refueling",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 2438.4,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 172.5,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = true,
									["id"] = "Tanker",
									["enabled"] = true,
									["params"] = 
									{
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "ActivateBeacon",
											["params"] = 
											{
												["type"] = 4,
												["AA"] = false,
												["unitId"] = 16683,
												["modeChannel"] = "Y",
												["channel"] = 60,
												["system"] = 5,
												["callsign"] = "ARC",
												["bearing"] = true,
												["frequency"] = 1147000000,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetInvisible",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = -11585.313345172,
					["x"] = -399323.02717468,
					["name"] = "",
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 2447,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2438.4,
				["alt_type"] = "BARO",
				["livery_id"] = "default",
				["skill"] = "Excellent",
				["speed"] = 172.5,
				["type"] = "KC130",
				["unitId"] = 16683,
				["psi"] = 1.4236457627903,
				["y"] = -11585.313345172,
				["x"] = -399323.02717468,
				["name"] = "KC-130",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 30000,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = -1.4236457627903,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 1,
					["name"] = "Arco11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "139",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = -11585.313345172,
		["x"] = -399323.02717468,
		["name"] = "KC-130",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,		
	}, -- end of ["KC-130"]
	["AWACS-E3A"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = true,
		["task"] = "AWACS",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 6096,
					["action"] = "Fly Over Point",
					["alt_type"] = "BARO",
					["speed"] = 164.44444444444,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = true,
									["id"] = "AWACS",
									["enabled"] = true,
									["params"] = 
									{
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetInvisible",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 46,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = -88627.624510964,
					["x"] = -129296.58141675,
					["name"] = "",
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 17446,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 6096,
				["alt_type"] = "BARO",
				["livery_id"] = "nato",
				["skill"] = "Excellent",
				["speed"] = 164.44444444444,
				["type"] = "E-3A",
				["unitId"] = 20566,
				["psi"] = 1.1124120783257,
				["y"] = -88627.624510964,
				["x"] = -129296.58141675,
				["name"] = "AWACS-E3A",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 65000,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = -1.1124120783257,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					["name"] = "Overlord11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "090",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = -88627.624510964,
		["x"] = -129296.58141675,
		["name"] = "AWACS-E3A",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,
	}, -- end of [AWACS-E3A]
  	["AWACS-E2D"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = true,
		["task"] = "AWACS",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 9144,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 133.61111111111,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "AWACS",
									["number"] = 1,
									["params"] = 
									{
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 38,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetInvisible",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = -12187.736469214,
					["x"] = -399320.85899169,
					["name"] = "",
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 2452,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 9144,
				["alt_type"] = "BARO",
				["livery_id"] = "E-2D Demo",
				["skill"] = "High",
				["speed"] = 133.61111111111,
				["type"] = "E-2C",
				["unitId"] = 16697,
				["psi"] = 1.3887207292845,
				["y"] = -12187.736469214,
				["x"] = -399320.85899169,
				["name"] = "AWACS-E2D-1",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "5624",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = -1.3887207292845,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					["name"] = "Overlord11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "143",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = -12187.736469214,
		["x"] = -399320.85899169,
		["name"] = "AWACS-E2D",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,		
	}, -- end of ["AWACS-E2D"]
	["AWACS-A50"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "AWACS",
		["uncontrolled"] = false,
		["taskSelected"] = true,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 10972.8,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 220.97222222222,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "AWACS",
									["number"] = 1,
									["params"] = 
									{
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetInvisible",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 1,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 4,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = false,
												["name"] = 19,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 315953.41096792,
					["x"] = 63905.857563882,
					["name"] = "",
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 588,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 10972.8,
				["alt_type"] = "BARO",
				["livery_id"] = "RF Air Force new",
				["skill"] = "High",
				["speed"] = 220.97222222222,
				["AddPropAircraft"] = 
				{
					["PropellorType"] = 0,
					["SoloFlight"] = false,
				}, -- end of ["AddPropAircraft"]
				["type"] = "A-50",
				["unitId"] = 1595,
				["psi"] = -1.7947587772958,
				["y"] = 315953.41096792,
				["x"] = 63905.857563882,
				["name"] = "RED_AWACS",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "70000",
					["flare"] = 192,
					["chaff"] = 192,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 1.7947587772958,
				["callsign"] = 666,
				["onboard_num"] = "027",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 315953.41096792,
		["x"] = 63905.857563882,
		["name"] = "RED_AWACS",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,
	}, -- end of ["AWACS-RED"]
	["S3BTANKER"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "Refueling",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 1828.8,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 141.31944444444,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = true,
									["id"] = "Tanker",
									["enabled"] = true,
									["params"] = 
									{
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "ActivateBeacon",
											["params"] = 
											{
												["type"] = 4,
												["AA"] = false,
												["callsign"] = "TKR",
												["system"] = 4,
												["channel"] = 1,
												["modeChannel"] = "X",
												["bearing"] = true,
												["frequency"] = 962000000,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetInvisible",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 606748.96393416,
					["x"] = -358539.84033849,
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 1,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 1828.8,
				["alt_type"] = "BARO",
				["livery_id"] = "usaf standard",
				["skill"] = "High",
				["speed"] = 141.31944444444,
				["type"] = "S-3B Tanker",
				["unitId"] = 1,
				["psi"] = 0,
				["y"] = 606748.96393416,
				["x"] = -358539.84033849,
				["name"] = "Aerial-1-1",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "7813",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					["name"] = "Texaco11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "010",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 606748.96393416,
		["x"] = -358539.84033849,
		["name"] = "S3BTANKER",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,
	}, -- end of ["S3BTANKER"]
	------------------------ SAM ------------------------
	["SA2"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 30,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 570781.83160836,
					["x"] = 153693.01667557,
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 2,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 573,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "SNR_75V",
				["unitId"] = 1537,
				["y"] = 570781.83160836,
				["x"] = 153693.01667557,
				["name"] = "SA2-1",
				["heading"] = 0.0038885041518015,
				["playerCanDrive"] = false,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S_75M_Volhov",
				["unitId"] = 1538,
				["y"] = 570734.73491097,
				["x"] = 153772.11573734,
				["name"] = "SA2-2",
				["heading"] = 5.4803338512622,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S_75M_Volhov",
				["unitId"] = 1539,
				["y"] = 570888.63214085,
				["x"] = 153693.23488244,
				["name"] = "SA2-3",
				["heading"] = 1.535889741755,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S_75M_Volhov",
				["unitId"] = 1540,
				["y"] = 570683.58738257,
				["x"] = 153691.1889813,
				["name"] = "SA2-4",
				["heading"] = 4.6774823953448,
				["playerCanDrive"] = false,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S_75M_Volhov",
				["unitId"] = 1541,
				["y"] = 570734.96223331,
				["x"] = 153607.76167943,
				["name"] = "SA2-5",
				["heading"] = 3.8048177693476,
				["playerCanDrive"] = false,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S_75M_Volhov",
				["unitId"] = 1542,
				["y"] = 570839.75783594,
				["x"] = 153605.2611336,
				["name"] = "SA2-6",
				["heading"] = 2.3561944901923,
				["playerCanDrive"] = false,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S_75M_Volhov",
				["unitId"] = 1543,
				["y"] = 570836.12067836,
				["x"] = 153773.70699378,
				["name"] = "SA2-7",
				["heading"] = 0.92502450355699,
				["playerCanDrive"] = false,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ZIL-131 KUNG",
				["unitId"] = 1544,
				["y"] = 570826.46777346,
				["x"] = 153722.97334767,
				["name"] = "SA2-8",
				["heading"] = 4.1713369122664,
				["playerCanDrive"] = false,
			}, -- end of [8]
			[9] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ZIL-131 KUNG",
				["unitId"] = 1545,
				["y"] = 570829.72075048,
				["x"] = 153718.14362543,
				["name"] = "SA2-9",
				["heading"] = 4.1713369122664,
				["playerCanDrive"] = false,
			}, -- end of [9]
			[10] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "p-19 s-125 sr",
				["unitId"] = 1546,
				["y"] = 570947.4874583,
				["x"] = 153631.87417734,
				["name"] = "SA2-10",
				["heading"] = 2.2165681500328,
				["playerCanDrive"] = false,
			}, -- end of [10]
			[11] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Ural-4320 APA-5D",
				["unitId"] = 1547,
				["y"] = 570946.21636909,
				["x"] = 153643.07562982,
				["name"] = "SA2-11",
				["heading"] = 0.68067840827779,
				["playerCanDrive"] = false,
			}, -- end of [11]
			[12] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ATMZ-5",
				["unitId"] = 1548,
				["y"] = 570610.66947625,
				["x"] = 153574.73104242,
				["name"] = "SA2-12",
				["heading"] = 0.87266462599716,
				["playerCanDrive"] = false,
			}, -- end of [12]
			[13] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ATMZ-5",
				["unitId"] = 1549,
				["y"] = 570630.57256833,
				["x"] = 153555.65724584,
				["name"] = "SA2-13",
				["heading"] = 1.0297442586767,
				["playerCanDrive"] = false,
			}, -- end of [13]
			[14] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Ural-4320T",
				["unitId"] = 1550,
				["y"] = 570696.9162086,
				["x"] = 153524.97331222,
				["name"] = "SA2-14",
				["heading"] = 5.4279739737024,
				["playerCanDrive"] = false,
			}, -- end of [14]
			[15] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Ural-4320T",
				["unitId"] = 1551,
				["y"] = 570711.01423216,
				["x"] = 153541.55922228,
				["name"] = "SA2-15",
				["heading"] = 5.3407075111026,
				["playerCanDrive"] = false,
			}, -- end of [15]
		}, -- end of ["units"]
		["y"] = 570781.83160836,
		["x"] = 153693.01667557,
		["name"] = "SA2_X",
		["start_time"] = 0,
	}, -- end of ["SA2"]	
	["SA3"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 35,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 573114.92135768,
					["x"] = 153604.67378327,
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 2,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 574,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "snr s-125 tr",
				["unitId"] = 1552,
				["y"] = 573114.92135768,
				["x"] = 153604.67378327,
				["name"] = "SA6-1-12",
				["heading"] = 6.2641478001644,
				["playerCanDrive"] = false,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "5p73 s-125 ln",
				["unitId"] = 1553,
				["y"] = 573135.33272216,
				["x"] = 153550.27823879,
				["name"] = "SA6-1-13",
				["heading"] = 3.1590459461097,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "5p73 s-125 ln",
				["unitId"] = 1554,
				["y"] = 573099.80572107,
				["x"] = 153549.0222337,
				["name"] = "SA6-1-14",
				["heading"] = 3.1590459461097,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "5p73 s-125 ln",
				["unitId"] = 1555,
				["y"] = 573153.45508131,
				["x"] = 153578.26920935,
				["name"] = "SA6-1-15",
				["heading"] = 3.1590459461097,
				["playerCanDrive"] = false,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "5p73 s-125 ln",
				["unitId"] = 1556,
				["y"] = 573078.81249316,
				["x"] = 153576.29548706,
				["name"] = "SA6-1-16",
				["heading"] = 3.1590459461097,
				["playerCanDrive"] = false,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "p-19 s-125 sr",
				["unitId"] = 1557,
				["y"] = 573041.63524492,
				["x"] = 153638.42740326,
				["name"] = "SA6-1-17",
				["heading"] = 6.2641478001644,
				["playerCanDrive"] = false,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ZIL-131 KUNG",
				["unitId"] = 1558,
				["y"] = 573131.33903364,
				["x"] = 153604.47659312,
				["name"] = "SA6-1-18",
				["heading"] = 1.5707963267949,
				["playerCanDrive"] = false,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ZiL-131 APA-80",
				["unitId"] = 1559,
				["y"] = 573128.615675,
				["x"] = 153611.35397283,
				["name"] = "SA6-1-19",
				["heading"] = 3.1241393610699,
				["playerCanDrive"] = false,
			}, -- end of [8]
			[9] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "GAZ-66",
				["unitId"] = 1560,
				["y"] = 573139.09924472,
				["x"] = 153677.82188039,
				["name"] = "SA6-1-20",
				["heading"] = 1.6057029118348,
				["playerCanDrive"] = false,
			}, -- end of [9]
			[10] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "GAZ-66",
				["unitId"] = 1561,
				["y"] = 573139.14210189,
				["x"] = 153672.09668672,
				["name"] = "SA6-1-21",
				["heading"] = 1.6406094968747,
				["playerCanDrive"] = false,
			}, -- end of [10]
			[11] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "GAZ-66",
				["unitId"] = 1562,
				["y"] = 573139.44830985,
				["x"] = 153667.40149797,
				["name"] = "SA6-1-22",
				["heading"] = 1.5707963267949,
				["playerCanDrive"] = false,
			}, -- end of [11]
			[12] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ZiL-131 APA-80",
				["unitId"] = 1563,
				["y"] = 573048.41890609,
				["x"] = 153644.47684558,
				["name"] = "SA6-1-23",
				["heading"] = 1.6406094968747,
				["playerCanDrive"] = false,
			}, -- end of [12]
		}, -- end of ["units"]
		["y"] = 573114.92135768,
		["x"] = 153604.67378327,
		["name"] = "SA3_X",
		["start_time"] = 0,
	}, -- end of ["SA3"]
	["SA6"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 35,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 575462.13928984,
					["x"] = 153514.10246575,
					["ETA_locked"] = true,
					["speed"] = 5.5555555555556,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 2,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 20,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["number"] = 4,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 90,
												["name"] = 24,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 550,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Kub 1S91 str",
				["unitId"] = 1455,
				["y"] = 575462.13928984,
				["x"] = 153514.10246575,
				["name"] = "SA6-1-1",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = false,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Kub 2P25 ln",
				["unitId"] = 1456,
				["y"] = 575366.42777193,
				["x"] = 153530.31343414,
				["name"] = "SA6-1-2",
				["heading"] = 1.5707963267949,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Kub 2P25 ln",
				["unitId"] = 1457,
				["y"] = 575564.39203127,
				["x"] = 153518.09304432,
				["name"] = "SA6-1-3",
				["heading"] = 4.6949356878648,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Kub 2P25 ln",
				["unitId"] = 1458,
				["y"] = 575457.24346135,
				["x"] = 153619.92406734,
				["name"] = "SA6-1-4",
				["heading"] = 3.1764992386297,
				["playerCanDrive"] = false,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Kub 2P25 ln",
				["unitId"] = 1459,
				["y"] = 575465.48565904,
				["x"] = 153414.93263457,
				["name"] = "SA6-1-5",
				["heading"] = 7.105427357601e-15,
				["playerCanDrive"] = false,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ATZ-10",
				["unitId"] = 1460,
				["y"] = 575566.7083547,
				["x"] = 153384.46016622,
				["name"] = "SA6-1-6",
				["heading"] = 5.4628805587423,
				["playerCanDrive"] = false,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ATZ-10",
				["unitId"] = 1461,
				["y"] = 575574.13989236,
				["x"] = 153393.66111761,
				["name"] = "SA6-1-7",
				["heading"] = 5.6374134839417,
				["playerCanDrive"] = false,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ZiL-131 APA-80",
				["unitId"] = 1462,
				["y"] = 575442.11965592,
				["x"] = 153488.49646889,
				["name"] = "SA6-1-8",
				["heading"] = 4.7298422729046,
				["playerCanDrive"] = false,
			}, -- end of [8]
			[9] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Ural-4320-31",
				["unitId"] = 1463,
				["y"] = 575482.15635911,
				["x"] = 153471.92997429,
				["name"] = "SA6-1-9",
				["heading"] = 3.1939525311496,
				["playerCanDrive"] = false,
			}, -- end of [9]
			[10] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Ural-4320-31",
				["unitId"] = 1464,
				["y"] = 575490.95802681,
				["x"] = 153471.92997429,
				["name"] = "SA6-1-10",
				["heading"] = 3.1764992386297,
				["playerCanDrive"] = false,
			}, -- end of [10]
			[11] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Ural-375 PBU",
				["unitId"] = 1465,
				["y"] = 575442.02541085,
				["x"] = 153492.06416023,
				["name"] = "SA6-1-11",
				["heading"] = 4.7298422729046,
				["playerCanDrive"] = false,
			}, -- end of [11]
		}, -- end of ["units"]
		["y"] = 575462.13928984,
		["x"] = 153514.10246575,
		["name"] = "SA6",
		["start_time"] = 0,
	}, -- end of ["SA6"]
    ["SA8"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 35,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 576326.90126669,
					["x"] = 153524.80926108,
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 575,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Osa 9A33 ln",
				["unitId"] = 1564,
				["y"] = 576326.90126669,
				["x"] = 153524.80926108,
				["name"] = "SA8-1",
				["heading"] = 0,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 576326.90126669,
		["x"] = 153524.80926108,
		["name"] = "SA8_X",
		["start_time"] = 0,
	},  -- end of ["SA8"]
    ["SA10"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 35,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 577222.62747304,
					["x"] = 153527.90695684,
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 2,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 20,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 90,
												["name"] = 24,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["number"] = 4,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 549,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S-300PS 40B6M tr",
				["unitId"] = 1425,
				["y"] = 577222.62747304,
				["x"] = 153527.90695684,
				["name"] = "SAM_Sa3Battery-1-1",
				["heading"] = 1.5707963267949,
				["playerCanDrive"] = false,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S-300PS 40B6MD sr",
				["unitId"] = 1426,
				["y"] = 577104.74560372,
				["x"] = 153512.34231908,
				["name"] = "SAM_Sa3Battery-1-2",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S-300PS 54K6 cp",
				["unitId"] = 1427,
				["y"] = 576976.07279779,
				["x"] = 153504.32772185,
				["name"] = "SAM_Sa3Battery-1-3",
				["heading"] = 7.105427357601e-15,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S-300PS 64H6E sr",
				["unitId"] = 1428,
				["y"] = 576976.07279779,
				["x"] = 153550.42298466,
				["name"] = "SAM_Sa3Battery-1-4",
				["heading"] = 7.105427357601e-15,
				["playerCanDrive"] = false,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S-300PS 5P85C ln",
				["unitId"] = 1429,
				["y"] = 577224.00815973,
				["x"] = 153444.55697356,
				["name"] = "SAM_Sa3Battery-1-5",
				["heading"] = 7.105427357601e-15,
				["playerCanDrive"] = false,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S-300PS 5P85D ln",
				["unitId"] = 1430,
				["y"] = 577206.52282554,
				["x"] = 153445.40831626,
				["name"] = "SAM_Sa3Battery-1-6",
				["heading"] = 0.17453292519941,
				["playerCanDrive"] = false,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S-300PS 5P85D ln",
				["unitId"] = 1431,
				["y"] = 577240.85474953,
				["x"] = 153445.35934062,
				["name"] = "SAM_Sa3Battery-1-7",
				["heading"] = 6.1086523819802,
				["playerCanDrive"] = false,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S-300PS 5P85C ln",
				["unitId"] = 1432,
				["y"] = 577223.04309933,
				["x"] = 153610.54736317,
				["name"] = "SAM_Sa3Battery-1-8",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = false,
			}, -- end of [8]
			[9] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S-300PS 5P85D ln",
				["unitId"] = 1433,
				["y"] = 577205.5118403,
				["x"] = 153609.84664181,
				["name"] = "SAM_Sa3Battery-1-9",
				["heading"] = 2.9670597283904,
				["playerCanDrive"] = false,
			}, -- end of [9]
			[10] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "S-300PS 5P85D ln",
				["unitId"] = 1434,
				["y"] = 577240.62201673,
				["x"] = 153609.84664181,
				["name"] = "SAM_Sa3Battery-1-10",
				["heading"] = 3.3161255787892,
				["playerCanDrive"] = false,
			}, -- end of [10]
			[11] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "generator_5i57",
				["unitId"] = 1435,
				["y"] = 577034.95033794,
				["x"] = 153536.99283452,
				["name"] = "SAM_Sa3Battery-1-11",
				["heading"] = 4.7123889803847,
				["playerCanDrive"] = false,
			}, -- end of [11]
			[12] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "generator_5i57",
				["unitId"] = 1436,
				["y"] = 577035.10936011,
				["x"] = 153527.06935461,
				["name"] = "SAM_Sa3Battery-1-12",
				["heading"] = 4.7123889803847,
				["playerCanDrive"] = false,
			}, -- end of [12]
			[13] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ATZ-5",
				["unitId"] = 1437,
				["y"] = 577053.99278816,
				["x"] = 153587.73077582,
				["name"] = "SAM_Sa3Battery-1-13",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = true,
			}, -- end of [13]
			[14] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ATZ-5",
				["unitId"] = 1438,
				["y"] = 577043.36203865,
				["x"] = 153587.73077582,
				["name"] = "SAM_Sa3Battery-1-14",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = true,
			}, -- end of [14]
			[15] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "GAZ-66",
				["unitId"] = 1439,
				["y"] = 577285.43890025,
				["x"] = 153506.95927751,
				["name"] = "SAM_Sa3Battery-1-15",
				["heading"] = 4.7123889803847,
				["playerCanDrive"] = false,
			}, -- end of [15]
			[16] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ATZ-60_Maz",
				["unitId"] = 1440,
				["y"] = 577071.27155213,
				["x"] = 153461.15560113,
				["name"] = "SAM_Sa3Battery-1-16",
				["heading"] = 0.78539816339741,
				["playerCanDrive"] = true,
			}, -- end of [16]
			[17] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ATZ-60_Maz",
				["unitId"] = 1441,
				["y"] = 577064.1594656,
				["x"] = 153468.26768765,
				["name"] = "SAM_Sa3Battery-1-17",
				["heading"] = 0.78539816339741,
				["playerCanDrive"] = true,
			}, -- end of [17]
			[18] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "KAMAZ Truck",
				["unitId"] = 1442,
				["y"] = 577285.1003477,
				["x"] = 153544.23418445,
				["name"] = "SAM_Sa3Battery-1-18",
				["heading"] = 4.7123889803847,
				["playerCanDrive"] = false,
			}, -- end of [18]
			[19] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Tor 9A331",
				["unitId"] = 1454,
				["y"] = 577150.52319232,
				["x"] = 153483.20163464,
				["name"] = "SAM_Sa10-1",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = false,
			}, -- end of [19]
		}, -- end of ["units"]
		["y"] = 577222.62747304,
		["x"] = 153527.90695684,
		["name"] = "SA10_X",
		["start_time"] = 0,
	},  -- end of ["SA10"]
    ["SA11"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 34,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 578090.35719926,
					["x"] = 153490.60088682,
					["ETA_locked"] = true,
					["speed"] = 5.5555555555556,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 572,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "SA-11 Buk SR 9S18M1",
				["unitId"] = 1525,
				["y"] = 578090.35719926,
				["x"] = 153490.60088682,
				["name"] = "SA11-1",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "SA-11 Buk LN 9A310M1",
				["unitId"] = 1526,
				["y"] = 578191.23474919,
				["x"] = 153493.25724187,
				["name"] = "SA11-2",
				["heading"] = 4.7123889803847,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "SA-11 Buk LN 9A310M1",
				["unitId"] = 1527,
				["y"] = 577988.10445784,
				["x"] = 153486.61030825,
				["name"] = "SA11-3",
				["heading"] = 1.553343034275,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "SA-11 Buk LN 9A310M1",
				["unitId"] = 1528,
				["y"] = 578095.25302775,
				["x"] = 153384.77928523,
				["name"] = "SA11-4",
				["heading"] = 0.034906585039887,
				["playerCanDrive"] = false,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "SA-11 Buk LN 9A310M1",
				["unitId"] = 1529,
				["y"] = 578087.01083006,
				["x"] = 153589.770718,
				["name"] = "SA11-5",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = false,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ATZ-10",
				["unitId"] = 1530,
				["y"] = 577985.78813441,
				["x"] = 153620.24318635,
				["name"] = "SA11-6",
				["heading"] = 2.3212879051525,
				["playerCanDrive"] = false,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ATZ-10",
				["unitId"] = 1531,
				["y"] = 577978.35659675,
				["x"] = 153611.04223496,
				["name"] = "SA11-7",
				["heading"] = 2.4958208303519,
				["playerCanDrive"] = false,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "ZiL-131 APA-80",
				["unitId"] = 1532,
				["y"] = 578111.78229705,
				["x"] = 153518.2375093,
				["name"] = "SA11-8",
				["heading"] = 1.5882496193148,
				["playerCanDrive"] = false,
			}, -- end of [8]
			[9] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Ural-4320-31",
				["unitId"] = 1533,
				["y"] = 578070.34013,
				["x"] = 153532.77337828,
				["name"] = "SA11-9",
				["heading"] = 0.05235987755983,
				["playerCanDrive"] = false,
			}, -- end of [9]
			[10] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Ural-4320-31",
				["unitId"] = 1534,
				["y"] = 578061.5384623,
				["x"] = 153532.77337828,
				["name"] = "SA11-10",
				["heading"] = 0.034906585039887,
				["playerCanDrive"] = false,
			}, -- end of [10]
			[11] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Ural-375 PBU",
				["unitId"] = 1535,
				["y"] = 578111.78229705,
				["x"] = 153513.20410613,
				["name"] = "SA11-11",
				["heading"] = 1.5882496193148,
				["playerCanDrive"] = false,
			}, -- end of [11]
			[12] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "SA-11 Buk CC 9S470M1",
				["unitId"] = 1536,
				["y"] = 578072.68953243,
				["x"] = 153476.6280431,
				["name"] = "SA11-12",
				["heading"] = 1.553343034275,
				["playerCanDrive"] = false,
			}, -- end of [12]
		}, -- end of ["units"]
		["y"] = 578090.35719926,
		["x"] = 153490.60088682,
		["name"] = "SA11_X",
		["start_time"] = 0,
	},  -- end of ["SA11"]
    ["SA15"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
				[1] = 
				{
					[1] = 
					{
						["y"] = 578599.66302873,
						["x"] = 153482.38437486,
					}, -- end of [1]
					[2] = 
					{
						["y"] = 578599.66302873,
						["x"] = 153482.38437486,
					}, -- end of [2]
				}, -- end of [1]
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 34,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 578599.66302873,
					["x"] = 153482.38437486,
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 576,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "High",
				["coldAtStart"] = false,
				["type"] = "Tor 9A331",
				["unitId"] = 1565,
				["y"] = 578599.66302873,
				["x"] = 153482.38437486,
				["name"] = "SA15-1",
				["heading"] = 4.7314728703886,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 578599.66302873,
		["x"] = 153482.38437486,
		["name"] = "SA15_X",
		["start_time"] = 0,
	},  -- end of ["SA15"]
    ["SA19"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 22,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 299214.22371761,
					["x"] = 39623.843013552,
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 2,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 20,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 682,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "2S6 Tunguska",
				["unitId"] = 1800,
				["y"] = 299214.22371761,
				["x"] = 39623.843013552,
				["name"] = "SA19-1",
				["heading"] = 0,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 299214.22371761,
		["x"] = 39623.843013552,
		["name"] = "SA19",
		["start_time"] = 0,
	},  -- end of ["SA19"]
	------------------------ AAA ------------------------
	["ZSU23_Shilka"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 22,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 299328.09367735,
					["x"] = 39637.172381306,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 5.5555555555556,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 91,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "ZSU-23-4 Shilka",
				["unitId"] = 481,
				["y"] = 299328.09367735,
				["x"] = 39637.172381306,
				["name"] = "Unit #209",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = false,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 299328.09367735,
		["x"] = 39637.172381306,
		["name"] = "AAA_Zsu23Shilka",
		["start_time"] = 0,
	},  -- end of ["ZSU23_Shilka"]
    ["ZU23_Emp"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 22,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 299298.36197716,
					["x"] = 39637.779150698,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 89,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "ZU-23 Emplacement",
				["unitId"] = 479,
				["y"] = 299298.36197716,
				["x"] = 39637.779150698,
				["name"] = "Unit #207",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 299298.36197716,
		["x"] = 39637.779150698,
		["name"] = "AAA_Zu23Emplacement",
		["start_time"] = 0,
	},  -- end of ["ZU23_Emp"]
    ["ZU23_Ural"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 22,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 299282.72696715,
					["x"] = 39636.654073691,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 5.5555555555556,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 88,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 478,
				["y"] = 299282.72696715,
				["x"] = 39636.654073691,
				["name"] = "Unit #206",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = false,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 299282.72696715,
		["x"] = 39636.654073691,
		["name"] = "AAA_Zu23Ural",
		["start_time"] = 0,
	}, -- end of ["ZU23_Ural"]
	["ZU23_Closed"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
				[1] = 
				{
					[1] = 
					{
						["y"] = 299353.56779192,
						["x"] = 39637.047214632,
					}, -- end of [1]
					[2] = 
					{
						["y"] = 299324.21254406,
						["x"] = 39636.129863136,
					}, -- end of [2]
				}, -- end of [1]
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 22,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 299311.94102036,
					["x"] = 39637.695245398,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 0,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 90,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "ZU-23 Emplacement Closed",
				["unitId"] = 480,
				["y"] = 299311.94102036,
				["x"] = 39637.695245398,
				["name"] = "Unit #208",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 299311.94102036,
		["x"] = 39637.695245398,
		["name"] = "AAA_Zu23Closed",
		["start_time"] = 0,
	}, -- end of [ZU23_Closed]	
	----------------------- MANPADS -----------------------
	["SA18Manpads"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 22,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 299292.29428324,
					["x"] = 39611.688066858,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 4,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 92,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "SA-18 Igla manpad",
				["unitId"] = 482,
				["y"] = 299292.29428324,
				["x"] = 39611.688066858,
				["name"] = "Unit #210",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 299292.29428324,
		["x"] = 39611.688066858,
		["name"] = "SAM_Sa18Manpads",
		["start_time"] = 0,
	}, -- end of [SA18Manpads]
	["SA18SManpads"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
				[1] = 
				{
					[1] = 
					{
						["y"] = 299317.36320321,
						["x"] = 39529.033326712,
					}, -- end of [1]
					[2] = 
					{
						["y"] = 299320.60780347,
						["x"] = 39533.359460394,
					}, -- end of [2]
				}, -- end of [1]
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 22,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 299308.07028743,
					["x"] = 39613.508375033,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 4,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 93,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "SA-18 Igla-S manpad",
				["unitId"] = 483,
				["y"] = 299308.07028743,
				["x"] = 39613.508375033,
				["name"] = "Unit #211",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 299308.07028743,
		["x"] = 39613.508375033,
		["name"] = "SAM_Sa18sManpads",
		["start_time"] = 0,
	}, -- end of [SA18SManpads]
	------------------------ CAMP ------------------------
	["CAMP_Heavy"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 30,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = -850039.55005353,
					["x"] = 507552.14703332,
					["ETA_locked"] = true,
					["speed"] = 5.5555555555556,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 17483,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 20656,
				["y"] = -850039.55005353,
				["x"] = 507552.14703332,
				["name"] = "CAMP_Heavy",
				["heading"] = 0,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = -850039.55005353,
		["x"] = 507552.14703332,
		["name"] = "CAMP_Heavy",
		["start_time"] = 0,
	}, -- end of ["CAMP_Heavy"]
	["CAMP_Tent_Group"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 21,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 289225.29837187,
					["x"] = 40597.069277546,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 5.5555555555556,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 73,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "tentepetite_vert",
				["unitId"] = 448,
				["y"] = 289225.29837187,
				["x"] = 40597.069277546,
				["name"] = "Unit #183",
				["heading"] = 5.9864793343406,
				["playerCanDrive"] = false,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "tente_verte",
				["unitId"] = 449,
				["y"] = 289203.1385953,
				["x"] = 40609.827936785,
				["name"] = "Unit #184",
				["heading"] = 0.069813170079773,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "tente_verte",
				["unitId"] = 450,
				["y"] = 289247.45814844,
				["x"] = 40585.429798943,
				["name"] = "Unit #185",
				["heading"] = 5.9864793343406,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "tentepetite_vert",
				["unitId"] = 451,
				["y"] = 289211.86820425,
				["x"] = 40594.159407896,
				["name"] = "Unit #186",
				["heading"] = 5.9864793343406,
				["playerCanDrive"] = false,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "tente_verte",
				["unitId"] = 452,
				["y"] = 289240.29539238,
				["x"] = 40610.051772912,
				["name"] = "Unit #187",
				["heading"] = 4.8869219055841,
				["playerCanDrive"] = false,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Container_Vert",
				["unitId"] = 453,
				["y"] = 289199.7810534,
				["x"] = 40591.025702118,
				["name"] = "Unit #188",
				["heading"] = 5.9864793343406,
				["playerCanDrive"] = false,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Container_Vert",
				["unitId"] = 454,
				["y"] = 289230.44660279,
				["x"] = 40574.46182872,
				["name"] = "Unit #189",
				["heading"] = 5.9864793343406,
				["playerCanDrive"] = false,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "tente_verte",
				["unitId"] = 455,
				["y"] = 289217.44400127,
				["x"] = 40579.772531204,
				["name"] = "Unit #190",
				["heading"] = 0.4014257279587,
				["playerCanDrive"] = false,
			}, -- end of [8]
			[9] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "tentepetite_vert",
				["unitId"] = 456,
				["y"] = 289217.01643517,
				["x"] = 40621.691251516,
				["name"] = "Unit #191",
				["heading"] = 5.9864793343406,
				["playerCanDrive"] = false,
			}, -- end of [9]
			[10] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Tente H_verte",
				["unitId"] = 461,
				["y"] = 289221.76804989,
				["x"] = 40560.906732556,
				["name"] = "Unit #196",
				["heading"] = 5.9864793343406,
				["playerCanDrive"] = false,
			}, -- end of [10]
			[11] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "tentepetite_vert",
				["unitId"] = 462,
				["y"] = 289206.58029006,
				["x"] = 40572.63999098,
				["name"] = "Unit #197",
				["heading"] = 5.9864793343406,
				["playerCanDrive"] = false,
			}, -- end of [11]
			[12] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Tente H_verte",
				["unitId"] = 463,
				["y"] = 289247.52799094,
				["x"] = 40566.742969199,
				["name"] = "Unit #198",
				["heading"] = 5.9864793343406,
				["playerCanDrive"] = false,
			}, -- end of [12]
		}, -- end of ["units"]
		["y"] = 289225.29837187,
		["x"] = 40597.069277546,
		["name"] = "CAMP_Tent_Group",
		["start_time"] = 0,
	}, -- end of [CAMP_Tent_Group]
	["CAMP_Inf_02"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 20,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 288079.26256212,
					["x"] = 42645.403272296,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 4,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 1,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 57,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Paratrooper AKS-74",
				["unitId"] = 367,
				["y"] = 288079.26256212,
				["x"] = 42645.403272296,
				["name"] = "Unit #104",
				["heading"] = 2.8448866807508,
				["playerCanDrive"] = false,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Infantry AK",
				["unitId"] = 368,
				["y"] = 288069.14056436,
				["x"] = 42636.996867373,
				["name"] = "Unit #105",
				["heading"] = 5.0789081233035,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Paratrooper RPG-16",
				["unitId"] = 369,
				["y"] = 288078.76029292,
				["x"] = 42635.106753823,
				["name"] = "Unit #106",
				["heading"] = 3.6651914291881,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Infantry AK",
				["unitId"] = 370,
				["y"] = 288088.5545422,
				["x"] = 42637.618099792,
				["name"] = "Unit #107",
				["heading"] = 2.8448866807508,
				["playerCanDrive"] = false,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Infantry AK",
				["unitId"] = 371,
				["y"] = 288088.05227301,
				["x"] = 42647.412349072,
				["name"] = "Unit #108",
				["heading"] = 0.97738438111682,
				["playerCanDrive"] = false,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Paratrooper RPG-16",
				["unitId"] = 445,
				["y"] = 288095.83744551,
				["x"] = 42639.124907373,
				["name"] = "Unit #180",
				["heading"] = 0.97738438111682,
				["playerCanDrive"] = false,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Infantry AK",
				["unitId"] = 446,
				["y"] = 288073.98873558,
				["x"] = 42653.941848591,
				["name"] = "Unit #181",
				["heading"] = 0.97738438111682,
				["playerCanDrive"] = false,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Infantry AK",
				["unitId"] = 447,
				["y"] = 288071.97965881,
				["x"] = 42644.398733909,
				["name"] = "Unit #182",
				["heading"] = 0.97738438111682,
				["playerCanDrive"] = false,
			}, -- end of [8]
			[9] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Infantry AK",
				["unitId"] = 457,
				["y"] = 288066.95696687,
				["x"] = 42649.421425847,
				["name"] = "Unit #192",
				["heading"] = 0.97738438111682,
				["playerCanDrive"] = false,
			}, -- end of [9]
			[10] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Infantry AK",
				["unitId"] = 458,
				["y"] = 288083.28071567,
				["x"] = 42654.946386979,
				["name"] = "Unit #193",
				["heading"] = 0.97738438111682,
				["playerCanDrive"] = false,
			}, -- end of [10]
			[11] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Infantry AK",
				["unitId"] = 459,
				["y"] = 288093.07496495,
				["x"] = 42644.901003102,
				["name"] = "Unit #194",
				["heading"] = 0.97738438111682,
				["playerCanDrive"] = false,
			}, -- end of [11]
			[12] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Infantry AK",
				["unitId"] = 460,
				["y"] = 288085.03865785,
				["x"] = 42629.581792691,
				["name"] = "Unit #195",
				["heading"] = 0.97738438111682,
				["playerCanDrive"] = false,
			}, -- end of [12]
		}, -- end of ["units"]
		["y"] = 288079.26256212,
		["x"] = 42645.403272296,
		["name"] = "CAMP_Inf_02",
		["start_time"] = 0,
		["hiddenOnPlanner"] = false,
	}, -- end of [CAMP_Inf_02]
    ----------------------- CONVOY ------------------------
	["CON_light"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
				[1] = 
				{
					[1] = 
					{
						["y"] = 307002.29266054,
						["x"] = 36451.947799565,
					}, -- end of [1]
					[2] = 
					{
						["y"] = 307002.29266054,
						["x"] = 36451.947799565,
					}, -- end of [2]
				}, -- end of [1]
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 5,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 306991.33844617,
					["x"] = 36455.435715355,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 5.5555555555556,
					["action"] = "On Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 45,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Tigr_233036",
				["unitId"] = 326,
				["y"] = 306991.33844617,
				["x"] = 36455.435715355,
				["name"] = "Unit #033",
				["heading"] = 2.8333339754249,
				["playerCanDrive"] = false,
				["wagons"] = 
				{
				}, -- end of ["wagons"]
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 327,
				["y"] = 306962.75232017,
				["x"] = 36464.537000937,
				["name"] = "Unit #034",
				["heading"] = 1.8790433242373,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 328,
				["y"] = 306934.16599896,
				["x"] = 36473.637673398,
				["name"] = "Unit #035",
				["heading"] = 1.8790149274913,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 329,
				["y"] = 306905.57963757,
				["x"] = 36482.738219676,
				["name"] = "Unit #036",
				["heading"] = 1.8790045696829,
				["playerCanDrive"] = false,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 PBU",
				["unitId"] = 330,
				["y"] = 306876.99344612,
				["x"] = 36491.839299659,
				["name"] = "Unit #079",
				["heading"] = 1.8790140394514,
				["playerCanDrive"] = false,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Tigr_233036",
				["unitId"] = 331,
				["y"] = 306848.40800062,
				["x"] = 36500.942721509,
				["name"] = "Unit #080",
				["heading"] = 1.8790787459442,
				["playerCanDrive"] = false,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "KAMAZ Truck",
				["unitId"] = 332,
				["y"] = 306819.82419292,
				["x"] = 36510.051281374,
				["name"] = "Unit #081",
				["heading"] = 1.8792307204181,
				["playerCanDrive"] = false,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 333,
				["y"] = 306791.24378837,
				["x"] = 36519.170500361,
				["name"] = "Unit #083",
				["heading"] = 1.8795438987433,
				["playerCanDrive"] = false,
			}, -- end of [8]
			[9] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "KAMAZ Truck",
				["unitId"] = 334,
				["y"] = 306762.66880464,
				["x"] = 36528.306677043,
				["name"] = "Unit #084",
				["heading"] = 1.8801155465484,
				["playerCanDrive"] = false,
			}, -- end of [9]
			[10] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "KAMAZ Truck",
				["unitId"] = 335,
				["y"] = 306734.09679001,
				["x"] = 36537.452161264,
				["name"] = "Unit #085",
				["heading"] = 1.8805447152192,
				["playerCanDrive"] = false,
			}, -- end of [10]
			[11] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "KAMAZ Truck",
				["unitId"] = 336,
				["y"] = 306705.52412294,
				["x"] = 36546.595611428,
				["name"] = "Unit #086",
				["heading"] = 1.8805410215421,
				["playerCanDrive"] = false,
			}, -- end of [11]
			[12] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 337,
				["y"] = 306676.95006854,
				["x"] = 36555.734724067,
				["name"] = "Unit #087",
				["heading"] = 1.8803837453141,
				["playerCanDrive"] = false,
			}, -- end of [12]
			[13] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "SKP-11",
				["unitId"] = 342,
				["y"] = 306648.37513627,
				["x"] = 36564.871092641,
				["name"] = "Unit #088",
				["heading"] = 1.8802767356983,
				["playerCanDrive"] = false,
			}, -- end of [13]
			[14] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Tigr_233036",
				["unitId"] = 343,
				["y"] = 306619.79957931,
				["x"] = 36574.005507597,
				["name"] = "Unit #089",
				["heading"] = 1.8802038056136,
				["playerCanDrive"] = false,
			}, -- end of [14]
			[15] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "ZiL-131 APA-80",
				["unitId"] = 344,
				["y"] = 306591.22351138,
				["x"] = 36583.138324052,
				["name"] = "Unit #090",
				["heading"] = 1.8801457366544,
				["playerCanDrive"] = false,
			}, -- end of [15]
			[16] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "ZiL-131 APA-80",
				["unitId"] = 345,
				["y"] = 306562.64680561,
				["x"] = 36592.269144119,
				["name"] = "Unit #091",
				["heading"] = 1.8800874621262,
				["playerCanDrive"] = false,
			}, -- end of [16]
			[17] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "KAMAZ Truck",
				["unitId"] = 346,
				["y"] = 306534.06930442,
				["x"] = 36601.39747612,
				["name"] = "Unit #092",
				["heading"] = 1.8799869866622,
				["playerCanDrive"] = false,
			}, -- end of [17]
			[18] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "KAMAZ Truck",
				["unitId"] = 347,
				["y"] = 306505.49163701,
				["x"] = 36610.525286639,
				["name"] = "Unit #093",
				["heading"] = 1.8799607746795,
				["playerCanDrive"] = false,
			}, -- end of [18]
			[19] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Osa 9A33 ln",
				["unitId"] = 348,
				["y"] = 306476.91389706,
				["x"] = 36619.652870086,
				["name"] = "Unit #094",
				["heading"] = 1.8799518773351,
				["playerCanDrive"] = false,
			}, -- end of [19]
		}, -- end of ["units"]
		["y"] = 306991.33844617,
		["x"] = 36455.435715355,
		["name"] = "CONVOY_light-1",
		["start_time"] = 0,
	},  -- end of ["CON_light"]
    ["CON_heavy"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
				[1] = 
				{
					[1] = 
					{
						["y"] = 304414.77669086,
						["x"] = 37276.865434798,
					}, -- end of [1]
					[2] = 
					{
						["y"] = 304414.77669086,
						["x"] = 37276.865434798,
					}, -- end of [2]
				}, -- end of [1]
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 22,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 301676.00477616,
					["x"] = 38214.931330529,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 9.25,
					["action"] = "On Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 70,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "ZSU-23-4 Shilka",
				["unitId"] = 405,
				["y"] = 301676.00477616,
				["x"] = 38214.931330529,
				["name"] = "Unit #140",
				["heading"] = 2.8116029773454,
				["playerCanDrive"] = true,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 406,
				["y"] = 301647.53942293,
				["x"] = 38224.39985035,
				["name"] = "Unit #141",
				["heading"] = 1.8782668196037,
				["playerCanDrive"] = true,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 407,
				["y"] = 301619.07294999,
				["x"] = 38233.868742469,
				["name"] = "Unit #142",
				["heading"] = 1.8784381995326,
				["playerCanDrive"] = true,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 408,
				["y"] = 301590.60647629,
				["x"] = 38243.337631008,
				["name"] = "Unit #143",
				["heading"] = 1.8785398765432,
				["playerCanDrive"] = true,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 409,
				["y"] = 301562.13998517,
				["x"] = 38252.806469144,
				["name"] = "Unit #144",
				["heading"] = 1.8783470362892,
				["playerCanDrive"] = true,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 410,
				["y"] = 301533.67338246,
				["x"] = 38262.27497114,
				["name"] = "Unit #145",
				["heading"] = 1.877645336169,
				["playerCanDrive"] = true,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 411,
				["y"] = 301505.20653901,
				["x"] = 38271.74274927,
				["name"] = "Unit #146",
				["heading"] = 1.877473355351,
				["playerCanDrive"] = true,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 412,
				["y"] = 301476.73925518,
				["x"] = 38281.209202938,
				["name"] = "Unit #147",
				["heading"] = 1.8773984159304,
				["playerCanDrive"] = true,
			}, -- end of [8]
			[9] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Osa 9A33 ln",
				["unitId"] = 413,
				["y"] = 301448.27113757,
				["x"] = 38290.673148291,
				["name"] = "Unit #148",
				["heading"] = 1.8773291465698,
				["playerCanDrive"] = false,
			}, -- end of [9]
			[10] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 414,
				["y"] = 301419.80110324,
				["x"] = 38300.131321826,
				["name"] = "Unit #149",
				["heading"] = 1.8772303862861,
				["playerCanDrive"] = true,
			}, -- end of [10]
			[11] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 415,
				["y"] = 301391.32811351,
				["x"] = 38309.580594062,
				["name"] = "Unit #150",
				["heading"] = 1.8769893046105,
				["playerCanDrive"] = true,
			}, -- end of [11]
			[12] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 416,
				["y"] = 301362.85730293,
				["x"] = 38319.036426189,
				["name"] = "Unit #151",
				["heading"] = 1.8757472778833,
				["playerCanDrive"] = true,
			}, -- end of [12]
			[13] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 417,
				["y"] = 301334.39176906,
				["x"] = 38328.508118369,
				["name"] = "Unit #152",
				["heading"] = 1.8730157673716,
				["playerCanDrive"] = true,
			}, -- end of [13]
			[14] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 418,
				["y"] = 301305.92821931,
				["x"] = 38337.98579116,
				["name"] = "Unit #153",
				["heading"] = 1.8708689503781,
				["playerCanDrive"] = true,
			}, -- end of [14]
			[15] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 419,
				["y"] = 301277.46511035,
				["x"] = 38347.464790578,
				["name"] = "Unit #154",
				["heading"] = 1.8679285264736,
				["playerCanDrive"] = true,
			}, -- end of [15]
			[16] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 420,
				["y"] = 301249.00182235,
				["x"] = 38356.943252237,
				["name"] = "Unit #155",
				["heading"] = 1.8637875013618,
				["playerCanDrive"] = true,
			}, -- end of [16]
			[17] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 421,
				["y"] = 301220.53792841,
				["x"] = 38366.419893654,
				["name"] = "Unit #156",
				["heading"] = 1.8575911919256,
				["playerCanDrive"] = true,
			}, -- end of [17]
			[18] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 422,
				["y"] = 301192.07330281,
				["x"] = 38375.894337225,
				["name"] = "Unit #157",
				["heading"] = 1.8495312285784,
				["playerCanDrive"] = true,
			}, -- end of [18]
			[19] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 423,
				["y"] = 301163.60811559,
				["x"] = 38385.367093434,
				["name"] = "Unit #158",
				["heading"] = 1.846427458863,
				["playerCanDrive"] = true,
			}, -- end of [19]
			[20] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Osa 9A33 ln",
				["unitId"] = 424,
				["y"] = 301135.14239031,
				["x"] = 38394.838232731,
				["name"] = "Unit #159",
				["heading"] = 1.8562698946798,
				["playerCanDrive"] = true,
			}, -- end of [20]
		}, -- end of ["units"]
		["y"] = 301676.00477616,
		["x"] = 38214.931330529,
		["name"] = "CONVOY_heavy-2",
		["start_time"] = 0,
	},  -- end of ["CON_heavy"]
	["CONVOY_base"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
				[1] = 
				{
					[1] = 
					{
						["y"] = 307429.64127261,
						["x"] = 36315.691981635,
					}, -- end of [1]
					[2] = 
					{
						["y"] = 307429.64127261,
						["x"] = 36315.691981635,
					}, -- end of [2]
				}, -- end of [1]
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 5,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 307929.59357735,
					["x"] = 36284.831768249,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 5.5555555555556,
					["action"] = "On Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 72,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Tigr_233036",
				["unitId"] = 444,
				["y"] = 307929.59357735,
				["x"] = 36284.831768249,
				["name"] = "Unit #179",
				["heading"] = -0.061648098349977,
				["playerCanDrive"] = false,
				["wagons"] = 
				{
				}, -- end of ["wagons"]
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 307929.59357735,
		["x"] = 36284.831768249,
		["name"] = "CONVOY_base",
		["start_time"] = 0,
	}, -- end of [CONVOY_base]
	["CONVOY_light-1"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
				[1] = 
				{
					[1] = 
					{
						["y"] = 307002.29266054,
						["x"] = 36451.947799565,
					}, -- end of [1]
					[2] = 
					{
						["y"] = 307002.29266054,
						["x"] = 36451.947799565,
					}, -- end of [2]
				}, -- end of [1]
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 5,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 306991.33844617,
					["x"] = 36455.435715355,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 5.5555555555556,
					["action"] = "On Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 45,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Tigr_233036",
				["unitId"] = 326,
				["y"] = 306991.33844617,
				["x"] = 36455.435715355,
				["name"] = "Unit #033",
				["heading"] = 2.8333339754249,
				["playerCanDrive"] = false,
				["wagons"] = 
				{
				}, -- end of ["wagons"]
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 327,
				["y"] = 306962.75232017,
				["x"] = 36464.537000937,
				["name"] = "Unit #034",
				["heading"] = 1.8790433242373,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 328,
				["y"] = 306934.16599896,
				["x"] = 36473.637673398,
				["name"] = "Unit #035",
				["heading"] = 1.8790149274913,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 329,
				["y"] = 306905.57963757,
				["x"] = 36482.738219676,
				["name"] = "Unit #036",
				["heading"] = 1.8790045696829,
				["playerCanDrive"] = false,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 PBU",
				["unitId"] = 330,
				["y"] = 306876.99344612,
				["x"] = 36491.839299659,
				["name"] = "Unit #079",
				["heading"] = 1.8790140394514,
				["playerCanDrive"] = false,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Tigr_233036",
				["unitId"] = 331,
				["y"] = 306848.40800062,
				["x"] = 36500.942721509,
				["name"] = "Unit #080",
				["heading"] = 1.8790787459442,
				["playerCanDrive"] = false,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "KAMAZ Truck",
				["unitId"] = 332,
				["y"] = 306819.82419292,
				["x"] = 36510.051281374,
				["name"] = "Unit #081",
				["heading"] = 1.8792307204181,
				["playerCanDrive"] = false,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 333,
				["y"] = 306791.24378837,
				["x"] = 36519.170500361,
				["name"] = "Unit #083",
				["heading"] = 1.8795438987433,
				["playerCanDrive"] = false,
			}, -- end of [8]
			[9] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "KAMAZ Truck",
				["unitId"] = 334,
				["y"] = 306762.66880464,
				["x"] = 36528.306677043,
				["name"] = "Unit #084",
				["heading"] = 1.8801155465484,
				["playerCanDrive"] = false,
			}, -- end of [9]
			[10] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "KAMAZ Truck",
				["unitId"] = 335,
				["y"] = 306734.09679001,
				["x"] = 36537.452161264,
				["name"] = "Unit #085",
				["heading"] = 1.8805447152192,
				["playerCanDrive"] = false,
			}, -- end of [10]
			[11] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "KAMAZ Truck",
				["unitId"] = 336,
				["y"] = 306705.52412294,
				["x"] = 36546.595611428,
				["name"] = "Unit #086",
				["heading"] = 1.8805410215421,
				["playerCanDrive"] = false,
			}, -- end of [11]
			[12] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 337,
				["y"] = 306676.95006854,
				["x"] = 36555.734724067,
				["name"] = "Unit #087",
				["heading"] = 1.8803837453141,
				["playerCanDrive"] = false,
			}, -- end of [12]
			[13] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "SKP-11",
				["unitId"] = 342,
				["y"] = 306648.37513627,
				["x"] = 36564.871092641,
				["name"] = "Unit #088",
				["heading"] = 1.8802767356983,
				["playerCanDrive"] = false,
			}, -- end of [13]
			[14] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Tigr_233036",
				["unitId"] = 343,
				["y"] = 306619.79957931,
				["x"] = 36574.005507597,
				["name"] = "Unit #089",
				["heading"] = 1.8802038056136,
				["playerCanDrive"] = false,
			}, -- end of [14]
			[15] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "ZiL-131 APA-80",
				["unitId"] = 344,
				["y"] = 306591.22351138,
				["x"] = 36583.138324052,
				["name"] = "Unit #090",
				["heading"] = 1.8801457366544,
				["playerCanDrive"] = false,
			}, -- end of [15]
			[16] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "ZiL-131 APA-80",
				["unitId"] = 345,
				["y"] = 306562.64680561,
				["x"] = 36592.269144119,
				["name"] = "Unit #091",
				["heading"] = 1.8800874621262,
				["playerCanDrive"] = false,
			}, -- end of [16]
			[17] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "KAMAZ Truck",
				["unitId"] = 346,
				["y"] = 306534.06930442,
				["x"] = 36601.39747612,
				["name"] = "Unit #092",
				["heading"] = 1.8799869866622,
				["playerCanDrive"] = false,
			}, -- end of [17]
			[18] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "KAMAZ Truck",
				["unitId"] = 347,
				["y"] = 306505.49163701,
				["x"] = 36610.525286638,
				["name"] = "Unit #093",
				["heading"] = 1.8799607746795,
				["playerCanDrive"] = false,
			}, -- end of [18]
			[19] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Osa 9A33 ln",
				["unitId"] = 348,
				["y"] = 306476.91389706,
				["x"] = 36619.652870086,
				["name"] = "Unit #094",
				["heading"] = 1.8799518773351,
				["playerCanDrive"] = false,
			}, -- end of [19]
		}, -- end of ["units"]
		["y"] = 306991.33844617,
		["x"] = 36455.435715355,
		["name"] = "CONVOY_light-1",
		["start_time"] = 0,
	}, -- end of [CONVOY_light-1]
	["CONVOY_light-2"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
				[1] = 
				{
					[1] = 
					{
						["y"] = 306224.70862636,
						["x"] = 36700.197414639,
					}, -- end of [1]
					[2] = 
					{
						["y"] = 306224.70862636,
						["x"] = 36700.197414639,
					}, -- end of [2]
				}, -- end of [1]
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 5,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 306224.7086263,
					["x"] = 36700.197414657,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 5.5555555555556,
					["action"] = "On Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 71,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Tigr_233036",
				["unitId"] = 425,
				["y"] = 306224.7086263,
				["x"] = 36700.197414657,
				["name"] = "Unit #160",
				["heading"] = 2.0846941664357,
				["playerCanDrive"] = false,
				["wagons"] = 
				{
				}, -- end of ["wagons"]
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 426,
				["y"] = 306196.72763336,
				["x"] = 36709.132878916,
				["name"] = "Unit #161",
				["heading"] = 1.879900916109,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 427,
				["y"] = 306168.14944255,
				["x"] = 36718.259050849,
				["name"] = "Unit #162",
				["heading"] = 1.8799008592043,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 428,
				["y"] = 306139.57125186,
				["x"] = 36727.385222765,
				["name"] = "Unit #163",
				["heading"] = 1.879900859882,
				["playerCanDrive"] = false,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 PBU",
				["unitId"] = 429,
				["y"] = 306110.99306129,
				["x"] = 36736.511395035,
				["name"] = "Unit #164",
				["heading"] = 1.8799008723394,
				["playerCanDrive"] = false,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Tigr_233036",
				["unitId"] = 430,
				["y"] = 306082.41487089,
				["x"] = 36745.637568004,
				["name"] = "Unit #165",
				["heading"] = 1.8799008962587,
				["playerCanDrive"] = false,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375",
				["unitId"] = 431,
				["y"] = 306053.83668082,
				["x"] = 36754.76374199,
				["name"] = "Unit #166",
				["heading"] = 1.8799009318986,
				["playerCanDrive"] = false,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375",
				["unitId"] = 432,
				["y"] = 306025.25849108,
				["x"] = 36763.889917036,
				["name"] = "Unit #167",
				["heading"] = 1.8799009689035,
				["playerCanDrive"] = false,
			}, -- end of [8]
			[9] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375",
				["unitId"] = 433,
				["y"] = 305996.68030161,
				["x"] = 36773.016092938,
				["name"] = "Unit #168",
				["heading"] = 1.8799009988225,
				["playerCanDrive"] = false,
			}, -- end of [9]
			[10] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375",
				["unitId"] = 434,
				["y"] = 305968.10211242,
				["x"] = 36782.14226958,
				["name"] = "Unit #169",
				["heading"] = 1.8799010251592,
				["playerCanDrive"] = false,
			}, -- end of [10]
			[11] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375",
				["unitId"] = 435,
				["y"] = 305939.52392328,
				["x"] = 36791.268446585,
				["name"] = "Unit #170",
				["heading"] = 1.8799010371935,
				["playerCanDrive"] = false,
			}, -- end of [11]
			[12] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 436,
				["y"] = 305910.94573413,
				["x"] = 36800.39462353,
				["name"] = "Unit #171",
				["heading"] = 1.879901035186,
				["playerCanDrive"] = false,
			}, -- end of [12]
			[13] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "ZIL-131 KUNG",
				["unitId"] = 437,
				["y"] = 305882.36754484,
				["x"] = 36809.520800007,
				["name"] = "Unit #172",
				["heading"] = 1.8799010189057,
				["playerCanDrive"] = false,
			}, -- end of [13]
			[14] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Tigr_233036",
				["unitId"] = 438,
				["y"] = 305853.78935446,
				["x"] = 36818.646973079,
				["name"] = "Unit #173",
				["heading"] = 1.8799008997323,
				["playerCanDrive"] = false,
			}, -- end of [14]
			[15] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "ZiL-131 APA-80",
				["unitId"] = 439,
				["y"] = 305825.2111515,
				["x"] = 36827.773106733,
				["name"] = "Unit #174",
				["heading"] = 1.879899520508,
				["playerCanDrive"] = false,
			}, -- end of [15]
			[16] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "ZiL-131 APA-80",
				["unitId"] = 440,
				["y"] = 305796.63290686,
				["x"] = 36836.89910986,
				["name"] = "Unit #175",
				["heading"] = 1.8798949531691,
				["playerCanDrive"] = false,
			}, -- end of [16]
			[17] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "GAZ-66",
				["unitId"] = 441,
				["y"] = 305768.05459097,
				["x"] = 36846.024890129,
				["name"] = "Unit #176",
				["heading"] = 1.8798871541494,
				["playerCanDrive"] = false,
			}, -- end of [17]
			[18] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "GAZ-66",
				["unitId"] = 442,
				["y"] = 305739.47617453,
				["x"] = 36855.150355254,
				["name"] = "Unit #177",
				["heading"] = 1.8798761276137,
				["playerCanDrive"] = false,
			}, -- end of [18]
			[19] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Osa 9A33 ln",
				["unitId"] = 443,
				["y"] = 305710.89762808,
				["x"] = 36864.27541319,
				["name"] = "Unit #178",
				["heading"] = 1.8798618795929,
				["playerCanDrive"] = false,
			}, -- end of [19]
		}, -- end of ["units"]
		["y"] = 306224.7086263,
		["x"] = 36700.197414657,
		["name"] = "CONVOY_light-2",
		["start_time"] = 0,
	}, -- end of [CONVOY_light-2]
	["CONVOY_heavy-1"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
				[1] = 
				{
					[1] = 
					{
						["y"] = 305424.62758347,
						["x"] = 36955.598089493,
					}, -- end of [1]
					[2] = 
					{
						["y"] = 305424.62758347,
						["x"] = 36955.598089493,
					}, -- end of [2]
				}, -- end of [1]
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 20,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 302474.66874609,
					["x"] = 37949.084862931,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 9.25,
					["action"] = "On Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 44,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Tigr_233036",
				["unitId"] = 306,
				["y"] = 302474.66874609,
				["x"] = 37949.084862931,
				["name"] = "Unit #001",
				["heading"] = 2.8167434240319,
				["playerCanDrive"] = true,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BMP-2",
				["unitId"] = 307,
				["y"] = 302446.2306552,
				["x"] = 37958.638576264,
				["name"] = "Unit #002",
				["heading"] = 1.8791409262917,
				["playerCanDrive"] = true,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BMP-2",
				["unitId"] = 308,
				["y"] = 302417.77983982,
				["x"] = 37968.154265693,
				["name"] = "Unit #003",
				["heading"] = 1.8791601648452,
				["playerCanDrive"] = true,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BMP-2",
				["unitId"] = 309,
				["y"] = 302389.32114534,
				["x"] = 37977.64645492,
				["name"] = "Unit #004",
				["heading"] = 1.8792199564999,
				["playerCanDrive"] = true,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "BMP-2",
				["unitId"] = 310,
				["y"] = 302360.85771163,
				["x"] = 37987.124459484,
				["name"] = "Unit #005",
				["heading"] = 1.8792993044879,
				["playerCanDrive"] = true,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 311,
				["y"] = 302332.3918371,
				["x"] = 37996.595145932,
				["name"] = "Unit #006",
				["heading"] = 1.8793461925752,
				["playerCanDrive"] = true,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "BMP-2",
				["unitId"] = 312,
				["y"] = 302303.92538172,
				["x"] = 38006.064090677,
				["name"] = "Unit #007",
				["heading"] = 1.8793518558872,
				["playerCanDrive"] = true,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "BMP-2",
				["unitId"] = 313,
				["y"] = 302275.45890848,
				["x"] = 38015.532981929,
				["name"] = "Unit #008",
				["heading"] = 1.8792989748675,
				["playerCanDrive"] = true,
			}, -- end of [8]
			[9] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BMP-2",
				["unitId"] = 314,
				["y"] = 302246.99243469,
				["x"] = 38025.001873676,
				["name"] = "Unit #009",
				["heading"] = 1.8791699310651,
				["playerCanDrive"] = false,
			}, -- end of [9]
			[10] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "BMP-2",
				["unitId"] = 315,
				["y"] = 302218.52596171,
				["x"] = 38034.470765722,
				["name"] = "Unit #018",
				["heading"] = 1.8790240909102,
				["playerCanDrive"] = true,
			}, -- end of [10]
			[11] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "Osa 9A33 ln",
				["unitId"] = 316,
				["y"] = 302190.05948895,
				["x"] = 38043.93965839,
				["name"] = "Unit #019",
				["heading"] = 1.878900414256,
				["playerCanDrive"] = true,
			}, -- end of [11]
			[12] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "BTR_D",
				["unitId"] = 317,
				["y"] = 302161.59301643,
				["x"] = 38053.408551812,
				["name"] = "Unit #020",
				["heading"] = 1.8788157653291,
				["playerCanDrive"] = true,
			}, -- end of [12]
			[13] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "BTR_D",
				["unitId"] = 318,
				["y"] = 302133.12654527,
				["x"] = 38062.877449289,
				["name"] = "Unit #021",
				["heading"] = 1.8787606099854,
				["playerCanDrive"] = true,
			}, -- end of [13]
			[14] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BTR_D",
				["unitId"] = 319,
				["y"] = 302104.66007372,
				["x"] = 38072.346345632,
				["name"] = "Unit #022",
				["heading"] = 1.8787212155447,
				["playerCanDrive"] = true,
			}, -- end of [14]
			[15] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 320,
				["y"] = 302076.19360245,
				["x"] = 38081.815242795,
				["name"] = "Unit #023",
				["heading"] = 1.878691365128,
				["playerCanDrive"] = true,
			}, -- end of [15]
			[16] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 321,
				["y"] = 302047.72713132,
				["x"] = 38091.284140392,
				["name"] = "Unit #024",
				["heading"] = 1.8786679717346,
				["playerCanDrive"] = true,
			}, -- end of [16]
			[17] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 322,
				["y"] = 302019.26066022,
				["x"] = 38100.753038035,
				["name"] = "Unit #025",
				["heading"] = 1.8786490585146,
				["playerCanDrive"] = true,
			}, -- end of [17]
			[18] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Ural-375",
				["unitId"] = 323,
				["y"] = 301990.794189,
				["x"] = 38110.22193534,
				["name"] = "Unit #026",
				["heading"] = 1.8786338426242,
				["playerCanDrive"] = false,
			}, -- end of [18]
			[19] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Ural-375",
				["unitId"] = 324,
				["y"] = 301962.32771754,
				["x"] = 38119.69083192,
				["name"] = "Unit #027",
				["heading"] = 1.8786213481253,
				["playerCanDrive"] = false,
			}, -- end of [19]
			[20] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Osa 9A33 ln",
				["unitId"] = 325,
				["y"] = 301933.86124555,
				["x"] = 38129.159726928,
				["name"] = "Unit #028",
				["heading"] = 1.878611069685,
				["playerCanDrive"] = true,
			}, -- end of [20]
		}, -- end of ["units"]
		["y"] = 302474.66874609,
		["x"] = 37949.084862931,
		["name"] = "CONVOY_heavy-1",
		["start_time"] = 0,
	}, -- end of [CONVOY_heavy-1]
	["CONVOY_heavy-2"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
				[1] = 
				{
					[1] = 
					{
						["y"] = 304414.77669086,
						["x"] = 37276.865434798,
					}, -- end of [1]
					[2] = 
					{
						["y"] = 304414.77669086,
						["x"] = 37276.865434798,
					}, -- end of [2]
				}, -- end of [1]
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 22,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 301676.00477616,
					["x"] = 38214.931330529,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 9.25,
					["action"] = "On Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 70,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "ZSU-23-4 Shilka",
				["unitId"] = 405,
				["y"] = 301676.00477616,
				["x"] = 38214.931330529,
				["name"] = "Unit #140",
				["heading"] = 2.8116029773454,
				["playerCanDrive"] = true,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 406,
				["y"] = 301647.53942293,
				["x"] = 38224.39985035,
				["name"] = "Unit #141",
				["heading"] = 1.8782668196037,
				["playerCanDrive"] = true,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 407,
				["y"] = 301619.07294999,
				["x"] = 38233.868742469,
				["name"] = "Unit #142",
				["heading"] = 1.8784381995326,
				["playerCanDrive"] = true,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 408,
				["y"] = 301590.60647629,
				["x"] = 38243.337631008,
				["name"] = "Unit #143",
				["heading"] = 1.8785398765432,
				["playerCanDrive"] = true,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 409,
				["y"] = 301562.13998517,
				["x"] = 38252.806469144,
				["name"] = "Unit #144",
				["heading"] = 1.8783470362892,
				["playerCanDrive"] = true,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 410,
				["y"] = 301533.67338246,
				["x"] = 38262.27497114,
				["name"] = "Unit #145",
				["heading"] = 1.877645336169,
				["playerCanDrive"] = true,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 411,
				["y"] = 301505.20653901,
				["x"] = 38271.74274927,
				["name"] = "Unit #146",
				["heading"] = 1.877473355351,
				["playerCanDrive"] = true,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 412,
				["y"] = 301476.73925518,
				["x"] = 38281.209202938,
				["name"] = "Unit #147",
				["heading"] = 1.8773984159304,
				["playerCanDrive"] = true,
			}, -- end of [8]
			[9] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Osa 9A33 ln",
				["unitId"] = 413,
				["y"] = 301448.27113757,
				["x"] = 38290.673148291,
				["name"] = "Unit #148",
				["heading"] = 1.8773291465698,
				["playerCanDrive"] = false,
			}, -- end of [9]
			[10] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 414,
				["y"] = 301419.80110324,
				["x"] = 38300.131321826,
				["name"] = "Unit #149",
				["heading"] = 1.8772303862861,
				["playerCanDrive"] = true,
			}, -- end of [10]
			[11] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 415,
				["y"] = 301391.32811351,
				["x"] = 38309.580594062,
				["name"] = "Unit #150",
				["heading"] = 1.8769893046105,
				["playerCanDrive"] = true,
			}, -- end of [11]
			[12] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 416,
				["y"] = 301362.85730293,
				["x"] = 38319.036426189,
				["name"] = "Unit #151",
				["heading"] = 1.8757472778833,
				["playerCanDrive"] = true,
			}, -- end of [12]
			[13] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 417,
				["y"] = 301334.39176906,
				["x"] = 38328.508118369,
				["name"] = "Unit #152",
				["heading"] = 1.8730157673716,
				["playerCanDrive"] = true,
			}, -- end of [13]
			[14] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 418,
				["y"] = 301305.92821931,
				["x"] = 38337.98579116,
				["name"] = "Unit #153",
				["heading"] = 1.8708689503781,
				["playerCanDrive"] = true,
			}, -- end of [14]
			[15] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 419,
				["y"] = 301277.46511035,
				["x"] = 38347.464790578,
				["name"] = "Unit #154",
				["heading"] = 1.8679285264736,
				["playerCanDrive"] = true,
			}, -- end of [15]
			[16] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 420,
				["y"] = 301249.00182235,
				["x"] = 38356.943252237,
				["name"] = "Unit #155",
				["heading"] = 1.8637875013618,
				["playerCanDrive"] = true,
			}, -- end of [16]
			[17] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 421,
				["y"] = 301220.53792841,
				["x"] = 38366.419893654,
				["name"] = "Unit #156",
				["heading"] = 1.8575911919256,
				["playerCanDrive"] = true,
			}, -- end of [17]
			[18] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 422,
				["y"] = 301192.07330281,
				["x"] = 38375.894337225,
				["name"] = "Unit #157",
				["heading"] = 1.8495312285784,
				["playerCanDrive"] = true,
			}, -- end of [18]
			[19] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 423,
				["y"] = 301163.60811559,
				["x"] = 38385.367093434,
				["name"] = "Unit #158",
				["heading"] = 1.846427458863,
				["playerCanDrive"] = true,
			}, -- end of [19]
			[20] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Osa 9A33 ln",
				["unitId"] = 424,
				["y"] = 301135.14239031,
				["x"] = 38394.838232731,
				["name"] = "Unit #159",
				["heading"] = 1.8562698946798,
				["playerCanDrive"] = true,
			}, -- end of [20]
		}, -- end of ["units"]
		["y"] = 301676.00477616,
		["x"] = 38214.931330529,
		["name"] = "CONVOY_heavy-2",
		["start_time"] = 0,
	}, -- end of [CONVOY_heavy-2]
	["CONVOY_heavy-3"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["taskSelected"] = true,
		["route"] = 
		{
			["spans"] = 
			{
				[1] = 
				{
					[1] = 
					{
						["y"] = 304414.77669086,
						["x"] = 37276.865434798,
					}, -- end of [1]
					[2] = 
					{
						["y"] = 304414.77669086,
						["x"] = 37276.865434798,
					}, -- end of [2]
				}, -- end of [1]
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 22,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = 300752.32117481,
					["x"] = 38522.131438127,
					["name"] = "",
					["ETA_locked"] = true,
					["speed"] = 9.25,
					["action"] = "On Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 0,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 9,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 661,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Tigr_233036",
				["unitId"] = 1729,
				["y"] = 300752.32117481,
				["x"] = 38522.131438127,
				["name"] = "CONVOY_heavy-3-1",
				["heading"] = 2.8138465283448,
				["playerCanDrive"] = false,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "UAZ-469",
				["unitId"] = 1730,
				["y"] = 300723.83993312,
				["x"] = 38531.552138367,
				["name"] = "CONVOY_heavy-3-2",
				["heading"] = 1.8782668196037,
				["playerCanDrive"] = false,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "ATZ-5",
				["unitId"] = 1731,
				["y"] = 300695.34725822,
				["x"] = 38540.941758892,
				["name"] = "CONVOY_heavy-3-3",
				["heading"] = 1.8784381995326,
				["playerCanDrive"] = false,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 1732,
				["y"] = 300666.83995151,
				["x"] = 38550.286755566,
				["name"] = "CONVOY_heavy-3-4",
				["heading"] = 1.8785398765432,
				["playerCanDrive"] = true,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "ATZ-5",
				["unitId"] = 1733,
				["y"] = 300638.31942473,
				["x"] = 38559.591410069,
				["name"] = "CONVOY_heavy-3-5",
				["heading"] = 1.8783470362892,
				["playerCanDrive"] = false,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-90",
				["unitId"] = 1734,
				["y"] = 300609.79426423,
				["x"] = 38568.882008205,
				["name"] = "CONVOY_heavy-3-6",
				["heading"] = 1.877645336169,
				["playerCanDrive"] = true,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-90",
				["unitId"] = 1735,
				["y"] = 300581.28128861,
				["x"] = 38578.209647558,
				["name"] = "CONVOY_heavy-3-7",
				["heading"] = 1.877473355351,
				["playerCanDrive"] = true,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-90",
				["unitId"] = 1736,
				["y"] = 300552.81543767,
				["x"] = 38587.677441908,
				["name"] = "CONVOY_heavy-3-8",
				["heading"] = 1.8773984159304,
				["playerCanDrive"] = true,
			}, -- end of [8]
			[9] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Osa 9A33 ln",
				["unitId"] = 1737,
				["y"] = 300524.41541783,
				["x"] = 38597.340409349,
				["name"] = "CONVOY_heavy-3-9",
				["heading"] = 1.8773291465698,
				["playerCanDrive"] = false,
			}, -- end of [9]
			[10] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-90",
				["unitId"] = 1738,
				["y"] = 300496.03015748,
				["x"] = 38607.050069872,
				["name"] = "CONVOY_heavy-3-10",
				["heading"] = 1.8772303862861,
				["playerCanDrive"] = true,
			}, -- end of [10]
			[11] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-90",
				["unitId"] = 1739,
				["y"] = 300467.61997942,
				["x"] = 38616.685845949,
				["name"] = "CONVOY_heavy-3-11",
				["heading"] = 1.8769893046105,
				["playerCanDrive"] = true,
			}, -- end of [11]
			[12] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-90",
				["unitId"] = 1740,
				["y"] = 300439.18369934,
				["x"] = 38626.244456237,
				["name"] = "CONVOY_heavy-3-12",
				["heading"] = 1.8757472778833,
				["playerCanDrive"] = true,
			}, -- end of [12]
			[13] = 
			{
				["skill"] = "Average",
				["coldAtStart"] = false,
				["type"] = "T-90",
				["unitId"] = 1741,
				["y"] = 300410.73327937,
				["x"] = 38635.761302478,
				["name"] = "CONVOY_heavy-3-13",
				["heading"] = 1.8730157673716,
				["playerCanDrive"] = true,
			}, -- end of [13]
			[14] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 1742,
				["y"] = 300382.2748848,
				["x"] = 38645.254390186,
				["name"] = "CONVOY_heavy-3-14",
				["heading"] = 1.8708689503781,
				["playerCanDrive"] = true,
			}, -- end of [14]
			[15] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 1743,
				["y"] = 300353.81181696,
				["x"] = 38654.733493855,
				["name"] = "CONVOY_heavy-3-15",
				["heading"] = 1.8679285264736,
				["playerCanDrive"] = true,
			}, -- end of [15]
			[16] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 1744,
				["y"] = 300325.34623247,
				["x"] = 38664.205051307,
				["name"] = "CONVOY_heavy-3-16",
				["heading"] = 1.8637875013618,
				["playerCanDrive"] = true,
			}, -- end of [16]
			[17] = 
			{
				["skill"] = "Excellent",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 1745,
				["y"] = 300296.87980238,
				["x"] = 38673.674073212,
				["name"] = "CONVOY_heavy-3-17",
				["heading"] = 1.8575911919256,
				["playerCanDrive"] = true,
			}, -- end of [17]
			[18] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 1746,
				["y"] = 300268.41332819,
				["x"] = 38683.142961584,
				["name"] = "CONVOY_heavy-3-18",
				["heading"] = 1.8495312285784,
				["playerCanDrive"] = true,
			}, -- end of [18]
			[19] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "T-90",
				["unitId"] = 1747,
				["y"] = 300239.94685341,
				["x"] = 38692.611848221,
				["name"] = "CONVOY_heavy-3-19",
				["heading"] = 1.846427458863,
				["playerCanDrive"] = true,
			}, -- end of [19]
			[20] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Osa 9A33 ln",
				["unitId"] = 1748,
				["y"] = 300211.48037893,
				["x"] = 38702.080735718,
				["name"] = "CONVOY_heavy-3-20",
				["heading"] = 1.8562698946798,
				["playerCanDrive"] = true,
			}, -- end of [20]
		}, -- end of ["units"]
		["y"] = 300752.32117481,
		["x"] = 38522.131438127,
		["name"] = "CONVOY_heavy-3",
		["start_time"] = 0,
	}, -- end of [CONVOY_heavy-3]
	------------------------ ARMOUR ------------------------
	["ARMOUR_Heavy_01"] = {
		["category"] = Group.Category.GROUND,
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 5,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = -855879.72750057,
					["x"] = 529013.61212327,
					["ETA_locked"] = true,
					["speed"] = 5.5555555555556,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 17479,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 20624,
				["y"] = -855879.72750057,
				["x"] = 529013.61212327,
				["name"] = "Ground-1-1",
				["heading"] = 0,
				["playerCanDrive"] = true,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 20625,
				["y"] = -855866.62702883,
				["x"] = 529030.53356593,
				["name"] = "Ground-1-2",
				["heading"] = 0.97738438111682,
				["playerCanDrive"] = true,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "T-55",
				["unitId"] = 20626,
				["y"] = -855890.28065836,
				["x"] = 528999.41994555,
				["name"] = "Ground-1-3",
				["heading"] = 5.6723200689816,
				["playerCanDrive"] = true,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 20627,
				["y"] = -855865.56171714,
				["x"] = 529001.79287326,
				["name"] = "Ground-1-4",
				["heading"] = 3.3161255787892,
				["playerCanDrive"] = true,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "tt_KORD",
				["unitId"] = 20628,
				["y"] = -855874.59389209,
				["x"] = 528993.91250137,
				["name"] = "Ground-1-5",
				["heading"] = 2.3038346126325,
				["playerCanDrive"] = true,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 20629,
				["y"] = -855885.85814016,
				["x"] = 529034.78150396,
				["name"] = "Ground-1-6",
				["heading"] = 2.8448866807508,
				["playerCanDrive"] = true,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "GAZ-66",
				["unitId"] = 20630,
				["y"] = -855965.20391893,
				["x"] = 529067.16680314,
				["name"] = "Ground-1-7",
				["heading"] = 1.5707963267949,
				["playerCanDrive"] = false,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "HL_DSHK",
				["unitId"] = 20631,
				["y"] = -855902.76563999,
				["x"] = 529013.87617546,
				["name"] = "Ground-1-8",
				["heading"] = 1.7627825445143,
				["playerCanDrive"] = true,
			}, -- end of [8]
		}, -- end of ["units"]
		["y"] = -855879.72750057,
		["x"] = 529013.61212327,
		["name"] = "ARMOUR_Heavy_01",
		["start_time"] = 0,
	}, -- end of ["ARMOUR_Heavy_01"]
	["ARMOUR_Heavy_02"] = {
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 17,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = -856971.79320205,
					["x"] = 519137.53969249,
					["ETA_locked"] = true,
					["speed"] = 5.5555555555556,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 17480,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BRDM-2",
				["unitId"] = 20632,
				["y"] = -856971.79320205,
				["x"] = 519137.53969249,
				["name"] = "Ground-2-1",
				["heading"] = 0,
				["playerCanDrive"] = true,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BRDM-2",
				["unitId"] = 20633,
				["y"] = -856957.0245358,
				["x"] = 519120.92494297,
				["name"] = "Ground-2-2",
				["heading"] = 2.460914245312,
				["playerCanDrive"] = true,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Ural-375 ZU-23",
				["unitId"] = 20634,
				["y"] = -856986.61144471,
				["x"] = 519118.0589405,
				["name"] = "Ground-2-3",
				["heading"] = 3.5604716740684,
				["playerCanDrive"] = true,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "HL_KORD",
				["unitId"] = 20635,
				["y"] = -856975.48536861,
				["x"] = 519158.76965022,
				["name"] = "Ground-2-4",
				["heading"] = 6.2308254296198,
				["playerCanDrive"] = true,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "HL_DSHK",
				["unitId"] = 20636,
				["y"] = -856971.61125105,
				["x"] = 519123.71141677,
				["name"] = "Ground-2-5",
				["heading"] = 0.78539816339745,
				["playerCanDrive"] = true,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "SAU Gvozdika",
				["unitId"] = 20637,
				["y"] = -856993.2581859,
				["x"] = 519139.66614032,
				["name"] = "Ground-2-6",
				["heading"] = 4.2411500823462,
				["playerCanDrive"] = true,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "ATMZ-5",
				["unitId"] = 20638,
				["y"] = -856942.59713264,
				["x"] = 519136.08987622,
				["name"] = "Ground-2-7",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = false,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "ATMZ-5",
				["unitId"] = 20639,
				["y"] = -856951.90204602,
				["x"] = 519136.63722407,
				["name"] = "Ground-2-8",
				["heading"] = 3.0194196059502,
				["playerCanDrive"] = false,
			}, -- end of [8]
		}, -- end of ["units"]
		["y"] = -856971.79320205,
		["x"] = 519137.53969249,
		["name"] = "ARMOUR_Heavy_02",
		["start_time"] = 0,
	}, -- end of ["ARMOUR_Heavy_02"]
	["ARMOUR_Heavy_03"] = {
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 2,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = -837931.86510234,
					["x"] = 530010.71558983,
					["ETA_locked"] = true,
					["speed"] = 5.5555555555556,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 17481,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 20640,
				["y"] = -837931.86510234,
				["x"] = 530010.71558983,
				["name"] = "Ground-3-1",
				["heading"] = 0,
				["playerCanDrive"] = true,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BMP-3",
				["unitId"] = 20641,
				["y"] = -837694.45951506,
				["x"] = 529963.23447238,
				["name"] = "Ground-3-2",
				["heading"] = 5.1836278784232,
				["playerCanDrive"] = true,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "tt_DSHK",
				["unitId"] = 20642,
				["y"] = -837940.282535,
				["x"] = 530001.49525613,
				["name"] = "Ground-3-3",
				["heading"] = 5.6723200689816,
				["playerCanDrive"] = true,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 20643,
				["y"] = -837913.88137077,
				["x"] = 529992.00732741,
				["name"] = "Ground-3-4",
				["heading"] = 2.4434609527921,
				["playerCanDrive"] = true,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "T-55",
				["unitId"] = 20644,
				["y"] = -837932.05402184,
				["x"] = 529990.0113746,
				["name"] = "Ground-3-5",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = true,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 20645,
				["y"] = -837945.19623982,
				["x"] = 530025.86322085,
				["name"] = "Ground-3-6",
				["heading"] = 4.9741883681838,
				["playerCanDrive"] = true,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Ural-4320T",
				["unitId"] = 20646,
				["y"] = -837955.59158367,
				["x"] = 529996.47266608,
				["name"] = "Ground-3-7",
				["heading"] = 3.1415926535898,
				["playerCanDrive"] = false,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Ural-4320T",
				["unitId"] = 20647,
				["y"] = -837915.47240191,
				["x"] = 530011.51736719,
				["name"] = "Ground-3-8",
				["heading"] = 2.3561944901923,
				["playerCanDrive"] = false,
			}, -- end of [8]
		}, -- end of ["units"]
		["y"] = -837931.86510234,
		["x"] = 530010.71558983,
		["name"] = "ARMOUR_Heavy_03",
		["start_time"] = 0,
	}, -- end of ["ARMOUR_Heavy_03"]
	["ARMOUR_Heavy_04"] = {
		["visible"] = false,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["route"] = 
		{
			["spans"] = 
			{
			}, -- end of ["spans"]
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 6,
					["type"] = "Turning Point",
					["ETA"] = 0,
					["alt_type"] = "BARO",
					["formation_template"] = "",
					["y"] = -839546.22309583,
					["x"] = 518615.24740048,
					["ETA_locked"] = true,
					["speed"] = 4,
					["action"] = "Off Road",
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
			["routeRelativeTOT"] = true,
		}, -- end of ["route"]
		["groupId"] = 17482,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 20648,
				["y"] = -839546.22309583,
				["x"] = 518615.24740048,
				["name"] = "Ground-4-1",
				["heading"] = 0.66322511575785,
				["playerCanDrive"] = true,
			}, -- end of [1]
			[2] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "BTR-80",
				["unitId"] = 20649,
				["y"] = -839533.12262409,
				["x"] = 518632.16884315,
				["name"] = "Ground-4-2",
				["heading"] = 0.97738438111682,
				["playerCanDrive"] = true,
			}, -- end of [2]
			[3] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "T-55",
				["unitId"] = 20650,
				["y"] = -839532.81335054,
				["x"] = 518594.95087163,
				["name"] = "Ground-4-3",
				["heading"] = 2.3212879051525,
				["playerCanDrive"] = true,
			}, -- end of [3]
			[4] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 20651,
				["y"] = -839526.86652147,
				["x"] = 518602.65482388,
				["name"] = "Ground-4-4",
				["heading"] = 1.6231562043547,
				["playerCanDrive"] = true,
			}, -- end of [4]
			[5] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "Paratrooper RPG-16",
				["unitId"] = 20652,
				["y"] = -839529.09756046,
				["x"] = 518616.115634,
				["name"] = "Ground-4-5",
				["heading"] = 0,
				["playerCanDrive"] = false,
			}, -- end of [5]
			[6] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "T-72B",
				["unitId"] = 20653,
				["y"] = -839548.78876042,
				["x"] = 518627.57694817,
				["name"] = "Ground-4-6",
				["heading"] = 4.9043751981041,
				["playerCanDrive"] = true,
			}, -- end of [6]
			[7] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "HL_DSHK",
				["unitId"] = 20654,
				["y"] = -839559.37643921,
				["x"] = 518602.55557793,
				["name"] = "Ground-4-7",
				["heading"] = 4.1189770347066,
				["playerCanDrive"] = true,
			}, -- end of [7]
			[8] = 
			{
				["skill"] = "Random",
				["coldAtStart"] = false,
				["type"] = "GAZ-66",
				["unitId"] = 20655,
				["y"] = -839538.27733095,
				["x"] = 518610.96669662,
				["name"] = "Ground-4-8",
				["heading"] = 0.62831853071796,
				["playerCanDrive"] = false,
			}, -- end of [8]
		}, -- end of ["units"]
		["y"] = -839546.22309583,
		["x"] = 518615.24740048,
		["name"] = "ARMOUR_Heavy_04",
		["start_time"] = 0,
	}, -- end of ["ARMOUR_Heavy_04"]	
    ------------------------ ARTILLERY ------------------------
	------------------------ INFANTRY ------------------------
	------------------------ SHIP ------------------------

}  
