
-- Hiae:"ez owned"

local lua_name = "Share.blue"
local lua_color = {r = 255, g = 255, b = 255}
local script_build = "Alpha"

local function try_require(module, msg)
    local success, result = pcall(require, module)
    if success then return result else return error(msg) end
end

local getUi = ui.get
local setUi = ui.set
local refUi = ui.reference
local multiRefUi = ui.multiReference

local gram_create = function(value, count) local gram = { }; for i=1, count do gram[i] = value; end return gram; end
local gram_update = function(tab, value, forced) local new_tab = tab; if forced or new_tab[#new_tab] ~= value then table.insert(new_tab, value); table.remove(new_tab, 1); end; tab = new_tab; end
local get_average = function(tab) local elements, sum = 0, 0; for k, v in pairs(tab) do sum = sum + v; elements = elements + 1; end return sum / elements; end
local images = try_require("gamesense/images", "Download images library: https://gamesense.pub/forums/viewtopic.php?id=22917")
local bit = try_require("bit")
local pui = try_require("gamesense/pui")
local c_entity = require("gamesense/entity")
local base64 = try_require("gamesense/base64", "Download base64 encode/decode library: https://gamesense.pub/forums/viewtopic.php?id=21619")
local antiaim_funcs = try_require("gamesense/antiaim_funcs", "Download anti-aim functions library: https://gamesense.pub/forums/viewtopic.php?id=29665")
local ffi = try_require("ffi", "Failed to require FFI, please make sure Allow unsafe scripts is enabled!")
local vector = try_require("vector", "Missing vector")
local http = try_require("gamesense/http", "Download HTTP library: https://gamesense.pub/forums/viewtopic.php?id=21619")
local clipboard = try_require("gamesense/clipboard", "Download Clipboard library: https://gamesense.pub/forums/viewtopic.php?id=28678")
local ent = try_require("gamesense/entity", "Download Entity Object library: https://gamesense.pub/forums/viewtopic.php?id=27529")
local csgo_weapons = try_require("gamesense/csgo_weapons", "Download CS:GO weapon data library: https://gamesense.pub/forums/viewtopic.php?id=18807")
local steamworks = try_require("gamesense/steamworks") or error('Missing https://gamesense.pub/forums/viewtopic.php?id=26526')

function multiRefUi(tab, groupbox, name)
    local ref1, ref2, ref3 = refUi(tab, groupbox, name)
    return { ref1, ref2, ref3 }
end


local whydoidothis = 0
local banner_img
local banner_url = "https://Leaks.s7ae.cc/res/hot.png"

local filesystem = {} do
	local m, i = "filesystem_stdio.dll", "VFileSystem017"
	local add_search_path		= vtable_bind(m, i, 11, "void (__thiscall*)(void*, const char*, const char*, int)")
	local remove_search_path	= vtable_bind(m, i, 12, "bool (__thiscall*)(void*, const char*, const char*)")

	local get_game_directory = vtable_bind("engine.dll", "VEngineClient014", 36, "const char*(__thiscall*)(void*)")
	filesystem.game_directory = string.sub(ffi.string(get_game_directory()), 1, -5)

	add_search_path(filesystem.game_directory, "ROOT_PATH", 0)
	defer(function () remove_search_path(filesystem.game_directory, "ROOT_PATH") end)

	filesystem.create_directory	= vtable_bind(m, i, 22, "void (__thiscall*)(void*, const char*, const char*)")
end

filesystem.create_directory("Shareblue", "ROOT_PATH")

local bannerFile = readfile("shareblue/hot.png")

if not bannerFile then
    http.get(banner_url, function(s, r)
        if s and r.status == 200 then
            banner_img = images.load(r.body)
            writefile("shareblue/hot.png", r.body)
        else
            error("Failed to load banner")
        end
    end)
else
    banner_img = images.load(bannerFile)
end

http.get(banner_url, function(s, r)
    if s and r.status == 200 then
        banner_img = images.load(r.body)
    else
        error("Failed to load banner")
    end
end)

local function draw_container(ctx, x, y, w, h, alpha, perf)
    client.draw_rectangle(ctx, x, y + 6, w, h, 10, 10, 10, perf)
    client.draw_rectangle(ctx, x + 1, y + 7, w - 2, h - 2, 60, 60, 60, perf)
    client.draw_rectangle(ctx, x + 2, y + 8, w - 4, h - 4, 40, 40, 40, perf)
    client.draw_rectangle(ctx, x + 3, y + 9, w - 6, h - 6, 40, 40, 40, perf)
    client.draw_rectangle(ctx, x + 4, y + 10, w - 8, h - 8, 40, 40, 40, perf)
    client.draw_rectangle(ctx, x + 5, y + 11, w - 10, h - 10, 60, 60, 60, perf)
    client.draw_rectangle(ctx, x + 6, y + 12, w - 12, h - 12, 20, 20, 20, perf)
    local half_w = w / 2
    local half_h = h / 2

    renderer.gradient(x + 6, y + 12, half_w - 6, 2, 221, 227, 78, perf, 202, 70, 205, perf, true)
    renderer.gradient(x + half_w, y + 12, half_w - 7, 2, 202, 70, 205, perf, 59, 175, 222, perf, true)
    renderer.gradient(x + 6, y + 12, 2, half_h, 221, 227, 78, perf, 202, 70, 205, perf, false)
    renderer.gradient(x + 6, y + h / 2 + 1, 2, half_h, 202, 70, 205, perf, 59, 175, 222, perf, false)
    renderer.gradient(x + w - 8, y + 12, 2, half_h, 59, 175, 222, perf, 202, 70, 205, perf, false)
    renderer.gradient(x + w - 8, y + h / 2 + 2, 2, half_h, 202, 70, 205, perf, 221, 227, 78, perf, false)
end

local function banner(ctx)
    if banner_img == nil then
        return
    end
    local menu_x, menu_y = ui.menu_position()
    local menu_width, menu_height = ui.menu_size()
    local half_width, half_height = menu_width / 2, menu_height / 2
    local menu_open = ui.is_menu_open()
    if menu_open then
        if whydoidothis < 1 then
            whydoidothis = math.min(whydoidothis + 0.04, 1)
        else
            whydoidothis = 1
        end
    else
        whydoidothis = 0
    end
    local img_width = half_width * 1.2
    local perf = 255 * whydoidothis
    draw_container(ctx, menu_x, menu_y - 98, menu_width, 98, whydoidothis, perf)
    banner_img:draw(menu_x + (menu_width - img_width) / 2 - 80, menu_y - 77, img_width + 160, 70, 255, 255, 255, perf,
        true, "f")
end

client.set_event_callback('paint_ui', function(ctx)
    banner(ctx)
end)


local lua = {}
lua.database = {
    configs = ":" .. lua_name .. "::configs:"
}
local presets = {}
local refs = {
    slowmotion = refUi("AA", "Other", "Slow motion"),
    OSAAA = refUi("AA", "Other", "On shot anti-aim"),
    OSAA = {refUi("AA", "Other", "On shot anti-aim")},
    Legmoves = refUi("AA", "Other", "Leg movement"),
    legit = refUi("LEGIT", "Aimbot", "Enabled"),
    minimum_damage_override = { refUi("Rage", "Aimbot", "Minimum damage override") },
    fakeDuck = refUi("RAGE", "Other", "Duck peek assist"),
    minimum_damage = refUi("Rage", "Aimbot", "Minimum damage"),
    hitChance = refUi("RAGE", "Aimbot", "Minimum hit chance"),
    safePoint = refUi("RAGE", "Aimbot", "Force safe point"),
    forceBaim = refUi("RAGE", "Aimbot", "Force body aim"),
    dtLimit = refUi("RAGE", "Aimbot", "Double tap fake lag limit"),
    quickPeek = {refUi("RAGE", "Other", "Quick peek assist")},
    dt = {refUi("RAGE", "Aimbot", "Double tap")},
    enabled = refUi("AA", "Anti-aimbot angles", "Enabled"),
    pitch = {refUi("AA", "Anti-aimbot angles", "pitch")},
    roll = refUi("AA", "Anti-aimbot angles", "roll"),
    yawBase = refUi("AA", "Anti-aimbot angles", "Yaw base"),
    yaw = {refUi("AA", "Anti-aimbot angles", "Yaw")},
    flLimit = refUi("AA", "Fake lag", "Limit"),
    flamount = refUi("AA", "Fake lag", "Amount"),
    flenabled = refUi("AA", "Fake lag", "Enabled"),
    flVariance = refUi("AA", "Fake lag", "Variance"),
    AAfake = refUi("AA", "Other", "Fake peek"),
    fsBodyYaw = refUi("AA", "anti-aimbot angles", "Freestanding body yaw"),
    edgeYaw = refUi("AA", "Anti-aimbot angles", "Edge yaw"),
    yawJitter = {refUi("AA", "Anti-aimbot angles", "Yaw jitter")},
    bodyYaw = {refUi("AA", "Anti-aimbot angles", "Body yaw")},
    freeStand = {refUi("AA", "Anti-aimbot angles", "Freestanding")},
    os = {refUi("AA", "Other", "On shot anti-aim")},
    slow = {refUi("AA", "Other", "Slow motion")},
    fakeLag = {refUi("AA", "Fake lag", "Limit")},
    legMovement = refUi("AA", "Other", "Leg movement"),
    indicators = {refUi("VISUALS", "Other ESP", "Feature indicators")},
    ping = {refUi("MISC", "Miscellaneous", "Ping spike")},
    clantag = refUi("Misc", "Miscellaneous", "Clan tag spammer"),
    menuClr = refUi("Misc", "Settings", "Menu color"),
    fakeping = {refUi("misc", "miscellaneous", "ping spike")},
    usrcmdprocessticks =  refUi("Misc", "Settings", "sv_maxusrcmdprocessticks2"),
    usrcmdprocessticks_holdaim = refUi("Misc", "Settings", "sv_maxusrcmdprocessticks_holdaim"),
}

local ref = {
    aimbot = refUi('RAGE', 'Aimbot', 'Enabled'),
    doubletap = {
        main = { refUi('RAGE', 'Aimbot', 'Double tap') },
        fakelag_limit = refUi('RAGE', 'Aimbot', 'Double tap fake lag limit')
    }
}

local binds = {
    legMovement = multiRefUi("AA", "Other", "Leg movement"),
    flenabled = multiRefUi("AA", "Fake lag", "Enabled"),
    slowmotion = multiRefUi("AA", "Other", "Slow motion"),
    OSAAA = multiRefUi("AA", "Other", "On shot anti-aim"),
    AAfake = multiRefUi("AA", "Other", "Fake peek"),
}

local function traverse_table_on(tbl, prefix)
    prefix = prefix or ""
    local stack = {{tbl, prefix}}

    while #stack > 0 do
        local current = table.remove(stack)
        local current_tbl = current[1]
        local current_prefix = current[2]

        for key, value in pairs(current_tbl) do
            local full_key = current_prefix .. key
            if type(value) == "table" then
                table.insert(stack, {value, full_key .. "."})
            else
                ui.set_visible(value, true)
            end
        end
    end
end

local function traverse_table(tbl, prefix)
    prefix = prefix or ""
    local stack = {{tbl, prefix}}

    while #stack > 0 do
        local current = table.remove(stack)
        local current_tbl = current[1]
        local current_prefix = current[2]

        for key, value in pairs(current_tbl) do
            local full_key = current_prefix .. key
            if type(value) == "table" then
                table.insert(stack, {value, full_key .. "."})
            else
                ui.set_visible(value, false)
            end
        end
    end
end
local vars = {
    localPlayer = 0,
    hitgroup_names = { 'Generic', 'Head', 'Chest', 'Stomach', 'Left arm', 'Right arm', 'Left leg', 'Right leg', 'Neck', '?', 'Gear' },
    aaStates = {"Global", "Standing", "Moving", "Slowwalking", "Crouching", "Air", "Air-Crouching", "Crouch-Moving", "Fakelag"},
    pStates = {"G", "S", "M", "SW", "C", "A", "AC", "CM", "FL"},
	sToInt = {["Global"] = 1, ["Standing"] = 2, ["Moving"] = 3, ["Slowwalking"] = 4, ["Crouching"] = 5, ["Air"] = 6, ["Air-Crouching"] = 7, ["Crouch-Moving"] = 8 , ["Fakelag"] = 9},
    intToS = {[1] = "Global", [2] = "Standing", [3] = "Moving", [4] = "Slowwalking", [5] = "Crouching", [6] = "Air", [7] = "Air-Crouching", [8] = "Crouch-Moving", [9] = "Fakelag"},
    currentTab = 1,
    activeState = 1,
    pState = 1,
    yaw = 0,
    sidemove = 0,
    m1_time = 0,
    choked = 0,
    dt_state = 0,
    doubletap_time = 0,
    breaker = {
        defensive = 0,
        defensive_check = 0,
        cmd = 0,
        last_origin = nil,
        origin = nil,
        tp_dist = 0,
        tp_data = gram_create(0,3)
    },
    mapname = globals.mapname()
}

local js = panorama.open()
local MyPersonaAPI, LobbyAPI, PartyListAPI, SteamOverlayAPI = js.MyPersonaAPI, js.LobbyAPI, js.PartyListAPI, js.SteamOverlayAPI

local angle3d_struct = ffi.typeof("struct { float pitch; float yaw; float roll; }")
local vec_struct = ffi.typeof("struct { float x; float y; float z; }")

local cUserCmd =
    ffi.typeof(
    [[
    struct
    {
        uintptr_t vfptr;
        int command_number;
        int tick_count;
        $ viewangles;
        $ aimdirection;
        float forwardmove;
        float sidemove;
        float upmove;
        int buttons;
        uint8_t impulse;
        int weaponselect;
        int weaponsubtype;
        int random_seed;
        short mousedx;
        short mousedy;
        bool hasbeenpredicted;
        $ headangles;
        $ headoffset;
        bool send_packet; 
    }
    ]],
    angle3d_struct,
    vec_struct,
    angle3d_struct,
    vec_struct
)

local client_sig = client.find_signature("client.dll", "\xB9\xCC\xCC\xCC\xCC\x8B\x40\x38\xFF\xD0\x84\xC0\x0F\x85") or error("client.dll!:input not found.")
local get_cUserCmd = ffi.typeof("$* (__thiscall*)(uintptr_t ecx, int nSlot, int sequence_number)", cUserCmd)
local input_vtbl = ffi.typeof([[struct{uintptr_t padding[8];$ GetUserCmd;}]],get_cUserCmd)
local input = ffi.typeof([[struct{$* vfptr;}*]], input_vtbl)
local get_input = ffi.cast(input,ffi.cast("uintptr_t**",tonumber(ffi.cast("uintptr_t", client_sig)) + 1)[0])

local func = {
    render_text = function(x, y, ...)
        local x_Offset = 0
        
        local args = {...}
    
        for i, line in pairs(args) do
            local r, g, b, a, text = unpack(line)
            local size = vector(renderer.measure_text("-d", text))
            renderer.text(x + x_Offset, y, r, g, b, a, "-d", 0, text)
            x_Offset = x_Offset + size.x
        end
    end,
    easeInOut = function(t)
        return (t > 0.5) and 4*((t-1)^3)+1 or 4*t^3;
    end,
    rec = function(x, y, w, h, radius, color)
        radius = math.min(x/2, y/2, radius)
        local r, g, b, a = unpack(color)
        renderer.rectangle(x, y + radius, w, h - radius*2, r, g, b, a)
        renderer.rectangle(x + radius, y, w - radius*2, radius, r, g, b, a)
        renderer.rectangle(x + radius, y + h - radius, w - radius*2, radius, r, g, b, a)
        renderer.circle(x + radius, y + radius, r, g, b, a, radius, 180, 0.25)
        renderer.circle(x - radius + w, y + radius, r, g, b, a, radius, 90, 0.25)
        renderer.circle(x - radius + w, y - radius + h, r, g, b, a, radius, 0, 0.25)
        renderer.circle(x + radius, y - radius + h, r, g, b, a, radius, -90, 0.25)
    end,
    rec_outline = function(x, y, w, h, radius, thickness, color)
        radius = math.min(w/2, h/2, radius)
        local r, g, b, a = unpack(color)
        if radius == 1 then
            renderer.rectangle(x, y, w, thickness, r, g, b, a)
            renderer.rectangle(x, y + h - thickness, w , thickness, r, g, b, a)
        else
            renderer.rectangle(x + radius, y, w - radius*2, thickness, r, g, b, a)
            renderer.rectangle(x + radius, y + h - thickness, w - radius*2, thickness, r, g, b, a)
            renderer.rectangle(x, y + radius, thickness, h - radius*2, r, g, b, a)
            renderer.rectangle(x + w - thickness, y + radius, thickness, h - radius*2, r, g, b, a)
            renderer.circle_outline(x + radius, y + radius, r, g, b, a, radius, 180, 0.25, thickness)
            renderer.circle_outline(x + radius, y + h - radius, r, g, b, a, radius, 90, 0.25, thickness)
            renderer.circle_outline(x + w - radius, y + radius, r, g, b, a, radius, -90, 0.25, thickness)
            renderer.circle_outline(x + w - radius, y + h - radius, r, g, b, a, radius, 0, 0.25, thickness)
        end
    end,
    clamp = function(x, min, max)
        return x < min and min or x > max and max or x
    end,
    breathe = function(offset, multiplier)
        local m_speed = globals.realtime() * (multiplier or 1.0);
        local m_factor = m_speed % math.pi;
      
        local m_sin = math.sin(m_factor + (offset or 0));
        local m_abs = math.abs(m_sin);
      
        return m_abs
    end,
    normalize_pitch = function(pitch) 
        return math.clamp(pitch, -89, 89) 
    end,
    table_contains = function(tbl, value)
        for i = 1, #tbl do
            if tbl[i] == value then
                return true
            end
        end
        return false
    end,
    setAATab = function(ref)
        ui.set_visible(refs.enabled, ref)
        ui.set_visible(refs.pitch[1], ref)
        ui.set_visible(refs.pitch[2], ref)
        ui.set_visible(refs.roll, ref)
        ui.set_visible(refs.slowmotion, ref)
        ui.set_visible(refs.Legmoves, ref)
        ui.set_visible(refs.yawBase, ref)
        ui.set_visible(refs.yaw[1], ref)
        ui.set_visible(refs.yaw[2], ref)
        ui.set_visible(refs.yawJitter[1], ref)
        ui.set_visible(refs.yawJitter[2], ref)
        ui.set_visible(refs.bodyYaw[1], ref)
        ui.set_visible(refs.bodyYaw[2], ref)
        ui.set_visible(refs.freeStand[1], ref)
        ui.set_visible(refs.freeStand[2], ref)
        ui.set_visible(refs.fsBodyYaw, ref)
        ui.set_visible(refs.edgeYaw, ref)
        ui.set_visible(refs.flLimit, ref)
        ui.set_visible(refs.flamount, ref)
        ui.set_visible(refs.flVariance, ref)
        ui.set_visible(refs.flenabled, ref)
        ui.set_visible(refs.AAfake, ref)
        ui.set_visible(refs.OSAAA, ref)
    end,
    findDist = function (x1, y1, z1, x2, y2, z2)
        return math.sqrt((x2 - x1)^2 + (y2 - y1)^2 + (z2 - z1)^2)
    end,
    resetAATab = function()
        setUi(refs.OSAAa, false)
        setUi(refs.enabled, false)
        setUi(refs.pitch[1], "Off")
        setUi(refs.pitch[2], 0)
        setUi(refs.roll, 0)
        setUi(refs.slowmotion, false)
        setUi(refs.yawBase, "local view")
        setUi(refs.yaw[1], "Off")
        setUi(refs.yaw[2], 0)
        setUi(refs.yawJitter[1], "Off")
        setUi(refs.yawJitter[2], 0)
        setUi(refs.bodyYaw[1], "Off")
        setUi(refs.bodyYaw[2], 0)
        setUi(refs.freeStand[1], false)
        setUi(refs.freeStand[2], "On hotkey")
        setUi(refs.fsBodyYaw, false)
        setUi(refs.edgeYaw, false)
        setUi(refs.flLimit, false)
        setUi(refs.flamount, false)
        setUi(refs.flenabled, false)
        setUi(refs.flVariance, false)
        setUi(refs.AAfake, false)
    end,
    type_from_string = function(input)
        if type(input) ~= "string" then return input end

        local value = input:lower()

        if value == "true" then
            return true
        elseif value == "false" then
            return false
        elseif tonumber(value) ~= nil then
            return tonumber(value)
        else
            return tostring(input)
        end
    end,
    lerp = function(start, vend, time)
        return start + (vend - start) * time
    end,
    vec_angles = function(angle_x, angle_y)
        local sy = math.sin(math.rad(angle_y))
        local cy = math.cos(math.rad(angle_y))
        local sp = math.sin(math.rad(angle_x))
        local cp = math.cos(math.rad(angle_x))
        return cp * cy, cp * sy, -sp
    end,
    hex = function(arg)
        local result = "\a"
        for key, value in next, arg do
            local output = ""
            while value > 0 do
                local index = math.fmod(value, 16) + 1
                value = math.floor(value / 16)
                output = string.sub("0123456789ABCDEF", index, index) .. output 
            end
            if #output == 0 then 
                output = "00" 
            elseif #output == 1 then 
                output = "0" .. output 
            end 
            result = result .. output
        end 
        return result .. "FF"
    end,
    split = function( inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
    end,
    RGBAtoHEX = function(redArg, greenArg, blueArg, alphaArg)
        return string.format('%.2x%.2x%.2x%.2x', redArg, greenArg, blueArg, alphaArg)
    end,
    create_color_array = function(r, g, b, string)
        local colors = {}
        for i = 0, #string do
            local color = {r, g, b, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime() / 4 + i * 5 / 30))}
            table.insert(colors, color)
        end
        return colors
    end,
    textArray = function(string)
        local result = {}
        for i=1, #string do
            result[i] = string.sub(string, i, i)
        end
        return result
    end,
    includes = function(tbl, value)
        for i = 1, #tbl do
            if tbl[i] == value then
                return true
            end
        end
        return false
    end,
    gradient_text = function(r1, g1, b1, a1, r2, g2, b2, a2, text)
        local output = ''
    
        local len = #text-1
    
        local rinc = (r2 - r1) / len
        local ginc = (g2 - g1) / len
        local binc = (b2 - b1) / len
        local ainc = (a2 - a1) / len
    
        for i=1, len+1 do
            output = output .. ('\a%02x%02x%02x%02x%s'):format(r1, g1, b1, a1, text:sub(i, i))
    
            r1 = r1 + rinc
            g1 = g1 + ginc
            b1 = b1 + binc
            a1 = a1 + ainc
        end
    
        return output
    end,    
    time_to_ticks = function(t)
        return math.floor(0.5 + (t / globals.tickinterval()))
    end,
    headVisible = function(enemy)
        local_player = entity.get_local_player()
        if local_player == nil then return end
        local ex, ey, ez = entity.hitbox_position(enemy, 1)
    
        local hx, hy, hz = entity.hitbox_position(local_player, 1)
        local head_fraction, head_entindex_hit = client.trace_line(enemy, ex, ey, ez, hx, hy, hz)
        if head_entindex_hit == local_player or head_fraction == 1 then return true else return false end
    end
}

func.in_air = (function(player)
    if player == nil then return end
    local flags = entity.get_prop(player, "m_fFlags")
    if flags == nil then return end
    if bit.band(flags, 1) == 0 then
        return true
    end
    return false
end)

local function get_velocity(player)
    local x,y,z = entity.get_prop(player, "m_vecVelocity")
    if x == nil then return end
    return math.sqrt(x*x + y*y + z*z)
end

local function can_desync(cmd)
    if entity.get_prop(entity.get_local_player(), "m_MoveType") == 9 then
        return false
    end
    local client_weapon = entity.get_player_weapon(entity.get_local_player())
    if client_weapon == nil then
        return false
    end
    local weapon_classname = entity.get_classname(client_weapon)
    local in_use = cmd.in_use == 1
    local in_attack = cmd.in_attack == 1
    local in_attack2 = cmd.in_attack2 == 1
    if in_use then
        return false
    end
    if in_attack or in_attack2 then
        if weapon_classname:find("Grenade") then
            vars.m1_time = globals.curtime() + 0.15
        end
    end
    if vars.m1_time > globals.curtime() then
        return false
    end
    if in_attack then
        if client_weapon == nil then
            return false
        end
        if weapon_classname then
            return false
        end
        return false
    end
    return true
end

local function get_choke(cmd)
    local fl_limit = getUi(refs.flLimit)
    local fl_p = fl_limit % 2 == 1
    local chokedcommands = cmd.chokedcommands
    local cmd_p = chokedcommands % 2 == 0
    local doubletap_ref = getUi(refs.dt[1]) and getUi(refs.dt[2])
    local osaa_ref = getUi(refs.os[1]) and getUi(refs.os[2])
    local fd_ref = getUi(refs.fakeDuck)
    local velocity = get_velocity(entity.get_local_player())
    if doubletap_ref then
        if vars.choked > 2 then
            if cmd.chokedcommands >= 0 then
                cmd_p = false
            end
        end
    end
    vars.choked = cmd.chokedcommands
    if vars.dt_state ~= doubletap_ref then
        vars.doubletap_time = globals.curtime() + 0.25
    end
    if not doubletap_ref and not osaa_ref and not cmd.no_choke or fd_ref then
        if not fl_p then
            if vars.doubletap_time > globals.curtime() then
                if cmd.chokedcommands >= 0 and cmd.chokedcommands < fl_limit then
                    cmd_p = chokedcommands % 2 == 0
                else
                    cmd_p = chokedcommands % 2 == 1
                end
            else
                cmd_p = chokedcommands % 2 == 1
            end
        end
    end
    vars.dt_state = doubletap_ref
    return cmd_p
end

local function apply_desync(cmd, fake)
    local usrcmd = get_input.vfptr.GetUserCmd(ffi.cast("uintptr_t", get_input), 0, cmd.command_number)
    cmd.allow_send_packet = false

    local pitch, yaw = client.camera_angles()

    local can_desync = can_desync(cmd)
    local is_choke = get_choke(cmd)

    setUi(refs.bodyYaw[1], is_choke and "Static" or "Off")
    if cmd.chokedcommands == 0 then
        vars.yaw = (yaw + 180) - fake*2;
    end

    if can_desync then
        if not usrcmd.hasbeenpredicted then
            if is_choke then
                cmd.yaw = vars.yaw;
            end
        end
    end
end

local color_text = function( string, r, g, b, a)
    local white = "\a" .. func.RGBAtoHEX(255, 255, 255, a)

    local str = ""
    for i, s in ipairs(func.split(string, "$")) do
    end

    return str
end

local function gradient_text(r1, g1, b1, a1, r2, g2, b2, a2, text)
    local len = #text
    local rinc = (r2 - r1) / len
    local ginc = (g2 - g1) / len
    local binc = (b2 - b1) / len
    local ainc = (a2 - a1) / len
    local result = {}

    for i = 1, len do
        local current_r = math.floor(r1 + rinc * (i - 1))
        local current_g = math.floor(g1 + ginc * (i - 1))
        local current_b = math.floor(b1 + binc * (i - 1))
        local current_a = math.floor(a1 + ainc * (i - 1))

        local color_code = string.format('\a%02x%02x%02x%02x', current_r, current_g, current_b, current_a)
        table.insert(result, color_code .. text:sub(i, i))
    end

    return table.concat(result)
end

local animate_text = function(time, string, r, g, b, a, r1, g1, b1, a1)
    local t_out, t_out_iter = { }, 1

    local l = string:len( ) - 1

    local r_add = (r1 - r)
    local g_add = (g1 - g)
    local b_add = (b1 - b)
    local a_add = (255 - a)

    for i = 1, #string do
        local iter = (i - 1)/(#string - 1) + time
        t_out[t_out_iter] = "\a" .. func.RGBAtoHEX( r + r_add * math.abs(math.cos( iter )), g + g_add * math.abs(math.cos( iter )), b + b_add * math.abs(math.cos( iter )), a + a_add * math.abs(math.cos( iter )) )

        t_out[t_out_iter + 1] = string:sub( i, i )

        t_out_iter = t_out_iter + 2
    end

    return t_out
end

local glow_module = function(x, y, w, h, width, rounding, accent, accent_inner)
    local thickness = 1
    local Offset = 1
    local r, g, b, a = unpack(accent)
    if accent_inner then
        func.rec(x, y, w, h + 1, rounding, accent_inner)
    end
    for k = 0, width do
        if a * (k/width)^(1) > 5 then
            local accent = {r, g, b, a * (k/width)^(2)}
            func.rec_outline(x + (k - width - Offset)*thickness, y + (k - width - Offset) * thickness, w - (k - width - Offset)*thickness*2, h + 1 - (k - width - Offset)*thickness*2, rounding + thickness * (width - k + Offset), thickness, accent)
        end
    end
end

local function remap(val, newmin, newmax, min, max, clamp)
	min = min or 0
	max = max or 1

	local pct = (val-min)/(max-min)

	if clamp ~= false then
		pct = math.min(1, math.max(0, pct))
	end

	return newmin+(newmax-newmin)*pct
end


local tab, container = "AA", "Anti-aimbot angles"
local label = ui.new_label("AA", "Fake lag", gradient_text(255, 255, 255, 255, 112, 255, 181, 255, "Shareblue"))
local tabPicker = ui.new_combobox("AA", "Fake lag", "\nTab", gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Anti-aim"), gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Fakelag"), gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Settings"), gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Config"))
local aaTabs = ui.new_combobox("AA", "Fake lag", "\nAA Tabs",gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Builder"), gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Other"))

local menu = {
    aaTab = {
        lableoth = ui.new_label(tab, container, "\ad0d0d0ff━━━━━ \a31d2f7ff♦ \ab070ffffAnti-aim Other \a31d2f7ff♦ \ad0d0d0ff━━━━━"),
        lableplc1 = ui.new_label(tab, container, " "),
        manualsOverFs = ui.new_checkbox(tab, container, "Manuals over freestanding"),
        legitAAHotkey = ui.new_hotkey(tab, container, "Legit AA"),
        freestand = ui.new_combobox(tab, container, "Freestanding", "Default", "Static"),
        freestandHotkey = ui.new_hotkey(tab, container, "Freestand", true),
        manualsenb = ui.new_checkbox(tab, container, "Enable Manuals"),
        manuals = ui.new_combobox(tab, container, "Manuals", "Off", "Default", "Static"),
        manualTab = {
            manualLeft = ui.new_hotkey(tab, container, "• Manual " .. func.hex({200,200,200}) .. "left"),
            manualRight = ui.new_hotkey(tab, container, "• Manual " .. func.hex({200,200,200}) .. "right"),
            manualForward = ui.new_hotkey(tab, container, "• Manual " .. func.hex({200,200,200}) .. "forward"),
        },
    },
    builderTab = {
        lablesaf = ui.new_label("AA", "Other", "\ad0d0d0ff━━━━━ \a31d2f7ff♦ \ab070ffffSafe Functions \a31d2f7ff♦ \ad0d0d0ff━━━━━"),
        lableplc6 = ui.new_label("AA", "Other", " "),
        safeKnife = ui.new_checkbox("AA", "Other", "Safe Knife"),
        safeZeus = ui.new_checkbox("AA", "Other", "Safe Zeus"),
        autoHideshots = ui.new_checkbox("AA", "Other", "Automatic Hideshots"),
        autoHideshotsStates = ui.new_multiselect("AA", "Other", "States", {"Standing", "Moving", "Slowwalking", "Crouching", "Crouch-Moving", "Air", "Air-Crouching"}),
        lableplc7 = ui.new_label("AA", "Other", " "),
        lableothf = ui.new_label("AA", "Other", "\ad0d0d0ff━━━━━ \a31d2f7ff♦ \ab070ffffOther Functions \a31d2f7ff♦ \ad0d0d0ff━━━━━"),
        lableplc8 = ui.new_label("AA", "Other", " "),
        resolver = ui.new_checkbox("AA", "Other", gradient_text(226, 82, 225, 255, 41, 48, 255, 255, "Resolver")),
        resolver_type = ui.new_combobox("AA", "Other", "Resolver Type", gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Stable"), gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Laboratory"), gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Defensive")),
        lableb = ui.new_label(tab, container, "\ad0d0d0ff━━━━━ \a31d2f7ff♦ \ab070ffffAnti-aim Builder \a31d2f7ff♦ \ad0d0d0ff━━━━━"),
        lableplc2 = ui.new_label(tab, container, " "),
        state = ui.new_combobox(tab, container, "Anti-aim state", vars.aaStates)
    },
    fakelagTab = {
        fakelagLabel1 = ui.new_label(tab, container, "\ad0d0d0ff━━━━━ \a31d2f7ff♦ \ab070ffffFakelag Settings \a31d2f7ff♦ \ad0d0d0ff━━━━━"),
        fakelagLabel2 = ui.new_label(tab, container, " "),
        fakelagEnable = ui.new_checkbox(tab, container, "Enable Fakelag"),
        fakelagAmount = ui.new_combobox(tab, container, "Amount", "Dynamic", "Maximum", "Fluctuate"),
        fakelagVariance = ui.new_slider(tab, container, "Variance", 0, 100, 0, true, "%"),
        fakelagLimit = ui.new_slider(tab, container, "Limit", 1, 17, 14),
        fakelagOptionsForceChoked = ui.new_checkbox(tab, container, "Force Choked"),
        fakelagBreakLCAir = ui.new_checkbox(tab, container, "Break LC In Air"),
        fakelagResetOS = ui.new_checkbox(tab, container, "Reset OS"),
	    fakelagResetonshotStyle = ui.new_combobox(tab, container, "Reset On Shot", {"Default", "Safest", "Extended"}),
        fakelagOptimizeModifier = ui.new_checkbox(tab, container, "OptimizeModifier"),
        fakelagForceDischargeScan = ui.new_checkbox(tab, container, "Force Discharge Scan"),
    },
    visualsTab = {
        lablev = ui.new_label(tab, container, "\ad0d0d0ff━━━━━ \a31d2f7ff♦ \ab070ffffSettings Visuals \a31d2f7ff♦ \ad0d0d0ff━━━━━"),
        lableplc3 = ui.new_label(tab, container, " "),
        indicatorsType = ui.new_checkbox(tab, container, "Enable Indicators"),
        indicatorsClr = ui.new_color_picker(tab, container, "First Color", lua_color.r, lua_color.g, lua_color.b, 255),
        indicatorsLable = ui.new_label(tab, container, " "),
        indicatorsClr2 = ui.new_color_picker(tab, container, "Second Color", lua_color.r, lua_color.g, lua_color.b, 255),
        arrowsindenb = ui.new_checkbox(tab, container, "Enable Arrows Indicator"),
        arrowIndicatorStyle = ui.new_combobox(tab, container, "Arrows", "Standart", "Triangle"),
        arrowClr = ui.new_color_picker(tab, container, "Arrow Color", lua_color.r, lua_color.g, lua_color.b, 255),
        hitlogsenb = ui.new_checkbox(tab, container, "Enable Hitlog"),
        hitlogs_krutie = ui.new_multiselect(tab, container, "Hitlogs", "Hit", "Miss"),
        screenHitlogEnb = ui.new_checkbox(tab, container, "Enable Screen Hitlog"),
        screenHitlogs_krutie = ui.new_multiselect(tab, container, "Hitlogs", "Hit", "Miss"),
        screenHitlogLabel1 = ui.new_label(tab, container, "- Glow Color"),
        screenHitlogGlowClr = ui.new_color_picker(tab, container, "Glow Color", 255, 255, 255, 255),
        screenHitlogLabel2 = ui.new_label(tab, container, "- Logo Color"),
        screenHitlogLogoClr = ui.new_color_picker(tab, container, "Logo Color", 255, 255, 255, 255),
        screenHitlogLabel4 = ui.new_label(tab, container, "- Back Color"),
        screenHitlogBackClr = ui.new_color_picker(tab, container, "Back Color", 255, 255, 255, 255),
        minimum_damageenb = ui.new_checkbox(tab, container, "Enable Min Damage Indicator"),
        minimum_damageIndicator = ui.new_combobox(tab, container, "Minimum Damage Indicator", "Bind", "Constant"),
        blurWhenMenuEnb = ui.new_checkbox(tab, container, "Enable Blur When menu"),
        lcIndicatorEnb = ui.new_checkbox(tab, container, "Enable LagComp Indicators"),
        lcEnemyIndicatorEnb = ui.new_checkbox(tab, container, "Enable Enemy LagComp Indicators"),
        collisionControl = ui.new_checkbox(tab, container, "Disable collision"),
        thirdpersonsenb = ui.new_checkbox(tab, container, "Enable Thirdperson Cam"),
        thirdpersondistance = ui.new_slider(tab, container, "Thirdperson Cam Dist", 1, 180, 65),
    },
    miscTab = {
        labledgdfgs = ui.new_label(tab, container, " "),
        lablevr = ui.new_label(tab, container, "\ad0d0d0ff━━━━━ \a31d2f7ff♦ \ab070ffffMisc Settings \a31d2f7ff♦ \ad0d0d0ff━━━━━"),
        lableplc4 = ui.new_label(tab, container, " "),
        watermark = ui.new_checkbox(tab, container, "Watermark"),
        watermarkClr = ui.new_color_picker(tab, container, "Watermark Color", lua_color.r, lua_color.g, lua_color.b, 255),
        watermarkpos = ui.new_combobox(tab, container, "Water Posiotion", "Left", "Right", "Bottom", "Top"),
        AvoidBack = ui.new_checkbox(tab, container, "Avoid Backstab"),
        othfunc = ui.new_label("AA", "Other", "\ad0d0d0ff━━━━━ \a31d2f7ff♦ \ab070ffffOther functions \a31d2f7ff♦ \ad0d0d0ff━━━━━"),
        lableplc5 = ui.new_label("AA", "Other", " "),
        filtercons = ui.new_checkbox("AA", "Other", "Console Filter"),
        unsafecharhge = ui.new_checkbox("AA", "Other", "Auto discharge exploit \a4f4f4fff[only scout & awp]"),
        clanTag = ui.new_checkbox(tab, container, "Clantag"),
        dtunsafecharge = ui.new_checkbox("AA", "Other", "Unsafe charge on enemy \a4f4f4fffcharg in visibel"),
        trashTalk = ui.new_checkbox(tab, container, "Trashtalk"),
        trashTalk_vibor = ui.new_multiselect(tab, container, "\n trashtalk vibor", "Kill", "Death"),
        fastLadder = ui.new_checkbox(tab, container, "Fast ladder"),
        resetManualAAEnb = ui.new_checkbox(tab, container, "Automatic reset Manual AA"),
        autofakepingsend = ui.new_checkbox(tab, container, "Auto FakePing"),
        autofakepingslider = ui.new_slider(tab, container, "Value of Pingspike", 1, 200, 200),
        dtairsend = ui.new_checkbox(tab, container, "DT Air"),
        slowwalksend = ui.new_checkbox(tab, container, "Slowwalk Speed"),
        slowwalkhotkey = ui.new_hotkey(tab, container, "Bind key"),
        slowwalkslider = ui.new_slider(tab, container, "Speed", 1, 245, 40, true, "%"),
        animationsEnabled = ui.new_checkbox(tab, container, "\aafaf62ffAnim breakers"),
        animations = ui.new_multiselect(tab, container, "\n Anim breakers", "Broken", "Static legs", "Leg fucker", "0 pitch on landing", "Moonwalk","Kinguru"),
    },
    configTab = {
        ui.new_label("AA", "Fake lag", " "),
        ui.new_label("AA", "Fake lag", "Update - 15/08/2024"),
        ui.new_label("AA", "Fake lag", "    - Record Delayed Yaw"),
        ui.new_label("AA", "Fake lag", "    + Improve Delayed Yaw"),
        ui.new_label("AA", "Fake lag", "            - by iota"),
        ui.new_label("AA", "Fake lag", "    - Fixed bugs"),

        ui.new_label("AA", "Fake lag", " "),
        ui.new_label("AA", "Fake lag", "Update - 01/08/2024"),
        ui.new_label("AA", "Fake lag", "    - Add Delayed Yaw"),

        ui.new_label("AA", "Fake lag", " "),
        ui.new_label("AA", "Fake lag", "Update - 30/07/2024"),
        ui.new_label("AA", "Fake lag", "    - Record Random Pitch"),
        ui.new_label("AA", "Fake lag", "    - Update Preset Anti-Aim"),

        ui.new_label("AA", "Fake lag", " "),
        ui.new_label("AA", "Fake lag", "Update - 26/07/2024"),
        ui.new_label("AA", "Fake lag", "    - Record Fakelag"),
        ui.new_label("AA", "Fake lag", "    - Fixed Avoid Backstab"),

        ui.new_label("AA", "Fake lag", " "),
        ui.new_label("AA", "Fake lag", "Update - 24/07/2024"),
        ui.new_label("AA", "Fake lag", "    - Add Autofakeping"),
        ui.new_label("AA", "Fake lag", "    - Add LC Indicator"),
        ui.new_label("AA", "Fake lag", "    - Add Enemy LC Indicator"),
        ui.new_label("AA", "Fake lag", "    - Add Slowwalk Speed"),
        ui.new_label("AA", "Fake lag", "    - Add DT Air"),
        ui.new_label("AA", "Fake lag", "    - Add Thirdperson Cam"),
        ui.new_label("AA", "Fake lag", "    - Add Fakelag Page"),
        ui.new_label("AA", "Fake lag", "    - Add Console Hitlog"),

        ui.new_label("AA", "Fake lag", " "),
        ui.new_label("AA", "Fake lag", "Update - 19/07/2024"),
        ui.new_label("AA", "Fake lag", "    - Add Resolver"),
        ui.new_label("AA", "Fake lag", "    - Improve Ui"),
        ui.new_label("AA", "Fake lag", "    - Fixed Config Bugs"),

        lableplc12 = ui.new_label("AA", "Other", "\ad0d0d0ff━━━━━━ \a31d2f7ff♦ \ab070ffffContact Us \a31d2f7ff♦ \ad0d0d0ff━━━━━━"),
        lableplc11 = ui.new_label("AA", "Other", " "),
        lableoth = ui.new_label("AA", "Other", gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Discord")),
        buttonsd = ui.new_button("AA", "Other", "Join us", function() SteamOverlayAPI.OpenExternalBrowserURL("https://Leaks.s7ae.cc/res/rick.mp4") end),
        lableoth2 = ui.new_label("AA", "Other", gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "QQ")),
        buttonsd2 = ui.new_button("AA", "Other", "Join us", function() SteamOverlayAPI.OpenExternalBrowserURL("https://Leaks.s7ae.cc/res/rick.mp4") end),
        lables = ui.new_label(tab, container, "\ad0d0d0ff━━━━━ \a31d2f7ff♦ \ab070ffffPreset Configs \a31d2f7ff♦ \ad0d0d0ff━━━━━"),
        lableplc7 = ui.new_label(tab, container, " "),
        list = ui.new_listbox(tab, container, "Configs", ""),
        name = ui.new_textbox(tab, container, "Config name", ""),
        load = ui.new_button(tab, container, "Load", function() end),
        save = ui.new_button(tab, container, "Save", function() end),
        delete = ui.new_button(tab, container, "Delete", function() end),
        import = ui.new_button(tab, container, gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Import"), function() end),
        export = ui.new_button(tab, container, gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Export"), function() end)
    }
}



local notify = (function()
    local b = vector;
    local c = function(d, b, c)
        return d + (b - d) * c
    end
    local e = function()
        return b(client.screen_size())
    end
    local f = function(d, ...)
        local c = {...}
        local c = table.concat(c, "")
        return b(renderer.measure_text(d, c))
    end
    
    local g = {
        notifications = {bottom = {}},
        max = {bottom = 6}
    }
    g.__index = g;
    
    g.new_bottom = function(h, i, j, ...)
        table.insert(g.notifications.bottom, {
            started = false,
            instance = setmetatable({
                active = false,
                timeout = 5,
                color = {["r"] = h, ["g"] = i, ["b"] = j, a = 0},
                x = e().x / 2,
                y = e().y,
                text = ...
            }, g)
        })
    end
    
    function g:handler()
        local d = 0;
        local b = 0;
        for d, b in pairs(g.notifications.bottom) do
            if not b.instance.active and b.started then
                table.remove(g.notifications.bottom, d)
            end
        end
        for d = 1, #g.notifications.bottom do
            if g.notifications.bottom[d].instance.active then
                b = b + 1
            end
        end
        for c, e in pairs(g.notifications.bottom) do
            if c > g.max.bottom then
                return
            end
            if e.instance.active then
                e.instance:render_bottom(d, b)
                d = d + 1
            end
            if not e.started then
                e.instance:start()
                e.started = true
            end
        end
    end
    
    function g:start()
        self.active = true;
        self.delay = globals.realtime() + self.timeout
    end
    
    function g:get_text()
        local d = ""
        for b, b in pairs(self.text) do
            local c = f("", b[1])
            local c, e, f = 255, 255, 255
            if b[2] then
                c, e, f = 99, 199, 99
            end
            d = d .. ("\a%02x%02x%02x%02x%s"):format(c, e, f, self.color.a, b[1])
        end
        return d
    end
    
    local k = (function()
        local d = {}
        d.rec = function(d, b, c, e, f, g, k, l, m)
            m = math.min(d / 2, b / 2, m)
            renderer.rectangle(d, b + m, c, e - m * 2, f, g, k, l)
            renderer.rectangle(d + m, b, c - m * 2, m, f, g, k, l)
            renderer.rectangle(d + m, b + e - m, c - m * 2, m, f, g, k, l)
            renderer.circle(d + m, b + m, f, g, k, l, m, 180, .25)
            renderer.circle(d - m + c, b + m, f, g, k, l, m, 90, .25)
            renderer.circle(d - m + c, b - m + e, f, g, k, l, m, 0, .25)
            renderer.circle(d + m, b - m + e, f, g, k, l, m, -90, .25)
        end
        d.rec_outline = function(d, b, c, e, f, g, k, l, m, n)
            m = math.min(c / 2, e / 2, m)
            if m == 1 then
                renderer.rectangle(d, b, c, n, f, g, k, l)
                renderer.rectangle(d, b + e - n, c, n, f, g, k, l)
            else
                renderer.rectangle(d + m, b, c - m * 2, n, f, g, k, l)
                renderer.rectangle(d + m, b + e - n, c - m * 2, n, f, g, k, l)
                renderer.rectangle(d, b + m, n, e - m * 2, f, g, k, l)
                renderer.rectangle(d + c - n, b + m, n, e - m * 2, f, g, k, l)
                renderer.circle_outline(d + m, b + m, f, g, k, l, m, 180, .25, n)
                renderer.circle_outline(d + m, b + e - m, f, g, k, l, m, 90, .25, n)
                renderer.circle_outline(d + c - m, b + m, f, g, k, l, m, -90, .25, n)
                renderer.circle_outline(d + c - m, b + e - m, f, g, k, l, m, 0, .25, n)
            end
        end
        d.glow_module_notify = function(b, c, e, f, g, k, l, m, n, o, p, q, r, s, t)
            local u = 1;
            local v = 1;
            if s then
                d.rec(b, c, e, f, l, m, n, o, k)
            end
            for l = 0, g do
                local m = o / 2 * (l / g)^3
                d.rec_outline(b + (l - g - v) * u, c + (l - g - v) * u, e - (l - g - v) * u * 2, f - (l - g - v) * u * 2, p, q, r, m / 1.5, k + u * (g - l + v), u)
            end
        end
        return d
    end)()
    
    function g:render_bottom(g, l)
        local e = e()
        local m = 6;
        local n = "      " .. self:get_text()
        local f = f("", n)
        local o = 8;
        local p = 5;
        local q = 0 + m + f.x;
        local q, r = q + p * 2, 12 + 10 + 1;
        local s, t = self.x - q / 2, math.ceil(self.y - 40 + .4)
        local u = globals.frametime()
        if globals.realtime() < self.delay then
            self.y = c(self.y, e.y - 45 - (l - g) * r * 1.4, u * 7)
            self.color.a = c(self.color.a, 255, u * 2)
        else
            self.y = c(self.y, self.y - 10, u * 15)
            self.color.a = c(self.color.a, 0, u * 20)
            if self.color.a <= 1 then
                self.active = false
            end
        end
        local c, e, g, l = self.color.r, self.color.g, self.color.b, self.color.a

        local glowClr_r, glowClr_g, glowClr_b, glowClr_a = getUi(menu.visualsTab.screenHitlogGlowClr)
        local logoClr_r, logoClr_g, logoClr_b, logoClr_a = getUi(menu.visualsTab.screenHitlogLogoClr)
        local backClr_r, backClr_g, backClr_b, backClr_a = getUi(menu.visualsTab.screenHitlogBackClr)

        k.glow_module_notify(s, t, q, r, 15, o, backClr_r, backClr_g, backClr_b, backClr_a, glowClr_r, glowClr_g, glowClr_b, glowClr_a, true)
        local k = p + 2;
        k = k + 0 + m;
        renderer.text(s + k, t + r / 2 - f.y / 2, logoClr_r, logoClr_g, logoClr_b, logoClr_a, "b", nil, "B")
        renderer.text(s + k, t + r / 2 - f.y / 2, c, e, g, l, "", nil, n)
    end
    
    client.set_event_callback("paint_ui", function()
        g:handler()
    end)
    
    return g
end)()

local function push_notify(text)
    notify.new_bottom(148, 0, 211, { { text .. "   " } }) 
end



math.clamp = function (x, a, b)
    if a > x then return a
    elseif b < x then return b
    else return x end
end

resolverFuncs = {
    last_sim_time = 0,
    native_GetClientEntity = vtable_bind('client.dll', 'VClientEntityList003', 3, 'void*(__thiscall*)(void*, int)'),
    bodyYaw = {},
    eyeAngles = {},
    isDefensiveResolver = function()
        if lp == nil or not entity.is_alive(lp) then return end
        local m_flOldSimulationTime = ffi.cast("float*", ffi.cast("uintptr_t", resolverFuncs.native_GetClientEntity(lp)) + 0x26C)[0]
        local m_flSimulationTime = entity.get_prop(lp, "m_flSimulationTime")
        local delta = toticks(m_flOldSimulationTime - m_flSimulationTime)
        if delta > 0 then
            resolverFuncs.last_sim_time = globals.tickcount() + delta - toticks(client.real_latency())
        end
        return resolverFuncs.last_sim_time > globals.tickcount()
    end,
    clamp = function(x, minval, maxval)
        if x < minval then
            return minval
        elseif x > maxval then
            return maxval
        else
            return x
        end
    end,
    getPrevSimtime = function(ent)
        local ent_ptr = resolverFuncs.native_GetClientEntity(ent)    
        if ent_ptr ~= nil then 
            return ffi.cast('float*', ffi.cast('uintptr_t', ent_ptr) + 0x26C)[0] 
        end
    end,
    restore = function()
        for i = 1, 64 do
            plist.set(i, "Force body yaw", false)
        end
    end,
    getMaxDesync = function(animstate)
        local speedfactor = math.clamp(animstate.feet_speed_forwards_or_sideways, 0, 1)
        local avg_speedfactor = (animstate.stop_to_full_running_fraction * -0.3 - 0.2) * speedfactor + 1

        local duck_amount = animstate.duck_amount
        if duck_amount > 0 then
            avg_speedfactor = avg_speedfactor + (duck_amount * speedfactor * (0.5 - avg_speedfactor))
        end

        return math.clamp(avg_speedfactor, .5, 1)
    end,
    handle = function(current_threat)
        if current_threat == nil or not entity.is_alive(current_threat) or entity.is_dormant(current_threat) then 
            resolverFuncs.restore()
            return 
        end
    
        if resolverFuncs.bodyYaw[current_threat] == nil then 
            resolverFuncs.bodyYaw[current_threat], resolverFuncs.eyeAngles[current_threat] = {}, {}
        end
    
        local simtime = toticks(entity.get_prop(current_threat, 'm_flSimulationTime'))
        local prev_simtime = toticks(resolverFuncs.getPrevSimtime(current_threat))
        resolverFuncs.bodyYaw[current_threat][simtime] = entity.get_prop(current_threat, 'm_flPoseParameter', 11) * 120 - 60
        resolverFuncs.eyeAngles[current_threat][simtime] = select(2, entity.get_prop(current_threat, "m_angEyeAngles"))
    
        if resolverFuncs.bodyYaw[current_threat][prev_simtime] ~= nil then
            local ent = c_entity.new(current_threat)
            local animstate = ent:get_anim_state()
            local max_desync = resolverFuncs.getMaxDesync(animstate)
            local Pitch = entity.get_prop(current_threat, "m_angEyeAngles[0]")
            local pitch_e = Pitch > -30 and Pitch < 49
            local curr_side = globals.tickcount() % 4 > 1 and 1 or - 1
    
            if getUi(menu.builderTab.resolver_type) == gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Stable") then
                local should_correct = (simtime - prev_simtime >= 1) and math.abs(max_desync) < 45 and resolverFuncs.bodyYaw[current_threat][prev_simtime] ~= 0
                if should_correct then
                    local value = math.random(0, resolverFuncs.bodyYaw[current_threat][prev_simtime] * math.random(-1, 1)) * .25
                    plist.set(current_threat, 'Force body yaw', true)  
                    plist.set(current_threat, 'Force body yaw value', value) 
                else
                    plist.set(current_threat, 'Force body yaw', false)  
                end
            elseif getUi(menu.builderTab.resolver_type) == gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Laboratory") then
                if pitch_e then
                    value_body = 0
                else
                    value_body = curr_side * (max_desync * math.random(0, 58))
                end
                plist.set(current_threat, 'Force body yaw', true)  
                plist.set(current_threat, 'Force body yaw value', value_body) 
            else
                if not resolverFuncs.isDefensiveResolver(current_threat) then return end
                if pitch_e then
                    value_body = 0
                else
                    value_body = math.random(0, resolverFuncs.bodyYaw[current_threat][prev_simtime] * math.random(-1, 1)) * .25
                end
                plist.set(current_threat, 'Force body yaw', true)  
                plist.set(current_threat, 'Force body yaw value', value_body) 
            end
        end
        plist.set(current_threat, 'Correction active', true)
    end,
    resolverUpdate = function()
        local lp = entity.get_local_player()
        if not lp then return end
        local entities = entity.get_players(true)
        if not entities then return end
    
        for i = 1, #entities do
            local target = entities[i]
            if not target then return end
            if not entity.is_alive(target) then return end
            resolverFuncs.handle(target)
        end
    end,
    callback_setupCommand = function()
        if getUi(menu.builderTab.resolver) then
            resolverFuncs.resolverUpdate()
        end
    end,
    callback_shutDown = function()
        resolverFuncs.restore()
    end,
}

ui.set_callback(menu.builderTab.resolver, function(self)
    if not getUi(self) then
        resolverFuncs.restore()
    end
end, true)

client.set_event_callback("setup_command", resolverFuncs.callback_setupCommand)

client.set_event_callback('shutdown', resolverFuncs.restore)



thirdpersonFuncs = {
    thirdpersonValues = function()
        if (getUi(menu.visualsTab.collisionControl)) then
            cvar.cam_collision:set_int(1)
        else
            cvar.cam_collision:set_int(0)
        end
    
        if (getUi(menu.visualsTab.thirdpersonsenb)) then
            cvar.c_mindistance:set_int(getUi(menu.visualsTab.thirdpersondistance))
            cvar.c_maxdistance:set_int(getUi(menu.visualsTab.thirdpersondistance))
        end
    end,
    callback_paintUi = function()
        thirdpersonFuncs.thirdpersonValues()
    end,
}

client.set_event_callback('paint_ui', thirdpersonFuncs.callback_paintUi)

ui.set_callback(menu.visualsTab.collisionControl, thirdpersonFuncs.thirdpersonValues)
ui.set_callback(menu.visualsTab.thirdpersonsenb, thirdpersonFuncs.thirdpersonValues)
ui.set_callback(menu.visualsTab.thirdpersondistance, thirdpersonFuncs.thirdpersonValues)



slowwalkFuncs = {
    setSpeed = function(newSpeed)
        if newSpeed == 245 then return end

        local LocalPlayer = entity.get_local_player()
        local vx, vy = entity.get_prop(LocalPlayer, "m_vecVelocity")
        local velocity = math.floor(math.min(10000, math.sqrt(vx*vx + vy*vy) + 0.5))
        local maxvelo = newSpeed

        if(velocity < maxvelo) then
            client.set_cvar("cl_sidespeed", maxvelo)
            client.set_cvar("cl_forwardspeed", maxvelo)
            client.set_cvar("cl_backspeed", maxvelo)
        end
    
        if(velocity >= maxvelo) then
            local kat = math.atan2(client.get_cvar("cl_forwardspeed"), client.get_cvar("cl_sidespeed"))
            local forward = math.cos(kat)*maxvelo;
            local side = math.sin(kat)*maxvelo;
            client.set_cvar("cl_sidespeed", side)
            client.set_cvar("cl_forwardspeed", forward)
            client.set_cvar("cl_backspeed", forward)
        end
    end,
    callback_runCommand = function()
        if not getUi(menu.miscTab.slowwalksend) then return end

        if not getUi(menu.miscTab.slowwalkhotkey) then
            slowwalkFuncs.setSpeed(450)
        else
            slowwalkFuncs.setSpeed(getUi(menu.miscTab.slowwalkslider))
        end
    end,
}

client.set_event_callback("run_command", slowwalkFuncs.callback_runCommand) 



local pingspike_cb, _, pingspikeSlider = refUi("misc", "miscellaneous", "ping spike")
local newPingspikeValue = menu.miscTab.autofakepingslider

autofakepingFuncs = {
    oldValue = getUi(pingspikeSlider),
    timeStart = globals.realtime(),
    round = function(num, numDecimalPlaces)
        local mult = 10^(numDecimalPlaces or 0)
        if num >= 0 then return math.floor(num * mult + 0.5) / mult
        else return math.ceil(num * mult - 0.5) / mult end
    end,
    rgbPercents = function(percentage)
        local r = 124 * 2 - 165 * percentage
        local g = 260 * percentage
        local b = 13
        return r, g, b
    end,
    callback_runCommand = function()
        local player_resource = entity.get_all("CCSPlayerResource")[1]
        if player_resource == nil then return end
        local ping = entity.get_prop(player_resource, "m_iPing", entity.get_local_player())
         
        if ping == nil then return end
        if ping > 0 and ping < 200 then
            local slider = getUi(newPingspikeValue)
            local diff = math.abs(slider - ping)
            if diff > 200 then return end
            setUi(pingspikeSlider, diff)
        end    
    end,
    callback_paint = function()
        if not getUi(menu.miscTab.autofakepingsend) then return end

        if entity.get_local_player() == nil then return end
    
        if diff_old == nil then
            diff_old = 0
        end
        
        local player_resource = entity.get_all("CCSPlayerResource")[1]
        if player_resource == nil then return end
        local ping = entity.get_prop(player_resource, "m_iPing", entity.get_local_player())
        if ping == nil then return end
        local maxping = getUi(newPingspikeValue)
        if maxping == nil then return end
        local diff = math.floor(ping / maxping * 100)
        if diff == nil then return end
        
        if diff_old ~= diff and globals.realtime() - autofakepingFuncs.timeStart > 0.03 then
            autofakepingFuncs.timeStart = globals.realtime()
            if diff_old > diff then i = -1 else i = 1 end
            diff_old = diff_old + i
        end

        local r, g, b = autofakepingFuncs.rgbPercents(diff_old / 100)
        
        if diff < 75 and diff > 0 then
            r, g, b = autofakepingFuncs.rgbPercents(diff_old / 100)
        elseif diff >= 75 then
            r, g, b = 124, 195, 13
        elseif diff < 0 then
            r, g, b = 237, 27, 3
        end
        
        client.draw_indicator(ctx, 204, 204, 204, 255, "" .. ping .. " / " .. maxping)
    end,
}

client.set_event_callback("run_command", autofakepingFuncs.callback_runCommand)

client.set_event_callback("paint", autofakepingFuncs.callback_paint)



lagcompFuncs = {
    positions = {},
    lc = false,
    callback_setupCommand = function(cmd)
        local plocal = entity.get_local_player()
        local origin = vector(entity.get_origin(plocal))
        local time = 1 / globals.tickinterval()

        if cmd.chokedcommands == 0 then
            lagcompFuncs.positions[#lagcompFuncs.positions + 1] = origin

            if #lagcompFuncs.positions >= time then
                local record = lagcompFuncs.positions[time]
                lagcompFuncs.lc = (origin - record):lengthsqr() > 4096
            end
        end

        if #lagcompFuncs.positions > time then
            table.remove(lagcompFuncs.positions, 1)
        end
    end,
    callback_paintUi = function()
        if not getUi(menu.visualsTab.lcIndicatorEnb) then return end

        local plocal = entity.get_local_player()
        local flags = entity.get_prop(plocal, "m_fFlags")
        
        if not flags then return end
        if bit.band(flags, 1) == 1 and not lagcompFuncs.lc or not entity.is_alive(plocal) then return end

        local r, g, b, a = 240, 15, 15, 240
        if lagcompFuncs.lc then r, g, b = 160, 202, 43 end
        
        renderer.indicator(r, g, b, a, "LC")
    end,
}

client.set_event_callback("setup_command", lagcompFuncs.callback_setupCommand)

client.set_event_callback("paint_ui", lagcompFuncs.callback_paintUi)



local g_esp_data = { }
local g_sim_ticks, g_net_data = { }, { }

lagcompEnemyFuncs = {
    timeToTicks = function(t)
        return math.floor(0.5 + (t / globals.tickinterval()))
    end,
    vecSubstract = function(a, b)
        return { a[1] - b[1], a[2] - b[2], a[3] - b[3] }
    end,
    vecAdd = function(a, b)
        return { a[1] + b[1], a[2] + b[2], a[3] + b[3] }
    end,
    vecLenght = function(x, y)
        return (x * x + y * y)
    end,
    getEntities = function(enemy_only, alive_only)
        local enemy_only = enemy_only ~= nil and enemy_only or false
        local alive_only = alive_only ~= nil and alive_only or true
        
        local result = {}
    
        local me = entity.get_local_player()
        local player_resource = entity.get_player_resource()
        
        for player = 1, globals.maxplayers() do
            local is_enemy, is_alive = true, true
            
            if enemy_only and not entity.is_enemy(player) then is_enemy = false end
            if is_enemy then
                if alive_only and entity.get_prop(player_resource, 'm_bAlive', player) ~= 1 then is_alive = false end
                if is_alive then table.insert(result, player) end
            end
        end
    
        return result
    end,
    extrapolate = function(ent, origin, flags, ticks)
        local tickinterval = globals.tickinterval()
    
        local sv_gravity = cvar.sv_gravity:get_float() * tickinterval
        local sv_jump_impulse = cvar.sv_jump_impulse:get_float() * tickinterval
    
        local p_origin, prev_origin = origin, origin
    
        local velocity = { entity.get_prop(ent, 'm_vecVelocity') }
        local gravity = velocity[3] > 0 and -sv_gravity or sv_jump_impulse
    
        for i=1, ticks do
            prev_origin = p_origin
            p_origin = {
                p_origin[1] + (velocity[1] * tickinterval),
                p_origin[2] + (velocity[2] * tickinterval),
                p_origin[3] + (velocity[3]+gravity) * tickinterval,
            }
    
            local fraction = client.trace_line(-1, 
                prev_origin[1], prev_origin[2], prev_origin[3], 
                p_origin[1], p_origin[2], p_origin[3]
            )
    
            if fraction <= 0.99 then
                return prev_origin
            end
        end
    
        return p_origin
    end,
    callback_paint = function()
        if not getUi(menu.visualsTab.lcEnemyIndicatorEnb) then return end
        local me = entity.get_local_player()
        local player_resource = entity.get_player_resource()

        if not me or not entity.is_alive(me) then
            return
        end

        local observer_mode = entity.get_prop(me, "m_iObserverMode")
        local active_players = {}

        if (observer_mode == 0 or observer_mode == 1 or observer_mode == 2 or observer_mode == 6) then
            active_players = lagcompEnemyFuncs.getEntities(true, true)
        elseif (observer_mode == 4 or observer_mode == 5) then
            local all_players = lagcompEnemyFuncs.getEntities(false, true)
            local observer_target = entity.get_prop(me, "m_hObserverTarget")
            local observer_target_team = entity.get_prop(observer_target, "m_iTeamNum")

            for test_player = 1, #all_players do
                if (
                    observer_target_team ~= entity.get_prop(all_players[test_player], "m_iTeamNum") and
                    all_players[test_player ] ~= me
                ) then
                    table.insert(active_players, all_players[test_player])
                end
            end
        end

        if #active_players == 0 then
            return
        end

        for idx, net_data in pairs(g_net_data) do
            if entity.is_alive(idx) and entity.is_enemy(idx) and net_data ~= nil then
                if net_data.lagcomp then
                    local predicted_pos = net_data.predicted_origin

                    local min = lagcompEnemyFuncs.vecAdd({ entity.get_prop(idx, 'm_vecMins') }, predicted_pos)
                    local max = lagcompEnemyFuncs.vecAdd({ entity.get_prop(idx, 'm_vecMaxs') }, predicted_pos)

                    local points = {
                        {min[1], min[2], min[3]}, {min[1], max[2], min[3]},
                        {max[1], max[2], min[3]}, {max[1], min[2], min[3]},
                        {min[1], min[2], max[3]}, {min[1], max[2], max[3]},
                        {max[1], max[2], max[3]}, {max[1], min[2], max[3]},
                    }

                    local edges = {
                        {0, 1}, {1, 2}, {2, 3}, {3, 0}, {5, 6}, {6, 7}, {1, 4}, {4, 8},
                        {0, 4}, {1, 5}, {2, 6}, {3, 7}, {5, 8}, {7, 8}, {3, 4}
                    }

                    for i = 1, #edges do
                        if i == 1 then
                            local origin = { entity.get_origin(idx) }
                            local origin_w2s = { renderer.world_to_screen(origin[1], origin[2], origin[3]) }
                            local min_w2s = { renderer.world_to_screen(min[1], min[2], min[3]) }

                            if origin_w2s[1] ~= nil and min_w2s[1] ~= nil then
                                renderer.line(origin_w2s[1], origin_w2s[2], min_w2s[1], min_w2s[2], 47, 117, 221, 255)
                            end
                        end

                        if points[edges[i][1]] ~= nil and points[edges[i][2]] ~= nil then
                            local p1 = { renderer.world_to_screen(points[edges[i][1]][1], points[edges[i][1]][2], points[edges[i][1]][3]) }
                            local p2 = { renderer.world_to_screen(points[edges[i][2]][1], points[edges[i][2]][2], points[edges[i][2]][3]) }
                
                            renderer.line(p1[1], p1[2], p2[1], p2[2], 47, 117, 221, 255)
                        end
                    end
                end

                local text = {
                    [0] = '', [1] = 'LAG COMP BREAKER',
                    [2] = 'SHIFTING TICKBASE'
                }

                local x1, y1, x2, y2, a = entity.get_bounding_box(idx)
                local palpha = 0

                if g_esp_data[idx] > 0 then
                    g_esp_data[idx] = g_esp_data[idx] - globals.frametime()*2
                    g_esp_data[idx] = g_esp_data[idx] < 0 and 0 or g_esp_data[idx]

                    palpha = g_esp_data[idx]
                end

                local tb = net_data.tickbase or g_esp_data[idx] > 0
                local lc = net_data.lagcomp

                if not tb or net_data.lagcomp then
                    palpha = a
                end

                if x1 ~= nil and a > 0 then
                    local name = entity.get_player_name(idx)
                    local y_add = name == '' and -8 or 0

                    renderer.text(x1 + (x2-x1)/2, y1 - 18 + y_add, 255, 45, 45, palpha*255, 'c', 0, text[tb and 2 or (lc and 1 or 0)])
                end
            end
        end
    end,
    callback_netUpdateEnd = function()
        if not getUi(menu.visualsTab.lcEnemyIndicatorEnb) then return end
        local me = entity.get_local_player()
        local players = lagcompEnemyFuncs.getEntities(true, true)

        for i=1, #players do
            local idx = players[i]
            local prev_tick = g_sim_ticks[idx]
            
            if entity.is_dormant(idx) or not entity.is_alive(idx) then
                g_sim_ticks[idx] = nil
                g_net_data[idx] = nil
                g_esp_data[idx] = nil
            else
                local player_origin = { entity.get_origin(idx) }
                local simulation_time = lagcompEnemyFuncs.timeToTicks(entity.get_prop(idx, 'm_flSimulationTime'))
        
                if prev_tick ~= nil then
                    local delta = simulation_time - prev_tick.tick

                    if delta < 0 or delta > 0 and delta <= 64 then
                        local m_fFlags = entity.get_prop(idx, 'm_fFlags')

                        local diff_origin = lagcompEnemyFuncs.vecSubstract(player_origin, prev_tick.origin)
                        local teleport_distance = lagcompEnemyFuncs.vecLenght(diff_origin[1], diff_origin[2])

                        local extrapolated = lagcompEnemyFuncs.extrapolate(idx, player_origin, m_fFlags, delta-1)
        
                        if delta < 0 then
                            g_esp_data[idx] = 1
                        end

                        g_net_data[idx] = {
                            tick = delta-1,

                            origin = player_origin,
                            predicted_origin = extrapolated,

                            tickbase = delta < 0,
                            lagcomp = teleport_distance > 4096,
                        }
                    end
                end
        
                if g_esp_data[idx] == nil then
                    g_esp_data[idx] = 0
                end

                g_sim_ticks[idx] = {
                    tick = simulation_time,
                    origin = player_origin,
                }
            end
        end
    end,
}

client.set_event_callback('paint', lagcompEnemyFuncs.callback_paint)
client.set_event_callback('net_update_end', lagcompEnemyFuncs.callback_netUpdateEnd)



fakelagFuncs = {
    OverrideProcessticks = false,
    ShotFakelagReset = false,
    RestoredMaxProcessTicks = false,
    contains = function(tab, this)
        for _, data in pairs(tab) do
            if data == this then
                return true
            end
        end
    
        return false
    end,
    extrapolatePosition = function(player, origin, ticks)
        local x, y, z = entity.get_prop(player, "m_vecVelocity")
        local vecVelocity = vector(
            x * globals.tickinterval() * ticks,
            y * globals.tickinterval() * ticks,
            z * globals.tickinterval() * ticks
        )
    
        return origin + vecVelocity
    end,
    callback_setupCommand = function(e)
        local local_player = entity.get_local_player()
        if not entity.is_alive(local_player) then
            if fakelagFuncs.RestoredMaxProcessTicks then
                fakelagFuncs.RestoredMaxProcessTicks = false
                setUi(refs.usrcmdprocessticks, 16)
                setUi(refs.usrcmdprocessticks_holdaim, true)
            end

            if fakelagFuncs.ShotFakelagReset then
                fakelagFuncs.ShotFakelagReset = false
                setUi(refs.bodyYaw[1], "Static")
            end

            return
        end

        local OnPeekTrigger = false
        local Weapon = entity.get_player_weapon(local_player)
        local Jumping =  bit.band(entity.get_prop(local_player, "m_fFlags"), 1) == 0
        local Velocity = vector(entity.get_prop(local_player, "m_vecVelocity")):length2d()

        local FakeDuck = getUi(refs.fakeDuck)

        local FakelagLimit = getUi(menu.fakelagTab.fakelagLimit)
        local FakelagAmount = getUi(menu.fakelagTab.fakelagAmount)
        local FakelagVariance = getUi(menu.fakelagTab.fakelagVariance)
        local FakelagonshotStyle = getUi(menu.fakelagTab.fakelagResetonshotStyle)
        local onshot = getUi(refs.OSAA[1]) and getUi(refs.OSAA[2]) and not FakeDuck
        local DoubleTap = getUi(refs.dt[1]) and getUi(refs.dt[2]) and not FakeDuck
        if getUi(menu.fakelagTab.fakelagOptimizeModifier) and not onshot and not DoubleTap then
            local EyePosition = fakelagFuncs.extrapolatePosition(local_player, vector(client.eye_position()), 14)
            for _, ptr in pairs(entity.get_players(true)) do
                if entity.is_alive(ptr) then
                    local TargetPosition = vector(entity.get_origin(ptr))
                    local Fraction, _ = client.trace_line(local_player, EyePosition.x, EyePosition.y, EyePosition.z, TargetPosition.x, TargetPosition.y, TargetPosition.z)
                    local _, Damage = client.trace_bullet(ptr, EyePosition.x, EyePosition.y, EyePosition.z, TargetPosition.x, TargetPosition.y, TargetPosition.z)
                    if Damage > 0 and Fraction < 0.8 then
                        OnPeekTrigger = true
                        break
                    end
                end
            end

            if OnPeekTrigger then
                FakelagLimit = math.random(14,16)
                FakelagVariance = 27
                FakelagAmount = "Maximum"
            elseif Velocity > 20 and not Jumping then
                FakelagLimit = math.random(14,16)
                FakelagVariance = 24
                FakelagAmount = "Maximum"
            elseif Jumping then
                FakelagLimit = math.random(14,16)
                FakelagVariance = 39
                FakelagAmount = "Maximum"
            end
        end

        if getUi(menu.fakelagTab.fakelagBreakLCAir) and Jumping and not onshot and not DoubleTap then
            FakelagVariance = math.random(21,28)
            FakelagAmount = "Fluctuate"
        end

        if getUi(menu.fakelagTab.fakelagResetOS) and Weapon and not FakeDuck and not onshot and not DoubleTap then
            local LastShotTimer = entity.get_prop(Weapon, "m_fLastShotTime")
            local EyePosition = fakelagFuncs.extrapolatePosition(local_player, vector(client.eye_position()), 14)
            if math.abs(toticks(globals.curtime() - LastShotTimer)) < 6 then
                local BreakLC = false
                for _, ptr in pairs(entity.get_players(true)) do
                    if entity.is_alive(ptr) then
                        local TargetPosition = vector(entity.get_origin(ptr))
                        local _, Damage = client.trace_bullet(ptr, EyePosition.x, EyePosition.y, EyePosition.z, TargetPosition.x, TargetPosition.y, TargetPosition.z)
                        if Damage > 0 then
                            BreakLC = true
                            break	
                        end
                    end
                end

                if BreakLC then
                    FakelagVariance = 26
                    FakelagAmount = "Fluctuate"
                end
            end

            if math.abs(toticks(globals.curtime() - LastShotTimer)) < (FakelagonshotStyle == "Default" and 3 or FakelagonshotStyle == "Safest" and 4 or 5) then
                FakelagLimit = 1
                e.no_choke = true
                ShotFakelagReset = true
                ui.set(refs.bodyYaw[1], "Off")
                ui.set(refs.usrcmdprocessticks_holdaim, false)
            elseif ShotFakelagReset then
                ShotFakelagReset = false
                ui.set(refs.bodyYaw[1], "Static")
                ui.set(refs.usrcmdprocessticks_holdaim, true)
            end

        elseif ShotFakelagReset then
            ShotFakelagReset = false
            ui.set(refs.bodyYaw[1], "Static")
            ui.set(refs.usrcmdprocessticks_holdaim, true)
        end

        if FakeDuck or onshot or (DoubleTap and DoubleTapBoost == "Off") then
            FakelagLimit = 15
            FakelagVariance = 0
            OverrideProcessticks = true
            ui.set(refs.usrcmdprocessticks, 16)
        elseif not FakeDuck and not onshot and not DoubleTap and OverrideProcessticks then
            OverrideProcessticks = false
            if FakelagLimit > (getUi(refs.usrcmdprocessticks) - 1) then
                ui.set(refs.usrcmdprocessticks, FakelagLimit + 1)
            end
        end

        if getUi(menu.fakelagTab.fakelagOptionsForceChoked) and not Jumping and not onshot and not DoubleTap then
            e.allow_send_packet = e.chokedcommands >= FakelagLimit
        end

        RestoredMaxProcessTicks = true
        ui.set( refs.flenabled, true)
        ui.set( refs.flamount, FakelagAmount)
        ui.set( refs.flVariance, FakelagVariance)
        ui.set( refs.flLimit, math.min(math.max(FakelagLimit, 1), getUi(refs.usrcmdprocessticks) - 1))
    end,
}

client.set_event_callback('setup_command', fakelagFuncs.callback_setupCommand)



dtairFuncs = {
    local_player = nil,
    callback_reg = false,
    dt_charged = false,
    checkCharge = function()
        local m_nTickBase = entity.get_prop(dtairFuncs.local_player, 'm_nTickBase')
        local client_latency = client.latency()
        local shift = math.floor(m_nTickBase - globals.tickcount() - 3 - toticks(client_latency) * .5 + .5 * (client_latency * 10))

        local wanted = -14 + (getUi(ref.doubletap.fakelag_limit) - 1) + 3 

        dtairFuncs.dt_charged = shift <= wanted
    end,
    callback_setupCommand = function()
        if not getUi(menu.miscTab.dtairsend) then return end

        if not getUi(ref.doubletap.main[2]) or not getUi(ref.doubletap.main[1]) then
            setUi(ref.aimbot, true)
    
            if dtairFuncs.callback_reg then
                client.unset_event_callback('run_command', dtairFuncs.checkCharge)
                dtairFuncs.callback_reg = false
            end
            return
        end
    
        dtairFuncs.local_player = entity.get_local_player()
    
        if not dtairFuncs.callback_reg then
            client.set_event_callback('run_command', dtairFuncs.checkCharge)
            dtairFuncs.callback_reg = true
        end
    
        local threat = client.current_threat()
    
        if not dtairFuncs.dt_charged
        and threat
        and bit.band(entity.get_prop(dtairFuncs.local_player, 'm_fFlags'), 1) == 0
        and bit.band(entity.get_esp_data(threat).flags, bit.lshift(1, 11)) == 2048 then
            setUi(ref.aimbot, false)
        else
            setUi(ref.aimbot, true)
        end
    end,
    callback_shutDown = function()
        setUi(ref.aimbot, true)
    end,
}

client.set_event_callback('setup_command', dtairFuncs.callback_setupCommand)

client.set_event_callback('shutdown', dtairFuncs.callback_shutDown)



local start_time = client.unix_time()
local function get_elapsed_time()
    local elapsed_seconds = client.unix_time() - start_time
    local hours = math.floor(elapsed_seconds / 3600)
    local minutes = math.floor((elapsed_seconds - hours * 3600) / 60)
    local seconds = math.floor(elapsed_seconds - hours * 3600 - minutes * 60)
    return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

local aaBuilder = {}
local aaContainer = {}

for i=1, #vars.aaStates do
    aaContainer[i] = func.hex({200,200,200}) .. "(" .. func.hex({222,55,55}) .. "" .. vars.pStates[i] .. "" .. func.hex({200,200,200}) .. ")" .. func.hex({155,155,155}) .. " "
    aaBuilder[i] = {
        enableState = ui.new_checkbox(tab, container, "\aFFFFFFFFEnable " .. func.hex({lua_color.r, lua_color.g, lua_color.b}) .. vars.aaStates[i] .. func.hex({200,200,200}) .. " state"),
        forceDefensive = ui.new_checkbox(tab, container, "Force Defensive\n" .. aaContainer[i]),
        stateDisablers = ui.new_multiselect(tab, container, "Disablers\n" .. aaContainer[i], "Standing", "Moving", "Slowwalking", "Crouching", "Air", "Air-Crouching", "Crouch-Moving"),
        pitch = ui.new_combobox(tab, container, "[ \aB8FFDAFF" .. vars.aaStates[i] .. " \aFFFFFFFF]\aD0D0D0FF " .. "Pitch\n" .. aaContainer[i], "Off", "Default", "Up", "Down", "Random", "Custom"),
        pitchSlider = ui.new_slider(tab, container, "Pitch add\n" .. aaContainer[i], -89, 89, 0, true, "°", 1),
        yawBase = ui.new_combobox(tab, container, "[ \aB8FFDAFF" .. vars.aaStates[i] .. " \aFFFFFFFF]\aD0D0D0FF " .. "Yaw base\n" .. aaContainer[i], "Local view", "At targets"),
        yaw = ui.new_combobox(tab, container, "[ \aB8FFDAFF" .. vars.aaStates[i] .. " \aFFFFFFFF]\aD0D0D0FF " .. "Yaw\n" .. aaContainer[i], "Off", "180", "180 Z", "Spin", "Slow Jitter", "Delay Jitter", "Delayed", "L&R"),
        yawRandomOrder = ui.new_checkbox(tab, container, "Random Order\n" .. aaContainer[i]),
        switchTicks = ui.new_slider(tab, container, "Ticks\n" .. aaContainer[i], 1, 14, 6, 0),
        yawStatic = ui.new_slider(tab, container, "yaw\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawCount = ui.new_slider(tab, container, "X7 Delayed yaw count\n" .. aaContainer[i], 2, 10, 2, true, "", 1),
        yawDelayOffset1 = ui.new_slider(tab, container, "Delayed yaw I\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawDelayOffset2 = ui.new_slider(tab, container, "Delayed yaw II\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawDelayOffset3 = ui.new_slider(tab, container, "Delayed yaw III\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawDelayOffset4 = ui.new_slider(tab, container, "Delayed yaw IV\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawDelayOffset5 = ui.new_slider(tab, container, "Delayed yaw V\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawDelayOffset6 = ui.new_slider(tab, container, "Delayed yaw VI\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawDelayOffset7 = ui.new_slider(tab, container, "Delayed yaw VII\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawDelayOffset8 = ui.new_slider(tab, container, "Delayed yaw VIII\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawDelayOffset9 = ui.new_slider(tab, container, "Delayed yaw IX\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawDelayOffset10 = ui.new_slider(tab, container, "Delayed yaw X\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawLeft = ui.new_slider(tab, container, "Left yaw\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawRight = ui.new_slider(tab, container, "Right yaw\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawJitter = ui.new_combobox(tab, container, "[ \aB8FFDAFF" .. vars.aaStates[i] .. " \aFFFFFFFF]\aD0D0D0FF " .. "Yaw jitter\n" .. aaContainer[i], "Off", "Offset", "Center", "Skitter", "Random", "3-Way", "L&R"),
        wayFirst = ui.new_slider(tab, container, "First yaw jitter\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        waySecond = ui.new_slider(tab, container, "Second yaw jitter\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        wayThird = ui.new_slider(tab, container, "Third yaw jitter\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawJitterStatic = ui.new_slider(tab, container, "yaw jitter\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawJitterLeft = ui.new_slider(tab, container, "Left yaw jitter\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawJitterRight = ui.new_slider(tab, container, "Right yaw jitter\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        bodyYaw = ui.new_combobox(tab, container, "[ \aB8FFDAFF" .. vars.aaStates[i] .. " \aFFFFFFFF]\aD0D0D0FF " .. "Body yaw\n" .. aaContainer[i], "Off", "Custom Desync", "Opposite", "Jitter", "Static"),
        bodyYawStatic = ui.new_slider(tab, container, "body yaw\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        fakeYawLimit = ui.new_slider(tab, container, "Fake yaw limit\n" .. aaContainer[i], -59, 59, 0, true, "°", 1),
        defensiveAntiAim = ui.new_checkbox(tab, container, "Defensive Anti-Aim\n" .. aaContainer[i]),
        def_pitch = ui.new_combobox(tab, container, "[ \aB8FFDAFF" .. vars.aaStates[i] .. " - def \aFFFFFFFF]\aD0D0D0FF " .. "Pitch\nd" .. aaContainer[i], "Off", "Default", "Up", "Down", "Spin", "Random Switch", "Switch", "Random", "Custom"),
        def_pitchSlider = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Pitch add\n" .. aaContainer[i], -89, 89, 0, true, "°", 1),
        def_pitchSliderStepA = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Switch Step A\n" .. aaContainer[i], -89, 89, 0, true, "°", 1),
        def_pitchSliderStepB = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Switch Step B\n" .. aaContainer[i], -89, 89, 0, true, "°", 1),
        def_pitchSliderSwitchTicks = ui.new_slider(tab, container, "Switch ticks\n" .. aaContainer[i], 1, 14, 6, 0),
        def_pitchSliderMin = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Spin min\n" .. aaContainer[i], -89, 89, 0, true, "°", 1),
        def_pitchSliderMax = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Spin max\n" .. aaContainer[i], -89, 89, 0, true, "°", 1),
        def_pitchSliderSpeed = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Spin Speed\n" .. aaContainer[i], 1, 100, 50, true, "%", 1),
        def_yawBase = ui.new_combobox(tab, container, "[ \aB8FFDAFF" .. vars.aaStates[i] .. " - def \aFFFFFFFF]\aD0D0D0FF " .. "Yaw base\nd" .. aaContainer[i], "Local view", "At targets"),
        def_yaw = ui.new_combobox(tab, container, "[ \aB8FFDAFF" .. vars.aaStates[i] .. " - def \aFFFFFFFF]\aD0D0D0FF " .. "Yaw\nd" .. aaContainer[i], "Off", "180", "180 Z", "Spin", "Slow Jitter", "Delay Jitter", "Delayed", "L&R"),
        def_yawRandomOrder = ui.new_checkbox(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Random Order\n" .. aaContainer[i]),
        def_switchTicks = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "ticks\n" .. aaContainer[i], 1, 14, 6, 0),
        def_yawStatic = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "yaw\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawCount = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "X7 Delayed yaw count\n" .. aaContainer[i], 2, 10, 2, true, "", 1),
        def_yawDelayOffset1 = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Delayed yaw I\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawDelayOffset2 = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Delayed yaw II\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawDelayOffset3 = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Delayed yaw III\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawDelayOffset4 = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Delayed yaw IV\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawDelayOffset5 = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Delayed yaw V\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawDelayOffset6 = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Delayed yaw VI\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawDelayOffset7 = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Delayed yaw VII\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawDelayOffset8 = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Delayed yaw VIII\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawDelayOffset9 = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Delayed yaw IX\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawDelayOffset10 = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Delayed yaw X\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawLeft = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Left yaw\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawRight = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Right yaw\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawJitter = ui.new_combobox(tab, container, "[ \aB8FFDAFF" .. vars.aaStates[i] .. " \aFFFFFFFF]\aD0D0D0FF " .. "Yaw jitter\nd" .. aaContainer[i], "Off", "Offset", "Center", "Skitter", "Random", "3-Way", "L&R"),
        def_wayFirst = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "First yaw jitter\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_waySecond = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Second yaw jitter\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_wayThird = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Third yaw jitter\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawJitterStatic = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "yaw jitter\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawJitterLeft = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Left yaw jitter\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_yawJitterRight = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Right yaw jitter\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_bodyYaw = ui.new_combobox(tab, container, "[ \aB8FFDAFF" .. vars.aaStates[i] .. " - def \aFFFFFFFF]\aD0D0D0FF " .. "Body yaw\nd" .. aaContainer[i], "Off", "Custom Desync", "Opposite", "Jitter", "Static"),
        def_bodyYawStatic = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "body yaw\n" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        def_fakeYawLimit = ui.new_slider(tab, container, "[ \aB8FFDAFFDefensive \aFFFFFFFF]\aD0D0D0FF " .. "Fake yaw limit\n" .. aaContainer[i], -59, 59, 0, true, "°", 1),
    }
end

local function getConfig(name)
    local database = database.read(lua.database.configs) or {}

    for i, v in pairs(database) do
        if v.name == name then
            return {
                config = v.config,
                index = i
            }
        end
    end

    for i, v in pairs(presets) do
        if v.name == name then
            return {
                config = v.config,
                index = i
            }
        end
    end

    return false
end

local function saveConfig(name)
    local db = database.read(lua.database.configs) or {}
    local config = {}

    if name:match("[^%w]") ~= nil then
        return
    end

    for key, value in pairs(vars.pStates) do
        config[value] = {}
        for k, v in pairs(aaBuilder[key]) do
            config[value][k] = getUi(v)
        end
    end

    local cfg = getConfig(name)

    if not cfg then
        table.insert(db, { name = name, config = config })
    else
        db[cfg.index].config = config
    end

    database.write(lua.database.configs, db)
end
local function deleteConfig(name)
    local db = database.read(lua.database.configs) or {}

    for i, v in pairs(db) do
        if v.name == name then
            table.remove(db, i)
            break
        end
    end

    for i, v in pairs(presets) do
        if v.name == name then
            return false
        end
    end

    database.write(lua.database.configs, db)
end

local function getConfigList()
    local database = database.read(lua.database.configs) or {}
    local config = {}

    for i, v in pairs(presets) do
        table.insert(config, v.name)
    end

    for i, v in pairs(database) do
        table.insert(config, v.name)
    end

    return config
end

local function typeFromString(input)
    if type(input) ~= "string" then return input end

    local value = input:lower()

    if value == "true" then
        return true
    elseif value == "false" then
        return false
    elseif tonumber(value) ~= nil then
        return tonumber(value)
    else
        return tostring(input)
    end
end

local function loadSettings(config)
    for key, value in pairs(vars.pStates) do
        for k, v in pairs(aaBuilder[key]) do
            if (config[value][k] ~= nil) then
                setUi(v, config[value][k])
            end
        end 
    end
end

local function importSettings()
    loadSettings(json.parse(clipboard.get()))
end

local function exportSettings(name)
    local config = {}
    for key, value in pairs(vars.pStates) do
        config[value] = {}
        for k, v in pairs(aaBuilder[key]) do
            config[value][k] = getUi(v)
        end
    end
    
    clipboard.set(json.stringify(config))
end

local function loadConfig(name)
    local config = getConfig(name)
    loadSettings(config.config)
end

local function initDatabase()
    if database.read(lua.database.configs) == nil then
        database.write(lua.database.configs, {})
    end

    local link = ""

    http.get(link, function(success, response)
        if not success then
            print("Failed to get presets")
            return
        end

        data = json.parse(response.body)
        print(data.presets)

        for i, preset in pairs(data.presets) do
            table.insert(presets, { name = "*"..preset.name, config = preset.config})
            setUi(menu.configTab.name, "*"..preset.name)
        end
        ui.update(menu.configTab.list, getConfigList())
    end)
end
initDatabase()



local aa = {
	ignore = false,
	manualAA= 0,
	input = 0,
}
client.set_event_callback("player_connect_full", function() 
	aa.ignore = false
	aa.manualAA= 0
	aa.input = 0
end) 

local counter = 0
local counter2 = 0
local index2 = 1
local switch = false
local switch2 = false
local switch3 = false
local switch_pending = false
local switch_side = false

distance_knife = {}
distance_knife.anti_knife_dist = function (x1, y1, z1, x2, y2, z2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2 + (z2 - z1)^2)
end
    

client.set_event_callback("run_command", function(cmd)
    vars.breaker.cmd = cmd.command_number
    if cmd.chokedcommands == 0 then
        vars.breaker.origin = vector(entity.get_origin(entity.get_local_player()))
        if vars.breaker.last_origin ~= nil then
            vars.breaker.tp_dist = (vars.breaker.origin - vars.breaker.last_origin):length2dsqr()
            gram_update(vars.breaker.tp_data, vars.breaker.tp_dist, true)
        end
        vars.breaker.last_origin = vars.breaker.origin
    end
end)

client.set_event_callback("predict_command", function(cmd)
    if cmd.command_number == vars.breaker.cmd then
        local tickbase = entity.get_prop(entity.get_local_player(), "m_nTickBase")
        vars.breaker.defensive = math.abs(tickbase - vars.breaker.defensive_check)
        vars.breaker.defensive_check = math.max(tickbase, vars.breaker.defensive_check)
        vars.breaker.cmd = 0
    end
end)

client.set_event_callback("setup_command", function(cmd)
    vars.localPlayer = entity.get_local_player()

    if not vars.localPlayer or not entity.is_alive(vars.localPlayer) then return end
	local flags = entity.get_prop(vars.localPlayer, "m_fFlags")
    local onground = bit.band(flags, 1) ~= 0 and cmd.in_jump == 0
	local valve = entity.get_prop(entity.get_game_rules(), "m_bIsValveDS")
	local origin = vector(entity.get_prop(vars.localPlayer, "m_vecOrigin"))
	local camera = vector(client.camera_angles())
	local eye = vector(client.eye_position())
    local velocity = vector(entity.get_prop(vars.localPlayer, "m_vecVelocity"))
    local weapon = entity.get_player_weapon()
	local pStill = math.sqrt(velocity.x ^ 2 + velocity.y ^ 2) < 5
    local bodyYaw = entity.get_prop(vars.localPlayer, "m_flPoseParameter", 11) * 120 - 60
    local tp_amount = get_average(vars.breaker.tp_data)/get_velocity(entity.get_local_player())*100 
    local is_defensive = (vars.breaker.defensive > 1) and not (tp_amount >= 25 and vars.breaker.defensive >= 13)

    local isSlow = getUi(refs.slow[1]) and getUi(refs.slow[2])
	local isOs = getUi(refs.os[1]) and getUi(refs.os[2])
	local isFd = getUi(refs.fakeDuck)
	local isDt = getUi(refs.dt[1]) and getUi(refs.dt[2])
    local isFl = getUi(refUi("AA", "Fake lag", "Enabled"))
    local legitAA = false

    local manualsOverFs = getUi(menu.aaTab.manualsOverFs) == true and true or false

    vars.pState = 1
    if pStill then vars.pState = 2 end
    if not pStill then vars.pState = 3 end
    if isSlow then vars.pState = 4 end
    if entity.get_prop(vars.localPlayer, "m_flDuckAmount") > 0.1 then vars.pState = 5 end
    if not pStill and entity.get_prop(vars.localPlayer, "m_flDuckAmount") > 0.1 then vars.pState = 8 end
    if not onground then vars.pState = 6 end
    if not onground and entity.get_prop(vars.localPlayer, "m_flDuckAmount") > 0.1 then vars.pState = 7 end

    if func.includes(getUi(menu.builderTab.autoHideshotsStates), vars.aaStates[vars.pState]) and getUi(refs.OSAAA) ~= "Always On" then
        print(1)
            setUi(refs.OSAAA, true)
                setUi(refs.OSAAA, "Always On")
        else
                print(getUi(binds.OSAAA[2][1]))
    end

    if getUi(aaBuilder[9].enableState) and not func.table_contains(getUi(aaBuilder[9].stateDisablers), vars.intToS[vars.pState]) and isDt == false and isOs == false and isFl == true then
		vars.pState = 9
    end

    if getUi(aaBuilder[vars.pState].enableState) == false and vars.pState ~= 1 then
        vars.pState = 1
    end

    if cmd.chokedcommands == 0 then
        counter = counter + 1
    end

    if counter >= 8 then
        counter = 0
    end

    if globals.tickcount() % (getUi(aaBuilder[vars.pState].switchTicks) + 1) == 1 then
        switch = not switch
    end

    if globals.tickcount() % (getUi(aaBuilder[vars.pState].def_pitchSliderSwitchTicks) + 1) == 1 then
        switch2 = not switch2
    end

    local nextAttack = entity.get_prop(vars.localPlayer, "m_flNextAttack")
    local nextPrimaryAttack = entity.get_prop(entity.get_player_weapon(vars.localPlayer), "m_flNextPrimaryAttack")
    local dtActive = false
    if nextPrimaryAttack ~= nil then
        dtActive = not (math.max(nextPrimaryAttack, nextAttack) > globals.curtime())
    end

    local side = bodyYaw > 0 and 1 or -1


        if getUi(menu.aaTab.manuals) ~= "Off" then
            setUi(menu.aaTab.manualTab.manualLeft, "On hotkey")
            setUi(menu.aaTab.manualTab.manualRight, "On hotkey")
            setUi(menu.aaTab.manualTab.manualForward, "On hotkey")
            if aa.input + 0.22 < globals.curtime() then
                if aa.manualAA == 0 then
                    if getUi(menu.aaTab.manualTab.manualLeft) then
                        aa.manualAA = 1
                        aa.input = globals.curtime()
                    elseif getUi(menu.aaTab.manualTab.manualRight) then
                        aa.manualAA = 2
                        aa.input = globals.curtime()
                    elseif getUi(menu.aaTab.manualTab.manualForward) then
                        aa.manualAA = 3
                        aa.input = globals.curtime()
                    end
                elseif aa.manualAA == 1 then
                    if getUi(menu.aaTab.manualTab.manualRight) then
                        aa.manualAA = 2
                        aa.input = globals.curtime()
                    elseif getUi(menu.aaTab.manualTab.manualForward) then
                        aa.manualAA = 3
                        aa.input = globals.curtime()
                    elseif getUi(menu.aaTab.manualTab.manualLeft) then
                        aa.manualAA = 0
                        aa.input = globals.curtime()
                    end
                elseif aa.manualAA == 2 then
                    if getUi(menu.aaTab.manualTab.manualLeft) then
                        aa.manualAA = 1
                        aa.input = globals.curtime()
                    elseif getUi(menu.aaTab.manualTab.manualForward) then
                        aa.manualAA = 3
                        aa.input = globals.curtime()
                    elseif getUi(menu.aaTab.manualTab.manualRight) then
                        aa.manualAA = 0
                        aa.input = globals.curtime()
                    end
                elseif aa.manualAA == 3 then
                    if getUi(menu.aaTab.manualTab.manualForward) then
                        aa.manualAA = 0
                        aa.input = globals.curtime()
                    elseif getUi(menu.aaTab.manualTab.manualLeft) then
                        aa.manualAA = 1
                        aa.input = globals.curtime()
                    elseif getUi(menu.aaTab.manualTab.manualRight) then
                        aa.manualAA = 2
                        aa.input = globals.curtime()
                    end
                end
            end
            if aa.manualAA == 1 or aa.manualAA == 2 or aa.manualAA == 3 then
                aa.ignore = true

                if getUi(menu.aaTab.manuals) == "Static" then
                    setUi(refs.yawJitter[1], "Off")
                    setUi(refs.yawJitter[2], 0)
                    setUi(refs.bodyYaw[1], "Static")
                    setUi(refs.bodyYaw[2], 180)
                    setUi(refs.pitch[1], "Down")

                    if aa.manualAA == 1 then
                        setUi(refs.yawBase, "local view")
                        setUi(refs.yaw[1], "180")
                        setUi(refs.yaw[2], -90)
                        setUi(refs.pitch[1], "Down")
                    elseif aa.manualAA == 2 then
                        setUi(refs.yawBase, "local view")
                        setUi(refs.yaw[1], "180")
                        setUi(refs.yaw[2], 90)
                        setUi(refs.pitch[1], "Down")
                    elseif aa.manualAA == 3 then
                        setUi(refs.yawBase, "local view")
                        setUi(refs.yaw[1], "180")
                        setUi(refs.yaw[2], 180)
                        setUi(refs.pitch[1], "Down")
                    end
                elseif getUi(menu.aaTab.manuals) == "Default" and getUi(aaBuilder[vars.pState].enableState) then
                    if getUi(aaBuilder[vars.pState].yawJitter) == "3-Way" then
                        setUi(refs.yawJitter[1], "Center")
                        local ways = {
                            getUi(aaBuilder[vars.pState].wayFirst),
                            getUi(aaBuilder[vars.pState].waySecond),
                            getUi(aaBuilder[vars.pState].wayThird)
                        }
                        setUi(refs.yawJitter[2], ways[(globals.tickcount() % 3) + 1] )
                    elseif getUi(aaBuilder[vars.pState].yawJitter) == "L&R" then
                        setUi(refs.yawJitter[1], "Center")
                        setUi(refs.yawJitter[2], (side == 1 and getUi(aaBuilder[vars.pState].yawJitterLeft) or getUi(aaBuilder[vars.pState].yawJitterRight)))
                    else
                        setUi(refs.yawJitter[1], getUi(aaBuilder[vars.pState].yawJitter))
                        setUi(refs.yawJitter[2], getUi(aaBuilder[vars.pState].yawJitterStatic))
                    end

                    setUi(refs.bodyYaw[1], "Opposite")
                    setUi(refs.bodyYaw[2], -180)

                    if aa.manualAA == 1 then
                        setUi(refs.yawBase, "local view")
                        setUi(refs.yaw[1], "180")
                        setUi(refs.yaw[2], -90)
                        setUi(refs.pitch[1], "Down")
                    elseif aa.manualAA == 2 then
                        setUi(refs.yawBase, "local view")
                        setUi(refs.yaw[1], "180")
                        setUi(refs.yaw[2], 90)
                        setUi(refs.pitch[1], "Down")
                    elseif aa.manualAA == 3 then
                        setUi(refs.yawBase, "local view")
                        setUi(refs.yaw[1], "180")
                        setUi(refs.yaw[2], 180)
                        setUi(refs.pitch[1], "Down")
                    end
                end                   

            else
                aa.ignore = false
            end
        else
            aa.ignore = false
            aa.manualAA= 0
            aa.input = 0
        end

    if not getUi(menu.aaTab.legitAAHotkey) and aa.ignore == false then
        if getUi(aaBuilder[vars.pState].enableState) then

            cmd.force_defensive = getUi(aaBuilder[vars.pState].forceDefensive) 
            if getUi(aaBuilder[vars.pState].defensiveAntiAim) and is_defensive then
                if getUi(aaBuilder[vars.pState].def_pitch) == "Spin" then
                    setUi(refs.pitch[1], "Custom")
                    setUi(refs.pitch[2], func.normalize_pitch(func.lerp(getUi(aaBuilder[vars.pState].def_pitchSliderMin), getUi(aaBuilder[vars.pState].def_pitchSliderMax), globals.curtime() * getUi(aaBuilder[vars.pState].def_pitchSliderSpeed) * 0.06 % 2 - 1)))
                elseif getUi(aaBuilder[vars.pState].def_pitch) == "Switch" then
                    setUi(refs.pitch[1], "Custom")
                    setUi(refs.pitch[2], switch2 and getUi(aaBuilder[vars.pState].def_pitchSliderStepA) or getUi(aaBuilder[vars.pState].def_pitchSliderStepB))
                elseif getUi(aaBuilder[vars.pState].def_pitch) == "Random" then
                    setUi(refs.pitch[1], "Custom")
                    setUi(refs.pitch[2], math.random(-89, 89))
                elseif getUi(aaBuilder[vars.pState].def_pitch) == "Random Switch" then
                    setUi(refs.pitch[1], "Custom")
                    local pitch
                    if math.random() < 0.5 then
                        pitch = getUi(aaBuilder[vars.pState].def_pitchSliderStepA)
                    else
                        pitch = getUi(aaBuilder[vars.pState].def_pitchSliderStepB)
                    end
                    setUi(refs.pitch[2], pitch)
                elseif getUi(aaBuilder[vars.pState].def_pitch) == "Custom" then
                    setUi(refs.pitch[1], getUi(aaBuilder[vars.pState].def_pitch))
                    setUi(refs.pitch[2], getUi(aaBuilder[vars.pState].def_pitchSlider))
                else
                    setUi(refs.pitch[1], getUi(aaBuilder[vars.pState].def_pitch))
                end
    
                setUi(refs.yawBase, getUi(aaBuilder[vars.pState].def_yawBase))
    
                if getUi(aaBuilder[vars.pState].def_yaw) == "Slow Jitter" then
                    setUi(refs.yaw[1], "180")
                    setUi(refs.yaw[2], switch and getUi(aaBuilder[vars.pState].def_yawRight) or getUi(aaBuilder[vars.pState].def_yawLeft))
                elseif getUi(aaBuilder[vars.pState].def_yaw) == "Delay Jitter" then
                    setUi(refs.yaw[1], "180")
                    if counter == 0 then

                        setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].def_yawRight))
                    elseif counter == 1 then

                        setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].def_yawLeft))
                    elseif counter == 2 then

                        setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].def_yawLeft))
                    elseif counter == 3 then

                        setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].def_yawLeft))
                    elseif counter == 4 then

                       setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].def_yawRight))
                    elseif counter == 5 then

                        setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].def_yawLeft))
                    elseif counter == 6 then

                       setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].def_yawRight))
                    elseif counter == 7 then

                       setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].def_yawRight))
                    end
                elseif getUi(aaBuilder[vars.pState].def_yaw) == "Delayed" then
                    local offsets = {
                        getUi(aaBuilder[vars.pState].def_yawDelayOffset1),
                        getUi(aaBuilder[vars.pState].def_yawDelayOffset2),
                        getUi(aaBuilder[vars.pState].def_yawDelayOffset3),
                        getUi(aaBuilder[vars.pState].def_yawDelayOffset4),
                        getUi(aaBuilder[vars.pState].def_yawDelayOffset5),
                        getUi(aaBuilder[vars.pState].def_yawDelayOffset6),
                        getUi(aaBuilder[vars.pState].def_yawDelayOffset7),
                        getUi(aaBuilder[vars.pState].def_yawDelayOffset8),
                        getUi(aaBuilder[vars.pState].def_yawDelayOffset9),
                        getUi(aaBuilder[vars.pState].def_yawDelayOffset10),
                    }
                    if getUi(aaBuilder[vars.pState].def_yawRandomOrder) then
                        if cmd.command_number % (getUi(aaBuilder[vars.pState].def_switchTicks) + 2) == 1 then
                            index2 = math.random(1, getUi(aaBuilder[vars.pState].def_yawCount))
                        end
                        setUi(refs.yaw[1], "180")
                        setUi(refs.yaw[2], offsets[index2])
                    else
                        if cmd.command_number % (getUi(aaBuilder[vars.pState].def_switchTicks) + 2) == 1 then
                            counter2 = (counter2 + 1) % getUi(aaBuilder[vars.pState].def_yawCount)
                        end
                        setUi(refs.yaw[1], "180")
                        setUi(refs.yaw[2], offsets[counter2 + 1])
                    end
                elseif getUi(aaBuilder[vars.pState].def_yaw) == "L&R" then
                    setUi(refs.yaw[1], "180")
                    setUi(refs.yaw[2],(side == 1 and getUi(aaBuilder[vars.pState].def_yawLeft) or getUi(aaBuilder[vars.pState].def_yawRight)))
                else
                    setUi(refs.yaw[1], getUi(aaBuilder[vars.pState].def_yaw))
                    setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].def_yawStatic))
                end
    
    
                if getUi(aaBuilder[vars.pState].def_yawJitter) == "3-Way" then
                    setUi(refs.yawJitter[1], "Center")
                    local ways = {
                        getUi(aaBuilder[vars.pState].def_wayFirst),
                        getUi(aaBuilder[vars.pState].def_waySecond),
                        getUi(aaBuilder[vars.pState].def_wayThird)
                    }
    
                    setUi(refs.yawJitter[2], ways[(globals.tickcount() % 3) + 1] )
                elseif getUi(aaBuilder[vars.pState].def_yawJitter) == "L&R" then 
                    setUi(refs.yawJitter[1], "Center")
                    setUi(refs.yawJitter[2], (side == 1 and getUi(aaBuilder[vars.pState].def_yawJitterLeft) or getUi(aaBuilder[vars.pState].def_yawJitterRight)))
                else
                    setUi(refs.yawJitter[1], getUi(aaBuilder[vars.pState].def_yawJitter))
                    setUi(refs.yawJitter[2], getUi(aaBuilder[vars.pState].def_yawJitterStatic))
                end
    
                
                if getUi(aaBuilder[vars.pState].def_bodyYaw) == "Custom Desync" then
                    setUi(refs.bodyYaw[1], "Opposite")
                    apply_desync(cmd, getUi(aaBuilder[vars.pState].def_fakeYawLimit))
                else
                    setUi(refs.bodyYaw[1], getUi(aaBuilder[vars.pState].def_bodyYaw))
                end
           
                setUi(refs.bodyYaw[2], (getUi(aaBuilder[vars.pState].def_bodyYawStatic)))
                setUi(refs.fsBodyYaw, false)
            else
                if getUi(aaBuilder[vars.pState].pitch) == "Custom" then
                    setUi(refs.pitch[1], getUi(aaBuilder[vars.pState].pitch))
                    setUi(refs.pitch[2], getUi(aaBuilder[vars.pState].pitchSlider))
                elseif getUi(aaBuilder[vars.pState].pitch) == "Random" then
                    setUi(refs.pitch[1], "Custom")
                    setUi(refs.pitch[2], math.random(-89, 90))
                else
                    setUi(refs.pitch[1], getUi(aaBuilder[vars.pState].pitch))
                end

                setUi(refs.yawBase, getUi(aaBuilder[vars.pState].yawBase))

                if getUi(aaBuilder[vars.pState].yaw) == "Slow Jitter" then
                    setUi(refs.yaw[1], "180")
                    setUi(refs.yaw[2], switch and getUi(aaBuilder[vars.pState].yawRight) or getUi(aaBuilder[vars.pState].yawLeft))
                elseif getUi(aaBuilder[vars.pState].yaw) == "Delay Jitter" then
                    setUi(refs.yaw[1], "180")
                    if counter == 0 then

                        setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].yawRight))
                    elseif counter == 1 then

                        setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].yawLeft))
                    elseif counter == 2 then

                        setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].yawLeft))
                    elseif counter == 3 then

                        setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].yawLeft))
                    elseif counter == 4 then

                    setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].yawRight))
                    elseif counter == 5 then

                        setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].yawLeft))
                    elseif counter == 6 then

                    setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].yawRight))
                    elseif counter == 7 then

                    setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].yawRight))
                    end
                elseif getUi(aaBuilder[vars.pState].yaw) == "Delayed" then
                    local offsets = {
                        getUi(aaBuilder[vars.pState].yawDelayOffset1),
                        getUi(aaBuilder[vars.pState].yawDelayOffset2),
                        getUi(aaBuilder[vars.pState].yawDelayOffset3),
                        getUi(aaBuilder[vars.pState].yawDelayOffset4),
                        getUi(aaBuilder[vars.pState].yawDelayOffset5),
                        getUi(aaBuilder[vars.pState].yawDelayOffset6),
                        getUi(aaBuilder[vars.pState].yawDelayOffset7),
                        getUi(aaBuilder[vars.pState].yawDelayOffset8),
                        getUi(aaBuilder[vars.pState].yawDelayOffset9),
                        getUi(aaBuilder[vars.pState].yawDelayOffset10),
                    }
                    if getUi(aaBuilder[vars.pState].yawRandomOrder) then
                        if cmd.command_number % (getUi(aaBuilder[vars.pState].switchTicks) + 2) == 1 then
                            index2 = math.random(1, getUi(aaBuilder[vars.pState].yawCount))
                        end
                        setUi(refs.yaw[1], "180")
                        setUi(refs.yaw[2], offsets[index2])
                    else
                        if cmd.command_number % (getUi(aaBuilder[vars.pState].switchTicks) + 2) == 1 then
                            counter2 = (counter2 + 1) % getUi(aaBuilder[vars.pState].yawCount)
                        end
                        setUi(refs.yaw[1], "180")
                        setUi(refs.yaw[2], offsets[counter2 + 1])
                    end
                elseif getUi(aaBuilder[vars.pState].yaw) == "L&R" then
                    setUi(refs.yaw[1], "180")
                    setUi(refs.yaw[2],(side == 1 and getUi(aaBuilder[vars.pState].yawLeft) or getUi(aaBuilder[vars.pState].yawRight)))
                else
                    setUi(refs.yaw[1], getUi(aaBuilder[vars.pState].yaw))
                    setUi(refs.yaw[2], getUi(aaBuilder[vars.pState].yawStatic))
                end


                if getUi(aaBuilder[vars.pState].yawJitter) == "3-Way" then
                    setUi(refs.yawJitter[1], "Center")
                    local ways = {
                        getUi(aaBuilder[vars.pState].wayFirst),
                        getUi(aaBuilder[vars.pState].waySecond),
                        getUi(aaBuilder[vars.pState].wayThird)
                    }

                    setUi(refs.yawJitter[2], ways[(globals.tickcount() % 3) + 1] )
                elseif getUi(aaBuilder[vars.pState].yawJitter) == "L&R" then 
                    setUi(refs.yawJitter[1], "Center")
                    setUi(refs.yawJitter[2], (side == 1 and getUi(aaBuilder[vars.pState].yawJitterLeft) or getUi(aaBuilder[vars.pState].yawJitterRight)))
                else
                    setUi(refs.yawJitter[1], getUi(aaBuilder[vars.pState].yawJitter))
                    setUi(refs.yawJitter[2], getUi(aaBuilder[vars.pState].yawJitterStatic))
                end

                
                if getUi(aaBuilder[vars.pState].bodyYaw) == "Custom Desync" then
                    setUi(refs.bodyYaw[1], "Opposite")
                    apply_desync(cmd, getUi(aaBuilder[vars.pState].fakeYawLimit))
                else
                    setUi(refs.bodyYaw[1], getUi(aaBuilder[vars.pState].bodyYaw))
                end
        
                setUi(refs.bodyYaw[2], (getUi(aaBuilder[vars.pState].bodyYawStatic)))
                setUi(refs.fsBodyYaw, false)
            end
        elseif not getUi(aaBuilder[vars.pState].enableState) then
            setUi(refs.pitch[1], "Off")
            setUi(refs.yawBase, "Local view")
            setUi(refs.yaw[1], "Off")
            setUi(refs.yaw[2], 0)
            setUi(refs.yawJitter[1], "Off")
            setUi(refs.yawJitter[2], 0)
            setUi(refs.bodyYaw[1], "Off")
            setUi(refs.bodyYaw[2], 0)
            setUi(refs.fsBodyYaw, false)
            setUi(refs.edgeYaw, false)
            setUi(refs.roll, 0)
        end
    elseif getUi(menu.aaTab.legitAAHotkey) and aa.ignore == false then
        if entity.get_classname(entity.get_player_weapon(vars.localPlayer)) == "CC4" then 
            return 
        end
    
        local should_disable = false
        local planted_bomb = entity.get_all("CPlantedC4")[1]
    
        if planted_bomb ~= nil then
            bomb_distance = vector(entity.get_origin(vars.localPlayer)):dist(vector(entity.get_origin(planted_bomb)))
            
            if bomb_distance <= 64 and entity.get_prop(vars.localPlayer, "m_iTeamNum") == 3 then
                should_disable = true
            end
        end
    
        local pitch, yaw = client.camera_angles()
        local direct_vec = vector(func.vec_angles(pitch, yaw))
    
        local eye_pos = vector(client.eye_position())
        local fraction, ent = client.trace_line(vars.localPlayer, eye_pos.x, eye_pos.y, eye_pos.z, eye_pos.x + (direct_vec.x * 8192), eye_pos.y + (direct_vec.y * 8192), eye_pos.z + (direct_vec.z * 8192))
    
        if ent ~= nil and ent ~= -1 then
            if entity.get_classname(ent) == "CPropDoorRotating" then
                should_disable = true
            elseif entity.get_classname(ent) == "CHostage" then
                should_disable = true
            end
        end
        
        if should_disable ~= true then
            setUi(refs.pitch[1], "Off")
            setUi(refs.yawBase, "Local view")
            setUi(refs.yaw[1], "Off")
            setUi(refs.yaw[2], 0)
            setUi(refs.yawJitter[1], "Off")
            setUi(refs.yawJitter[2], 0)
            setUi(refs.bodyYaw[1], "Opposite")
            setUi(refs.fsBodyYaw, true)
            setUi(refs.edgeYaw, false)
            setUi(refs.roll, 0)
    
            cmd.in_use = 0
            cmd.roll = 0
        end
    end

    

   local self = entity.get_local_player()

   local players = entity.get_players(true)
   local eye_x, eye_y, eye_z = client.eye_position()
   returnthat = false 
   if getUi(menu.miscTab.AvoidBack) then
       if players ~= nil then
           for i, enemy in pairs(players) do
               local head_x, head_y, head_z = entity.hitbox_position(players[i], 5)
               local wx, wy = renderer.world_to_screen(head_x, head_y, head_z)
               local fractions, entindex_hit = client.trace_line(self, eye_x, eye_y, eye_z, head_x, head_y, head_z)
   
               if 250 >= vector(entity.get_prop(enemy, 'm_vecOrigin')):dist(vector(entity.get_prop(self, 'm_vecOrigin'))) and entity.is_alive(enemy) and entity.get_player_weapon(enemy) ~= nil and entity.get_classname(entity.get_player_weapon(enemy)) == 'CKnife' and (entindex_hit == players[i] or fractions == 1) and not entity.is_dormant(players[i]) then
                   setUi(refs.yaw[2], 180)
                   setUi(refs.yawBase, "At targets")
                   returnthat = true
               end
           end
       end
   end


    if ( getUi(menu.aaTab.freestandHotkey) and getUi(menu.aaTab.freestand)) then
        if manualsOverFs == true and aa.ignore == true then
            setUi(refs.freeStand[2], "On hotkey")
            return
        else
            if getUi(menu.aaTab.freestand) == "Static" then
                setUi(refs.bodyYaw[1], "Off")
                setUi(refs.pitch[1], "Down")
            end
            setUi(refs.freeStand[2], "Always on")
            setUi(refs.freeStand[1], true)
        end
    else
        setUi(refs.freeStand[1], false)
        setUi(refs.freeStand[2], "On hotkey")
    end
    

    local pitch, yaw = client.camera_angles()
    if entity.get_prop(vars.localPlayer, "m_MoveType") == 9 then
        cmd.yaw = math.floor(cmd.yaw+0.5)
        cmd.roll = 0

        if getUi(menu.miscTab.fastLadder) then
            if cmd.forwardmove > 0 then
                if pitch < 45 then
                    cmd.pitch = 89
                    cmd.in_moveright = 1
                    cmd.in_moveleft = 0
                    cmd.in_forward = 0
                    cmd.in_back = 1
                    if cmd.sidemove == 0 then
                        cmd.yaw = cmd.yaw + 90
                    end
                    if cmd.sidemove < 0 then
                        cmd.yaw = cmd.yaw + 150
                    end
                    if cmd.sidemove > 0 then
                        cmd.yaw = cmd.yaw + 30
                    end
                end 
            end
        end
    end


    if getUi(menu.builderTab.safeKnife) and vars.pState == 7 and entity.get_classname(entity.get_player_weapon(vars.localPlayer)) == "CKnife" then
        setUi(refs.pitch[1], "Minimal")
        setUi(refs.yawBase, "At targets")
        setUi(refs.yaw[1], "180")
        setUi(refs.yaw[2], 0)
        setUi(refs.yawJitter[1], "Offset")
        setUi(refs.yawJitter[2], 0)
        setUi(refs.bodyYaw[1], "Static")
        setUi(refs.bodyYaw[2], 0)
        setUi(refs.fsBodyYaw, false)
        setUi(refs.edgeYaw, false)
        setUi(refs.roll, 0)
    end
    
    if getUi(menu.builderTab.safeZeus) and vars.pState == 7 and entity.get_classname(entity.get_player_weapon(vars.localPlayer)) == "CWeaponTaser" then
        setUi(refs.pitch[1], "Down")
        setUi(refs.yawBase, "At targets")
        setUi(refs.yaw[1], "180")
        setUi(refs.yaw[2], 0)
        setUi(refs.yawJitter[1], "Off")
        setUi(refs.yawJitter[2], 0)
        setUi(refs.bodyYaw[1], "Static")
        setUi(refs.bodyYaw[2], 0)
        setUi(refs.fsBodyYaw, false)
        setUi(refs.edgeYaw, false)
        setUi(refs.roll, 0)
end

end)

local legsSaved = false
local legsTypes = {[1] = "Off", [2] = "Always slide", [3] = "Never slide"}
local ground_ticks = 0
client.set_event_callback("pre_render", function()
    if not entity.get_local_player() then return end
    local flags = entity.get_prop(entity.get_local_player(), "m_fFlags")
    ground_ticks = bit.band(flags, 1) == 0 and 0 or (ground_ticks < 5 and ground_ticks + 1 or ground_ticks)
    

    if func.table_contains(getUi(menu.miscTab.animations), "Static legs") then
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 6) 
    end

    if func.table_contains(getUi(menu.miscTab.animations), "Broken") then
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", math.random(0, 10)/10, 3)
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", math.random(0, 10)/10, 7)
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", math.random(0, 10)/10, 6)
    end

    if func.table_contains(getUi(menu.miscTab.animations), "Leg fucker") then
        if not legsSaved then
            legsSaved = getUi(refs.legMovement)
        end
        ui.set_visible(refs.legMovement, false)
        if func.table_contains(getUi(menu.miscTab.animations), "Leg fucker") then
            setUi(refs.legMovement, legsTypes[math.random(1, 3)])
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 9,  0)
        end

    elseif (legsSaved == "Off" or legsSaved == "Always slide" or legsSaved == "Never slide") then
        ui.set_visible(refs.legMovement, true)
        setUi(refs.legMovement, legsSaved)
        legsSaved = false
    end

    if func.table_contains(getUi(menu.miscTab.animations), "0 pitch on landing") then
        ground_ticks = bit.band(flags, 1) == 1 and ground_ticks + 1 or 0

        if ground_ticks > 20 and ground_ticks < 150 then
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0.5, 12)
        end
    end

    if func.table_contains(getUi(menu.miscTab.animations), "Moonwalk") then
        if not legsSaved then
            legsSaved = getUi(refs.legMovement)
        end
        ui.set_visible(refs.legMovement, false)
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0, 7)
        local me = ent.get_local_player()
        local flags = me:get_prop("m_fFlags")
        local onground = bit.band(flags, 1) ~= 0
        if not onground then
            local my_animlayer = me:get_anim_overlay(6)
            my_animlayer.weight = 1
        end
        setUi(refs.legMovement, "Off")
    elseif (legsSaved == "Off" or legsSaved == "Always slide" or legsSaved == "Never slide") then
        ui.set_visible(refs.legMovement, true)
        setUi(refs.legMovement, legsSaved)
        legsSaved = false
    end
    if func.table_contains(getUi(menu.miscTab.animations),"Kinguru") then
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", math.random(0, 10)/10, 3)
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", math.random(0, 10)/10, 7)
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", math.random(0, 10)/10, 6)
    end
    if not getUi(menu.miscTab.animationsEnabled) then
        return
    end
    
end)

local alpha = 0
local scopedFraction = 0
local acatelScoped = 1
local dtModifier = 0
local barMoveY = 0

local activeFraction = 0
local inactiveFraction = 0
local defensiveFraction = 0
local hideFraction = 0
local hideInactiveFraction = 0
local dtPos = {y = 0}
local osPos = {y = 0}

local mainIndClr = {r = 0, g = 0, b = 0, a = 0}
local dtClr = {r = 0, g = 0, b = 0, a = 0}
local chargeClr = {r = 0, g = 0, b = 0, a = 0}
local chargeInd = {w = 0, x = 0, y = 25}
local psClr = {r = 0, g = 0, b = 0, a = 0}
local dtInd = {w = 0, x = 0, y = 25}
local qpInd = {w = 0, x = 0, y = 25, a = 0}
local fdInd = {w = 0, x = 0, y = 25, a = 0}
local spInd = {w = 0, x = 0, y = 25, a = 0}
local baInd = {w = 0, x = 0, y = 25, a = 0}
local fsInd = {w = 0, x = 0, y = 25, a = 0}
local osInd = {w = 0, x = 0, y = 25, a = 0}
local psInd = {w = 0, x = 0, y = 25}
local wAlpha = 0
local interval = 0

local indicators_table = {}

local zalupa = function(indicator)
    local is_defensive = (vars.breaker.defensive > 1)
    if indicator.text == 'DT' then
        if is_defensive then
            indicator.r = 130
            indicator.g = 195
            indicator.b = 20
        end
    end

    indicators_table[#indicators_table + 1] = indicator
end

function rgba_to_hex(b,c,d,e)
    return string.format('%02x%02x%02x%02x',b,c,d,e)
end

function text_fade_animation_guwno(speed, r, g, b, a, text)
    local final_text = ''
    local curtime = globals.curtime()
    for i = 0, #text do
        local color = rgba_to_hex(r, g, b, a * math.abs(1 * math.cos(2 * speed * curtime / 4 - i * 5 / 30)))
        final_text = final_text .. '\a' .. color .. text:sub(i, i)
    end
    return final_text
end

client.set_event_callback("paint", function()
    local local_player = entity.get_local_player()
        vars.localPlayer = entity.get_local_player()
    if local_player == nil or entity.is_alive(local_player) == false then return end
    local sizeX, sizeY = client.screen_size()
    local weapon = entity.get_player_weapon(local_player)
    local bodyYaw = entity.get_prop(local_player, "m_flPoseParameter", 11) * 120 - 60
    local side = bodyYaw > 0 and 1 or -1
    local state = "MOVING"
    local mainClr = {}
    local mainClr2 = {}
    local arrowClr = {}
    mainClr.r, mainClr.g, mainClr.b, mainClr.a = getUi(menu.visualsTab.indicatorsClr)
    mainClr2.r, mainClr2.g, mainClr2.b, mainClr2.a = getUi(menu.visualsTab.indicatorsClr2)
    arrowClr.r, arrowClr.g, arrowClr.b, arrowClr.a = getUi(menu.visualsTab.arrowClr)
    local fake = math.floor(antiaim_funcs.get_desync(1))
    


    if getUi(menu.visualsTab.arrowsindenb) and getUi(menu.visualsTab.arrowIndicatorStyle) == "Triangle" then
        renderer.triangle(sizeX / 2 + 40, sizeY / 2 + 1, sizeX / 2 + 30, sizeY / 2 - 6, sizeX / 2 + 30, sizeY / 2 + 7, 
        aa.manualAA == 2 and arrowClr.r or 0, 
        aa.manualAA == 2 and arrowClr.g or 0, 
        aa.manualAA == 2 and arrowClr.b or 0, 
        aa.manualAA == 2 and arrowClr.a or 160)

        renderer.triangle(sizeX / 2 - 40, sizeY / 2 + 1, sizeX / 2 - 30, sizeY / 2 - 6, sizeX / 2 - 30, sizeY / 2 + 7, 
        aa.manualAA == 1 and arrowClr.r or 0, 
        aa.manualAA == 1 and arrowClr.g or 0, 
        aa.manualAA == 1 and arrowClr.b or 0, 
        aa.manualAA == 1 and arrowClr.a or 160)
    end

    if getUi(menu.visualsTab.arrowsindenb) and getUi(menu.visualsTab.arrowIndicatorStyle)  == "Standart" then
        alpha = (aa.manualAA == 2 or aa.manualAA == 1) and func.lerp(alpha, 255, globals.frametime() * 20) or func.lerp(alpha, 0, globals.frametime() * 20)
        renderer.text(sizeX / 2 + 60, sizeY / 2 - 2.5, aa.manualAA == 2 and arrowClr.r or 0, aa.manualAA == 2 and arrowClr.g or 0, aa.manualAA == 2 and arrowClr.b or 0, aa.manualAA == 2 and arrowClr.a or 160, "c+", 0, '⮞')
        renderer.text(sizeX / 2 - 60, sizeY / 2 - 2.5, aa.manualAA == 1 and arrowClr.r or 0, aa.manualAA == 1 and arrowClr.g or 0, aa.manualAA == 1 and arrowClr.b or 0, aa.manualAA == 1 and arrowClr.a or 160, "c+", 0, '⮜')
    end
    
    

    local scopeLevel = entity.get_prop(weapon, 'm_zoomLevel')
    local scoped = entity.get_prop(local_player, 'm_bIsScoped') == 1
    local resumeZoom = entity.get_prop(local_player, 'm_bResumeZoom') == 1
    local isValid = weapon ~= nil and scopeLevel ~= nil
    local act = isValid and scopeLevel > 0 and scoped and not resumeZoom
    local time = globals.frametime() * 30

    if act then
        if scopedFraction < 1 then
            scopedFraction = func.lerp(scopedFraction, 1 + 0.1, time)
        else
            scopedFraction = 1
        end
    else
        scopedFraction = func.lerp(scopedFraction, 0, time)
    end


    local dpi = getUi(refUi("MISC", "Settings", "DPI scale")):gsub('%%', '') - 100
    local globalFlag = "cd-"
    local globalMoveY = 0
    local indX, indY = renderer.measure_text(globalFlag, "DT")
    local yDefault = 16
    local indCount = 0
    indY = globalFlag == "cd-" and indY - 3 or indY - 2

    local nextAttack = entity.get_prop(vars.localPlayer, "m_flNextAttack")
    local nextPrimaryAttack = entity.get_prop(entity.get_player_weapon(vars.localPlayer), "m_flNextPrimaryAttack")
    local dtActive = false
    if nextPrimaryAttack ~= nil then
        dtActive = not (math.max(nextPrimaryAttack, nextAttack) > globals.curtime())
    end
    local isCharged = dtActive
    local isFs = getUi(menu.aaTab.freestandHotkey)
    local isBa = getUi(refs.forceBaim)
    local isSp = getUi(refs.safePoint)
    local isQp = getUi(refs.quickPeek[2])
    local isSlow = getUi(refs.slow[1]) and getUi(refs.slow[2])
    local isOs = getUi(refs.os[1]) and getUi(refs.os[2])
    local isFd = getUi(refs.fakeDuck)
    local isDt = getUi(refs.dt[1]) and getUi(refs.dt[2])

    local state = vars.intToS[vars.pState]:upper()

    if getUi(menu.visualsTab.indicatorsType) then
        local strike_w, strike_h = renderer.measure_text("cdb", "Shareblue.gs")
        local logo = animate_text(globals.curtime(), "Shareblue.gs", mainClr.r, mainClr.g, mainClr.b, mainClr.a, mainClr2.r, mainClr2.g, mainClr2.b, mainClr2.a)
        local star_alpha = {
            math.max(func.breathe(30, 0.9), 0.1) * 150, 
            math.max(func.breathe(1, 0.3), 0.1) * 150, 
            math.max(func.breathe(22, 0.8), 0.1) * 100, 
            math.max(func.breathe(23, 0.4), 0.1) * 75, 
            math.max(func.breathe(10, 0.7), 0.1) * 50,
            math.max(func.breathe(0, 0.5), 0.1) * 125,
            math.max(func.breathe(11, 0.9), 0.1) * 100,
            math.max(func.breathe(14, 0.4), 0.1) * 100,
            math.max(func.breathe(31, 0.9), 0.1) * 200
        }
        renderer.text(sizeX/2 + ((strike_w + 2)/2) * scopedFraction - 8, sizeY/2 + 20 - dpi/10 - 10, mainClr.r, mainClr.g, mainClr.b, star_alpha[1], "cd", nil, "✮")
        renderer.text(sizeX/2 + ((strike_w + 2)/2) * scopedFraction - 2, sizeY/2 + 20 - dpi/10 - 10, mainClr.r, mainClr.g, mainClr.b, star_alpha[2], "cd", nil, "⋆")
        renderer.text(sizeX/2 + ((strike_w + 2)/2) * scopedFraction + 12, sizeY/2 + 20 - dpi/10 - 8, mainClr.r, mainClr.g, mainClr.b, star_alpha[3], "cd", nil, "⋆")
        renderer.text(sizeX/2 + ((strike_w + 2)/2) * scopedFraction + 6, sizeY/2 + 20 - dpi/10 - 7, mainClr.r, mainClr.g, mainClr.b, star_alpha[4], "cd", nil, "★")
        renderer.text(sizeX/2 + ((strike_w + 2)/2) * scopedFraction + 26, sizeY/2 + 20 - dpi/10 - 10, mainClr.r, mainClr.g, mainClr.b, star_alpha[5], "+cd", nil, "⋆")
        renderer.text(sizeX/2 + ((strike_w + 2)/2) * scopedFraction + 20, sizeY/2 + 20 - dpi/10 - 4, mainClr.r, mainClr.g, mainClr.b, star_alpha[6], "cd", nil, "✦")
        renderer.text(sizeX/2 + ((strike_w + 2)/2) * scopedFraction - 23, sizeY/2 + 20 - dpi/10 - 12, mainClr.r, mainClr.g, mainClr.b, star_alpha[7], "cd", nil, "⋆")
        renderer.text(sizeX/2 + ((strike_w + 2)/2) * scopedFraction - 26, sizeY/2 + 20 - dpi/10 - 5, mainClr.r, mainClr.g, mainClr.b, star_alpha[8], "-cd", nil, "★")
        renderer.text(sizeX/2 + ((strike_w + 2)/2) * scopedFraction - 15, sizeY/2 + 20 - dpi/10 - 6, mainClr.r, mainClr.g, mainClr.b, star_alpha[9], "cd", nil, "★")
        renderer.text(sizeX/2 + ((strike_w + 2)/2) * scopedFraction, sizeY/2 + 20 - dpi/10, 106, 90, 205, 255, "cbd", nil, unpack(logo))

        local count = 0

        if isDt and dtActive and isDefensive == false then
            activeFraction = func.clamp(activeFraction + globals.frametime()/0.15, 0, 1)
            if dtPos.y < indY * count then
                dtPos.y = func.lerp(dtPos.y, indY * count + 0.1, time)
            else
                dtPos.y = indY * count
            end
            count = count + 1
        else
            activeFraction = func.clamp(activeFraction - globals.frametime()/0.15, 0, 1)
        end

        if isDt and dtActive and isDefensive then
            defensiveFraction = func.clamp(defensiveFraction + globals.frametime()/0.15, 0, 1)
            if dtPos.y < indY * count then
                dtPos.y = func.lerp(dtPos.y, indY * count + 0.1, time)
            else
                dtPos.y = indY * count
            end
            count = count + 1
        else
            defensiveFraction = func.clamp(defensiveFraction - globals.frametime()/0.15, 0, 1)
            isDefensive = false
        end

        if isDt and not dtActive then
            inactiveFraction = func.clamp(inactiveFraction + globals.frametime()/0.15, 0, 1)
            if dtPos.y < indY * count then
                dtPos.y = func.lerp(dtPos.y, indY * count + 0.1, time)
            else
                dtPos.y = indY * count
            end
            count = count + 1
        else
            inactiveFraction = func.clamp(inactiveFraction - globals.frametime()/0.15, 0, 1)
        end

        if isOs and getUi(refUi("Rage", "Other", "Silent aim")) and isDt then
            hideInactiveFraction = func.clamp(hideInactiveFraction + globals.frametime()/0.15, 0, 1)
            if osPos.y < indY * count then
                osPos.y = func.lerp(osPos.y, indY * count + 0.1, time)
            else
                osPos.y = indY * count
            end
            count = count + 1
        else
            hideInactiveFraction = func.clamp(hideInactiveFraction - globals.frametime()/0.15, 0, 1)
        end

        if isOs and getUi(refUi("Rage", "Other", "Silent aim")) and not isDt then
            hideFraction = func.clamp(hideFraction + globals.frametime()/0.15, 0, 1)
            if osPos.y < indY * count then
                osPos.y = func.lerp(osPos.y, indY * count + 0.1, time)
            else
                osPos.y = indY * count
            end
            count = count + 1
        else
            hideFraction = func.clamp(hideFraction - globals.frametime()/0.15, 0, 1)
        end

        local globalMarginX, globalMarginY = renderer.measure_text("-cd", "DSAD")
        globalMarginY = globalMarginY - 2
        local dt_size = renderer.measure_text("-cd", "DT ")
        local ready_size = renderer.measure_text("-cd", "READY")
        renderer.text(sizeX/2 + ((dt_size + ready_size + 2)/2) * scopedFraction, sizeY/2 + 30, 255, 255, 255, activeFraction * 255, "-cd", dt_size + activeFraction * ready_size + 1, "DT ", "\a" .. func.RGBAtoHEX(5, 255, 5, 255 * activeFraction) .. "READY")

        local charging_size = renderer.measure_text("-cd", "WAITING")
        local ret = animate_text(globals.curtime(), "WAITING", 255, 0, 0, 255, 0, 0, 0, 255)
        renderer.text(sizeX/2 + ((dt_size + charging_size + 2)/2) * scopedFraction, sizeY/2 + 30, 255, 255, 255, inactiveFraction * 255, "-cd", dt_size + inactiveFraction * charging_size + 1, "DT ", unpack(ret))

        local defensive_size = renderer.measure_text("-cd", "DEFENSIVE")
        local def = animate_text(globals.curtime(), "DEFENSIVE", mainClr.r, mainClr.g, mainClr.b, 255, 0, 0, 0, 255)
        renderer.text(sizeX/2 + ((dt_size + defensive_size + 2)/2) * scopedFraction, sizeY/2 + 30 + globalMarginY + dtPos.y, 255, 255, 255, defensiveFraction * 255, "-cd", dt_size + defensiveFraction * defensive_size + 1, "DT ", unpack(def))

        local hide_size = renderer.measure_text("-cd", "OSAA ")
        local active_size = renderer.measure_text("-cd", "ACTIVE")
        renderer.text(sizeX/2 + ((hide_size + active_size + 2)/2) * scopedFraction, sizeY/2 + 30 + osPos.y, 255, 255, 255, hideFraction * 255, "-cd", hide_size + hideFraction * active_size + 1, "OSAA ", "\a" .. func.RGBAtoHEX(255, 255, 0, 255 * hideFraction) .. "ACTIVE")
        
        local inactive_size = renderer.measure_text("-cd", "INACTIVE")
        local osin = animate_text(globals.curtime(), "INACTIVE", 255, 0, 0, 255, 0, 0, 0, 255)
        renderer.text(sizeX/2 + ((hide_size + inactive_size + 2)/2) * scopedFraction, sizeY/2 + 30 + osPos.y, 255, 255, 255, hideInactiveFraction * 255, "-cd", hide_size + hideInactiveFraction * inactive_size + 1, "OSAA ", unpack(osin))
    end
    

    if getUi(menu.visualsTab.minimum_damageIndicator) ~= "-" and entity.get_classname(weapon) ~= "CKnife"  then
        if getUi(menu.visualsTab.minimum_damageenb) and getUi(menu.visualsTab.minimum_damageIndicator) == "Constant" then
            if ( getUi(refs.minimum_damage_override[1]) and getUi(refs.minimum_damage_override[2]) ) == false then
                renderer.text(sizeX / 2 + 3, sizeY / 2 - 15, 255, 255, 255, 255, "", 0, getUi(refs.minimum_damage))
            else
                renderer.text(sizeX / 2 + 3, sizeY / 2 - 15, 255, 255, 255, 255, "", 0, getUi(refs.minimum_damage_override[3]))
            end
        elseif getUi(menu.visualsTab.minimum_damageenb) and getUi(refs.minimum_damage_override[1]) and getUi(refs.minimum_damage_override[2]) and getUi(menu.visualsTab.minimum_damageIndicator) == "Bind" then
            dmg = getUi(refs.minimum_damage_override[3])
            renderer.text(sizeX / 2 + 3, sizeY / 2 - 15, 255, 255, 255, 255, "", 0, dmg)
        end
    end

    if getUi(menu.miscTab.watermark) then
        local clr_r, clr_g, clr_b = getUi(menu.miscTab.watermarkClr)
        local text = text_fade_animation_guwno(3, clr_r, clr_g, clr_b, 220, "B E A R B L U E") .. "\aFF0000FF  [ " .. script_build .. " ]"
        local text_size = vector(renderer.measure_text("c", text))
        
        if getUi(menu.miscTab.watermarkpos) == "Left" then
            renderer.text(text_size.x / 2 + 10, sizeY / 2 - 10, 255, 255, 255, 255, "c",  nil, text)
        elseif getUi(menu.miscTab.watermarkpos) == "Right" then
            renderer.text(sizeX - text_size.x / 2 - 10, sizeY / 2 - 10, 255, 255, 255, 255, "c",  nil, text)
        elseif getUi(menu.miscTab.watermarkpos) == "Bottom" then  
            renderer.text(sizeX / 2, sizeY - 15, 255 , 255, 255, 255, "c",  nil, text)
        elseif getUi(menu.miscTab.watermarkpos) == "Top" then
            renderer.text(sizeX / 2, 70, 255 , 255, 255, 255, "c",  nil, text)
        end
    end

    if getUi(menu.visualsTab.blurWhenMenuEnb) and ui.is_menu_open() then
        renderer.blur(0, 0, sizeX, sizeY)
    end
end)


ui.update(menu.configTab.list,getConfigList())
if database.read(lua.database.configs) == nil then
    database.write(lua.database.configs, {})
end

setUi(menu.configTab.name, #database.read(lua.database.configs) == 0 and "" or database.read(lua.database.configs)[getUi(menu.configTab.list)+1].name)

ui.set_callback(menu.configTab.list, function(value)
    local protected = function()
        if value == nil then return end
        local name = ""
    
        local configs = getConfigList()
        if configs == nil then return end
    
        name = configs[getUi(value)+1] or ""
    
        setUi(menu.configTab.name, name)
    end

    if pcall(protected) then

    end
end)

ui.set_callback(menu.configTab.load, function()
    local name = getUi(menu.configTab.name)
    if name == "" then return end
    local protected = function()
        loadConfig(name)
    end

    if pcall(protected) then
        name = name:gsub('*', '')
        push_notify(string.format('Successfully loaded "%s"', name))
    else
        push_notify(string.format('Failed to load "%s"', name))
    end
end)

ui.set_callback(menu.configTab.save, function()
    local name = getUi(menu.configTab.name)
    if name == "" then return end
    
    for i, v in pairs(presets) do
        if v.name == name:gsub('*', '') then
            push_notify(string.format('You can`t save built-in preset "%s"', name:gsub('*', '')))
            return
        end
    end

    if name:match("[^%w]") ~= nil then
        push_notify(string.format('Failed to save "%s" due to invalid characters', name))
        return
    end

    local protected = function()
        saveConfig(name)
        ui.update(menu.configTab.list, getConfigList())
    end

    if pcall(protected) then
        push_notify(string.format('Successfully saved "%s"', name))
    end
end)

ui.set_callback(menu.configTab.delete, function()
    local name = getUi(menu.configTab.name)
    if name == "" then return end
    if deleteConfig(name) == false then
        push_notify(string.format('Failed to delete "%s"', name))
        ui.update(menu.configTab.list, getConfigList())
        return
    end

    for i, v in pairs(presets) do
        if v.name == name:gsub('*', '') then
            push_notify(string.format('You can`t delete built-in preset "%s"', name:gsub('*', '')))
            return
        end
    end

    local protected = function()
        deleteConfig(name)
    end

    if pcall(protected) then
        ui.update(menu.configTab.list, getConfigList())
        setUi(menu.configTab.list, #presets + #database.read(lua.database.configs) - #database.read(lua.database.configs))
        setUi(menu.configTab.name, #database.read(lua.database.configs) == 0 and "" or getConfigList()[#presets + #database.read(lua.database.configs) - #database.read(lua.database.configs)+1])
        push_notify(string.format('Successfully deleted "%s"', name))
    end
end)

ui.set_callback(menu.configTab.import, function()

    local protected = function()
        importSettings()
    end

    if pcall(protected) then
        push_notify(string.format('Successfully imported settings', name))
    else
        push_notify(string.format('Failed to import settings', name))
    end
end)

ui.set_callback(menu.configTab.export, function()
    local name = getUi(menu.configTab.name)
    if name == "" then return end

    local protected = function()
        exportSettings(name)
    end
    if pcall(protected) then
        push_notify(string.format('Successfully exported settings', name))
    else
        push_notify(string.format('Failed to export settings', name))
    end
end)

client.set_event_callback("paint_ui", function()
    vars.activeState = vars.sToInt[getUi(menu.builderTab.state)]
    
    local isEnabled = true
    ui.set_visible(tabPicker, isEnabled)
    ui.set_visible(aaTabs, getUi(tabPicker) == gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Anti-aim") and isEnabled)
    traverse_table(binds)
    local isAATab = getUi(tabPicker) == gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Anti-aim") and getUi(aaTabs) == gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Other")
    local isBuilderTab = getUi(tabPicker) == gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Anti-aim") and getUi(aaTabs) == gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Builder")
    local isFakelagTab = getUi(tabPicker) == gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Fakelag")
    local isVisualsTab = getUi(tabPicker) == gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Settings")
    local isMiscTab = getUi(tabPicker) == gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Settings")
    local isCFGTab = getUi(tabPicker) == gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Config")

    setUi(aaBuilder[1].enableState, true)
    for i = 1, #vars.aaStates do
        local stateEnabled = getUi(aaBuilder[i].enableState)
        ui.set_visible(aaBuilder[i].enableState, vars.activeState == i and i~=1 and isBuilderTab and isEnabled)
        ui.set_visible(aaBuilder[i].forceDefensive, vars.activeState == i and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].stateDisablers, vars.activeState == 9 and i == 9 and isBuilderTab and getUi(aaBuilder[9].enableState) and isEnabled)
        ui.set_visible(aaBuilder[i].pitch, vars.activeState == i and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].pitchSlider , vars.activeState == i and isBuilderTab and stateEnabled and getUi(aaBuilder[i].pitch) == "Custom" and isEnabled)
        ui.set_visible(aaBuilder[i].yawBase, vars.activeState == i and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yaw, vars.activeState == i and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].switchTicks, vars.activeState == i and isBuilderTab and stateEnabled and (getUi(aaBuilder[i].yaw) == "Slow Jitter" or getUi(aaBuilder[i].yaw) == "Delayed") and isEnabled)
        ui.set_visible(aaBuilder[i].yawStatic, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yaw) ~= "Slow Jitter" and getUi(aaBuilder[i].yaw) ~= "Delayed" and getUi(aaBuilder[i].yaw) ~= "L&R" and getUi(aaBuilder[i].yaw) ~= "Delay Jitter" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawLeft, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and (getUi(aaBuilder[i].yaw) == "Slow Jitter" or getUi(aaBuilder[i].yaw) == "L&R" or getUi(aaBuilder[i].yaw) == "Delay Jitter") and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawRight, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and (getUi(aaBuilder[i].yaw) == "Slow Jitter" or getUi(aaBuilder[i].yaw) == "L&R" or getUi(aaBuilder[i].yaw) == "Delay Jitter") and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawRandomOrder, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yaw) == "Delayed" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawCount, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yaw) == "Delayed" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawDelayOffset1, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yaw) == "Delayed" and getUi(aaBuilder[i].yawCount) >= 1 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawDelayOffset2, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yaw) == "Delayed" and getUi(aaBuilder[i].yawCount) >= 2 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawDelayOffset3, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yaw) == "Delayed" and getUi(aaBuilder[i].yawCount) >= 3 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawDelayOffset4, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yaw) == "Delayed" and getUi(aaBuilder[i].yawCount) >= 4 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawDelayOffset5, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yaw) == "Delayed" and getUi(aaBuilder[i].yawCount) >= 5 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawDelayOffset6, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yaw) == "Delayed" and getUi(aaBuilder[i].yawCount) >= 6 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawDelayOffset7, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yaw) == "Delayed" and getUi(aaBuilder[i].yawCount) >= 7 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawDelayOffset8, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yaw) == "Delayed" and getUi(aaBuilder[i].yawCount) >= 8 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawDelayOffset9, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yaw) == "Delayed" and getUi(aaBuilder[i].yawCount) >= 9 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawDelayOffset10, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yaw) == "Delayed" and getUi(aaBuilder[i].yawCount) >= 10 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawJitter, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].wayFirst, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yawJitter) == "3-Way"  and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].waySecond, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yawJitter) == "3-Way"  and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].wayThird, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yawJitter) == "3-Way"  and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawJitterStatic, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yawJitter) ~= "Off" and getUi(aaBuilder[i].yawJitter) ~= "L&R" and getUi(aaBuilder[i].yawJitter) ~= "3-Way" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawJitterLeft, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yawJitter) == "L&R" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawJitterRight, vars.activeState == i and getUi(aaBuilder[i].yaw) ~= "Off" and getUi(aaBuilder[i].yawJitter) == "L&R" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].bodyYaw, vars.activeState == i and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].bodyYawStatic, vars.activeState == i and getUi(aaBuilder[i].bodyYaw) ~= "Off" and getUi(aaBuilder[i].bodyYaw) ~= "Opposite" and getUi(aaBuilder[i].bodyYaw) ~= "Custom Desync" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].fakeYawLimit, vars.activeState == i and getUi(aaBuilder[i].bodyYaw) == "Custom Desync" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].defensiveAntiAim, vars.activeState == i and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].def_pitch, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_pitchSlider , getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and isBuilderTab and stateEnabled and getUi(aaBuilder[i].def_pitch) == "Custom" and isEnabled))
        ui.set_visible(aaBuilder[i].def_pitchSliderMin , getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and isBuilderTab and stateEnabled and getUi(aaBuilder[i].def_pitch) == "Spin" and isEnabled))
        ui.set_visible(aaBuilder[i].def_pitchSliderMax , getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and isBuilderTab and stateEnabled and getUi(aaBuilder[i].def_pitch) == "Spin" and isEnabled))
        ui.set_visible(aaBuilder[i].def_pitchSliderSpeed , getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and isBuilderTab and stateEnabled and getUi(aaBuilder[i].def_pitch) == "Spin" and isEnabled))
        ui.set_visible(aaBuilder[i].def_pitchSliderStepA , getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and isBuilderTab and stateEnabled and (getUi(aaBuilder[i].def_pitch) == "Switch" or getUi(aaBuilder[i].def_pitch) == "Random Switch") and isEnabled))
        ui.set_visible(aaBuilder[i].def_pitchSliderStepB , getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and isBuilderTab and stateEnabled and (getUi(aaBuilder[i].def_pitch) == "Switch" or getUi(aaBuilder[i].def_pitch) == "Random Switch") and isEnabled))
        ui.set_visible(aaBuilder[i].def_pitchSliderSwitchTicks , getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and isBuilderTab and stateEnabled and (getUi(aaBuilder[i].def_pitch) == "Switch") and isEnabled))
        ui.set_visible(aaBuilder[i].def_yawBase, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_yaw, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_switchTicks, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and isBuilderTab and stateEnabled and (getUi(aaBuilder[i].def_yaw) == "Slow Jitter" or getUi(aaBuilder[i].def_yaw) == "Delayed") and isEnabled))
        ui.set_visible(aaBuilder[i].def_yawStatic, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yaw) ~= "Slow Jitter" and getUi(aaBuilder[i].def_yaw) ~= "Delayed" and getUi(aaBuilder[i].def_yaw) ~= "L&R" and getUi(aaBuilder[i].def_yaw) ~= "Delay Jitter" and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_yawLeft, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and (getUi(aaBuilder[i].def_yaw) == "Slow Jitter" or getUi(aaBuilder[i].def_yaw) == "L&R" or getUi(aaBuilder[i].def_yaw) == "Delay Jitter") and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_yawRight, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and (getUi(aaBuilder[i].def_yaw) == "Slow Jitter" or getUi(aaBuilder[i].def_yaw) == "L&R" or getUi(aaBuilder[i].def_yaw) == "Delay Jitter") and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_yawRandomOrder, getUi(aaBuilder[i].defensiveAntiAim) and vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yaw) == "Delayed" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].def_yawCount, getUi(aaBuilder[i].defensiveAntiAim) and vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yaw) == "Delayed" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].def_yawDelayOffset1, getUi(aaBuilder[i].defensiveAntiAim) and vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yaw) == "Delayed" and getUi(aaBuilder[i].def_yawCount) >= 1 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].def_yawDelayOffset2, getUi(aaBuilder[i].defensiveAntiAim) and vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yaw) == "Delayed" and getUi(aaBuilder[i].def_yawCount) >= 2 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].def_yawDelayOffset3, getUi(aaBuilder[i].defensiveAntiAim) and vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yaw) == "Delayed" and getUi(aaBuilder[i].def_yawCount) >= 3 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].def_yawDelayOffset4, getUi(aaBuilder[i].defensiveAntiAim) and vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yaw) == "Delayed" and getUi(aaBuilder[i].def_yawCount) >= 4 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].def_yawDelayOffset5, getUi(aaBuilder[i].defensiveAntiAim) and vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yaw) == "Delayed" and getUi(aaBuilder[i].def_yawCount) >= 5 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].def_yawDelayOffset6, getUi(aaBuilder[i].defensiveAntiAim) and vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yaw) == "Delayed" and getUi(aaBuilder[i].def_yawCount) >= 6 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].def_yawDelayOffset7, getUi(aaBuilder[i].defensiveAntiAim) and vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yaw) == "Delayed" and getUi(aaBuilder[i].def_yawCount) >= 7 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].def_yawDelayOffset8, getUi(aaBuilder[i].defensiveAntiAim) and vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yaw) == "Delayed" and getUi(aaBuilder[i].def_yawCount) >= 8 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].def_yawDelayOffset9, getUi(aaBuilder[i].defensiveAntiAim) and vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yaw) == "Delayed" and getUi(aaBuilder[i].def_yawCount) >= 9 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].def_yawDelayOffset10, getUi(aaBuilder[i].defensiveAntiAim) and vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yaw) == "Delayed" and getUi(aaBuilder[i].def_yawCount) >= 10 and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].def_yawJitter, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_wayFirst, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yawJitter) == "3-Way"  and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_waySecond, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yawJitter) == "3-Way"  and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_wayThird, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yawJitter) == "3-Way"  and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_yawJitterStatic, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yawJitter) ~= "Off" and getUi(aaBuilder[i].def_yawJitter) ~= "L&R" and getUi(aaBuilder[i].def_yawJitter) ~= "3-Way" and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_yawJitterLeft, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yawJitter) == "L&R" and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_yawJitterRight, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and getUi(aaBuilder[i].def_yaw) ~= "Off" and getUi(aaBuilder[i].def_yawJitter) == "L&R" and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_bodyYaw, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_bodyYawStatic, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and getUi(aaBuilder[i].def_bodyYaw) ~= "Off" and getUi(aaBuilder[i].def_bodyYaw) ~= "Opposite" and getUi(aaBuilder[i].def_bodyYaw) ~= "Custom Desync" and isBuilderTab and stateEnabled and isEnabled))
        ui.set_visible(aaBuilder[i].def_fakeYawLimit, getUi(aaBuilder[i].defensiveAntiAim) and (vars.activeState == i and getUi(aaBuilder[i].def_bodyYaw) == "Custom Desync" and isBuilderTab and stateEnabled and isEnabled))
    end

    for i, feature in pairs(menu.aaTab) do
        if type(feature) ~= "table" then
            ui.set_visible(feature, isAATab and isEnabled)
        end
	end 

    for i, feature in pairs(menu.aaTab.manualTab) do
        if type(feature) ~= "table" then
            ui.set_visible(feature, isAATab and isEnabled and getUi(menu.aaTab.manuals) ~= "Off")
        end
	end 

    for i, feature in pairs(menu.builderTab) do
		ui.set_visible(feature, isBuilderTab and isEnabled)
	end

    for i, feature in pairs(menu.visualsTab) do
        if type(feature) ~= "table" then
            ui.set_visible(feature, isVisualsTab and isEnabled)
        end
	end
    
    for i, feature in pairs(menu.miscTab) do
        if type(feature) ~= "table" then
            ui.set_visible(feature, isMiscTab and isEnabled)
        end
	end

    for i, feature in pairs(menu.fakelagTab) do
        if type(feature) ~= "table" then
            ui.set_visible(feature, isFakelagTab and isEnabled)
        end
    end

    ui.set_visible(menu.builderTab.autoHideshotsStates, getUi(menu.builderTab.autoHideshots) and isBuilderTab and isEnabled)
    ui.set_visible(menu.builderTab.resolver_type, getUi(menu.builderTab.resolver) and isBuilderTab and isEnabled)
    ui.set_visible(menu.miscTab.watermarkpos, getUi(menu.miscTab.watermark) and isMiscTab and isEnabled)
    ui.set_visible(menu.miscTab.animations, getUi(menu.miscTab.animationsEnabled) and isMiscTab and isEnabled)
    ui.set_visible(menu.miscTab.trashTalk_vibor, getUi(menu.miscTab.trashTalk) and (isMiscTab and isEnabled))
    ui.set_visible(menu.miscTab.slowwalkhotkey, getUi(menu.miscTab.slowwalksend) and (isMiscTab and isEnabled))
    ui.set_visible(menu.miscTab.slowwalkslider, getUi(menu.miscTab.slowwalksend) and (isMiscTab and isEnabled))
    ui.set_visible(menu.miscTab.autofakepingslider, getUi(menu.miscTab.autofakepingsend) and (isMiscTab and isEnabled))
    ui.set_visible(menu.fakelagTab.fakelagResetonshotStyle, getUi(menu.fakelagTab.fakelagResetOS) and isFakelagTab and isEnabled)
    ui.set_visible(menu.visualsTab.indicatorsClr, getUi(menu.visualsTab.indicatorsType) and (isVisualsTab and isEnabled))
    ui.set_visible(menu.visualsTab.indicatorsLable, getUi(menu.visualsTab.indicatorsType) and (isVisualsTab and isEnabled))
    ui.set_visible(menu.visualsTab.indicatorsClr2, getUi(menu.visualsTab.indicatorsType) and (isVisualsTab and isEnabled))
    ui.set_visible(menu.visualsTab.arrowIndicatorStyle, getUi(menu.visualsTab.arrowsindenb) and (isVisualsTab and isEnabled))
    ui.set_visible(menu.visualsTab.arrowClr, getUi(menu.visualsTab.arrowsindenb) and getUi(menu.visualsTab.arrowIndicatorStyle) and (isVisualsTab and isEnabled))
    ui.set_visible(menu.visualsTab.hitlogs_krutie, getUi(menu.visualsTab.hitlogsenb) and (isVisualsTab and isEnabled))
    ui.set_visible(menu.visualsTab.screenHitlogs_krutie, getUi(menu.visualsTab.screenHitlogEnb) and (isVisualsTab and isEnabled))
    ui.set_visible(menu.visualsTab.screenHitlogLabel1, getUi(menu.visualsTab.screenHitlogEnb) and (isVisualsTab and isEnabled))
    ui.set_visible(menu.visualsTab.screenHitlogGlowClr, getUi(menu.visualsTab.screenHitlogEnb) and (isVisualsTab and isEnabled))
    ui.set_visible(menu.visualsTab.screenHitlogLabel2, getUi(menu.visualsTab.screenHitlogEnb) and (isVisualsTab and isEnabled))
    ui.set_visible(menu.visualsTab.screenHitlogLogoClr, getUi(menu.visualsTab.screenHitlogEnb) and (isVisualsTab and isEnabled))
    ui.set_visible(menu.visualsTab.screenHitlogLabel4, getUi(menu.visualsTab.screenHitlogEnb) and (isVisualsTab and isEnabled))
    ui.set_visible(menu.visualsTab.screenHitlogBackClr, getUi(menu.visualsTab.screenHitlogEnb) and (isVisualsTab and isEnabled))
    ui.set_visible(menu.visualsTab.minimum_damageIndicator, getUi(menu.visualsTab.minimum_damageenb) and (isVisualsTab and isEnabled))
    ui.set_visible(menu.visualsTab.thirdpersondistance, getUi(menu.visualsTab.thirdpersonsenb) and (isVisualsTab and isEnabled))

    ui.set_visible(menu.aaTab.manuals, getUi(menu.aaTab.manualsenb) and (isAATab and isEnabled))   

    for i, feature in pairs(menu.configTab) do
		ui.set_visible(feature, isCFGTab and isEnabled)
	end

    if not isEnabled and not saved then
        func.resetAATab()
        setUi(refs.fsBodyYaw, isEnabled)
        setUi(refs.enabled, isEnabled)
        saved = true
    elseif isEnabled and saved then
        setUi(refs.fsBodyYaw, not isEnabled)
        setUi(refs.enabled, isEnabled)
        saved = false
    end
    func.setAATab(not isEnabled)

end)



local clantags = {
    "美食家大辣片",
}

local clantag_index = 0

client.set_event_callback("paint", function()
    if getUi(refs.clantag) then return end

    if getUi(menu.miscTab.clanTag) then
        local time = math.floor( globals.curtime() * 4 + 0.7  )
        local i = time % #clantags + 1
        if clantag_index == i then return end
        clantag_index = i
        client.set_clan_tag(clantags[clantag_index])
    else
        client.set_clan_tag()
    end
end)


local function is_vulnerable()
    for _, v in ipairs(entity.get_players(true)) do
        local flags = (entity.get_esp_data(v)).flags

        if bit.band(flags, bit.lshift(1, 11)) ~= 0 then
            return true
        end
    end

    return false
end

local auto_discharge = function(cmd)
    if not getUi(menu.miscTab.unsafecharhge) or getUi(refs.quickPeek[2]) or not getUi(refs.dt[2]) or 
    (entity.get_classname(entity.get_player_weapon(entity.get_local_player())) ~= "CWeaponSSG08" and entity.get_classname(entity.get_player_weapon(entity.get_local_player())) ~= "CWeaponAWP") then return end

    local vel_2 = math.floor(entity.get_prop(entity.get_local_player(), "m_vecVelocity[2]"))

    if is_vulnerable() and vel_2 > 20 then
        cmd.in_jump = false
        cmd.discharge_pending = true
    end
end

client.set_event_callback("setup_command", function(cmd)
    auto_discharge(cmd)
end)


local chat_spammer = {}

chat_spammer.phrases = {
    kill = {
        {"中国人自己的scriptleaks 加群了解详情171089983"}
    },

    death = {
        {"中国人自己的scriptleaks 加群了解详情171089983"}
    }
}

chat_spammer.phrase_count = {
    death = 0,
    kill = 0,
}

chat_spammer.handle = function(e)
    if not getUi(menu.miscTab.trashTalk) then
        return
    end

    local player = entity.get_local_player()

    if player == nil then
        return
    end

    local victim = client.userid_to_entindex(e.userid)

    if victim == nil then
        return
    end

    local attacker = client.userid_to_entindex(e.attacker)

    if attacker == nil then
        return
    end

    chat_spammer.phrase_count.death = chat_spammer.phrase_count.death + 1
    if chat_spammer.phrase_count.death > #chat_spammer.phrases.death then
        chat_spammer.phrase_count.death = 1
    end

    chat_spammer.phrase_count.kill = chat_spammer.phrase_count.kill + 1
    if chat_spammer.phrase_count.kill > #chat_spammer.phrases.kill then
        chat_spammer.phrase_count.kill = 1
    end

    local phrase = {
        death = chat_spammer.phrases.death[chat_spammer.phrase_count.death],
        kill = chat_spammer.phrases.kill[chat_spammer.phrase_count.kill],
    }

    if func.includes(getUi(menu.miscTab.trashTalk_vibor), "Kill") then
        if attacker == player and victim ~= player then
            for i = 1, #phrase.kill do
                client.delay_call(i*2, function()
                    client.exec(("say %s"):format(phrase.kill[i]))
                end)
            end
        end
    end

    if func.includes(getUi(menu.miscTab.trashTalk_vibor), "Death") then
        if attacker ~= player and victim == player then
            for i = 1, #phrase.death do
                client.delay_call(i*2, function()
                    client.exec(("say %s"):format(phrase.death[i]))
                end)
            end
        end
    end
end

hitlogFuncs = {
    hitgroupNames = {"generic", "head", "chest", "stomach", "left arm", "right arm", "left leg", "right leg", "neck", "?", "gear"},
    callback_aimHit = function(e)
        local group = hitlogFuncs.hitgroupNames[e.hitgroup + 1] or "?"
        local entityHealth = entity.get_prop(e.target, "m_iHealth")
        if getUi(menu.visualsTab.hitlogsenb) and func.includes(getUi(menu.visualsTab.hitlogs_krutie), "Hit") then
            client.color_log(149, 184, 6, "b\0")
            client.color_log(141, 171, 19, "e\0")
            client.color_log(134, 159, 32, "a\0")
            client.color_log(126, 146, 45, "r\0")
            client.color_log(119, 134, 57, "B\0")
            client.color_log(111, 121, 70, "l\0")
            client.color_log(104, 109, 83, "u\0")
            client.color_log(96, 96, 96, "e\0")

            client.color_log(107, 107, 107, " - \0")
            client.color_log(149, 184, 6, "Registered \0")
            client.color_log(255, 255, 255, "shot at " .. entity.get_player_name(e.target) .. "'s " .. group .. " for \0")
            client.color_log(149, 184, 6, e.damage .. "\0")
            client.color_log(255, 255, 255, " damage ( remaining \0")
            client.color_log(255, 255, 255, entityHealth .. " )")
        end

        if getUi(menu.visualsTab.screenHitlogEnb) and func.includes(getUi(menu.visualsTab.screenHitlogs_krutie), "Hit") then
            push_notify("Hit " .. entity.get_player_name(e.target) .. "'s " .. group .. " for " .. e.damage .. " ( remaining " .. entityHealth .. " )")
        end
    end,
    callback_aimMiss = function(e)
        local group = hitlogFuncs.hitgroupNames[e.hitgroup + 1] or "?"
        if e.reason == "?" then e.reason = "resolver" end

        if getUi(menu.visualsTab.hitlogsenb) and func.includes(getUi(menu.visualsTab.hitlogs_krutie), "Miss") then
            client.color_log(183, 6, 6, "b\0")
            client.color_log(171, 19, 19, "e\0")
            client.color_log(158, 32, 32, "a\0")
            client.color_log(146, 45, 45, "r\0")
            client.color_log(133, 57, 57, "B\0")
            client.color_log(121, 70, 70, "l\0")
            client.color_log(108, 83, 83, "u\0")
            client.color_log(96, 96, 96, "e\0")

            client.color_log(107, 107, 107, " - \0")
            client.color_log(183, 6, 6, "Missed \0")
            client.color_log(255, 255, 255, "shot at " .. entity.get_player_name(e.target) .. "'s " .. group .. " due to \0")
            client.color_log(183, 6, 6, e.reason)
        end

        if getUi(menu.visualsTab.screenHitlogEnb) and func.includes(getUi(menu.visualsTab.screenHitlogs_krutie), "Miss") then
            push_notify("Missed " .. entity.get_player_name(e.target) .. "'s " .. group .. " due to " .. e.reason)
        end
    end,
}

client.set_event_callback("aim_hit", hitlogFuncs.callback_aimHit)
client.set_event_callback("aim_miss", hitlogFuncs.callback_aimMiss)

client.set_event_callback('player_death', chat_spammer.handle)

client.set_event_callback('shutdown', function ()
    client.set_clan_tag("\0")
    traverse_table_on(refs)
end)

client.set_event_callback('paint_ui', function ()
    local isAATab = getUi(tabPicker) == gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Anti-aim") and getUi(aaTabs) == gradient_text(158, 250, 255, 255, 176, 112, 255, 255, "Other")
    if isAATab then
        traverse_table_on(binds)
        else
            traverse_table(binds)
    end 

    if (globals.mapname() ~= vars.mapname) then
        vars.breaker.cmd = 0
        vars.breaker.defensive = 0
        vars.breaker.defensive_check = 0
        vars.mapname = globals.mapname()
    end
end)

client.set_event_callback("round_start", function()
    vars.breaker.cmd = 0
    vars.breaker.defensive = 0
    vars.breaker.defensive_check = 0
    if getUi(menu.miscTab.resetManualAAEnb) and aa.manualAA ~= 0 then
        aa.ignore = false
        aa.manualAA = 0
        aa.input = 0
        push_notify("Manual Anti-Aim already reset")
    end
end)

client.set_event_callback("player_connect_full", function(e)
    local ent = client.userid_to_entindex(e.userid)
    if ent == entity.get_local_player() then
        vars.breaker.cmd = 0
        vars.breaker.defensive = 0
        vars.breaker.defensive_check = 0
    end
end)

ui.set_callback(menu.miscTab.filtercons, function()
    if menu.miscTab.filtercons then
        cvar.developer:set_int(0)
        cvar.con_filter_enable:set_int(1)
        cvar.con_filter_text:set_string("IrWL5106TZZKNFPz4P4Gl3pSN?J370f5hi373ZjPg%VOVh6lN")
        client.exec("con_filter_enable 1")
    else
        cvar.con_filter_enable:set_int(0)
        cvar.con_filter_text:set_string("")
        client.exec("con_filter_enable 0")
    end
end)

client.set_event_callback("shutdown", function()
    cvar.con_filter_enable:set_int(0)
    cvar.con_filter_text:set_string("")
    client.exec("con_filter_enable 0")
end)



function text_fade_animation_guwno(speed, r, g, b, a, text)
    local final_text = ''
    local curtime = globals.curtime()
    for i = 0, #text do
        local color = rgba_to_hex(r, g, b, a * math.abs(1 * math.cos(2 * speed * curtime / 4 - i * 5 / 30)))
        final_text = final_text .. '\a' .. color .. text:sub(i, i)
    end
    return final_text
end

function update_color()
    menuClr = {}
    menuClr.r, menuClr.g, menuClr.b = getUi(refs.menuClr)
    setUi(label, text_fade_animation_guwno(7, menuClr.r, menuClr.g, menuClr.b, 255, "Shareblue - " .. script_build:upper()))
end

client.set_event_callback('paint_ui', function()
    update_color()
end)

setUi(menu.visualsTab.indicatorsClr, 172, 167, 209, 255)
setUi(menu.visualsTab.screenHitlogBackClr, 255, 255, 255, 30)
setUi(menu.visualsTab.screenHitlogLogoClr, 118, 118, 118, 255)
setUi(menu.visualsTab.screenHitlogGlowClr, 234, 234, 234, 255)

client.exec("clear")
client.color_log(255, 255, 255, "Welcome to Shareblue.gs")
push_notify("Loadding Shareblue ...")
 