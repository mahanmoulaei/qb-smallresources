Config = {}
Config.MaxWidth = 5.0
Config.MaxHeight = 5.0
Config.MaxLength = 5.0
Config.DamageNeeded = 100.0
Config.IdleCamera = true
Config.EnableProne = true
Config.JointEffectTime = 60
Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25
Config.DefaultPrice = 20 -- Default price for the carwash
Config.DirtLevel = 0.1 -- Threshold for the dirt level to be counted as dirty
Config.DisableAmbience = false -- Disabled distance sirens, distance car alarms, etc
Config.RemoveWeaponDrops = true

ConsumablesEat = {
    ["sandwich"] = math.random(35, 54),
    ["tosti"] = math.random(40, 50),
    ["twerks_candy"] = math.random(35, 54),
    ["snikkel_candy"] = math.random(40, 50),
}

ConsumablesDrink = {
    ["water_bottle"] = math.random(35, 54),
    ["kurkakola"] = math.random(35, 54),
    ["coffee"] = math.random(40, 50),
}

ConsumablesAlcohol = {
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
}

ConsumablesFireworks = {
    "firework1",
    "firework2",
    "firework3",
    "firework4"
}

Config.Shuff = {
	Command = "shuff",
	Description = "Temporarily disable seat switching protection"
}

Config.Seat = {
	Command = "seat",
	Description = "Switch seats in the current vehicle",
	Extra = "Avaz kardane sandali tuye mashin. 1 = raanande, 2 = shaagerd, 3 = aghab chap, 4 = aghab rast, ..."
}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_AMBULANCE",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`SHAMAL`] = true,
    [`LUXOR`] = true,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`BUZZARD2`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`FIRETRUK`] = true,
    [`MULE`] = true,
    [`MAVERICK`] = true,
    [`BLIMP`] = true,
    [`AIRTUG`] = true,
    [`CAMPER`] = true,
    [`HYDRA`] = true,
    [`OPPRESSOR`] = true,
    [`technical3`] = true,
    [`insurgent3`] = true,
    [`apc`] = true,
    [`tampa3`] = true,
    [`trailersmall2`] = true,
    [`halftrack`] = true,
    [`hunter`] = true,
    [`vigilante`] = true,
    [`akula`] = true,
    [`barrage`] = true,
    [`khanjali`] = true,
    [`caracara`] = true,
    [`blimp3`] = true,
    [`menacer`] = true,
    [`oppressor2`] = true,
    [`scramjet`] = true,
    [`strikeforce`] = true,
    [`cerberus`] = true,
    [`cerberus2`] = true,
    [`cerberus3`] = true,
    [`scarab`] = true,
    [`scarab2`] = true,
    [`scarab3`] = true,
    [`rrocket`] = true,
    [`ruiner2`] = true,
    [`deluxo`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.Teleports = {
    --Elevator @ labs
    [1] = {
        [1] = {
            coords = vector4(3540.74, 3675.59, 20.99, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(3540.74, 3675.59, 28.11, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },

    },
    --Coke Processing Enter/Exit
    [2] = {
        [1] = {
            coords = vector4(909.49, -1589.22, 30.51, 92.24),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Coke Processing'
        },
        [2] = {
            coords = vector4(1088.81, -3187.57, -38.99, 181.7),
            ["AllowVehicle"] = false,
            drawText = '[E] Leave'
        },
    },
}

Config.CarWash = { -- carwash
    [1] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(25.29, -1391.96, 29.33),
    },
    [2] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(174.18, -1736.66, 29.35),
    },
    [3] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-74.56, 6427.87, 31.44),
    },
    [4] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(1363.22, 3592.7, 34.92),
    },
    [5] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-699.62, -932.7, 19.01),
    }
}

Config.Telescope = {}
Config.Telescope.Targeting = {
	Icon = "fas fa-binoculars",
	Label = "Use Telescope"
}

-- Localization
Config.Telescope.Localization = {
	HelpText = "Press ~INPUT_PICKUP~ to look through the telescope",
	NonFound = "No telescope was found!",
	TelescopeInUse = "Someone else is already using the telescope!",
	ToFarAway = "You went to far away!",
	Exit = "Exit Telescope"
}

-- Other
Config.Telescope.UseDistanceThread = false -- set false for more optimization

Config.Telescope.MaxInteractionDist = 2.0
Config.Telescope.MaxDetectionDist = 6.0

Config.Telescope.MovementSpeed = {
	Keyboard = 2.75,
	Controller = 1.0
}

Config.Telescope.Zoom = {
	Max = 100.0,
	Min = 2.0,
	Speed = 5.0
}

Config.Telescope.Animations = {
	["default"] = {
		enter = "enter_front",
		enterTime = 1500,
		exit = "exit_front",
		idle = "idle"
	},
	["public"] = {
		enter = "public_enter_front",
		enterTime = 1500,
		exit = "public_exit_front",
		idle = "public_idle"
	},
	["upright"] = {
		enter = "upright_enter_front",
		enterTime = 2500,
		exit = "upright_exit_front",
		idle = "upright_idle"
	}
}

Config.Telescope.Models = {
	[1186047406] = { MaxHorizontal = 55.0, MaxVertical = 20.0, offset = vector3(-0.03, 0.96, 0.0), headingOffset = 180.0, animation = "public", cameraOffset = vector3(0.0, -0.5, 0.7), scaleform = "OBSERVATORY_SCOPE" }, -- prop_telescope_01 (Public)
	[844159446] = { MaxHorizontal = 55.0, MaxVertical = 20.0, offset = vector3(0.02, -0.78, 1.0), animation = "upright", cameraOffset = vector3(0.0, 0.2, 1.7), scaleform = "BINOCULARS" }, -- prop_telescope (Mount Chilliad)
	[-656927072] = { MaxHorizontal = 55.0, MaxVertical = 35.0, offset = vector3(1.14, 0.0, 0.0), headingOffset = 90.0, animation = "default", cameraOffset = vector3(-0.25, 0.0, 1.3), scaleform = "OBSERVATORY_SCOPE" }, -- prop_t_telescope_01b (Domestic)
	[1930051531] = { MaxHorizontal = 55.0, MaxVertical = 20.0, offset = vector3(-0.03, 0.96, 0.0), headingOffset = 180.0, animation = "public", cameraOffset = vector3(0.0, -0.5, 0.7), scaleform = "BINOCULARS" }, -- xs_prop_arena_telescope_01
}

-- This list is only for the help text. If you only use the command or a 3rd eye then this list is not needed.
Config.Telescope.Telescopes = {
	-- Public --
	-- Galileo Observatory
	{ model = 1186047406, coords = vector3(-490.6682, 1095.387, 319.9773) },
	{ model = 1186047406, coords = vector3(-487.7137, 1094.643, 319.9769) },
	{ model = 1186047406, coords = vector3(-466.6990, 1088.443, 327.5582) },
	{ model = 1186047406, coords = vector3(-452.7089, 1082.787, 332.4135) },
	{ model = 1186047406, coords = vector3(-457.2304, 1101.254, 332.4135) },
	{ model = 1186047406, coords = vector3(-451.7881, 1099.751, 332.4135) },
	{ model = 1186047406, coords = vector3(-415.1138, 1089.622, 332.4135) },
	{ model = 1186047406, coords = vector3(-409.6714, 1088.119, 332.4135) },
	{ model = 1186047406, coords = vector3(-401.0349, 1051.714, 323.721) },

	-- Senora National Park
	{ model = 1186047406, coords = vector3(2615.951, 3667.427, 101.9804) },
	{ model = 1186047406, coords = vector3(2613.160, 3662.852, 101.9836) },

	-- Del Perro Beach
	{ model = 1186047406, coords = vector3(-1722.135, -1014.014, 5.067778) },
	{ model = 1186047406, coords = vector3(-1719.312, -1016.231, 5.140132) },
	{ model = 1186047406, coords = vector3(-1677.599, -989.2823, 7.260609) },
	{ model = 1186047406, coords = vector3(-1682.565, -1005.748, 7.264191) },
	{ model = 1186047406, coords = vector3(-1704.427, -1058.541, 12.89529) }, -- This one is on the pier but is much closer to the beach ones

	-- Del Perro Pier
	{ model = 1186047406, coords = vector3(-1839.998, -1166.770, 12.8953) },
	{ model = 1186047406, coords = vector3(-1852.887, -1182.131, 12.8953) },
	{ model = 1186047406, coords = vector3(-1865.726, -1197.432, 12.8953) },
	{ model = 1186047406, coords = vector3(-1879.108, -1213.380, 12.898) },
	{ model = 1186047406, coords = vector3(-1867.321, -1223.522, 12.898) },
	{ model = 1186047406, coords = vector3(-1856.398, -1232.756, 12.91837) },
	{ model = 1186047406, coords = vector3(-1838.830, -1247.536, 12.91732) },
	{ model = 1186047406, coords = vector3(-1823.529, -1260.374, 12.918) },
	{ model = 1186047406, coords = vector3(-1826.419, -1270.177, 8.503754) },
	{ model = 1186047406, coords = vector3(-1841.719, -1257.338, 8.5031) },
	{ model = 1186047406, coords = vector3(-1857.081, -1244.448, 8.50415) },

	-- Hill Valley Church (West Eclipse Boulevard)
	{ model = 1186047406, coords = vector3(-1810.320, -129.073, 78.66142) },

	-- Public Binocular --
	-- Mount Chilliad
	{ model = 844159446, coords = vector3(499.8335, 5602.674, 796.9147) },
	{ model = 844159446, coords = vector3(503.3787, 5602.383, 796.9147) },

	-- Chumash
	{ model = 844159446, coords = vector3(-3259.545, 982.4403, 11.59678) }, -- Both are at the base of the pier
	{ model = 844159446, coords = vector3(-3259.456, 987.225, 11.59678) },

	-- Domestics --
	-- Route 68/Harmony
	{ model = -656927072, coords = vector3(930.242, 2858.837, 59.8827) },
	{ model = -656927072, coords = vector3(930.703, 2869.554, 60.5036) },

	-- Houses/Apartment
	{ model = -656927072, coords = vector3(13.73517, 528.4813, 174.2378) }, -- Franklin
	{ model = -656927072, coords = vector3(-667.9016, 845.2842, 224.6442) }, -- 6085 Milton Road
	{ model = -656927072, coords = vector3(-1018.618, 658.7, 160.8932) }, -- 2884 Hillcrest Avenue (Martin Madrazo's house)

	{ model = -656927072, coords = vector3(-130.2234, -645.0045, 168.4174) }, -- Apartment (Arcadius Business Center)
	{ model = -656927072, coords = vector3(-1473.417, -543.9343, 73.04141) }, -- Apartment (Marathon Ave/North Rockford Drive)
	{ model = -656927072, coords = vector3(-15.94042, -580.2412, 79.02798) }, -- Apartment (Integrity)

	-- Other apartments
	{ model = -656927072, coords = vector3(-774.7643, 604.7314, 143.3283) },
	{ model = -656927072, coords = vector3(-662.9636, 582.7271, 144.5675) },
	{ model = -656927072, coords = vector3(-570.1771, 640.1734, 145.0294) },
	{ model = -656927072, coords = vector3(-851.1698, 671.2417, 152.0503) },
	{ model = -656927072, coords = vector3(-1282.699, 429.0291, 97.09206) },
	{ model = -656927072, coords = vector3(-162.235, 479.5696, 136.8414) },
	{ model = -656927072, coords = vector3(126.4659, 540.1469, 183.4945) },
	{ model = -656927072, coords = vector3(327.7837, 421.3323, 148.5685) },
	{ model = -656927072, coords = vector3(375.5592, 401.9527, 145.0975) },
	{ model = -656927072, coords = vector3(-12.571, -581.1641, 98.44279) },
	{ model = -656927072, coords = vector3(-44.62522, -578.5092, 88.32477) },
	{ model = -656927072, coords = vector3(-260.373, -941.1046, 75.44127) },
	{ model = -656927072, coords = vector3(-282.813, -967.2342, 90.72084) },
	{ model = -656927072, coords = vector3(-880.5233, -442.9293, 124.7444) },
	{ model = -656927072, coords = vector3(-918.014, -446.9025, 119.817) },
	{ model = -656927072, coords = vector3(-901.0436, -425.5372, 93.67105) },
	{ model = -656927072, coords = vector3(-912.1877, -386.501, 113.2719) },
	{ model = -656927072, coords = vector3(-895.6904, -368.2518, 83.69043) },
	{ model = -656927072, coords = vector3(-934.3463, -383.0493, 107.6502) },
	{ model = -656927072, coords = vector3(-1475.581, -539.8524, 55.13894) },
	{ model = -656927072, coords = vector3(-1475.581, -539.8524, 67.76656) },
	{ model = -656927072, coords = vector3(-1557.817, -580.1621, 108.1199) },
	{ model = -656927072, coords = vector3(-1368.97, -468.4037, 71.63905) },
	{ model = -656927072, coords = vector3(-625.4163, 59.26805, 106.237) },
	{ model = -656927072, coords = vector3(-612.4269, 39.68902, 97.1973) },
	{ model = -656927072, coords = vector3(-575.95, 48.04946, 91.83607) },
	{ model = -656927072, coords = vector3(-803.17, 334.2904, 205.8309) },
	{ model = -656927072, coords = vector3(-775.646, 342.9091, 210.9943) },
	{ model = -656927072, coords = vector3(-789.0805, 343.0732, 186.7107) },
	{ model = -656927072, coords = vector3(-803.63, 343.6826, 158.2115) },
	{ model = -656927072, coords = vector3(-752.8467, 322.9657, 175.0137) },

	-- DLC: Los Santos The Contract
	{ model = -656927072, coords = vector3(-1017.182, -436.4265, 67.2585) },
	{ model = -656927072, coords = vector3(-1011.75, -435.0921, 72.0585) },
	{ model = -656927072, coords = vector3(380.2575, -69.22025, 106.7604) },
	{ model = -656927072, coords = vector3(384.9384, -72.2832, 111.5604) },
	{ model = -656927072, coords = vector3(-994.3716, -760.9808, 65.29156) },
	{ model = -656927072, coords = vector3(-993.0943, -755.5347, 70.09155) },
	{ model = -656927072, coords = vector3(-588.0742, -706.9901, 116.4024) },
	{ model = -656927072, coords = vector3(-593.5171, -705.6987, 121.2024) },
}