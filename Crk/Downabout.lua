function var_0_0(arg_1_0, arg_1_1)
  local var_1_0, var_1_1 = pcall(require, arg_1_0)

  if var_1_0 then
    return var_1_1
  else
    return error(arg_1_1)
  end
end

client_visible, client_eye_position, client_log, client_trace_bullet, entity_get_bounding_box, entity_get_local_player, entity_get_origin, entity_get_player_name, entity_get_player_resource, entity_get_player_weapon, entity_get_prop, entity_is_dormant, entity_is_enemy, globals_curtime, globals_maxplayers, globals_tickcount, math_max, renderer_indicator, string_format, ui_get, ui_new_checkbox, ui_new_hotkey, ui_reference, ui_set_callback, sqrt, unpack, entity_is_alive, plist_get = client.visible, client.eye_position, client.log, client.trace_bullet, entity.get_bounding_box, entity.get_local_player, entity.get_origin, entity.get_player_name, entity.get_player_resource, entity.get_player_weapon, entity.get_prop, entity.is_dormant, entity.is_enemy, globals.curtime, globals.maxplayers, globals.tickcount, math.max, renderer.indicator, string.format, ui.get, ui.new_checkbox, ui.new_hotkey, ui.reference, ui.set_callback, sqrt, unpack, entity.is_alive, plist.get

local var_0_1 = var_0_0("ffi", "~ Failed to require FFI, please make sure Allow unsafe scripts is enabled!")
local var_0_2 = var_0_0("gamesense/pui", "~ Download pui library: https://gamesense.pub/forums/viewtopic.php?id=41761")
local var_0_3 = var_0_0("gamesense/http", "~ Download HTTP library: https://gamesense.pub/forums/viewtopic.php?id=21619")
local var_0_4 = var_0_0("gamesense/base64", "~ Module base64 not found")
local var_0_5 = var_0_0("gamesense/clipboard", "~ Download clipboard library: https://gamesense.pub/forums/viewtopic.php?id=28678")
local var_0_6 = var_0_0("gamesense/entity", "~ Download entity library: https://gamesense.pub/forums/viewtopic.php?id=27529")
local var_0_7 = var_0_0("gamesense/csgo_weapons", "~ csgo_weapons libriary not found")
local var_0_8 = var_0_0("json", "~ Missing Json")
local var_0_9 = require("gamesense/trace")
local var_0_10 = var_0_0("vector", "~ Missing Vector")
local var_0_11 = database.read("fshajfhjsafghasjfgashjfgshjafgshjafgshjafghajfgwyafgafyuagwfyuawfgeyuafgsdajhfsgweyuagfeyuafsfjhagefyuagsfhjfgsefyuwagyufggsfjhsdgfhjakgswefyugDASUKYFGdSJFHSKGFESYUKGSDJHFgsdhjfgsdjhgfjhsgfjhSGEFjhGWJHEfgjhdzgfjdhskadwgasdbwahdashjdgwajhfgdjngdskjhfgkjsgjklsdgjdfkljgkldfjgfdklgjklfdgjkljajgfahwg")
local var_0_12 = require("bit")
local var_0_13 = var_0_0("gamesense/easing", "~ Missing Easing")
local var_0_14 = 0
local var_0_15, var_0_16 = client.screen_size()
local var_0_17 = {}

native_GetClientEntity = vtable_bind("client_panorama.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*,int)")
native_IsWeapon = vtable_thunk(165, "bool(__thiscall*)(void*)")
native_GetInaccuracy = vtable_thunk(482, "float(__thiscall*)(void*)")

function table.contains(arg_2_0, arg_2_1)
  if type(arg_2_0) ~= "table" then
    return false
  end

  for iter_2_0 = 0, #arg_2_0 do
    if arg_2_0[iter_2_0] == arg_2_1 then
      return true, iter_2_0
    end
  end

  return false
end

local var_0_18 = {
  build = "Recode",
  user = "H1a3"
}

function var_0_19(arg_3_0, arg_3_1)
  var_0_3.get(arg_3_0, function(arg_4_0, arg_4_1)
    if not arg_4_0 or arg_4_1.status ~= 200 then
      client.error_log(string.format("Could not retrieve asset '%s' from server. Error code: %d", arg_3_1, arg_4_1.status))

      return
    end

    writefile(arg_3_1, arg_4_1.body)
  end)
end

local var_8_77 = {
  87,101,108,99,111,109,101,
  32,                         
  98,97,99,107,               
  44,32,                      
  104,97,107,107,97,105
}

local function var_0_19(arg_3_0, arg_3_1)
  local tmp_s = {}
  for i = 1, #var_8_77 do
    tmp_s[#tmp_s + 1] = string.char(var_8_77[i])
  end
  local assembled = table.concat(tmp_s, "")
  local out_var = assembled
end

local var_0_20 = {
  BODY_PITCH = 12,
  AIM_BLEND_STAND_WALK = 14,
  SPEED = 3,
  MOVE_BLEND_RUN = 10,
  JUMP_FALL = 6,
  AIM_BLEND_CROUCH_IDLE = 16,
  AIM_BLEND_CROUCH_WALK = 17,
  AIM_BLEND_STAND_IDLE = 13,
  MOVE_BLEND_CROUCH = 8,
  DEATH_YAW = 18,
  LADDER_SPEED = 5,
  STAND = 1,
  MOVE_BLEND_WALK = 9,
  MOVE_YAW = 7,
  STRAFE_YAW = 0,
  AIM_BLEND_STAND_RUN = 14,
  LADDER_YAW = 4,
  BODY_YAW = 11,
  LEAN_YAW = 2
}
local var_0_21 = {
  button = {
    unsavable = true,
    arg = 2,
    type = "function"
  },
  checkbox = {
    init = false,
    arg = 1,
    type = "boolean"
  },
  color_picker = {
    arg = 5,
    type = "table"
  },
  combobox = {
    variable = true,
    arg = 2,
    type = "string"
  },
  hotkey = {
    arg = 3,
    type = "table",
    enum = {
      [0] = "Always on",
      "On hotkey",
      "Toggle",
      "Off hotkey"
    }
  },
  label = {
    unsavable = true,
    arg = 1,
    type = "string"
  },
  listbox = {
    variable = true,
    init = 0,
    arg = 2,
    type = "number"
  },
  multiselect = {
    variable = true,
    arg = 2,
    type = "table",
    init = {}
  },
  slider = {
    arg = 8,
    type = "number"
  },
  textbox = {
    init = "",
    arg = 1,
    type = "string"
  },
  string = {
    init = "",
    arg = 2,
    type = "string"
  },
  unknown = {
    init = "",
    arg = 2,
    type = "string"
  }
}
local var_0_22 = {
  "Global",
  "G3SG1 / SCAR-20",
  "SSG 08",
  "AWP",
  "R8 Revolver",
  "Desert Eagle",
  "Pistol",
  "Zeus",
  "Rifle",
  "Shotgun",
  "SMG",
  "Machine gun"
}

function var_0_23(arg_5_0, arg_5_1, arg_5_2)
  return arg_5_0 < arg_5_1 and arg_5_1 or arg_5_2 < arg_5_0 and arg_5_2 or arg_5_0
end

function var_0_24(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
  return string.format("%.2x%.2x%.2x%.2x", arg_6_0, arg_6_1, arg_6_2, arg_6_3)
end

function var_0_25(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5, arg_7_6, arg_7_7, arg_7_8, arg_7_9)
  local var_7_0 = {}
  local var_7_1 = 1
  local var_7_2 = arg_7_6 - arg_7_2
  local var_7_3 = arg_7_7 - arg_7_3
  local var_7_4 = arg_7_8 - arg_7_4
  local var_7_5 = arg_7_9 - arg_7_5

  for iter_7_0 = 1, #arg_7_1 do
    local var_7_6 = (iter_7_0 - 1) / (#arg_7_1 - 1) + arg_7_0

    var_7_0[var_7_1] = "\a" .. var_0_24(arg_7_2 + var_7_2 * math.abs(math.cos(var_7_6)), arg_7_3 + var_7_3 * math.abs(math.cos(var_7_6)), arg_7_4 + var_7_4 * math.abs(math.cos(var_7_6)), arg_7_5 + var_7_5 * math.abs(math.cos(var_7_6)))
    var_7_0[var_7_1 + 1] = arg_7_1:sub(iter_7_0, iter_7_0)
    var_7_1 = var_7_1 + 2
  end

  return table.concat(var_7_0)
end

function var_0_26(arg_8_0, arg_8_1)
  local var_8_0 = {}
  local var_8_1 = 1

  for iter_8_0 = 1, #arg_8_1 do
    local var_8_2 = (iter_8_0 - 1) / (#arg_8_1 - 1)
    local var_8_3 = var_8_2 + arg_8_0
    local var_8_4
    local var_8_5
    local var_8_6
    local var_8_7
    local var_8_9

    if var_8_2 < 0.25 then
      local var_8_8 = var_8_2 / 0.25

      var_8_4 = 255
      var_8_5 = 255 * var_8_8
      var_8_6 = 0
      var_8_9 = 255
    elseif var_8_2 < 0.5 then
      var_8_4 = 255 * (1 - (var_8_2 - 0.25) / 0.25)
      var_8_5 = 255
      var_8_6 = 0
      var_8_9 = 255
    elseif var_8_2 < 0.75 then
      local var_8_10 = (var_8_2 - 0.5) / 0.25

      var_8_4 = 0
      var_8_5 = 255 * (1 - var_8_10)
      var_8_6 = 255 * var_8_10
      var_8_9 = 255
    else
      local var_8_11 = (var_8_2 - 0.75) / 0.25

      var_8_4 = 255 * var_8_11
      var_8_5 = 0
      var_8_6 = 255 * (1 - var_8_11)
      var_8_9 = 255
    end

    local var_8_12 = math.min(255, math.max(0, var_8_4 * math.abs(math.cos(var_8_3))))
    local var_8_13 = math.min(255, math.max(0, var_8_5 * math.abs(math.cos(var_8_3))))
    local var_8_14 = math.min(255, math.max(0, var_8_6 * math.abs(math.cos(var_8_3))))
    local var_8_15 = math.min(255, math.max(0, var_8_9))

    var_8_0[var_8_1] = "\a" .. var_0_24(var_8_12, var_8_13, var_8_14, var_8_15)
    var_8_0[var_8_1 + 1] = arg_8_1:sub(iter_8_0, iter_8_0)
    var_8_1 = var_8_1 + 2
  end

  return table.concat(var_8_0)
end

function var_0_27(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5)
  local var_9_0 = arg_9_0[1]
  local var_9_1 = arg_9_0[2]
  local var_9_2 = arg_9_0[3]
  local var_9_3 = arg_9_0[4]
  local var_9_4 = arg_9_1[1]
  local var_9_5 = arg_9_1[2]
  local var_9_6 = arg_9_1[3]
  local var_9_7 = arg_9_1[4]
  local var_9_8 = arg_9_2[1]
  local var_9_9 = arg_9_2[2]
  local var_9_10 = arg_9_2[3]
  local var_9_11 = arg_9_2[4]
  local var_9_12 = arg_9_3[1]
  local var_9_13 = arg_9_3[2]
  local var_9_14 = arg_9_3[3]
  local var_9_15 = arg_9_3[4]
  local var_9_16 = globals.realtime() / 4 % 1.2 * arg_9_5 - 1.2
  local var_9_17 = ""

  for iter_9_0 = 1, #arg_9_4 do
    local var_9_18 = arg_9_4:sub(iter_9_0, iter_9_0)
    local var_9_19 = iter_9_0 / #arg_9_4
    local var_9_20
    local var_9_21
    local var_9_22
    local var_9_23

    if var_9_19 <= 0.33 then
      local var_9_24 = var_9_19 / 0.33

      var_9_20 = var_9_0 + (var_9_4 - var_9_0) * var_9_24
      var_9_21 = var_9_1 + (var_9_5 - var_9_1) * var_9_24
      var_9_22 = var_9_2 + (var_9_6 - var_9_2) * var_9_24
      var_9_23 = var_9_3 + (var_9_7 - var_9_3) * var_9_24
    elseif var_9_19 <= 0.66 then
      local var_9_25 = (var_9_19 - 0.33) / 0.33

      var_9_20 = var_9_4 + (var_9_8 - var_9_4) * var_9_25
      var_9_21 = var_9_5 + (var_9_9 - var_9_5) * var_9_25
      var_9_22 = var_9_6 + (var_9_10 - var_9_6) * var_9_25
      var_9_23 = var_9_7 + (var_9_11 - var_9_7) * var_9_25
    else
      local var_9_26 = (var_9_19 - 0.66) / 0.34

      var_9_20 = var_9_8 + (var_9_12 - var_9_8) * var_9_26
      var_9_21 = var_9_9 + (var_9_13 - var_9_9) * var_9_26
      var_9_22 = var_9_10 + (var_9_14 - var_9_10) * var_9_26
      var_9_23 = var_9_11 + (var_9_15 - var_9_11) * var_9_26
    end

    local var_9_27 = var_9_19 - var_9_16

    if var_9_27 >= 0 and var_9_27 <= 1.4 then
      if var_9_27 > 0.7 then
        var_9_27 = 1.4 - var_9_27
      end

      local var_9_28 = var_9_12 - var_9_20
      local var_9_29 = var_9_13 - var_9_21
      local var_9_30 = var_9_14 - var_9_22
      local var_9_31 = var_9_15 - var_9_23

      var_9_20 = var_9_20 + var_9_28 * var_9_27 / 0.8
      var_9_21 = var_9_21 + var_9_29 * var_9_27 / 0.8
      var_9_22 = var_9_22 + var_9_30 * var_9_27 / 0.8
      var_9_23 = var_9_23 + var_9_31 * var_9_27 / 0.8
    end

    var_9_17 = var_9_17 .. ("\a%02x%02x%02x%02x%s"):format(var_9_20, var_9_21, var_9_22, var_9_23, arg_9_4:sub(iter_9_0, iter_9_0))
  end

  return var_9_17
end

function var_0_28(arg_10_0)
  if type(arg_10_0) ~= "table" then
    return arg_10_0
  end

  local var_10_0 = {}

  for iter_10_0, iter_10_1 in pairs(arg_10_0) do
    var_10_0[var_0_28(iter_10_0)] = var_0_28(iter_10_1)
  end

  return var_10_0
end

local var_0_29 = var_0_28(table)
local var_0_30 = var_0_28(math)
local var_0_31 = var_0_28(string)
local var_0_32 = var_0_28(ui)
local var_0_33 = var_0_28(client)

function var_0_29.find(arg_11_0, arg_11_1)
  for iter_11_0, iter_11_1 in pairs(arg_11_0) do
    if iter_11_1 == arg_11_1 then
      return iter_11_0
    end
  end

  return false
end

function var_0_29.ifind(arg_12_0, arg_12_1)
  for iter_12_0 = 1, var_0_29.maxn(arg_12_0) do
    if arg_12_0[iter_12_0] == arg_12_1 then
      return iter_12_0
    end
  end
end

function var_0_29.qfind(arg_13_0, arg_13_1)
  for iter_13_0 = 1, #arg_13_0 do
    if arg_13_0[iter_13_0] == arg_13_1 then
      return iter_13_0
    end
  end
end

function var_0_29.ihas(arg_14_0, ...)
  local var_14_0 = {
    ...
  }

  for iter_14_0 = 1, var_0_29.maxn(arg_14_0) do
    for iter_14_1 = 1, #var_14_0 do
      if arg_14_0[iter_14_0] == var_14_0[iter_14_1] then
        return true
      end
    end
  end

  return false
end

function var_0_29.minn(arg_15_0)
  local var_15_0 = 0

  for iter_15_0 = 1, #arg_15_0 do
    if arg_15_0[iter_15_0] == nil then
      break
    end

    var_15_0 = var_15_0 + 1
  end

  return var_15_0
end

function var_0_29.filter(arg_16_0)
  local var_16_0 = {}

  for iter_16_0 = 1, var_0_29.maxn(arg_16_0) do
    if arg_16_0[iter_16_0] ~= nil then
      var_16_0[#var_16_0 + 1] = arg_16_0[iter_16_0]
    end
  end

  return var_16_0
end

function var_0_29.append(arg_17_0, ...)
  for iter_17_0, iter_17_1 in ipairs({
    ...
  }) do
    var_0_29.insert(arg_17_0, iter_17_1)
  end
end

var_0_29.copy = var_0_28
var_0_30.max_lerp_low_fps = 2.2222222222222223

function var_0_34(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
  return var_0_31.format("%02x%02x%02x%02x", arg_18_0, arg_18_1, arg_18_2, arg_18_3)
end

function var_0_30.clamp(arg_19_0, arg_19_1, arg_19_2)
  if arg_19_0 < arg_19_1 then
    return arg_19_1
  elseif arg_19_2 < arg_19_0 then
    return arg_19_2
  else
    return arg_19_0
  end
end

function var_0_30.vector_lerp(arg_20_0, arg_20_1, arg_20_2)
  local var_20_0 = globals.frametime() * 100

  arg_20_2 = arg_20_2 * var_0_30.min(var_20_0, var_0_30.max_lerp_low_fps)

  return arg_20_0:lerp(arg_20_1, arg_20_2)
end

function var_0_30.lerp1(arg_21_0, arg_21_1, arg_21_2)
  return (arg_21_1 - arg_21_0) * arg_21_2 + arg_21_0
end

function var_0_30.normalize_yaw(arg_22_0)
  arg_22_0 = (arg_22_0 % 360 + 360) % 360

  return arg_22_0 > 180 and arg_22_0 - 360 or arg_22_0
end

function var_0_35(arg_23_0, arg_23_1, arg_23_2)
  if arg_23_0 then
    return arg_23_1
  else
    return arg_23_2
  end
end

function var_0_36(arg_24_0, arg_24_1, ...)
  local var_24_0 = {
    pcall(arg_24_0, ...)
  }

  if not var_24_0[1] then
    return type(arg_24_1) == "function" and arg_24_1(var_24_0[2]) or error(var_24_0[2], arg_24_1 or 2)
  end

  return unpack(var_24_0, 2)
end

function var_0_30.lerp2(arg_25_0, arg_25_1, arg_25_2)
  arg_25_2 = arg_25_2 or 0.005
  arg_25_2 = var_0_30.clamp(globals.frametime() * arg_25_2 * 175, 0.01, 1)

  local var_25_0 = var_0_30.lerp1(arg_25_0, arg_25_1, arg_25_2)

  if arg_25_1 == 0 and var_25_0 < 0.01 and var_25_0 > -0.01 then
    var_25_0 = 0
  elseif arg_25_1 == 1 and var_25_0 < 1.01 and var_25_0 > 0.99 then
    var_25_0 = 1
  end

  return var_25_0
end

local var_0_37 = {
  base_speed = 0.095,
  _list = {}
}

function var_0_37.new(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
  arg_26_2 = arg_26_2 or var_0_37.base_speed
  var_0_37._list[arg_26_0] = var_0_37._list[arg_26_0] or arg_26_3 or 0
  var_0_37._list[arg_26_0] = var_0_30.lerp2(var_0_37._list[arg_26_0], arg_26_1, arg_26_2)

  return var_0_37._list[arg_26_0]
end

local var_0_38
local var_0_39
local var_0_40
local var_0_41
local var_0_42 = {
  execute = function(arg_27_0, arg_27_1, arg_27_2)
    local var_27_0
    local var_27_1

    for iter_27_0, iter_27_1 in ipairs(arg_27_1) do
      var_27_1, var_27_0, arg_27_0 = iter_27_1, arg_27_0, arg_27_0[iter_27_1]

      if arg_27_0 == nil then
        return
      end
    end

    if var_27_0[var_27_1] then
      arg_27_2(var_27_0[var_27_1])
    end
  end,
  replace = function(arg_28_0, arg_28_1, arg_28_2)
    local var_28_0
    local var_28_1

    for iter_28_0, iter_28_1 in ipairs(arg_28_1) do
      var_28_1, var_28_0, arg_28_0 = iter_28_1, arg_28_0, arg_28_0[iter_28_1]

      if arg_28_0 == nil then
        return
      end
    end

    var_28_0[var_28_1] = arg_28_2
  end,
  find = function(arg_29_0, arg_29_1)
    local var_29_0
    local var_29_1

    for iter_29_0, iter_29_1 in ipairs(arg_29_1) do
      var_29_1, var_29_0, arg_29_0 = iter_29_1, arg_29_0, arg_29_0[iter_29_1]

      if arg_29_0 == nil then
        return
      end
    end

    return var_29_0[var_29_1]
  end,
  pave = function(arg_30_0, arg_30_1, arg_30_2)
    local var_30_0 = arg_30_0

    for iter_30_0, iter_30_1 in ipairs(arg_30_2) do
      if type(var_30_0[iter_30_1]) == "table" then
        var_30_0 = var_30_0[iter_30_1]
      else
        var_30_0[iter_30_1] = iter_30_0 < #arg_30_2 and {} or arg_30_1
        var_30_0 = var_30_0[iter_30_1]
      end
    end

    return arg_30_0
  end
}

function var_0_42.extract(arg_31_0, arg_31_1)
  if not arg_31_1 or #arg_31_1 == 0 then
    return arg_31_0
  end

  local var_31_0 = var_0_42.find(arg_31_0, arg_31_1)

  return var_0_42.pave({}, var_31_0, arg_31_1)
end

local var_0_43 = {}
local var_0_44 = {}
local var_0_45 = {
  element = {},
  group = {}
}
local var_0_46 = {}
local var_0_47 = {}
local var_0_48 = {}

var_0_33.set_event_callback("shutdown", function()
  for iter_32_0, iter_32_1 in next, var_0_46 do
    if iter_32_1.__ref and not iter_32_1.__rage then
      if iter_32_1.overridden then
        var_0_32.set(iter_32_0, iter_32_1.original)
      end

      var_0_32.set_enabled(iter_32_0, true)
      var_0_32.set_visible(iter_32_0, not iter_32_1.__hidden)
    end
  end
end)
var_0_33.set_event_callback("pre_config_save", function()
  for iter_33_0, iter_33_1 in next, var_0_46 do
    if iter_33_1.__ref and not iter_33_1.__rage and iter_33_1.overridden then
      iter_33_1.ovr_restore = {
        var_0_32.get(iter_33_0)
      }

      var_0_32.set(iter_33_0, iter_33_1.original)
    end
  end

  var_0_47.cycle(function(arg_34_0)
    for iter_34_0, iter_34_1 in pairs(var_0_47.context[arg_34_0]) do
      if var_0_46[iter_34_0].overridden then
        var_0_47.cache[arg_34_0][iter_34_0] = var_0_32.get(iter_34_0)

        var_0_32.set(iter_34_0, iter_34_1)
      end
    end
  end, true)
end)
var_0_33.set_event_callback("post_config_save", function()
  for iter_35_0, iter_35_1 in next, var_0_46 do
    if iter_35_1.__ref and not iter_35_1.__rage and iter_35_1.overridden then
      var_0_32.set(iter_35_0, unpack(iter_35_1.ovr_restore))

      iter_35_1.ovr_restore = nil
    end
  end

  var_0_47.cycle(function(arg_36_0)
    for iter_36_0, iter_36_1 in pairs(var_0_47.context[arg_36_0]) do
      if var_0_46[iter_36_0].overridden then
        var_0_32.set(iter_36_0, var_0_47.cache[arg_36_0][iter_36_0])

        var_0_47.cache[arg_36_0][iter_36_0] = nil
      end
    end
  end, true)
end)

local var_0_49 = {}

function var_0_50(arg_37_0, arg_37_1)
  if arg_37_0.name == "Weapon type" and var_0_31.lower(var_0_46[arg_37_0.ref].tab) == "rage" then
    return var_0_32.get(arg_37_0.ref)
  end

  var_0_32.set_callback(arg_37_0.ref, function(arg_38_0)
    if var_0_46[arg_38_0].__rage and var_0_47.silent then
      return
    end

    for iter_38_0 = 0, #var_0_46[arg_38_0].callbacks do
      if type(var_0_46[arg_38_0].callbacks[iter_38_0]) == "function" then
        var_0_46[arg_38_0].callbacks[iter_38_0](arg_37_0)
      end
    end
  end)

  if arg_37_0.type == "button" then
    return
  elseif arg_37_0.type == "color_picker" or arg_37_0.type == "hotkey" then
    var_0_46[arg_37_0.ref].callbacks[0] = function(arg_39_0)
      arg_37_0.value = {
        var_0_32.get(arg_39_0.ref)
      }
    end

    return {
      var_0_32.get(arg_37_0.ref)
    }
  else
    var_0_46[arg_37_0.ref].callbacks[0] = function(arg_40_0)
      arg_37_0.value = var_0_32.get(arg_40_0.ref)
    end

    if arg_37_0.type == "multiselect" then
      arg_37_0.value = var_0_32.get(arg_37_0.ref)
      var_0_46[arg_37_0.ref].callbacks[1] = function(arg_41_0)
        var_0_46[arg_37_0.ref].options = {}

        for iter_41_0 = 1, #arg_41_0.value do
          var_0_46[arg_37_0.ref].options[arg_41_0.value[iter_41_0]] = true
        end
      end

      var_0_46[arg_37_0.ref].callbacks[1](arg_37_0)
    end

    return var_0_32.get(arg_37_0.ref)
  end
end

function var_0_49.new(arg_42_0, arg_42_1)
  local var_42_0 = {}

  arg_42_1 = arg_42_1 or {}
  var_42_0.ref = arg_42_0
  var_42_0.name, var_42_0.type = var_0_32.name(arg_42_0), var_0_32.type(arg_42_0)
  var_0_46[arg_42_0] = var_0_46[arg_42_0] or {
    overridden = false,
    type = var_42_0.type,
    ref = arg_42_0,
    tab = arg_42_1.__tab,
    container = arg_42_1.__container,
    __ref = arg_42_1.__ref,
    __hidden = arg_42_1.__hidden,
    __init = arg_42_1.__init,
    __list = arg_42_1.__list,
    __rage = arg_42_1.__rage,
    __plist = arg_42_1.__plist and var_42_0.type ~= "label" and var_42_0.type ~= "button" and var_42_0.type ~= "hotkey",
    original = var_42_0.value,
    donotsave = arg_42_1.__plist or false,
    callbacks = {
      [0] = arg_42_1.__callback
    },
    events = {},
    depend = {
      [0] = {
        arg_42_0
      },
      {},
      {}
    }
  }
  var_0_46[arg_42_0].self = setmetatable(var_42_0, var_0_45.element)
  var_42_0.value = var_0_50(var_42_0, arg_42_1.__ref)

  if arg_42_1.__rage then
    var_0_45.element.set_callback(var_42_0, var_0_47.memorize)
  end

  if var_0_46[arg_42_0].__plist then
    var_0_48.elements[#var_0_48.elements + 1] = var_42_0

    var_0_45.element.set_callback(var_42_0, var_0_48.slot_update, true)
  end

  return var_42_0
end

function var_0_49.group(...)
  return setmetatable({
    ...
  }, var_0_45.group)
end

function var_0_49.string(arg_44_0, arg_44_1)
  local var_44_0 = {
    ref = var_0_32.new_string(arg_44_0, arg_44_1 or "")
  }

  var_44_0.type = "string"
  var_44_0[0] = {
    savable = true
  }

  return setmetatable(var_44_0, var_0_45.element)
end

function var_0_49.features(arg_45_0, arg_45_1)
  local var_45_0
  local var_45_1 = arg_45_1[1]
  local var_45_2 = type(arg_45_1[1])

  if not var_45_0 and (var_45_2 == "table" or var_45_2 == "cdata") and not var_45_1.r then
    var_45_0 = "color"

    local var_45_3 = var_45_1[1] or 255
    local var_45_4 = var_45_1[2] or 255
    local var_45_5 = var_45_1[3] or 255
    local var_45_6 = var_45_1[4] or 255

    arg_45_0.color = var_0_49.new(var_0_32.new_color_picker(var_0_46[arg_45_0.ref].tab, var_0_46[arg_45_0.ref].container, arg_45_0.name, var_45_3, var_45_4, var_45_5, var_45_6), {
      __init = {
        var_45_3,
        var_45_4,
        var_45_5,
        var_45_6
      },
      __plist = var_0_46[arg_45_0.ref].__plist
    })
  elseif not var_45_0 and (var_45_2 == "table" or var_45_2 == "cdata") and var_45_1.r then
    var_45_0 = "color"
    arg_45_0.color = var_0_49.new(var_0_32.new_color_picker(var_0_46[arg_45_0.ref].tab, var_0_46[arg_45_0.ref].container, arg_45_0.name, var_45_1.r, var_45_1.g, var_45_1.b, var_45_1.a), {
      __init = {
        var_45_1.r,
        var_45_1.g,
        var_45_1.b,
        var_45_1.a
      },
      __plist = var_0_46[arg_45_0.ref].__plist
    })
  elseif not var_45_0 and var_45_2 == "number" then
    var_45_0 = "hotkey"
    arg_45_0.hotkey = var_0_49.new(var_0_32.new_hotkey(var_0_46[arg_45_0.ref].tab, var_0_46[arg_45_0.ref].container, arg_45_0.name, true, var_45_1, {
      __init = var_45_1
    }))
  end

  var_0_46[arg_45_0.ref].depend[0][2] = var_45_0 and arg_45_0[var_45_0].ref
  var_0_46[arg_45_0.ref].__addon = var_45_0
  var_0_46[arg_45_0.ref].donotsave = arg_45_1[2] == false
end

function var_0_49.memorize(arg_46_0, arg_46_1, arg_46_2)
  if var_0_46[arg_46_0.ref].donotsave then
    return
  end

  if not var_0_21[arg_46_0.type].unsavable then
    var_0_42.pave(arg_46_2, arg_46_0.ref, arg_46_1)
  end

  if arg_46_0.color then
    arg_46_1[#arg_46_1] = arg_46_1[#arg_46_1] .. "_c"

    var_0_42.pave(arg_46_2, arg_46_0.color.ref, arg_46_1)
  end

  if arg_46_0.hotkey then
    arg_46_1[#arg_46_1] = arg_46_1[#arg_46_1] .. "_h"

    var_0_42.pave(arg_46_2, arg_46_0.hotkey.ref, arg_46_1)
  end
end

var_0_49.hidden_refs = {
  "Unlock hidden cVars",
  "Allow custom game events",
  "Faster grenade toss",
  "sv_maxunlag",
  "sv_maxusrcmdprocessticks",
  "sv_clockcorrection_msecs"
}

local var_0_51 = {
  combobox = function(arg_47_0)
    if arg_47_0[3] == true then
      return arg_47_0[1].value ~= arg_47_0[2]
    else
      for iter_47_0 = 2, #arg_47_0 do
        if arg_47_0[1].value == arg_47_0[iter_47_0] then
          return true
        end
      end
    end

    return false
  end,
  listbox = function(arg_48_0)
    if arg_48_0[3] == true then
      return arg_48_0[1].value ~= arg_48_0[2]
    else
      for iter_48_0 = 2, #arg_48_0 do
        if arg_48_0[1].value == arg_48_0[iter_48_0] then
          return true
        end
      end
    end

    return false
  end,
  multiselect = function(arg_49_0)
    return var_0_29.ihas(arg_49_0[1].value, unpack(arg_49_0, 2))
  end,
  slider = function(arg_50_0)
    return arg_50_0[2] <= arg_50_0[1].value and arg_50_0[1].value <= (arg_50_0[3] or arg_50_0[2])
  end
}

function var_0_52(arg_51_0)
  local var_51_0 = false

  if type(arg_51_0[2]) == "function" then
    var_51_0 = arg_51_0[2](arg_51_0[1])
  else
    local var_51_1 = var_0_51[arg_51_0[1].type]

    if var_51_1 then
      var_51_0 = var_51_1(arg_51_0)
    else
      var_51_0 = arg_51_0[1].value == arg_51_0[2]
    end
  end

  return var_51_0 and true or false
end

function var_0_49.dependant(arg_52_0, arg_52_1, arg_52_2)
  local var_52_0 = 0

  for iter_52_0 = 1, #arg_52_0 do
    if var_0_52(arg_52_0[iter_52_0]) then
      var_52_0 = var_52_0 + 1
    else
      break
    end
  end

  local var_52_1 = var_52_0 >= #arg_52_0
  local var_52_2 = arg_52_2 and "set_enabled" or "set_visible"

  for iter_52_1, iter_52_2 in ipairs(arg_52_1) do
    var_0_32[var_52_2](iter_52_2, var_52_1)
  end
end

local var_0_53 = {
  time_to_ticks = function(arg_53_0)
    return var_0_30.floor(0.5 + arg_53_0 / globals.tickinterval())
  end,
  rgb_to_hex = function(arg_54_0)
    return var_0_31.format("%02X%02X%02X%02X", arg_54_0[1], arg_54_0[2], arg_54_0[3], arg_54_0[4] or 255)
  end
}

function var_0_53.animate_text(arg_55_0, arg_55_1, arg_55_2, arg_55_3, arg_55_4, arg_55_5, arg_55_6, arg_55_7, arg_55_8, arg_55_9)
  local var_55_0 = {}
  local var_55_1 = 1
  local var_55_2 = arg_55_1:len() - 1
  local var_55_3 = arg_55_6 - arg_55_2
  local var_55_4 = arg_55_7 - arg_55_3
  local var_55_5 = arg_55_8 - arg_55_4
  local var_55_6 = arg_55_9 - arg_55_5

  for iter_55_0 = 1, #arg_55_1 do
    local var_55_7 = (iter_55_0 - 1) / (#arg_55_1 - 1) + arg_55_0

    var_55_0[var_55_1] = "\a" .. var_0_53.rgb_to_hex({
      arg_55_2 + var_55_3 * var_0_30.abs(var_0_30.cos(var_55_7)),
      arg_55_3 + var_55_4 * var_0_30.abs(var_0_30.cos(var_55_7)),
      arg_55_4 + var_55_5 * var_0_30.abs(var_0_30.cos(var_55_7)),
      arg_55_5 + var_55_6 * var_0_30.abs(var_0_30.cos(var_55_7))
    })
    var_55_0[var_55_1 + 1] = arg_55_1:sub(iter_55_0, iter_55_0)
    var_55_1 = var_55_1 + 2
  end

  return var_0_29.concat(var_55_0)
end

function var_0_53.hex_to_rgb(arg_56_0)
  arg_56_0 = arg_56_0:gsub("^#", "")

  return tonumber(arg_56_0:sub(1, 2), 16), tonumber(arg_56_0:sub(3, 4), 16), tonumber(arg_56_0:sub(5, 6), 16), tonumber(arg_56_0:sub(7, 8), 16) or 255
end

function var_0_53.gradient_text(arg_57_0, arg_57_1, arg_57_2)
  local var_57_0 = {}
  local var_57_1 = #var_0_31.gsub(arg_57_0, ".[\x80-\xBF]*", "a")
  local var_57_2 = 1 / (#arg_57_1 - 1)

  arg_57_2 = arg_57_2 or 1

  local var_57_3 = 0

  for iter_57_0 in var_0_31.gmatch(arg_57_0, ".[\x80-\xBF]*") do
    var_57_3 = var_57_3 + 1

    local var_57_4 = var_57_3 / var_57_1 / var_57_2
    local var_57_5 = var_0_30.ceil(var_57_4)
    local var_57_6 = var_57_4 / var_57_5
    local var_57_7 = arg_57_1[var_57_5]
    local var_57_8 = arg_57_1[var_57_5 + 1]
    local var_57_9 = var_57_7[1] + (var_57_8[1] - var_57_7[1]) * var_57_6
    local var_57_10 = var_57_7[2] + (var_57_8[2] - var_57_7[2]) * var_57_6
    local var_57_11 = var_57_7[3] + (var_57_8[3] - var_57_7[3]) * var_57_6
    local var_57_12 = var_57_7[4] + (var_57_8[4] - var_57_7[4]) * var_57_6

    var_57_0[#var_57_0 + 1] = (var_57_3 - 1) % arg_57_2 == 0 and ("\a%02x%02x%02x%02x%s"):format(var_57_9, var_57_10, var_57_11, var_57_12, iter_57_0) or iter_57_0
  end

  var_57_0[#var_57_0 + 1] = "\aCDCDCDFF"

  return var_0_29.concat(var_57_0)
end

function var_0_54(arg_58_0, arg_58_1)
  local var_58_0 = {}

  for iter_58_0 in var_0_31.gmatch(arg_58_0, "\b%x+") do
    var_58_0[#var_58_0 + 1] = {
      var_0_53.hex_to_rgb(var_0_31.sub(iter_58_0, 2))
    }
  end

  if #var_58_0 > 0 then
    return var_0_53.gradient_text(arg_58_1, var_58_0, #arg_58_1 > 8 and 2 or 1)
  end
end

function var_0_53.format(arg_59_0)
  if type(arg_59_0) == "string" then
    arg_59_0 = var_0_31.gsub(arg_59_0, "\f<(.-)>", var_0_43.macros)
    arg_59_0 = var_0_31.gsub(arg_59_0, "[\v\r\t]", {
      ["\t"] = "    ",
      ["\r"] = "\aCDCDCDFF",
      ["\v"] = "\aB9B7F1FF"
    })
    arg_59_0 = var_0_31.gsub(arg_59_0, "([\b%x]-)%[(.-)%]", var_0_54)
  end

  return arg_59_0
end

function var_0_53.unpack_color(...)
  local var_60_0 = {
    ...
  }
  local var_60_1 = type(var_60_0[1])

  if var_60_1 == "table" or var_60_1 == "cdata" or var_60_1 == "userdata" then
    if var_60_0[1].r then
      return {
        var_60_0[1].r,
        var_60_0[1].g,
        var_60_0[1].b,
        var_60_0[1].a
      }
    elseif var_60_0[1][1] then
      return {
        var_60_0[1][1],
        var_60_0[1][2],
        var_60_0[1][3],
        var_60_0[1][4]
      }
    end
  end

  return var_60_0
end

local var_0_55 = {
  color_picker = function(arg_61_0)
    arg_61_0[1] = var_0_31.sub(var_0_53.format(arg_61_0[1]), 1, 117)

    if type(arg_61_0[2]) ~= "number" then
      local var_61_0 = arg_61_0[2]

      arg_61_0.n, arg_61_0.req, arg_61_0[2] = arg_61_0.n + 3, arg_61_0.req + 3, var_61_0.r

      var_0_29.insert(arg_61_0, 3, var_61_0.g)
      var_0_29.insert(arg_61_0, 4, var_61_0.b)
      var_0_29.insert(arg_61_0, 5, var_61_0.a)
    end

    for iter_61_0 = arg_61_0.req + 1, arg_61_0.n do
      arg_61_0.misc[iter_61_0 - arg_61_0.req] = arg_61_0[iter_61_0]
    end

    arg_61_0.data.__init = {
      arg_61_0[2] or 255,
      arg_61_0[3] or 255,
      arg_61_0[4] or 255,
      arg_61_0[5] or 255
    }
  end,
  listbox = function(arg_62_0, arg_62_1)
    arg_62_0[1] = var_0_31.sub(var_0_53.format(arg_62_0[1]), 1, 117)

    for iter_62_0 = arg_62_0.req + 1, arg_62_0.n do
      arg_62_0.misc[iter_62_0 - arg_62_0.req] = arg_62_0[iter_62_0]
    end

    arg_62_0.data.__init, arg_62_0.data.__list = 0, not arg_62_1 and arg_62_0[2] or {
      unpack(arg_62_0, 2, arg_62_0.n)
    }
  end,
  combobox = function(arg_63_0, arg_63_1)
    arg_63_0[1] = var_0_31.sub(var_0_53.format(arg_63_0[1]), 1, 117)

    for iter_63_0 = arg_63_0.req + 1, arg_63_0.n do
      arg_63_0.misc[iter_63_0 - arg_63_0.req] = arg_63_0[iter_63_0]
    end

    arg_63_0.data.__init, arg_63_0.data.__list = not arg_63_1 and arg_63_0[2][1] or arg_63_0[2], not arg_63_1 and arg_63_0[2] or {
      unpack(arg_63_0, 2, arg_63_0.n)
    }
  end,
  multiselect = function(arg_64_0, arg_64_1)
    arg_64_0[1] = var_0_31.sub(var_0_53.format(arg_64_0[1]), 1, 117)

    for iter_64_0 = arg_64_0.req + 1, arg_64_0.n do
      arg_64_0.misc[iter_64_0 - arg_64_0.req] = arg_64_0[iter_64_0]
    end

    arg_64_0.data.__init, arg_64_0.data.__list = {}, not arg_64_1 and arg_64_0[2] or {
      unpack(arg_64_0, 2, arg_64_0.n)
    }
  end,
  slider = function(arg_65_0)
    arg_65_0[1] = var_0_31.sub(var_0_53.format(arg_65_0[1]), 1, 117)

    for iter_65_0 = arg_65_0.req + 1, arg_65_0.n do
      arg_65_0.misc[iter_65_0 - arg_65_0.req] = arg_65_0[iter_65_0]
    end

    arg_65_0.data.__init = arg_65_0[4] or arg_65_0[2]
  end,
  button = function(arg_66_0)
    arg_66_0[2] = arg_66_0[2] or function()
      return
    end
    arg_66_0[1] = var_0_31.sub(var_0_53.format(arg_66_0[1]), 1, 117)
    arg_66_0.n, arg_66_0.data.__callback = 2, arg_66_0[2]
  end
}

function var_0_53.dispense(arg_68_0, arg_68_1, ...)
  local var_68_0 = {
    ...
  }
  local var_68_1 = {}
  local var_68_2 = var_0_21[arg_68_0]

  if type(arg_68_1) == "table" then
    var_68_1[1], var_68_1[2] = arg_68_1[1], arg_68_1[2]
    var_68_1.__plist = arg_68_1.__plist
  else
    var_68_1[1], var_68_1[2] = arg_68_1, var_68_0[1]

    var_0_29.remove(var_68_0, 1)
  end

  var_68_0.n, var_68_0.data = var_0_29.maxn(var_68_0), {
    __tab = var_68_1[1],
    __container = var_68_1[2],
    __plist = var_68_1.__plist and true or nil
  }

  local var_68_3 = var_68_2 and var_68_2.variable and type(var_68_0[2]) == "string"

  var_68_0.req, var_68_0.misc = not var_68_3 and var_68_2.arg or var_68_0.n, {}

  if var_0_55[arg_68_0] then
    var_0_55[arg_68_0](var_68_0, var_68_3)
  else
    for iter_68_0 = 1, var_68_0.n do
      if type(var_68_0[iter_68_0]) == "string" then
        var_68_0[iter_68_0] = var_0_31.sub(var_0_53.format(var_68_0[iter_68_0]), 1, 117)
      end

      if iter_68_0 > var_68_0.req then
        var_68_0.misc[iter_68_0 - var_68_0.req] = var_68_0[iter_68_0]
      end
    end

    var_68_0.data.__init = var_68_2.init
  end

  return var_68_0, var_68_1
end

local var_0_56 = renderer

function var_0_56.rec(arg_69_0, arg_69_1, arg_69_2, arg_69_3, arg_69_4, arg_69_5)
  arg_69_4 = var_0_30.min(arg_69_0 / 2, arg_69_1 / 2, arg_69_4)

  local var_69_0, var_69_1, var_69_2, var_69_3 = unpack(arg_69_5)

  renderer.rectangle(arg_69_0, arg_69_1 + arg_69_4, arg_69_2, arg_69_3 - arg_69_4 * 2, var_69_0, var_69_1, var_69_2, var_69_3)
  renderer.rectangle(arg_69_0 + arg_69_4, arg_69_1, arg_69_2 - arg_69_4 * 2, arg_69_4, var_69_0, var_69_1, var_69_2, var_69_3)
  renderer.rectangle(arg_69_0 + arg_69_4, arg_69_1 + arg_69_3 - arg_69_4, arg_69_2 - arg_69_4 * 2, arg_69_4, var_69_0, var_69_1, var_69_2, var_69_3)
  renderer.circle(arg_69_0 + arg_69_4, arg_69_1 + arg_69_4, var_69_0, var_69_1, var_69_2, var_69_3, arg_69_4, 180, 0.25)
  renderer.circle(arg_69_0 - arg_69_4 + arg_69_2, arg_69_1 + arg_69_4, var_69_0, var_69_1, var_69_2, var_69_3, arg_69_4, 90, 0.25)
  renderer.circle(arg_69_0 - arg_69_4 + arg_69_2, arg_69_1 - arg_69_4 + arg_69_3, var_69_0, var_69_1, var_69_2, var_69_3, arg_69_4, 0, 0.25)
  renderer.circle(arg_69_0 + arg_69_4, arg_69_1 - arg_69_4 + arg_69_3, var_69_0, var_69_1, var_69_2, var_69_3, arg_69_4, -90, 0.25)
end

function var_0_56.rec_outline(arg_70_0, arg_70_1, arg_70_2, arg_70_3, arg_70_4, arg_70_5, arg_70_6)
  arg_70_4 = var_0_30.min(arg_70_2 / 2, arg_70_3 / 2, arg_70_4)

  local var_70_0, var_70_1, var_70_2, var_70_3 = unpack(arg_70_6)

  if arg_70_4 == 1 then
    renderer.rectangle(arg_70_0, arg_70_1, arg_70_2, arg_70_5, var_70_0, var_70_1, var_70_2, var_70_3)
    renderer.rectangle(arg_70_0, arg_70_1 + arg_70_3 - arg_70_5, arg_70_2, arg_70_5, var_70_0, var_70_1, var_70_2, var_70_3)
  else
    renderer.rectangle(arg_70_0 + arg_70_4, arg_70_1, arg_70_2 - arg_70_4 * 2, arg_70_5, var_70_0, var_70_1, var_70_2, var_70_3)
    renderer.rectangle(arg_70_0 + arg_70_4, arg_70_1 + arg_70_3 - arg_70_5, arg_70_2 - arg_70_4 * 2, arg_70_5, var_70_0, var_70_1, var_70_2, var_70_3)
    renderer.rectangle(arg_70_0, arg_70_1 + arg_70_4, arg_70_5, arg_70_3 - arg_70_4 * 2, var_70_0, var_70_1, var_70_2, var_70_3)
    renderer.rectangle(arg_70_0 + arg_70_2 - arg_70_5, arg_70_1 + arg_70_4, arg_70_5, arg_70_3 - arg_70_4 * 2, var_70_0, var_70_1, var_70_2, var_70_3)
    renderer.circle_outline(arg_70_0 + arg_70_4, arg_70_1 + arg_70_4, var_70_0, var_70_1, var_70_2, var_70_3, arg_70_4, 180, 0.25, arg_70_5)
    renderer.circle_outline(arg_70_0 + arg_70_4, arg_70_1 + arg_70_3 - arg_70_4, var_70_0, var_70_1, var_70_2, var_70_3, arg_70_4, 90, 0.25, arg_70_5)
    renderer.circle_outline(arg_70_0 + arg_70_2 - arg_70_4, arg_70_1 + arg_70_4, var_70_0, var_70_1, var_70_2, var_70_3, arg_70_4, -90, 0.25, arg_70_5)
    renderer.circle_outline(arg_70_0 + arg_70_2 - arg_70_4, arg_70_1 + arg_70_3 - arg_70_4, var_70_0, var_70_1, var_70_2, var_70_3, arg_70_4, 0, 0.25, arg_70_5)
  end
end

function var_0_56.shadow(arg_71_0, arg_71_1, arg_71_2, arg_71_3, arg_71_4, arg_71_5, arg_71_6, arg_71_7)
  local var_71_0 = 1
  local var_71_1 = 1
  local var_71_2, var_71_3, var_71_4, var_71_5 = unpack(arg_71_6)

  if arg_71_7 then
    var_0_56.rec(arg_71_0, arg_71_1, arg_71_2, arg_71_3 + 1, arg_71_5, arg_71_7)
  end

  for iter_71_0 = 0, arg_71_4 do
    if var_71_5 * (iter_71_0 / arg_71_4)^1 > 5 then
      local var_71_6 = {
        var_71_2,
        var_71_3,
        var_71_4,
        var_71_5 * (iter_71_0 / arg_71_4)^2
      }

      var_0_56.rec_outline(arg_71_0 + (iter_71_0 - arg_71_4 - var_71_1) * var_71_0, arg_71_1 + (iter_71_0 - arg_71_4 - var_71_1) * var_71_0, arg_71_2 - (iter_71_0 - arg_71_4 - var_71_1) * var_71_0 * 2, arg_71_3 + 1 - (iter_71_0 - arg_71_4 - var_71_1) * var_71_0 * 2, arg_71_5 + var_71_0 * (arg_71_4 - iter_71_0 + var_71_1), var_71_0, var_71_6)
    end
  end
end

var_0_43.macros = setmetatable({}, {
  __newindex = function(arg_72_0, arg_72_1, arg_72_2)
    rawset(arg_72_0, tostring(arg_72_1), arg_72_2)
  end,
  __index = function(arg_73_0, arg_73_1)
    return rawget(arg_73_0, tostring(arg_73_1))
  end
})
var_0_43.accent, var_0_43.menu_open = nil, var_0_32.is_menu_open()

local var_0_57 = var_0_32.reference("MISC", "Settings", "Menu color")

var_0_43.accent = var_0_53.rgb_to_hex({
  var_0_32.get(var_0_57)
})

local var_0_58 = var_0_43.accent

var_0_32.set_callback(var_0_57, function()
  local var_74_0 = {
    var_0_32.get(var_0_57)
  }

  var_0_43.accent = var_0_53.rgb_to_hex(var_74_0)

  for iter_74_0, iter_74_1 in next, var_0_46 do
    if iter_74_1.type == "label" and not iter_74_1.__ref then
      local var_74_1, var_74_2 = var_0_31.gsub(iter_74_1.self.value, var_0_58, var_0_43.accent)

      if var_74_2 > 0 then
        var_0_32.set(iter_74_0, var_74_1)

        iter_74_1.self.value = var_74_1
      end
    end
  end

  var_0_58 = var_0_43.accent

  var_0_33.fire_event("ui_handler::accent_color", var_74_0)
end)

function var_0_43.group(arg_75_0, arg_75_1)
  return var_0_49.group(arg_75_0, arg_75_1)
end

var_0_43.format = var_0_53.format

function var_0_43.reference(arg_76_0, arg_76_1, arg_76_2)
  local var_76_0 = {
    var_0_36(var_0_32.reference, 3, arg_76_0, arg_76_1, arg_76_2)
  }
  local var_76_1 = #var_76_0
  local var_76_2 = false

  if var_0_31.lower(arg_76_0) == "misc" and var_0_31.lower(arg_76_1) == "settings" then
    for iter_76_0, iter_76_1 in ipairs(var_0_49.hidden_refs) do
      if var_0_31.find(arg_76_2, "^" .. iter_76_1) then
        var_76_2 = true

        break
      end
    end
  end

  for iter_76_2, iter_76_3 in ipairs(var_76_0) do
    var_76_0[iter_76_2] = var_0_49.new(iter_76_3, {
      __ref = true,
      __hidden = var_76_2 or nil,
      __tab = arg_76_0,
      __container = arg_76_1,
      __rage = arg_76_1 == "Aimbot" or nil
    })
  end

  if var_76_1 > 1 then
    local var_76_3 = 0

    for iter_76_4 = 1, var_76_1 > 4 and var_76_1 or 4, 2 do
      local var_76_4 = iter_76_4 - var_76_3
      local var_76_5 = iter_76_4 + 1 - var_76_3

      if var_76_0[var_76_5] and (var_76_0[var_76_5].type == "hotkey" or var_76_0[var_76_5].type == "color_picker") then
        local var_76_6 = var_76_0[var_76_5].type == "color_picker" and "color" or "hotkey"

        var_0_46[var_76_0[var_76_4].ref].__addon, var_76_0[var_76_4][var_76_6] = var_76_6, var_76_0[var_76_5]

        var_0_29.remove(var_76_0, var_76_5)

        var_76_3 = var_76_3 + 1
      end
    end

    return unpack(var_76_0)
  else
    return var_76_0[1]
  end
end

function var_0_43.traverse(arg_77_0, arg_77_1, arg_77_2)
  arg_77_2 = arg_77_2 or {}

  if type(arg_77_0) == "table" and arg_77_0.__name ~= "ui_handler::element" and arg_77_0[#arg_77_0] ~= "~" then
    for iter_77_0, iter_77_1 in next, arg_77_0 do
      local var_77_0 = var_0_29.copy(arg_77_2)

      var_77_0[#var_77_0 + 1] = iter_77_0

      var_0_43.traverse(iter_77_1, arg_77_1, var_77_0)
    end
  else
    arg_77_1(arg_77_0, arg_77_2)
  end
end

function save(arg_78_0, ...)
  local var_78_0 = {}

  var_0_43.traverse(var_0_42.extract(arg_78_0, {
    ...
  }), function(arg_79_0, arg_79_1)
    local var_79_0
    local var_79_1 = var_0_46[arg_79_0].type

    if var_79_1 == "color_picker" then
      var_79_0 = "#" .. var_0_53.rgb_to_hex({
        var_0_32.get(arg_79_0)
      })
    elseif var_79_1 == "hotkey" then
      local var_79_2, var_79_3, var_79_4 = var_0_32.get(arg_79_0)

      var_79_0 = {
        var_79_3,
        var_79_4 or 0
      }
    else
      var_79_0 = var_0_32.get(arg_79_0)
    end

    if type(var_79_0) == "table" then
      var_79_0[#var_79_0 + 1] = "~"
    end

    var_0_42.pave(var_78_0, var_79_0, arg_79_1)
  end)

  return var_78_0
end

function load(arg_80_0, arg_80_1, ...)
  if not arg_80_1 then
    return
  end

  local var_80_0 = var_0_42.extract(arg_80_1, {
    ...
  })

  var_0_43.traverse(var_0_42.extract(arg_80_0, {
    ...
  }), function(arg_81_0, arg_81_1)
    pcall(function()
      local var_82_0 = var_0_42.find(var_80_0, arg_81_1)
      local var_82_1 = var_0_46[arg_81_0]
      local var_82_2 = type(var_82_0)
      local var_82_3 = var_82_1.type
      local var_82_4 = var_0_21[var_82_3]

      if var_82_2 == "string" and var_82_0:sub(1, 1) == "#" then
        var_82_0, var_82_2 = {
          var_0_53.hex_to_rgb(var_82_0)
        }, "table"
      elseif var_82_2 == "table" and var_82_0[#var_82_0] == "~" then
        var_82_0[#var_82_0] = nil
      end

      if var_82_3 == "hotkey" and var_82_0 and type(var_82_0[1]) == "number" then
        var_82_0[1] = var_0_21.hotkey.enum[var_82_0[1]]
      end

      if var_82_4 and var_82_4.type == var_82_2 then
        if var_82_2 == "table" and var_82_3 ~= "multiselect" then
          var_0_32.set(arg_81_0, unpack(var_82_0))

          if var_82_3 == "color_picker" then
            var_0_45.element.invoke(var_82_1.self)
          end
        else
          var_0_32.set(arg_81_0, var_82_0)
        end
      elseif var_82_1.__init then
        var_0_32.set(arg_81_0, var_82_1.__init)
      end
    end)
  end)
end

local var_0_59 = {
  __metatable = false,
  __type = "ui_handler::package",
  __call = function(arg_83_0, arg_83_1, ...)
    return (type(arg_83_1) == "table" and load or save)(arg_83_0[0], arg_83_1, ...)
  end,
  save = function(arg_84_0, ...)
    return save(arg_84_0[0], ...)
  end,
  load = function(arg_85_0, ...)
    load(arg_85_0[0], ...)
  end
}

var_0_59.__index = var_0_59

function var_0_43.setup(arg_86_0)
  local var_86_0 = {
    [0] = {}
  }

  var_0_43.traverse(arg_86_0, function(arg_87_0, arg_87_1)
    var_0_49.memorize(arg_87_0, arg_87_1, var_86_0[0])
  end)

  return setmetatable(var_86_0, var_0_59)
end

var_0_45.element = {
  __name = "ui_handler::element",
  __metatable = false,
  __type = "ui_handler::element",
  __eq = function(arg_88_0, arg_88_1)
    return arg_88_0.ref == arg_88_1.ref
  end,
  __tostring = function(arg_89_0)
    return var_0_31.format("ui_handler.%s[%d] " % s(""), arg_89_0.type, arg_89_0.ref, arg_89_0.name)
  end,
  __call = function(arg_90_0, ...)
    if #{
      ...
    } > 0 then
      var_0_32.set(arg_90_0.ref, ...)
    else
      return var_0_32.get(arg_90_0.ref)
    end
  end,
  depend = function(arg_91_0, ...)
    local var_91_0 = {
      ...
    }
    local var_91_1 = var_91_0[1] == true
    local var_91_2 = var_0_46[arg_91_0.ref].depend[var_91_1 and 2 or 1]
    local var_91_3 = var_0_46[arg_91_0.ref].depend[0]

    for iter_91_0 = var_91_1 and 2 or 1, var_0_29.maxn(var_91_0) do
      local var_91_4 = var_91_0[iter_91_0]

      if var_91_4 then
        if var_91_4.__name == "ui_handler::element" then
          var_91_4 = {
            var_91_4,
            true
          }
        end

        var_91_2[#var_91_2 + 1] = var_91_4

        function var_91_5()
          var_0_49.dependant(var_91_2, var_91_3, var_91_1)
        end

        var_91_5()

        var_0_46[var_91_4[1].ref].callbacks[#var_0_46[var_91_4[1].ref].callbacks + 1] = var_91_5
      end
    end

    return arg_91_0
  end,
  override = function(arg_93_0, arg_93_1)
    local var_93_0 = arg_93_0.type == "hotkey"
    local var_93_1 = var_0_46[arg_93_0.ref]
    local var_93_2 = var_0_47.context[var_0_47.ref.value]

    if arg_93_1 ~= nil then
      if not var_93_1.overridden then
        if var_93_0 then
          arg_93_0.value = {
            var_0_32.get(arg_93_0.ref)
          }
        end

        if var_93_1.__rage then
          var_93_2[arg_93_0.ref] = arg_93_0.value
        else
          var_93_1.original = arg_93_0.value
        end
      end

      var_93_1.overridden = true

      if var_93_0 then
        var_0_32.set(arg_93_0.ref, arg_93_1[1], arg_93_1[2])
      else
        var_0_32.set(arg_93_0.ref, arg_93_1)
      end

      if var_93_1.__rage then
        var_93_1.__ovr_v = arg_93_1
      end
    elseif var_93_1.overridden then
      local var_93_3 = var_93_1.original

      if var_93_1.__rage then
        var_93_3, var_93_1.__ovr_v = var_93_2[arg_93_0.ref]
      end

      if var_93_0 then
        var_0_32.set(arg_93_0.ref, var_0_21.hotkey.enum[var_93_3[2]], var_93_3[3] or 0)
      else
        var_0_32.set(arg_93_0.ref, var_93_3)
      end

      var_93_1.overridden = false
    end
  end,
  get_original = function(arg_94_0)
    if var_0_46[arg_94_0.ref].__rage then
      if var_0_46[arg_94_0.ref].overridden then
        return var_0_47.context[var_0_47.ref.value][arg_94_0.ref]
      else
        return arg_94_0.value
      end
    elseif var_0_46[arg_94_0.ref].overridden then
      return var_0_46[arg_94_0.ref].original
    else
      return arg_94_0.value
    end
  end,
  set = function(arg_95_0, ...)
    if arg_95_0.type == "color_picker" then
      var_0_32.set(arg_95_0.ref, unpack(var_0_53.unpack_color(...)))
      var_0_45.element.invoke(arg_95_0)
    elseif arg_95_0.type == "label" then
      local var_95_0 = var_0_53.format(...)

      var_0_32.set(arg_95_0.ref, var_95_0)

      arg_95_0.value = var_95_0
    else
      var_0_32.set(arg_95_0.ref, ...)
    end
  end,
  get = function(arg_96_0, arg_96_1)
    if arg_96_1 and arg_96_0.type == "multiselect" then
      return var_0_46[arg_96_0.ref].options[arg_96_1] or false
    end

    return var_0_32.get(arg_96_0.ref)
  end,
  reset = function(arg_97_0)
    if var_0_46[arg_97_0.ref].__init then
      var_0_32.set(arg_97_0.ref, var_0_46[arg_97_0.ref].__init)
    end
  end,
  update = function(arg_98_0, arg_98_1)
    var_0_32.update(arg_98_0.ref, arg_98_1)

    var_0_46[arg_98_0.ref].__list = arg_98_1

    local var_98_0 = #arg_98_1 - 1
  end,
  get_list = function(arg_99_0)
    return var_0_46[arg_99_0.ref].__list
  end,
  get_color = function(arg_100_0)
    if var_0_46[arg_100_0.ref].__addon then
      return var_0_32.get(arg_100_0.color.ref)
    end
  end,
  set_color = function(arg_101_0, ...)
    if var_0_46[arg_101_0.ref].__addon then
      var_0_45.element.set(arg_101_0.color, ...)
    end
  end,
  get_hotkey = function(arg_102_0)
    if var_0_46[arg_102_0.ref].__addon then
      return var_0_32.get(arg_102_0.hotkey.ref)
    end
  end,
  set_hotkey = function(arg_103_0, ...)
    if var_0_46[arg_103_0.ref].__addon then
      var_0_45.element.set(arg_103_0.hotkey, ...)
    end
  end,
  is_reference = function(arg_104_0)
    return var_0_46[arg_104_0.ref].__ref or false
  end,
  get_type = function(arg_105_0)
    return arg_105_0.type
  end,
  get_name = function(arg_106_0)
    return arg_106_0.name
  end,
  set_visible = function(arg_107_0, arg_107_1)
    var_0_32.set_visible(arg_107_0.ref, arg_107_1)

    if var_0_46[arg_107_0.ref].__addon then
      var_0_32.set_visible(arg_107_0[var_0_46[arg_107_0.ref].__addon].ref, arg_107_1)
    end
  end,
  set_enabled = function(arg_108_0, arg_108_1)
    var_0_32.set_enabled(arg_108_0.ref, arg_108_1)

    if var_0_46[arg_108_0.ref].__addon then
      var_0_32.set_enabled(arg_108_0[var_0_46[arg_108_0.ref].__addon].ref, arg_108_1)
    end
  end,
  set_callback = function(arg_109_0, arg_109_1, arg_109_2)
    if arg_109_2 == true then
      arg_109_1(arg_109_0)
    end

    var_0_46[arg_109_0.ref].callbacks[#var_0_46[arg_109_0.ref].callbacks + 1] = arg_109_1
  end,
  unset_callback = function(arg_110_0, arg_110_1)
    var_0_29.remove(var_0_46[arg_110_0.ref].callbacks, var_0_29.qfind(var_0_46[arg_110_0.ref].callbacks, arg_110_1) or 0)
  end,
  invoke = function(arg_111_0, ...)
    for iter_111_0 = 0, #var_0_46[arg_111_0.ref].callbacks do
      var_0_46[arg_111_0.ref].callbacks[iter_111_0](arg_111_0, ...)
    end
  end,
  set_event = function(arg_112_0, arg_112_1, arg_112_2, arg_112_3)
    local var_112_0 = var_0_46[arg_112_0.ref]

    if arg_112_3 == nil then
      arg_112_3 = true
    end

    local var_112_1 = type(arg_112_3) == "function"
    local var_112_2

    var_112_0.events[arg_112_2] = function(arg_113_0)
      local var_113_0

      if var_112_1 then
        var_113_0 = arg_112_3(arg_113_0)
      else
        var_113_0 = arg_113_0.value == arg_112_3
      end

      local var_113_1 = var_113_0 and var_0_33.set_event_callback or var_0_33.unset_event_callback

      if var_112_2 ~= var_113_0 then
        var_113_1(arg_112_1, arg_112_2)

        var_112_2 = var_113_0
      end
    end

    var_112_0.events[arg_112_2](arg_112_0)

    var_112_0.callbacks[#var_112_0.callbacks + 1] = var_112_0.events[arg_112_2]
  end,
  unset_event = function(arg_114_0, arg_114_1, arg_114_2)
    var_0_33.unset_event_callback(arg_114_1, arg_114_2)
    var_0_45.element.unset_callback(arg_114_0, var_0_46[arg_114_0.ref].events[arg_114_2])

    var_0_46[arg_114_0.ref].events[arg_114_2] = nil
  end,
  get_location = function(arg_115_0)
    return var_0_46[arg_115_0.ref].tab, var_0_46[arg_115_0.ref].container
  end
}
var_0_45.element.__index = var_0_45.element
var_0_45.group = {
  __metatable = false,
  __name = "ui_handler::group",
  __index = function(arg_116_0, arg_116_1)
    return rawget(var_0_45.group, arg_116_1) or var_0_44.__index(arg_116_0, arg_116_1)
  end,
  get_location = function(arg_117_0)
    return arg_117_0[1], arg_117_0[2]
  end
}

for iter_0_0, iter_0_1 in next, var_0_21 do
  function iter_0_1.fn(arg_118_0, ...)
    local var_118_0, var_118_1 = var_0_53.dispense(iter_0_0, arg_118_0, ...)
    local var_118_2 = var_0_49.new(var_0_36(var_0_32["new_" .. iter_0_0], 3, var_118_1[1], var_118_1[2], unpack(var_118_0, 1, var_118_0.n < var_118_0.req and var_118_0.n or var_118_0.req)), var_118_0.data)

    var_0_49.features(var_118_2, var_118_0.misc)

    return var_118_2
  end
end

var_0_44.__name, var_0_44.__metatable = "ui_handler::basement", false

function var_0_44.__index(arg_119_0, arg_119_1)
  if not var_0_21[arg_119_1] then
    return var_0_32[arg_119_1]
  end

  if arg_119_1 == "string" then
    return var_0_49.string
  end

  return var_0_21[arg_119_1].fn
end

var_0_47 = {
  silent = false,
  ref = var_0_43.reference("RAGE", "Weapon type", "Weapon type"),
  context = {},
  cache = {}
}

local var_0_60 = var_0_47.ref.value
local var_0_61

for iter_0_2, iter_0_3 in ipairs(var_0_22) do
  var_0_47.context[iter_0_3], var_0_47.cache[iter_0_3] = {}, {}
end

local var_0_62 = var_0_32.reference("RAGE", "Aimbot", "Enabled")

var_0_32.set_callback(var_0_62, function()
  if not var_0_47.silent then
    var_0_33.delay_call(0, var_0_33.fire_event, "ui_handler::adaptive_weapon", var_0_47.ref.value, var_0_60)
  end

  if var_0_61 then
    var_0_61(var_0_47.ref.value)
  end
end)

function var_0_47.cycle(arg_121_0, arg_121_1)
  var_0_61 = arg_121_1 and arg_121_0 or nil
  var_0_47.silent = arg_121_1 and true or false

  for iter_121_0, iter_121_1 in ipairs(var_0_22) do
    var_0_47.ref:override(iter_121_1)
  end

  var_0_47.ref:override()

  var_0_61, var_0_47.silent = nil, false
end

var_0_32.set_callback(var_0_47.ref.ref, function(arg_122_0)
  var_0_47.ref.value = var_0_32.get(arg_122_0)

  if not var_0_47.silent and var_0_60 ~= var_0_47.ref.value then
    for iter_122_0 = 1, #var_0_46[arg_122_0].callbacks do
      var_0_46[arg_122_0].callbacks[iter_122_0](var_0_47.ref)
    end
  end

  var_0_60 = var_0_47.ref.value
end)

function var_0_47.memorize(arg_123_0)
  local var_123_0 = var_0_47.context[var_0_47.ref.value]

  if var_0_46[arg_123_0.ref].overridden then
    if var_123_0[arg_123_0.ref] == nil then
      var_123_0[arg_123_0.ref] = arg_123_0.value

      var_0_45.element.override(arg_123_0, var_0_46[arg_123_0.ref].__ovr_v)
    end
  elseif var_123_0[arg_123_0.ref] then
    var_0_45.element.set(arg_123_0, var_123_0[arg_123_0.ref])

    var_123_0[arg_123_0.ref] = nil
  end
end

var_0_48 = {
  elements = {},
  list = {}
}
var_0_43.plist = var_0_49.group("PLAYERS", "Adjustments")
var_0_43.plist.__plist = true

local var_0_63 = 0
local var_0_64 = {
  list = var_0_43.reference("PLAYERS", "Players", "Player list"),
  reset = var_0_43.reference("PLAYERS", "Players", "Reset all"),
  apply = var_0_43.reference("PLAYERS", "Adjustments", "Apply to all")
}
local var_0_65 = {}
local var_0_66 = {
  __metatable = false,
  __type = "ui_handler::player_slot",
  __tostring = function(arg_124_0)
    return var_0_31.format("ui_handler::player_slot[%d] of %s", arg_124_0.idx, var_0_45.element.__tostring(var_0_46[arg_124_0.ref].self))
  end,
  set = function(arg_125_0, ...)
    local var_125_0 = var_0_46[arg_125_0.ref]
    local var_125_1 = {
      ...
    }
    local var_125_2 = var_125_0.type == "color_picker"

    if var_125_2 then
      var_125_1 = var_0_53.unpack_color(...)
    end

    if arg_125_0.idx == var_0_63 then
      var_0_32.set(arg_125_0.ref, unpack(var_125_1))

      if var_125_2 then
        var_0_45.element.invoke(var_125_0.self)
      end
    else
      arg_125_0.value = var_125_2 and var_125_1 or unpack(var_125_1)
    end
  end,
  get = function(arg_126_0, arg_126_1)
    if arg_126_1 and var_0_46[arg_126_0.ref].type == "multiselect" then
      return var_0_29.qfind(arg_126_0.value, arg_126_1) ~= nil
    end

    if var_0_46[arg_126_0.ref].type ~= "color_picker" then
      return arg_126_0.value
    else
      return unpack(arg_126_0.value)
    end
  end
}

var_0_66.__index = var_0_66

function var_0_48.traverse(arg_127_0)
  for iter_127_0, iter_127_1 in ipairs(var_0_48.elements) do
    arg_127_0(iter_127_1)
  end
end

local var_0_67 = {
  select = function(arg_128_0)
    for iter_128_0, iter_128_1 in ipairs(var_0_48.elements) do
      var_0_45.element.set(iter_128_1, iter_128_1[arg_128_0].value)
    end
  end,
  add = function(arg_129_0)
    for iter_129_0, iter_129_1 in ipairs(var_0_48.elements) do
      local var_129_0 = var_0_35(var_0_46[iter_129_1.ref].__init ~= nil, var_0_46[iter_129_1.ref].__init, iter_129_1.value)

      iter_129_1[arg_129_0], var_0_48.list[arg_129_0] = setmetatable({
        ref = iter_129_1.ref,
        idx = arg_129_0,
        value = var_129_0
      }, var_0_66), true
    end
  end,
  remove = function(arg_130_0)
    for iter_130_0, iter_130_1 in ipairs(var_0_48.elements) do
      iter_130_1[arg_130_0], var_0_48.list[arg_130_0] = nil
    end
  end
}

function var_0_48.slot_update(arg_131_0)
  if arg_131_0[var_0_63] then
    arg_131_0[var_0_63].value = arg_131_0.value
  else
    var_0_67.add(var_0_63)
  end
end

local var_0_68 = false

function update(arg_132_0)
  var_0_63 = var_0_32.get(var_0_64.list.ref)

  local var_132_0 = entity.get_players()
  local var_132_1 = var_0_48.list
  local var_132_2 = entity.get_local_player()

  for iter_132_0, iter_132_1 in next, var_132_1 do
    if entity.get_classname(iter_132_0) ~= "CCSPlayer" then
      var_0_67.remove(iter_132_0)
    end
  end

  for iter_132_2, iter_132_3 in ipairs(var_132_0) do
    if iter_132_3 ~= var_132_2 and not var_0_48.list[iter_132_3] and entity.get_classname(iter_132_3) == "CCSPlayer" then
      var_0_67.add(iter_132_3)
    end
  end

  if not var_0_68 and not arg_132_0.value then
    for iter_132_4 = #var_132_0, 1, -1 do
      if var_132_0[iter_132_4] ~= var_132_2 then
        var_0_32.set(var_0_64.list.ref, var_132_0[iter_132_4])

        break
      end
    end

    var_0_33.update_player_list()

    var_0_68 = true
  else
    var_0_68 = false
  end

  var_0_67.select(var_0_63)
  var_0_33.fire_event("ui_handler::plist_update", var_0_63)
end

function var_0_69()
  update({})
  var_0_33.unset_event_callback("pre_render", var_0_69)
end

var_0_33.set_event_callback("pre_render", var_0_69)
var_0_45.element.set_callback(var_0_64.list, update, true)
var_0_33.set_event_callback("player_connect_full", update)
var_0_33.set_event_callback("player_disconnect", update)
var_0_33.set_event_callback("player_spawned", update)
var_0_33.set_event_callback("player_spawn", update)
var_0_33.set_event_callback("player_death", update)
var_0_33.set_event_callback("player_team", update)
var_0_45.element.set_callback(var_0_64.apply, function()
  var_0_48.traverse(function(arg_135_0)
    for iter_135_0, iter_135_1 in next, var_0_48.list do
      arg_135_0[iter_135_0].value = arg_135_0[var_0_63].value
    end
  end)
end)
var_0_45.element.set_callback(var_0_64.reset, function()
  var_0_48.traverse(function(arg_137_0)
    for iter_137_0, iter_137_1 in next, var_0_48.list do
      if iter_137_0 == var_0_63 then
        var_0_66.set(arg_137_0[iter_137_0], var_0_46[arg_137_0.ref].__init)
      else
        arg_137_0[iter_137_0].value = var_0_46[arg_137_0.ref].__init
      end
    end
  end)
end)

local var_0_70 = panorama.open()
local var_0_71 = var_0_70.MyPersonaAPI
local var_0_72 = var_0_70.LobbyAPI
local var_0_73 = var_0_70.PartyListAPI
local var_0_74 = var_0_70.SteamOverlayAPI
local var_0_75 = {}
local var_0_76 = {}
local var_0_77 = {}

var_0_76.database = {
  configs = "Downabout.asia"
}

function var_0_32.multiReference(arg_138_0, arg_138_1, arg_138_2)
  local var_138_0, var_138_1, var_138_2 = var_0_32.reference(arg_138_0, arg_138_1, arg_138_2)

  return {
    var_138_0,
    var_138_1,
    var_138_2
  }
end

local var_0_78 = var_0_33.unix_time()

function get_elapsed_time()
  local var_139_0 = var_0_33.unix_time() - var_0_78
  local var_139_1 = var_0_30.floor(var_139_0 / 3600)
  local var_139_2 = var_0_30.floor((var_139_0 - var_139_1 * 3600) / 60)
  local var_139_3 = var_0_30.floor(var_139_0 - var_139_1 * 3600 - var_139_2 * 60)

  return var_0_31.format("%02d:%02d:%02d", var_139_1, var_139_2, var_139_3)
end

local var_0_79 = var_0_43.group("aa", "anti-aimbot angles")
local var_0_80 = var_0_43.group("aa", "anti-aimbot angles")
local var_0_81 = var_0_43.group("aa", "fake lag")
local info = var_0_43.group("aa", "anti-aimbot angles")
local var_0_82 = var_0_43.group("aa", "other")
var_0_83 = {
  "Global\r",
  "Standing\r",
  "Walking\r",
  "Running\r",
  "Aerobic\r",
  "Aerobic+\r",
  "Crouch\r",
  "Crouch+\r",
  "Freestand\r",
  "Manuals\r"
}
var_0_84 = {
  " \nGlobal",
  " \nStanding",
  " \nWalking",
  " \nRunning",
  " \nAerobic",
  " \nAerobic+",
  " \nCrouch",
  " \nCrouch+",
  " \nFreestand",
  " \nManuals"
}
var_0_85 = {
  enabled = var_0_32.reference("AA", "Anti-aimbot angles", "Enabled"),
  yawbase = var_0_32.reference("AA", "Anti-aimbot angles", "Yaw base"),
  fsbodyyaw = var_0_32.reference("AA", "anti-aimbot angles", "Freestanding body yaw"),
  edgeyaw = var_0_32.reference("AA", "Anti-aimbot angles", "Edge yaw"),
  fakeduck = var_0_32.reference("RAGE", "Other", "Duck peek assist"),
  forcebaim = var_0_32.reference("RAGE", "Aimbot", "Force body aim"),
  safepoint = var_0_32.reference("RAGE", "Aimbot", "Force safe point"),
  roll = {
    var_0_32.reference("AA", "Anti-aimbot angles", "Roll")
  },
  clantag = var_0_32.reference("Misc", "Miscellaneous", "Clan tag spammer"),
  fov = var_0_32.reference("Misc", "Miscellaneous", "Override FOV"),
  zoom = var_0_32.reference("Misc", "Miscellaneous", "Override zoom FOV"),
  other_slowmotion = var_0_32.reference("AA", "Other", "Slow motion"),
  other_legmovement = var_0_32.reference("AA", "Other", "Leg movement"),
  other_osaa = var_0_32.reference("AA", "Other", "On shot anti-aim"),
  other_fkpeek = var_0_32.reference("AA", "Other", "Fake peek"),
  pitch = {
    var_0_32.reference("AA", "Anti-aimbot angles", "pitch")
  },
  rage = {
    var_0_32.reference("RAGE", "Aimbot", "Enabled")
  },
  yaw = {
    var_0_32.reference("AA", "Anti-aimbot angles", "Yaw")
  },
  yawjitter = {
    var_0_32.reference("AA", "Anti-aimbot angles", "Yaw jitter")
  },
  bodyyaw = {
    var_0_32.reference("AA", "Anti-aimbot angles", "Body yaw")
  },
  freestand = {
    var_0_32.reference("AA", "Anti-aimbot angles", "Freestanding")
  },
  os = {
    var_0_32.reference("AA", "Other", "On shot anti-aim")
  },
  slow = {
    var_0_32.reference("AA", "Other", "Slow motion")
  },
  dt = {
    var_0_32.reference("RAGE", "Aimbot", "Double tap")
  },
  minimum_damage_override = {
    var_0_32.reference("RAGE", "Aimbot", "Minimum damage override")
  },
  autopeek = {
    var_0_32.reference("RAGE", "Other", "Quick peek assist")
  },
  spread = var_0_32.reference("Rage", "Other", "Log misses due to spread"),
  fakelag_enable = var_0_32.reference("AA", "Fake lag", "Enabled"),
  ThirdPerson_Ref = {
    var_0_32.reference("Visuals", "Effects", "Force third person (alive)")
  },
  scope_overlay = var_0_32.reference("VISUALS", "Effects", "Remove scope overlay"),
  gs_ind = var_0_32.reference("VISUALS", "Other ESP", "Feature indicators"),
}
var_0_86 = {
  legMovement = var_0_32.multiReference("AA", "Other", "Leg movement"),
  slowmotion = var_0_32.multiReference("AA", "Other", "Slow motion"),
  OSAAA = var_0_32.multiReference("AA", "Other", "On shot anti-aim"),
  AAfake = var_0_32.multiReference("AA", "Other", "Fake peek")
}
var_0_87 = {
  flenabled = {
    var_0_32.reference("AA", "Fake lag", "Enabled")
  },
  fakelag_amount = var_0_32.reference("AA", "Fake lag", "Amount"),
  fakelag_limit = var_0_32.reference("AA", "Fake lag", "Limit"),
  fakelag_variance = var_0_32.reference("AA", "Fake lag", "Variance")
}

var_0_32.set(var_0_85.enabled, true)

var_0_88 = {
  main = {
    label = var_0_81:label("\v☸️\rDownabout.asia"),
    tab = var_0_81:combobox("\nDownabout.asia  /  Build", {
      "Information",
      "Ragebot Features",
      "Anti-aim",
      "Miscellaneous",
      "Configuration"
    })
  },
  information = {
    label = var_0_81:label(" "),
    build = var_0_81:label("\v☃️\rBuild: \v" .. var_0_18.build),
    time = var_0_81:label("\v☕\rSession Time: "),
    buttonsd = var_0_82:button("\v☣️\rDownabout\r.asia", function()
      var_0_74.OpenExternalBrowserURL("https://Leaks.s7ae.cc/res/rick.mp4")
    end),
    buttonds = var_0_82:button("\v☆\rDiscord\r.gg", function()
      var_0_74.OpenExternalBrowserURL("https://Leaks.s7ae.cc/res/rick.mp4")
    end),
    text1 = info:label("\v☮️\rDownabout.asia User Details"),
    text2 = info:label(" "),
    text3 = info:label("\v☮️\rLast Update: 26/02/12"),
    text4 = info:label("\v☮️\r"),
    text5 = info:label("\v☮️\rQq Group:171089983"),
    text6 = info:label(" "),
    text7 = info:label("\v☮️\rDescription:\vAdvanced anti-aim script"),

  },
  ragebotfeatures = {
    label1 = var_0_79:label("\v☄️Main Settings\nRage"),
    dt = var_0_79:checkbox("\v☄️\rDoubletap Fix"),
    target = var_0_79:checkbox("\v☄️\rActive Target"),
    Jumpstop = var_0_79:checkbox("\v☄️\rJumpstop"),
    Jumpstop_hotkey = var_0_79:hotkey("Jumpstop", true),
    Jumpstop_distance = var_0_79:slider("\nJumpStop Distance", 0, 2000, 1000, true, "u", 1),
    resolve = var_0_79:checkbox("\v☄️\rResolve Desync"),
    dormant_switch = var_0_79:checkbox("\v❄\rDormant \vaimbot"),
    dormant_key = var_0_79:hotkey("\v❄\rDormant \vaimbot", true),
    dormant_mindmg = var_0_79:slider("\v❄\rDormant min\vimum damage", 0, 100, 10, true),
    dormant_indicator = var_0_79:checkbox("\v❄\rDormant \vindicator"),
    ai = var_0_82:label("\v☄️\rArtificial Intelligence"),
    aipeek = var_0_82:checkbox("\v☄️\rIntelligence Peek"),
    aipeek_hotkey = var_0_82:hotkey("\v☄️\rIntelligence Peek", true),
    aipeek_render = var_0_82:checkbox("\v☄️\rDraw render zone", true),
    label = var_0_82:combobox("\nModeaip", {
      "Offensive",
      "Defensive"
    })
  },
  antiaim = {
    condition = var_0_79:combobox("\v☂️\rAnti-aim\r conditions", var_0_83),
    tab = var_0_81:combobox("\v☂️\rAnti-aim\r system", {
      "Builder",
      "Features"
    }),
    yaw_base = var_0_79:combobox("\v❄️\rYaw \vBase", {
      "Local view",
      "At targets"
    }),
    features = var_0_79:multiselect("\v⚽\rFeatures", {
      "Safe head",
      "Onshot AA Fix",
      "Anti Bruteforce",
      "Warmup AA",
      "Avoid Backstab"
    }),
    safe = var_0_79:multiselect("Safe head overrides", {
      "Knife on Air + Duck",
      "Taser on Air + Duck",
      "High distance"
    }),
    brute_mode = var_0_79:combobox("Anti Bruteforce", {
      "Adaptive",
      "Decrease",
      "Increase"
    }),
    yaw_direction = var_0_79:multiselect("\v⛽\rYaw \vdirections", {
      "Freestand",
      "Manuals"
    }),
    freestand_settings = var_0_79:combobox("Freestand settings", {
      "Default",
      "Static",
      "Jitter"
    }),
    freestand_hotkey = var_0_79:hotkey("Freestand settings", true),
    manuals_settings = var_0_79:combobox("Manuals settings", {
      "Default",
      "Static",
      "Jitter"
    }),
    manuals_left = var_0_79:hotkey("Manual Left"),
    manuals_right = var_0_79:hotkey("Manual Right"),
    manuals_forward = var_0_79:hotkey("Manual Forward"),
    manuals_reset = var_0_79:hotkey("Manual Reset"),
    enabled = var_0_82:checkbox("Enabled"),
    amount = var_0_82:combobox("Amount", {
      "Dynamic",
      "Maximum",
      "Fluctuate"
    }),
    variance = var_0_82:slider("Variance", 0, 100, 0, true, "%", 1),
    limit = var_0_82:slider("Limit", 1, 15, 1, true, "", 1)
  },
  Miscellaneous = {
    tab = var_0_81:combobox("\vSettings\r system", {
      "Misc",
      "Visuals",
      "Other"
    }),
    aim_label = var_0_79:label("\v⚙\rAimbot \vSettings"),
    aimbot = var_0_79:checkbox("\v⚙\rAimbot \vLogs"),
    aimbot_hit = var_0_79:color_picker("hit", 255, 255, 255),
    aimbot_miss = var_0_79:color_picker("miss", 255, 255, 255),
    aimbot_screen = var_0_79:checkbox("\v⚙\rScreen \vLogs"),
    statistic = var_0_79:checkbox("Hit/Miss"),
    aim_label2 = var_0_79:label(" "),
    accf_label = var_0_79:label("\v⚡\rHelpful \vSettings"),
    edge = var_0_79:checkbox("\v⚡\rEdge \vyaw \aFFFFFF2F[fakeduck]"),
    quick_switch = var_0_79:checkbox("\v⚡\rQuick \vswitch"),
    fast_ladder = var_0_79:checkbox("\v⚡\rFast \vladder"),
    zoom_anim = var_0_79:checkbox("\v✈️\rAnimate zoom FOV"),
    cam_anim = var_0_79:multiselect("Animate camera", {
      "X",
      "Y",
      "Z",
      "Pitch",
      "Yaw"
    }),
    filter_console = var_0_79:checkbox("\v☦️\rFilter \vConsole"),
    clantags = var_0_79:checkbox("\v⚙\rClan \vtag"),
    Chat_spammer = var_0_79:checkbox("\v⚙\rTrash \vTalking"),
    Chat_spammer_type = var_0_79:combobox("\nTalking type", {
      "Downabout.asia",
      "1"
    }),
    sharelogo = var_0_79:checkbox("\v©️\rShare \vLogos"),
    movement_keys_only = var_0_79:checkbox('\v✈\rStrafe \vFix'),
    accf_label2 = var_0_79:label(" "),
    animb_label = var_0_79:label("\v⚙\rAnimation breakers"),
    animation = var_0_79:checkbox("\v⚙Enable\nanimbrke"),
    typebr = var_0_79:combobox("Breaking on", {
      "Never slide",
      "Always slide"
    }),
    m_elements = var_0_79:multiselect("Elements", {
      "Leg breaker",
      "Quick peek assist",
      "Adjust body lean",
      "Slide elements",
      "Reset pitch on land",
      "Break legs while in air",
      "Break legs while landing",
      "Earthquake"
    }),
    slide_elements = var_0_79:multiselect("Sliding elements", {
      "While walking",
      "While running",
      "While crouching"
    }),
    break_land_value = var_0_79:slider("Breakable land value", 0, 10, 5, true, "%", 0.1, {
      [0] = "Slowest",
      [10] = "Force",
      [5] = "Fastest"
    }),
    air_element = var_0_79:slider("Air elements", 0, 100, 0, true, "%", 0.01, {
      [0] = "Disabled",
      [75] = "High",
      [50] = "Medium",
      [100] = "Force",
      [35] = "Small"
    }),
    body_lean_value = var_0_79:slider("Body lean value", 0, 100, 0, true, "%", 0.01, {
      [0] = "Disabled",
      [75] = "High",
      [50] = "Medium",
      [100] = "Extreme",
      [35] = "Small"
    }),
    label_1_1_1 = var_0_82:label("\vEarthquake"),
    state = var_0_82:multiselect("Statement\nanimbr", {
      "While in air",
      "While landing",
      "Adjust body lean"
    }),
    speedearth = var_0_82:slider("Speed\nanimbr", 2, 10, 10),
    world_label = var_0_79:label("\vWorld Settings"),
    third_person = var_0_79:checkbox("Third person"),
    third_person_slider = var_0_79:slider("\nDistance", 0, 250, 100),
    aspect_ratio = var_0_79:checkbox("Force aspect ratio"),
    aspect_ratio_slider = var_0_79:slider("\nAmount", 0, 200, 0, true, " ", 0.01, function(arg_142_0)
      if arg_142_0 == 0 then
        return "Off"
      end
    end),
    world_label2 = var_0_79:label(" "),
    view_label = var_0_79:label("\vViewmodel Settings"),
    viewinsc = var_0_79:checkbox("Force viewmodel in scope"),
    viewchange = var_0_79:checkbox("Change viewmodel in scope"),
    viewmodel = var_0_79:checkbox("Viewmodel"),
    CS_S = var_0_79:checkbox("CS:S Animation"),
    vS = var_0_79:slider("Viewmodel FOV", 0, 170, 68, true, " ", 1),
    xS = var_0_79:slider("Viewmodel X", -250, 250, 0, true, " ", 0.1),
    yS = var_0_79:slider("Viewmodel Y", -250, 250, 0, true, " ", 0.1),
    zS = var_0_79:slider("Viewmodel Z", -250, 250, 0, true, " ", 0.1),
    scope_label = var_0_82:label("\vScope Settings"),
    scope_crosshair = var_0_82:checkbox("Crosshair in scope"),
    scope_overlay = var_0_82:checkbox("Scope Overlay"),
    scope_disablers = var_0_82:multiselect("Disabler", {
      "Left",
      "Right",
      "Bottom",
      "Top"
    }),
    scope_color = var_0_82:color_picker("so", 255, 255, 255),
    scope_size = var_0_82:slider("Size", 0, 500, 190),
    scope_gap = var_0_82:slider("Gap", 0, 500, 15),
    scope_animation = var_0_82:multiselect("Animations\nscoverl", {
      "Alpha",
      "Overlay"
    }),
    global_vis = var_0_79:label("\vGlobal Settings"),
    accent_label = var_0_79:label("Accent color"),
    accent_color = var_0_79:color_picker("aclr", 255, 255, 255),
    dpi_on = var_0_79:checkbox("DPI Scaling"),
    dpi_label = var_0_79:label(" "),
    visuals_select = var_0_79:combobox("\v⚙\rMain \vSelection", {
      "Screen logs",
      "Feature indicators",
      "Watermark",
      "Crosshair indicator",
      "Damage indicator",
      "Arrows"
    }),
    visuals_select_ = var_0_79:label(" "),
    aimbot_label = var_0_79:label("\vScreen \rlogs"),
    aimbot_label2 = var_0_79:label("Enable \vAimbot Logs\r [\vMisc\r -> \vAimbot Settings\r]"),
    aimbot_label3 = var_0_79:label("Enable \vScreen Logs\r [\vMisc\r -> \vAimbot Settings\r]"),
    aimbot_on = var_0_79:multiselect("Log when", {
      "Hit",
      "Miss"
    }),
    aimbot_com = var_0_79:multiselect("Additions", {
      "Prefix",
      "Miss reason",
      "Damage value"
    }),
    aimbot_rect = var_0_79:slider("Rect round", 2, 12, 4),
    aimbot_glow = var_0_79:checkbox("Enable glow"),
    custom_ind_gs_label = var_0_79:label("\vFeature indicators"),
    custom_ind_gs = var_0_79:checkbox("Enable animations\nfeature"),
    custom_ind_gs_color = var_0_79:checkbox("Enable custom color"),
    custom_ind_gs_colorcp = var_0_79:color_picker("cgsc", 255, 255, 255),
    custom_ind_gs_icon = var_0_79:checkbox("Add feature icons"),
    custom_ind_gs_size = var_0_79:slider("Adding to y", 6, 12, 12),
    custom_ind_gs_rect1 = var_0_79:slider("Weight size", 0, 15, 0),
    custom_ind_gs_rect = var_0_79:slider("Height size", 0, 4, 0),
    custom_ind_gs_back = var_0_79:slider("Background alpha", 25, 155, 50),
    watermark_label = var_0_79:label("\vWatermark"),
    watermark_mode = var_0_79:combobox("\nMode", {
      "Small",
      "Verdana",
      "Bold",
      "Calibri"
    }),
    watermark_color_mode = var_0_79:combobox("\nColor", {
      "Static",
      "Gradient",
      "Rainbow"
    }),
    watermark_color = var_0_79:color_picker("wc", 255, 255, 255),
    watermark_name = var_0_79:textbox("\nadwad"),
    arrows_label = var_0_79:label("\vArrows"),
    arrows = var_0_79:checkbox("Enable\narrows"),
    arrows_color = var_0_79:color_picker("ac", 255, 255, 255),
    arrows_type = var_0_79:combobox("\nType arrows", {
      "⪦ ⪧",
      "≺ ≻",
      "◀ ▶",
      "◁ ▷",
      "❮ ❯",
      "❰ ❱",
      "❬ ❭",
      "⏴ ⏵",
      "⊂ ⊃",
      "⪪ ⪫",
      "⩹ ⩺"
    }),
    arrows_scope = var_0_79:multiselect("On scope", {
      "Alpha",
      "Level"
    }),
    damage_label = var_0_79:label("\vDamage indicator"),
    damage_ind = var_0_79:checkbox("Enable\ndamageind"),
    damage_color = var_0_79:color_picker("dc", 255, 255, 255),
    damage_anim = var_0_79:checkbox("Disable animation\ndamageind"),
    damage_select = var_0_79:combobox("Font", {
      "Small",
      "Verdana",
      "Bold"
    }),
    crosshair_label = var_0_79:label("\vCrosshair indicator"),
    crosshair = var_0_79:checkbox("Enable\ncri"),
    crosshair_color = var_0_79:color_picker("ci", 255, 255, 255),
    crosshair_select = var_0_79:multiselect("Statements", {
      "Glow module",
      "Desync",
      "Build",
      "State",
      "Double tap",
      "Onshot anti-aim",
      "Body aim",
      "Safe point",
      "Duck peek assist",
      "Minimum damage override",
      "Freestanding"
    }),
    crosshair_y = var_0_79:slider("Position y", -80, 80, 25),
    crosshair_label2 = var_0_79:label(" "),
    other_label = var_0_79:label("\vOther\nvisuals"),
    velocity = var_0_79:checkbox("\v☾\rVelocity \vIndicator"),
    velocity_color = var_0_79:color_picker("vc", 255, 255, 255),
    defensive = var_0_79:checkbox("\v☁️\rDefensive \vindicator"),
    defensive_color = var_0_79:color_picker("dc", 255, 255, 255),
    hitmark_enable = var_0_79:checkbox("\v❤\rWorld \vHitmarker"),
    hitmark_color = var_0_79:color_picker("World Hitmarker Color", 105, 200, 255, 255),
    output_label = var_0_82:label("\vOutput logs"),
    output_font = var_0_82:combobox("Font", {
      "Small",
      "Verdana",
      "Bold"
    }),
    output_anim = var_0_82:checkbox("Enable animations"),
    output_back = var_0_82:checkbox("Background"),
    output_x = var_0_82:slider("Start x\noutput", 0, 10, 10),
    output_y = var_0_82:slider("Start y\noutput", 0, 10, 10)
  },
  config = {
    lines21 = var_0_79:label("\vConfigurations \rSettings"),
    list_box = var_0_79:listbox("Config", "", false),
    name = var_0_80:textbox("Config name", "", false),
    buttom_load = var_0_80:button("\v⭳ \rLoad"),
    buttom_create = var_0_80:button("\v⭱ \rSave"),
    buttom_delete = var_0_80:button("\v⮌ \rDelete"),
    buttom_import = var_0_80:button("\v⮅ \rImport"),
    buttom_export = var_0_80:button("\v⮃ \rExport")
  }
}

function traverse_table_on(arg_143_0, arg_143_1)
  arg_143_1 = arg_143_1 or ""

  local var_143_0 = {
    {
      arg_143_0,
      arg_143_1
    }
  }

  while #var_143_0 > 0 do
    local var_143_1 = var_0_29.remove(var_143_0)
    local var_143_2 = var_143_1[1]
    local var_143_3 = var_143_1[2]

    for iter_143_0, iter_143_1 in pairs(var_143_2) do
      local var_143_4 = var_143_3 .. iter_143_0

      if type(iter_143_1) == "table" then
        var_0_29.insert(var_143_0, {
          iter_143_1,
          var_143_4 .. "."
        })
      else
        var_0_32.set_visible(iter_143_1, true)
      end
    end
  end
end

function traverse_table(arg_144_0, arg_144_1)
  arg_144_1 = arg_144_1 or ""

  local var_144_0 = {
    {
      arg_144_0,
      arg_144_1
    }
  }

  while #var_144_0 > 0 do
    local var_144_1 = var_0_29.remove(var_144_0)
    local var_144_2 = var_144_1[1]
    local var_144_3 = var_144_1[2]

    for iter_144_0, iter_144_1 in pairs(var_144_2) do
      local var_144_4 = var_144_3 .. iter_144_0

      if type(iter_144_1) == "table" then
        var_0_29.insert(var_144_0, {
          iter_144_1,
          var_144_4 .. "."
        })
      else
        var_0_32.set_visible(iter_144_1, false)
      end
    end
  end
end

local var_0_89 = {
  var_0_88.main.tab,
  "Information"
}
local var_0_90 = {
  var_0_88.main.tab,
  "Ragebot Features"
}
local var_0_91 = {
  var_0_88.main.tab,
  "Anti-aim"
}
local var_0_92 = {
  var_0_88.main.tab,
  "Miscellaneous"
}
local var_0_93 = {
  var_0_88.Miscellaneous.tab,
  "Misc"
}
local var_0_94 = {
  var_0_88.Miscellaneous.tab,
  "Visuals"
}
local var_0_95 = {
  var_0_88.main.tab,
  "Configuration"
}
local var_0_96 = {
  var_0_88.antiaim.tab,
  "Builder"
}
local var_0_97 = {
  var_0_88.antiaim.tab,
  "Features"
}
local var_0_98 = {
  var_0_88.Miscellaneous.tab,
  "Other"
}

var_0_88.information.text1:depend(var_0_89)
var_0_88.information.text2:depend(var_0_89)
var_0_88.information.text3:depend(var_0_89)
var_0_88.information.text4:depend(var_0_89)
var_0_88.information.text5:depend(var_0_89)
var_0_88.information.text6:depend(var_0_89)
var_0_88.information.text7:depend(var_0_89)
var_0_88.information.label:depend(var_0_89)
var_0_88.information.build:depend(var_0_89)
var_0_88.information.time:depend(var_0_89)
var_0_88.information.buttonsd:depend(var_0_89)
var_0_88.information.buttonds:depend(var_0_89)
var_0_88.ragebotfeatures.label1:depend(var_0_90)
var_0_88.ragebotfeatures.target:depend(var_0_90)
var_0_88.ragebotfeatures.resolve:depend(var_0_90)
var_0_88.ragebotfeatures.dormant_switch:depend(var_0_90)
var_0_88.ragebotfeatures.dormant_mindmg:depend(var_0_90)
var_0_88.ragebotfeatures.dormant_key:depend(var_0_90)
var_0_88.ragebotfeatures.dormant_indicator:depend(var_0_90)
var_0_88.ragebotfeatures.Jumpstop:depend(var_0_90)
var_0_88.ragebotfeatures.Jumpstop_hotkey:depend(var_0_90, {
  var_0_88.ragebotfeatures.Jumpstop,
  true
})
var_0_88.ragebotfeatures.Jumpstop_distance:depend(var_0_90, {
  var_0_88.ragebotfeatures.Jumpstop,
  true
})
var_0_88.ragebotfeatures.ai:depend(var_0_90)
var_0_88.ragebotfeatures.aipeek:depend(var_0_90)
var_0_88.ragebotfeatures.aipeek_hotkey:depend(var_0_90, {
  var_0_88.ragebotfeatures.aipeek,
  true
})
var_0_88.ragebotfeatures.label:depend(var_0_90, {
  var_0_88.ragebotfeatures.aipeek,
  true
})
var_0_88.ragebotfeatures.aipeek_render:depend(var_0_90, {
  var_0_88.ragebotfeatures.aipeek,
  true
})
var_0_88.ragebotfeatures.dt:depend(var_0_90)
var_0_88.antiaim.condition:depend(var_0_91, var_0_96)
var_0_88.antiaim.tab:depend(var_0_91)
var_0_88.antiaim.enabled:depend(var_0_91, var_0_97)
var_0_88.antiaim.variance:depend(var_0_91, var_0_97)
var_0_88.antiaim.limit:depend(var_0_91, var_0_97)
var_0_88.antiaim.amount:depend(var_0_91, var_0_97)
var_0_88.antiaim.yaw_base:depend(var_0_91, var_0_97)
var_0_88.antiaim.features:depend(var_0_91, var_0_97)
var_0_88.antiaim.safe:depend(var_0_91, {
  var_0_88.antiaim.features,
  "Safe head"
}, var_0_97)
var_0_88.antiaim.yaw_direction:depend(var_0_91, var_0_97)
var_0_88.antiaim.manuals_settings:depend(var_0_91, {
  var_0_88.antiaim.yaw_direction,
  "Manuals"
}, var_0_97)
var_0_88.antiaim.freestand_settings:depend(var_0_91, {
  var_0_88.antiaim.yaw_direction,
  "Freestand"
}, var_0_97)
var_0_88.antiaim.freestand_hotkey:depend(var_0_91, {
  var_0_88.antiaim.yaw_direction,
  "Freestand"
}, var_0_97)
var_0_88.antiaim.manuals_left:depend(var_0_91, {
  var_0_88.antiaim.yaw_direction,
  "Manuals"
}, var_0_97)
var_0_88.antiaim.manuals_right:depend(var_0_91, {
  var_0_88.antiaim.yaw_direction,
  "Manuals"
}, var_0_97)
var_0_88.antiaim.manuals_forward:depend(var_0_91, {
  var_0_88.antiaim.yaw_direction,
  "Manuals"
}, var_0_97)
var_0_88.antiaim.manuals_reset:depend(var_0_91, {
  var_0_88.antiaim.yaw_direction,
  "Manuals"
}, var_0_97)
var_0_88.antiaim.brute_mode:depend(var_0_91, var_0_97, {
  var_0_88.antiaim.features,
  "Anti Bruteforce"
})
var_0_88.Miscellaneous.tab:depend(var_0_92)
var_0_88.Miscellaneous.animb_label:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.accf_label:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.accf_label2:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.aim_label:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.aim_label2:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.aimbot:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.aimbot_screen:depend(var_0_92, var_0_93, {
  var_0_88.Miscellaneous.aimbot,
  true
})
var_0_88.Miscellaneous.aimbot_label:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.aimbot,
  true
}, {
  var_0_88.Miscellaneous.aimbot_screen,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Screen logs"
})
var_0_88.Miscellaneous.aimbot_label2:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.aimbot,
  false
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Screen logs"
})
var_0_88.Miscellaneous.aimbot_label3:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.aimbot,
  true
}, {
  var_0_88.Miscellaneous.aimbot_screen,
  false
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Screen logs"
})
var_0_88.Miscellaneous.aimbot_rect:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.aimbot,
  true
}, {
  var_0_88.Miscellaneous.aimbot_screen,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Screen logs"
})
var_0_88.Miscellaneous.aimbot_on:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.aimbot,
  true
}, {
  var_0_88.Miscellaneous.aimbot_screen,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Screen logs"
})
var_0_88.Miscellaneous.aimbot_com:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.aimbot,
  true
}, {
  var_0_88.Miscellaneous.aimbot_screen,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Screen logs"
})
var_0_88.Miscellaneous.aimbot_glow:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.aimbot,
  true
}, {
  var_0_88.Miscellaneous.aimbot_screen,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Screen logs"
})
var_0_88.Miscellaneous.aimbot_hit:depend(var_0_92, var_0_93, {
  var_0_88.Miscellaneous.aimbot,
  true
})
var_0_88.Miscellaneous.aimbot_miss:depend(var_0_92, var_0_93, {
  var_0_88.Miscellaneous.aimbot,
  true
})
var_0_88.Miscellaneous.statistic:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.filter_console:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.clantags:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.Chat_spammer:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.Chat_spammer_type:depend(var_0_92, var_0_93, {
  var_0_88.Miscellaneous.Chat_spammer,
  true
})
var_0_88.Miscellaneous.sharelogo:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.hitmark_enable:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.hitmark_color:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.movement_keys_only:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.edge:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.fast_ladder:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.zoom_anim:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.cam_anim:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.quick_switch:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.animation:depend(var_0_92, var_0_93)
var_0_88.Miscellaneous.typebr:depend(var_0_92, var_0_93, {
  var_0_88.Miscellaneous.animation,
  true
})
var_0_88.Miscellaneous.m_elements:depend(var_0_92, var_0_93, {
  var_0_88.Miscellaneous.animation,
  true
})
var_0_88.Miscellaneous.slide_elements:depend(var_0_92, var_0_93, {
  var_0_88.Miscellaneous.animation,
  true
}, {
  var_0_88.Miscellaneous.m_elements,
  "Slide elements"
})
var_0_88.Miscellaneous.break_land_value:depend(var_0_92, var_0_93, {
  var_0_88.Miscellaneous.animation,
  true
}, {
  var_0_88.Miscellaneous.m_elements,
  "Break legs while landing"
})
var_0_88.Miscellaneous.air_element:depend(var_0_92, var_0_93, {
  var_0_88.Miscellaneous.animation,
  true
}, {
  var_0_88.Miscellaneous.m_elements,
  "Break legs while in air"
})
var_0_88.Miscellaneous.body_lean_value:depend(var_0_92, var_0_93, {
  var_0_88.Miscellaneous.animation,
  true
}, {
  var_0_88.Miscellaneous.m_elements,
  "Adjust body lean"
})
var_0_88.Miscellaneous.label_1_1_1:depend(var_0_92, var_0_93, {
  var_0_88.Miscellaneous.animation,
  true
}, {
  var_0_88.Miscellaneous.m_elements,
  "Earthquake"
})
var_0_88.Miscellaneous.state:depend(var_0_92, var_0_93, {
  var_0_88.Miscellaneous.animation,
  true
}, {
  var_0_88.Miscellaneous.m_elements,
  "Earthquake"
})
var_0_88.Miscellaneous.speedearth:depend(var_0_92, var_0_93, {
  var_0_88.Miscellaneous.animation,
  true
}, {
  var_0_88.Miscellaneous.m_elements,
  "Earthquake"
})
var_0_88.Miscellaneous.world_label:depend(var_0_92, var_0_98)
var_0_88.Miscellaneous.world_label2:depend(var_0_92, var_0_98)
var_0_88.Miscellaneous.view_label:depend(var_0_92, var_0_98)
var_0_88.Miscellaneous.scope_label:depend(var_0_92, var_0_98)
var_0_88.Miscellaneous.third_person:depend(var_0_92, var_0_98)
var_0_88.Miscellaneous.third_person_slider:depend(var_0_92, var_0_98, {
  var_0_88.Miscellaneous.third_person,
  true
})
var_0_88.Miscellaneous.aspect_ratio:depend(var_0_92, var_0_98)
var_0_88.Miscellaneous.aspect_ratio_slider:depend(var_0_92, var_0_98, {
  var_0_88.Miscellaneous.aspect_ratio,
  true
})
var_0_88.Miscellaneous.viewmodel:depend(var_0_92, var_0_98)
var_0_88.Miscellaneous.viewinsc:depend(var_0_92, var_0_98)
var_0_88.Miscellaneous.viewchange:depend(var_0_92, var_0_98, {
  var_0_88.Miscellaneous.viewinsc,
  true
})
var_0_88.Miscellaneous.CS_S:depend(var_0_92, var_0_98, {
  var_0_88.Miscellaneous.viewmodel,
  true
})
var_0_88.Miscellaneous.vS:depend(var_0_92, var_0_98, {
  var_0_88.Miscellaneous.viewmodel,
  true
})
var_0_88.Miscellaneous.xS:depend(var_0_92, var_0_98, {
  var_0_88.Miscellaneous.viewmodel,
  true
})
var_0_88.Miscellaneous.yS:depend(var_0_92, var_0_98, {
  var_0_88.Miscellaneous.viewmodel,
  true
})
var_0_88.Miscellaneous.zS:depend(var_0_92, var_0_98, {
  var_0_88.Miscellaneous.viewmodel,
  true
})
var_0_88.Miscellaneous.scope_overlay:depend(var_0_92, var_0_98)
var_0_88.Miscellaneous.scope_crosshair:depend(var_0_92, var_0_98)
var_0_88.Miscellaneous.scope_disablers:depend(var_0_92, var_0_98, {
  var_0_88.Miscellaneous.scope_overlay,
  true
})
var_0_88.Miscellaneous.scope_gap:depend(var_0_92, var_0_98, {
  var_0_88.Miscellaneous.scope_overlay,
  true
})
var_0_88.Miscellaneous.scope_size:depend(var_0_92, var_0_98, {
  var_0_88.Miscellaneous.scope_overlay,
  true
})
var_0_88.Miscellaneous.scope_animation:depend(var_0_92, var_0_98, {
  var_0_88.Miscellaneous.scope_overlay,
  true
})
var_0_88.Miscellaneous.scope_color:depend(var_0_92, var_0_98, {
  var_0_88.Miscellaneous.scope_overlay,
  true
})
var_0_88.Miscellaneous.global_vis:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.accent_color:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.accent_label:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.dpi_on:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.dpi_label:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.velocity:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.velocity_color:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.velocity,
  true
})
var_0_88.Miscellaneous.defensive:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.defensive_color:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.defensive,
  true
})
var_0_88.Miscellaneous.output_label:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.output_x:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.output_y:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.output_anim:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.output_back:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.output_font:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.output_font:set("Bold")
var_0_88.Miscellaneous.damage_select:set("Verdana")
var_0_88.Miscellaneous.crosshair_label2:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.other_label:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.visuals_select:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.visuals_select_:depend(var_0_92, var_0_94)
var_0_88.Miscellaneous.damage_label:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Damage indicator"
})
var_0_88.Miscellaneous.damage_ind:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Damage indicator"
})
var_0_88.Miscellaneous.damage_anim:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.damage_ind,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Damage indicator"
})
var_0_88.Miscellaneous.damage_color:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.damage_ind,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Damage indicator"
})
var_0_88.Miscellaneous.damage_select:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.damage_ind,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Damage indicator"
})
var_0_88.Miscellaneous.arrows_label:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Arrows"
})
var_0_88.Miscellaneous.arrows:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Arrows"
})
var_0_88.Miscellaneous.arrows_type:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.arrows,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Arrows"
})
var_0_88.Miscellaneous.arrows_scope:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.arrows,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Arrows"
})
var_0_88.Miscellaneous.arrows_color:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.arrows,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Arrows"
})
var_0_88.Miscellaneous.crosshair_label:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Crosshair indicator"
})
var_0_88.Miscellaneous.crosshair:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Crosshair indicator"
})
var_0_88.Miscellaneous.crosshair_color:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.crosshair,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Crosshair indicator"
})
var_0_88.Miscellaneous.crosshair_select:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.crosshair,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Crosshair indicator"
})
var_0_88.Miscellaneous.crosshair_y:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.crosshair,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Crosshair indicator"
})
var_0_88.Miscellaneous.custom_ind_gs_label:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Feature indicators"
})
var_0_88.Miscellaneous.custom_ind_gs:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Feature indicators"
})
var_0_88.Miscellaneous.custom_ind_gs_color:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Feature indicators"
})
var_0_88.Miscellaneous.custom_ind_gs_colorcp:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.custom_ind_gs_color,
  true
}, {
  var_0_88.Miscellaneous.visuals_select,
  "Feature indicators"
})
var_0_88.Miscellaneous.custom_ind_gs_size:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Feature indicators"
})
var_0_88.Miscellaneous.custom_ind_gs_rect1:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Feature indicators"
})
var_0_88.Miscellaneous.custom_ind_gs_rect:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Feature indicators"
})
var_0_88.Miscellaneous.custom_ind_gs_back:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Feature indicators"
})
var_0_88.Miscellaneous.custom_ind_gs_icon:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Feature indicators"
})
var_0_88.Miscellaneous.watermark_label:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Watermark"
})
var_0_88.Miscellaneous.watermark_mode:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Watermark"
})
var_0_88.Miscellaneous.watermark_color:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Watermark"
})
var_0_88.Miscellaneous.watermark_color_mode:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Watermark"
})
var_0_88.Miscellaneous.watermark_name:depend(var_0_92, var_0_94, {
  var_0_88.Miscellaneous.visuals_select,
  "Watermark"
})
var_0_88.config.lines21:depend(var_0_95)
var_0_88.config.list_box:depend(var_0_95)
var_0_88.config.name:depend(var_0_95)
var_0_88.config.buttom_create:depend(var_0_95)
var_0_88.config.buttom_load:depend(var_0_95)
var_0_88.config.buttom_delete:depend(var_0_95)
var_0_88.config.buttom_export:depend(var_0_95)
var_0_88.config.buttom_import:depend(var_0_95)

var_0_99 = {}

for iter_0_4 = 1, #var_0_83 do
  var_0_99[iter_0_4] = {
    label_ = var_0_79:label(" "),
    enable2 = var_0_79:checkbox("Enable ~ \v" .. var_0_83[iter_0_4]),
    label = var_0_79:label(" "),
    selection_ = var_0_79:combobox(" \v☄️Main Settings" .. var_0_84[iter_0_4], {
      "Yaw",
      "Desync",
      "Defensive"
    }),
    labelt = var_0_79:label(" "),
    mod_type2 = var_0_79:multiselect("\v✌️\rYaw \vmode" .. var_0_84[iter_0_4], {
      "Offset",
      "Spin",
      "Random"
    }),
    ofs_1 = var_0_79:slider(" Offset Amount #1" .. var_0_84[iter_0_4], -80, 80, 0, true, "°", 1),
    ofs_2 = var_0_79:slider(" Offset Amount #2" .. var_0_84[iter_0_4], -80, 80, 0, true, "°", 1),
    spna = var_0_79:slider(" Spin Amount" .. var_0_84[iter_0_4], 0, 80, 0, true, "°", 1),
    rana = var_0_79:slider(" Random Amount" .. var_0_84[iter_0_4], 0, 80, 0, true, "°", 1),
    body_yaw_type2 = var_0_79:combobox("\v☠️\rBody \vyaw" .. var_0_84[iter_0_4], {
      "Static",
      "Opposite",
      "Jitter"
    }),
    body_slider2 = var_0_79:slider("\n Body Yaw Amount" .. var_0_84[iter_0_4], -60, 60, 0, true, "°", 1),
    adaptive_def = var_0_79:checkbox(" Adaptive for defensive" .. var_0_84[iter_0_4]),
    enable = var_0_79:checkbox("\v☁️ \rEnable \vDefensive" .. var_0_84[iter_0_4]),
    force_lc = var_0_79:checkbox(" Force LC" .. var_0_84[iter_0_4]),
    pitch_type = var_0_79:combobox(" Pitch" .. var_0_84[iter_0_4], {
      "Off",
      "Static",
      "Jitter",
      "Spin",
      "Spin[MOD]",
      "Random",
      "Random Static",
      "Random Ticks"
    }),
    pitch_slider1 = var_0_79:slider(" Angle" .. var_0_84[iter_0_4], -89, 89, 0, true, "°", 1),
    pitch_slider = var_0_79:slider(" Angle 1" .. var_0_84[iter_0_4], -89, 89, 0, true, "°", 1),
    pitch_slider2 = var_0_79:slider(" Angle 2" .. var_0_84[iter_0_4], -89, 89, 0, true, "°", 1),
    pitch_spin = var_0_79:slider(" Angle 1" .. var_0_84[iter_0_4], -89, 89, 0, true, "°", 1),
    pitch_spin2 = var_0_79:slider(" Angle 2" .. var_0_84[iter_0_4], -89, 89, 0, true, "°", 1),
    pitch_spin_mod = var_0_79:slider(" Angle 1" .. var_0_84[iter_0_4], -89, 89, 0, true, "°", 1),
    pitch_spin2_mod = var_0_79:slider(" Angle 2" .. var_0_84[iter_0_4], -89, 89, 0, true, "°", 1),
    pitch_speed = var_0_79:slider(" Angle Speed" .. var_0_84[iter_0_4], -50, 50, 20, true, " ", 0.1),
    pitch_speed2 = var_0_79:slider(" Angle Speed" .. var_0_84[iter_0_4], -50, 50, 20, true, " ", 0.1),
    pitch_jitter = var_0_79:slider(" Angle 1" .. var_0_84[iter_0_4], -89, 89, 0, true, "°", 1),
    pitch_jitter2 = var_0_79:slider(" Angle 2" .. var_0_84[iter_0_4], -89, 89, 0, true, "°", 1),
    pitch_slider_static = var_0_79:slider(" Angle 1" .. var_0_84[iter_0_4], -89, 89, 0, true, "°", 1),
    pitch_slider2_static = var_0_79:slider(" Angle 2" .. var_0_84[iter_0_4], -89, 89, 0, true, "°", 1),
    pitch_slow_def = var_0_79:slider(" Speed" .. var_0_84[iter_0_4], 0, 10, 0, true, " ", 0.1),
    defense_aa_type = var_0_79:combobox(" Yaw" .. var_0_84[iter_0_4], {
      "Off",
      "Static",
      "Static [FS]",
      "Jitter",
      "Jitter[L/R]",
      "Skitter",
      "Spin",
      "Random",
      "3-way",
      "5-way"
    }),
    defensive_left = var_0_79:slider(" Yaw Left" .. var_0_84[iter_0_4], -180, 180, 0, true, "°", 1),
    defensive_right = var_0_79:slider(" Yaw Right" .. var_0_84[iter_0_4], -180, 180, 0, true, "°", 1),
    defense_aa_slider = var_0_79:slider(" Yaw Amount" .. var_0_84[iter_0_4], 0, 360, 0, true, "°", 1),
    defensive_random = var_0_79:slider(" Yaw Amount" .. var_0_84[iter_0_4], 0, 360, 0, true, "°", 1),
    defensive_jitter = var_0_79:slider(" Yaw Amount" .. var_0_84[iter_0_4], 0, 360, 0, true, "°", 1),
    defensive_jitter_speed = var_0_79:slider(" Speed Ticks" .. var_0_84[iter_0_4], 2, 14, 2, true, "t", 1, {
      [2] = " "
    }),
    defensive_spin = var_0_79:slider(" Yaw Amount" .. var_0_84[iter_0_4], 0, 360, 0, true, "°", 1),
    defensive_skitter = var_0_79:slider(" Yaw Amount" .. var_0_84[iter_0_4], 0, 360, 0, true, "°", 1),
    defensive_speed = var_0_79:slider(" Yaw Speed" .. var_0_84[iter_0_4], -50, 50, 20, true, " ", 0.1),
    jitter_speed2 = var_0_79:slider(" Yaw Speed" .. var_0_84[iter_0_4], 2, 14, 2, true, "t", 1, {
      [2] = " "
    }),
    adaptive_desync = var_0_79:checkbox(" Adaptive Desync" .. var_0_84[iter_0_4]),
    labelsli = var_0_79:label(" "),
    labelslin = var_0_79:label("\v Other Settings" .. var_0_84[iter_0_4]),
    yaw_delay2 = var_0_79:slider(" Delay ticks" .. var_0_84[iter_0_4], 1, 14, 1, true, "t", 1, {
      [1] = " "
    }),
    Random_delay = var_0_79:slider(" Randomize ticks" .. var_0_84[iter_0_4], 0, 14, 0, true, "t", 1, {
      [0] = " "
    }),
    hold_delay = var_0_79:slider(" Hold ticks" .. var_0_84[iter_0_4], 0, 14, 0, true, "t", 1, {
      [0] = " "
    })
  }
end

for iter_0_5 = 1, #var_0_83 do
  local var_0_100 = {
    var_0_88.antiaim.condition,
    function()
      return iter_0_5 ~= 1
    end
  }
  local var_0_101 = {
    var_0_88.antiaim.condition,
    var_0_83[iter_0_5]
  }
  local var_0_102 = {
    var_0_99[iter_0_5].enable2,
    function()
      if iter_0_5 == 1 then
        return true
      else
        return var_0_99[iter_0_5].enable2:get()
      end
    end
  }
  local var_0_103 = {
    var_0_88.main.tab,
    "Anti-aim"
  }
  local var_0_104 = {
    var_0_99[iter_0_5].body_yaw_type2,
    function()
      return var_0_99[iter_0_5].body_yaw_type2:get() == "Static" or var_0_99[iter_0_5].body_yaw_type2:get() == "Jitter"
    end
  }
  local var_0_105 = {
    var_0_99[iter_0_5].body_yaw_type2,
    function()
      return var_0_99[iter_0_5].body_yaw_type2:get() == "Jitter"
    end
  }
  local var_0_106 = {
    var_0_99[iter_0_5].selection_,
    function()
      return var_0_99[iter_0_5].selection_:get() == "Yaw"
    end
  }
  local var_0_107 = {
    var_0_99[iter_0_5].selection_,
    function()
      return var_0_99[iter_0_5].selection_:get() == "Desync"
    end
  }
  local var_0_108 = {
    var_0_99[iter_0_5].selection_,
    function()
      return var_0_99[iter_0_5].selection_:get() == "Defensive"
    end
  }
  local var_0_109 = {
    var_0_99[iter_0_5].enable,
    function()
      return var_0_99[iter_0_5].enable:get()
    end
  }
  local var_0_110 = {
    var_0_99[iter_0_5].pitch_type,
    function()
      return var_0_99[iter_0_5].pitch_type:get() == "Static"
    end
  }
  local var_0_111 = {
    var_0_99[iter_0_5].defense_aa_type,
    function()
      return var_0_99[iter_0_5].defense_aa_type:get() == "Spin"
    end
  }
  local var_0_112 = {
    var_0_99[iter_0_5].defense_aa_type,
    function()
      return var_0_99[iter_0_5].defense_aa_type:get() == "Jitter[L/R]"
    end
  }
  local var_0_113 = {
    var_0_99[iter_0_5].pitch_type,
    function()
      return var_0_99[iter_0_5].pitch_type:get() == "Jitter"
    end
  }
  local var_0_114 = {
    var_0_99[iter_0_5].pitch_type,
    function()
      return var_0_99[iter_0_5].pitch_type:get() == "Spin"
    end
  }
  local var_0_115 = {
    var_0_99[iter_0_5].pitch_type,
    function()
      return var_0_99[iter_0_5].pitch_type:get() == "Spin[MOD]"
    end
  }
  local var_0_116 = {
    var_0_99[iter_0_5].pitch_type,
    function()
      return var_0_99[iter_0_5].pitch_type:get() == "Random Static"
    end
  }
  local var_0_117 = {
    var_0_99[iter_0_5].pitch_type,
    function()
      return var_0_99[iter_0_5].pitch_type:get() == "Random"
    end
  }
  local var_0_118 = {
    var_0_99[iter_0_5].defense_aa_type,
    function()
      return var_0_99[iter_0_5].defense_aa_type:get() == "Static" or var_0_99[iter_0_5].defense_aa_type:get() == "Static [FS]"
    end
  }
  local var_0_119 = {
    var_0_99[iter_0_5].defense_aa_type,
    function()
      return var_0_99[iter_0_5].defense_aa_type:get() == "Jitter"
    end
  }
  local var_0_120 = {
    var_0_99[iter_0_5].defense_aa_type,
    function()
      return var_0_99[iter_0_5].defense_aa_type:get() == "Random"
    end
  }
  local var_0_121 = {
    var_0_99[iter_0_5].defense_aa_type,
    function()
      return var_0_99[iter_0_5].defense_aa_type:get() == "Skitter"
    end
  }
  local var_0_122 = {
    var_0_99[iter_0_5].defense_aa_type,
    function()
      return var_0_99[iter_0_5].defense_aa_type:get() ~= "Off"
    end
  }
  local var_0_123 = {
    var_0_99[iter_0_5].mod_type2,
    function()
      return var_0_99[iter_0_5].mod_type2:get("Spin")
    end
  }
  local var_0_124 = {
    var_0_99[iter_0_5].mod_type2,
    function()
      return var_0_99[iter_0_5].mod_type2:get("Offset")
    end
  }
  local var_0_125 = {
    var_0_99[iter_0_5].mod_type2,
    function()
      return var_0_99[iter_0_5].mod_type2:get("Random")
    end
  }

  var_0_99[iter_0_5].label_:depend(var_0_100, var_0_101, var_0_103, var_0_96)
  var_0_99[iter_0_5].enable2:depend(var_0_100, var_0_101, var_0_103, var_0_96)
  var_0_99[iter_0_5].label:depend(var_0_102, var_0_101, var_0_103, var_0_96)
  var_0_99[iter_0_5].selection_:depend(var_0_102, var_0_101, var_0_103, var_0_96)
  var_0_99[iter_0_5].labelt:depend(var_0_102, var_0_101, var_0_103, var_0_96)
  var_0_99[iter_0_5].mod_type2:depend(var_0_102, var_0_101, var_0_103, var_0_96, var_0_106)
  var_0_99[iter_0_5].ofs_1:depend(var_0_102, var_0_101, var_0_103, var_0_96, var_0_106, var_0_124)
  var_0_99[iter_0_5].ofs_2:depend(var_0_102, var_0_101, var_0_103, var_0_96, var_0_106, var_0_124)
  var_0_99[iter_0_5].spna:depend(var_0_102, var_0_101, var_0_103, var_0_96, var_0_106, var_0_123)
  var_0_99[iter_0_5].rana:depend(var_0_102, var_0_101, var_0_103, var_0_96, var_0_106, var_0_125)
  var_0_99[iter_0_5].body_yaw_type2:depend(var_0_102, var_0_101, var_0_103, var_0_107, var_0_96)
  var_0_99[iter_0_5].adaptive_def:depend(var_0_102, var_0_101, var_0_103, var_0_107, var_0_96)
  var_0_99[iter_0_5].body_slider2:depend(var_0_102, var_0_101, var_0_103, var_0_107, var_0_104, var_0_96)
  var_0_99[iter_0_5].yaw_delay2:depend(var_0_102, var_0_101, var_0_103, var_0_96)
  var_0_99[iter_0_5].Random_delay:depend(var_0_102, var_0_101, var_0_103, var_0_96)
  var_0_99[iter_0_5].hold_delay:depend(var_0_102, var_0_101, var_0_103, var_0_96)
  var_0_99[iter_0_5].pitch_type:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_96)
  var_0_99[iter_0_5].pitch_slider2:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_117, var_0_96)
  var_0_99[iter_0_5].pitch_slider:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_117, var_0_96)
  var_0_99[iter_0_5].pitch_slider1:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_110, var_0_96)
  var_0_99[iter_0_5].pitch_spin:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_114, var_0_96)
  var_0_99[iter_0_5].pitch_spin2:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_114, var_0_96)
  var_0_99[iter_0_5].pitch_speed:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_114, var_0_96)
  var_0_99[iter_0_5].pitch_spin_mod:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_115, var_0_96)
  var_0_99[iter_0_5].pitch_spin2_mod:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_115, var_0_96)
  var_0_99[iter_0_5].pitch_speed2:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_115, var_0_96)
  var_0_99[iter_0_5].pitch_jitter2:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_113, var_0_96)
  var_0_99[iter_0_5].pitch_jitter:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_113, var_0_96)
  var_0_99[iter_0_5].pitch_slider_static:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_116, var_0_96)
  var_0_99[iter_0_5].pitch_slider2_static:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_116, var_0_96)
  var_0_99[iter_0_5].pitch_slow_def:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_116, var_0_96)
  var_0_99[iter_0_5].defense_aa_type:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_96)
  var_0_99[iter_0_5].defensive_left:depend(var_0_102, var_0_101, var_0_103, var_0_112, var_0_109, var_0_108, var_0_96)
  var_0_99[iter_0_5].defensive_right:depend(var_0_102, var_0_101, var_0_103, var_0_112, var_0_109, var_0_108, var_0_96)
  var_0_99[iter_0_5].defense_aa_slider:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_118, var_0_96)
  var_0_99[iter_0_5].defensive_random:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_120, var_0_96)
  var_0_99[iter_0_5].defensive_jitter:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_119, var_0_96)
  var_0_99[iter_0_5].defensive_jitter_speed:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_119, var_0_96)
  var_0_99[iter_0_5].jitter_speed2:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_112, var_0_96)
  var_0_99[iter_0_5].defensive_skitter:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_121, var_0_96)
  var_0_99[iter_0_5].defensive_spin:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_111, var_0_96)
  var_0_99[iter_0_5].force_lc:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_96)
  var_0_99[iter_0_5].labelsli:depend(var_0_102, var_0_101, var_0_103, var_0_96)
  var_0_99[iter_0_5].labelslin:depend(var_0_102, var_0_101, var_0_103, var_0_96)
  var_0_99[iter_0_5].enable:depend(var_0_102, var_0_101, var_0_108, var_0_103, var_0_96)
  var_0_99[iter_0_5].adaptive_desync:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_122, var_0_96)
  var_0_99[iter_0_5].defensive_speed:depend(var_0_102, var_0_101, var_0_103, var_0_109, var_0_108, var_0_111, var_0_96)
  var_0_88.antiaim.enabled:set(true)
end

function hide_original_menu(arg_169_0)
  var_0_32.set_visible(var_0_85.enabled, arg_169_0)
  var_0_32.set_visible(var_0_85.pitch[1], arg_169_0)
  var_0_32.set_visible(var_0_85.pitch[2], arg_169_0)
  var_0_32.set_visible(var_0_85.yawbase, arg_169_0)
  var_0_32.set_visible(var_0_85.yaw[1], arg_169_0)
  var_0_32.set_visible(var_0_85.yaw[2], arg_169_0)
  var_0_32.set_visible(var_0_85.yawjitter[1], arg_169_0)
  var_0_32.set_visible(var_0_85.roll[1], arg_169_0)
  var_0_32.set_visible(var_0_85.yawjitter[2], arg_169_0)
  var_0_32.set_visible(var_0_85.bodyyaw[1], arg_169_0)
  var_0_32.set_visible(var_0_85.bodyyaw[2], arg_169_0)
  var_0_32.set_visible(var_0_85.fsbodyyaw, arg_169_0)
  var_0_32.set_visible(var_0_85.edgeyaw, arg_169_0)
  var_0_32.set_visible(var_0_85.freestand[1], arg_169_0)
  var_0_32.set_visible(var_0_85.freestand[2], arg_169_0)
end

local var_0_126 = {}
local var_0_127 = {
  automatic_scope = var_0_2.reference("RAGE", "Aimbot", "Automatic scope"),
  target_hitbox = var_0_2.reference("RAGE", "Aimbot", "Target hitbox"),
  quickpeek = var_0_2.reference("RAGE", "Other", "Quick peek assist"),
  onshot_antiaim = var_0_2.reference("AA", "Other", "On shot anti-aim")
}

var_0_127.doubletap, var_0_127.doubletap_mode = var_0_2.reference("RAGE", "Aimbot", "Double tap")
var_0_127.doubletap_fakelag_limit = var_0_2.reference("RAGE", "Aimbot", "Double tap fake lag limit")
var_0_127.min_damage = var_0_2.reference("RAGE", "Aimbot", "Minimum damage")
var_0_127.min_damage_override, var_0_127.min_damage_override_value = var_0_2.reference("RAGE", "Aimbot", "Minimum damage override")
var_0_127.automatic_scope = var_0_2.reference("RAGE", "Aimbot", "Automatic scope")
var_0_127.quickpeek = var_0_2.reference("RAGE", "Other", "Quick peek assist")
var_0_127.quickpeek_mode = var_0_2.reference("RAGE", "Other", "Quick peek assist mode")
var_0_127.quickpeek_distance = var_0_2.reference("RAGE", "Other", "Quick peek assist distance")
var_0_127.force_baim = var_0_2.reference("RAGE", "Aimbot", "Force body aim")
var_0_127.third_person_alive = var_0_2.reference("VISUALS", "Effects", "Force third person (alive)")

local var_0_128 = {
  to_pairs = {
    vector = {
      "x",
      "y",
      "z"
    },
    imcolor = {
      "r",
      "g",
      "b",
      "a"
    }
  },
  get_type = function(arg_170_0, arg_170_1)
    local var_170_0 = type(arg_170_1)

    if var_170_0 == "cdata" and arg_170_1.x and arg_170_1.y and arg_170_1.z then
      return "vector"
    elseif var_170_0 == "cdata" and arg_170_1.r and arg_170_1.g and arg_170_1.b and arg_170_1.a then
      return "imcolor"
    elseif var_170_0 == "userdata" and arg_170_1.__type then
      return var_0_31.lower(arg_170_1.__type.name)
    end

    return var_170_0
  end,
  copy_tables = function(arg_171_0, arg_171_1, arg_171_2, arg_171_3)
    arg_171_3 = arg_171_3 or arg_171_2

    local var_171_0 = getmetatable(arg_171_2)

    if var_171_0 and getmetatable(arg_171_1) == nil then
      setmetatable(arg_171_1, var_171_0)
    end

    for iter_171_0, iter_171_1 in pairs(arg_171_2) do
      if type(iter_171_1) == "table" then
        arg_171_1[iter_171_0] = arg_171_0:copy_tables({}, iter_171_1, arg_171_3[iter_171_0])
      else
        local var_171_1 = arg_171_3[iter_171_0]

        if type(var_171_1) == "boolean" then
          var_171_1 = var_171_1 and 1 or 0
        end

        arg_171_1[iter_171_0] = var_171_1
      end
    end

    return arg_171_1
  end,
  resolve = function(arg_172_0, arg_172_1, arg_172_2, arg_172_3, arg_172_4, arg_172_5)
    if type(arg_172_3) == "boolean" then
      arg_172_3 = arg_172_3 and 1 or 0
    end

    if type(arg_172_2) == "boolean" then
      arg_172_2 = arg_172_2 and 1 or 0
    end

    local var_172_0 = arg_172_1(arg_172_4, arg_172_2, arg_172_3 - arg_172_2, arg_172_5)

    if type(arg_172_3) == "number" then
      if var_0_30.abs(arg_172_3 - var_172_0) <= 0.001 then
        var_172_0 = arg_172_3
      end

      if var_172_0 % 1 < 0.0001 then
        var_172_0 = var_0_30.floor(var_172_0)
      elseif var_172_0 % 1 > 0.9999 then
        var_172_0 = var_0_30.ceil(var_172_0)
      end
    end

    return var_172_0
  end,
  perform_easing = function(arg_173_0, arg_173_1, arg_173_2, arg_173_3, arg_173_4, arg_173_5, arg_173_6)
    if arg_173_0.to_pairs[arg_173_1] then
      for iter_173_0, iter_173_1 in ipairs(arg_173_0.to_pairs[arg_173_1]) do
        arg_173_3[iter_173_1] = arg_173_0:perform_easing(type(v), arg_173_2, arg_173_3[iter_173_1], arg_173_4[iter_173_1], arg_173_5, arg_173_6)
      end

      return arg_173_3
    end

    if arg_173_1 == "table" then
      for iter_173_2, iter_173_3 in pairs(arg_173_4) do
        arg_173_3[iter_173_2] = arg_173_3[iter_173_2] or iter_173_3
        arg_173_3[iter_173_2] = arg_173_0:perform_easing(type(iter_173_3), arg_173_2, arg_173_3[iter_173_2], iter_173_3, arg_173_5, arg_173_6)
      end

      return arg_173_3
    end

    return arg_173_0:resolve(arg_173_2, arg_173_3, arg_173_4, arg_173_5, arg_173_6)
  end,
  new = function(arg_174_0, arg_174_1, arg_174_2)
    if type(arg_174_1) == "boolean" then
      arg_174_1 = arg_174_1 and 1 or 0
    end

    local var_174_0 = {}
    local var_174_1 = {
      value = arg_174_1 or 0,
      easing = arg_174_2 or function(arg_175_0, arg_175_1, arg_175_2, arg_175_3)
        return arg_175_2 * arg_175_0 / arg_175_3 + arg_175_1
      end
    }

    function var_174_0.update(arg_176_0, arg_176_1, arg_176_2, arg_176_3)
      if type(arg_176_2) == "boolean" then
        arg_176_2 = arg_176_2 and 1 or 0
      end

      local var_176_0 = globals.frametime()
      local var_176_1 = arg_176_1 or 0.15
      local var_176_2 = arg_174_0:get_type(arg_176_2)
      local var_176_3 = arg_174_0:get_type(arg_176_0.value)

      assert(var_176_2 == var_176_3, var_0_31.format("type mismatch. expected %s (received %s)", var_176_3, var_176_2))

      if arg_176_0.value == arg_176_2 then
        return arg_176_2
      end

      if var_176_0 <= 0 or var_176_1 <= var_176_0 then
        if var_176_3 == "imcolor" or var_176_3 == "vector" then
          arg_176_0.value = arg_176_2:clone()
        elseif var_176_3 == "table" then
          arg_174_0:copy_tables(arg_176_0.value, arg_176_2)
        else
          arg_176_0.value = arg_176_2
        end
      else
        local var_176_4 = arg_176_3 or arg_176_0.easing

        arg_176_0.value = arg_174_0:perform_easing(var_176_3, var_176_4, arg_176_0.value, arg_176_2, var_176_0, var_176_1)
      end

      return arg_176_0.value
    end

    return setmetatable(var_174_0, {
      __metatable = false,
      __call = var_174_0.update,
      __index = var_174_1
    })
  end,
  new_interp = function(arg_177_0, arg_177_1)
    return setmetatable({
      previous = arg_177_1 or 0
    }, {
      __call = function(arg_178_0, arg_178_1, arg_178_2)
        local var_178_0 = arg_178_2 or 1
        local var_178_1 = globals.tickinterval() * var_178_0

        if var_0_30.abs(arg_178_1 - arg_178_0.previous) > 0 then
          local var_178_2 = var_0_30.min(var_178_1, globals.frametime()) / var_178_1

          arg_178_0.previous = arg_178_0.previous + var_178_2 * (arg_178_1 - arg_178_0.previous)
        else
          arg_178_0.previous = arg_178_1
        end

        arg_178_0.previous = arg_178_0.previous % 1 < 0.0001 and 0 or arg_178_0.previous

        return arg_178_0.previous
      end
    })
  end
}
local var_0_129 = {
  extend_vector = function(arg_179_0, arg_179_1, arg_179_2)
    local var_179_0 = arg_179_2 * var_0_30.pi / 180

    return var_0_10(arg_179_0.x + var_0_30.cos(var_179_0) * arg_179_1, arg_179_0.y + var_0_30.sin(var_179_0) * arg_179_1, arg_179_0.z)
  end
}
local var_0_130 = cvar.sv_gravity
local var_0_131 = cvar.sv_jump_impulse

function var_0_129.extrapolate_position(arg_180_0, arg_180_1, arg_180_2, arg_180_3)
  local var_180_0 = globals.tickinterval()
  local var_180_1 = var_0_130:get_float() * var_180_0
  local var_180_2 = var_0_131:get_float() * var_180_0
  local var_180_3 = arg_180_1
  local var_180_4 = arg_180_1
  local var_180_5 = var_0_10(entity.get_prop(arg_180_0, "m_vecVelocity"))
  local var_180_6 = var_180_5.z > 0 and -var_180_1 or var_180_2

  for iter_180_0 = 1, arg_180_2 do
    local var_180_7 = var_180_3

    var_180_3 = var_0_10(var_180_3.x + (arg_180_3 and -(var_180_5.x * var_180_0) or var_180_5.x * var_180_0), var_180_3.y + (arg_180_3 and -(var_180_5.y * var_180_0) or var_180_5.y * var_180_0), var_180_3.z + (arg_180_3 and -((var_180_5.z + var_180_6) * var_180_0) or (var_180_5.z + var_180_6) * var_180_0))

    if var_0_33.trace_line(-1, var_180_7.x, var_180_7.y, var_180_7.x, var_180_3.x, var_180_3.y, var_180_3.x) <= 0.99 then
      return var_180_7
    end
  end

  return var_180_3
end

function var_0_129.set_movement(arg_181_0, arg_181_1, arg_181_2)
  local var_181_0 = var_0_10(var_0_10(entity.get_origin(arg_181_2)):to(arg_181_1):angles()).y

  arg_181_0.in_forward = 1
  arg_181_0.in_back = 0
  arg_181_0.in_moveleft = 0
  arg_181_0.in_moveright = 0
  arg_181_0.in_speed = 0
  arg_181_0.forwardmove = 800
  arg_181_0.sidemove = 0
  arg_181_0.move_yaw = var_181_0
end

function var_0_129.rgb_to_hex(arg_182_0)
  return var_0_31.format("%02x%02x%02x%02x", arg_182_0[1], arg_182_0[2], arg_182_0[3], arg_182_0[4])
end

function var_0_129.lerp(arg_183_0, arg_183_1, arg_183_2)
  if arg_183_0 == arg_183_1 then
    return arg_183_1
  end

  return arg_183_0 + (arg_183_1 - arg_183_0) * arg_183_2
end

function var_0_129.color_swap(arg_184_0, arg_184_1, arg_184_2)
  arg_184_2 = var_0_30.clamp(arg_184_2, 0, 1)

  if arg_184_2 == 0 then
    return arg_184_0
  elseif arg_184_2 == 1 then
    return arg_184_1
  end

  return {
    var_0_129.lerp(arg_184_0[1], arg_184_1[1], arg_184_2),
    var_0_129.lerp(arg_184_0[2], arg_184_1[2], arg_184_2),
    var_0_129.lerp(arg_184_0[3], arg_184_1[3], arg_184_2),
    var_0_129.lerp(arg_184_0[4], arg_184_1[4], arg_184_2)
  }
end

function var_0_129.colored_text(arg_185_0, arg_185_1)
  return var_0_31.format("\a%02x%02x%02x%02x%s", arg_185_1[1], arg_185_1[2], arg_185_1[3], arg_185_1[4], arg_185_0)
end

function var_0_129.gradient_text(arg_186_0, arg_186_1, arg_186_2, arg_186_3, arg_186_4)
  arg_186_2 = arg_186_2 or arg_186_1
  arg_186_3 = var_0_30.clamp(arg_186_3, 0, 1)

  if arg_186_3 == 0 then
    return var_0_129.colored_text(arg_186_0, arg_186_2)
  elseif arg_186_3 == 1 then
    return var_0_129.colored_text(arg_186_0, arg_186_1)
  end

  local var_186_0 = var_0_31.len(arg_186_0)
  local var_186_1 = {}

  for iter_186_0 = 1, var_186_0 do
    local var_186_2 = arg_186_4 and 1 - arg_186_3 - (var_186_0 - iter_186_0) / (var_186_0 - 1) + (1 - arg_186_3) or iter_186_0 - arg_186_3 * var_186_0
    local var_186_3 = var_0_129.color_swap(arg_186_1, arg_186_2, var_186_2)

    var_186_1[iter_186_0] = var_0_129.colored_text(var_0_31.sub(arg_186_0, iter_186_0, iter_186_0), var_186_3)
  end

  return var_0_29.concat(var_186_1)
end

local var_0_132 = {}

var_0_132.active = false
var_0_132.charged = false
var_0_132.disabled = false

local var_0_133 = {}

var_0_133.active = false
var_0_133.charged = false
var_0_133.disabled = false
var_0_133.forced_discharge = false

function var_0_133.reset(arg_187_0)
  arg_187_0.active = false
  arg_187_0.charged = false
  arg_187_0.disabled = false
  arg_187_0.forced_discharge = false
end

function var_0_133.restore(arg_188_0)
  var_0_127.doubletap:override()
end

function var_0_133.disable(arg_189_0)
  var_0_127.doubletap:override(false)

  arg_189_0.disabled = true
end

function var_0_133.force_discharge(arg_190_0, arg_190_1)
  if arg_190_1 and arg_190_1.discharge_pending ~= nil then
    arg_190_1.discharge_pending = true
  end

  arg_190_0.forced_discharge = true
end

local var_0_134 = false

function var_0_133.on_setup_command(arg_191_0, arg_191_1)
  if arg_191_0.disabled then
    arg_191_0:reset()

    var_0_134 = true

    return
  end

  if var_0_134 then
    var_0_134 = false

    arg_191_0:restore()
  end

  if arg_191_0.forced_discharge then
    arg_191_0.forced_discharge = false
    arg_191_1.discharge_pending = true
  end

  if not var_0_85.doubletap:get() or not var_0_85.doubletap:get_hotkey() then
    arg_191_0:reset()

    return
  end

  arg_191_0.active = true
  arg_191_0.charged = var_0_132.charged
end

local var_0_135 = {}

var_0_135.active = false
var_0_135.charged = false
var_0_135.disabled = false

function var_0_135.reset(arg_192_0)
  arg_192_0.active = false
  arg_192_0.charged = false
  arg_192_0.disabled = false
end

function var_0_135.restore(arg_193_0)
  var_0_127.onshot_antiaim:override()
  var_0_127.onshot_antiaim.hotkey:override()
end

function var_0_135.disable(arg_194_0)
  var_0_127.onshot_antiaim:override(false)

  arg_194_0.disabled = true
end

local var_0_136 = false

function var_0_135.on_setup_command(arg_195_0)
  if arg_195_0.disabled then
    arg_195_0:reset()

    var_0_136 = true

    return
  end

  if var_0_136 then
    var_0_136 = false

    arg_195_0:restore()
  end

  if not var_0_127.onshot_antiaim.value or not var_0_127.onshot_antiaim:get_hotkey() then
    arg_195_0:reset()

    return
  end

  arg_195_0.active = true
  arg_195_0.charged = var_0_132.charged
end

local var_0_137 = {}

var_0_137.active = false
var_0_137.active_until = 0
var_0_137.ticks = 0
var_0_137.ticks_from_activation = 0
var_0_137.disabled = false
var_0_137.forced = false

function var_0_137.reset(arg_196_0)
  arg_196_0.active = false
  arg_196_0.active_until = 0
  arg_196_0.ticks = 0
  arg_196_0.ticks_from_activation = 0
  arg_196_0.disabled = false
  arg_196_0.forced = false
end

function var_0_137.disable(arg_197_0)
  arg_197_0.disabled = true
end

function var_0_137.force(arg_198_0, arg_198_1)
  if arg_198_1 and arg_198_1.force_defensive ~= nil then
    arg_198_1.force_defensive = true
  end

  arg_198_0.forced = true
end

local var_0_138 = 0

function var_0_137.detect(arg_199_0)
  local var_199_0 = vars.local_player
  local var_199_1 = globals.tickcount()
  local var_199_2 = toticks(entity.get_prop(var_199_0, "m_flSimulationTime"))
  local var_199_3 = var_199_2 - var_0_138

  if var_199_3 < 0 then
    arg_199_0.active_until = var_199_1 + var_0_30.abs(var_199_3) - toticks(var_0_33.real_latency()) - 1
    arg_199_0.ticks = arg_199_0.active_until - var_199_1
  end

  var_0_138 = var_199_2
  arg_199_0.active = var_199_1 < arg_199_0.active_until

  if arg_199_0.active then
    arg_199_0.ticks_from_activation = arg_199_0.ticks - (arg_199_0.active_until - var_199_1) + 1
  end
end

local var_0_139 = 0
local var_0_140 = 0

function var_0_137.handle(arg_200_0, arg_200_1)
  return
end

function var_0_137.on_setup_command(arg_201_0, arg_201_1)
  if not var_0_132.charged then
    arg_201_0:reset()

    return
  end

  if arg_201_0.disabled then
    arg_201_0.disabled = false
  end

  if arg_201_0.forced then
    arg_201_0.forced = false
    arg_201_1.force_defensive = true
  end

  arg_201_0:detect()
end

function var_0_132.reset(arg_202_0)
  arg_202_0.active = false
  arg_202_0.charged = false
  arg_202_0.disabled = false

  var_0_133:reset()
  var_0_135:reset()
  var_0_137:reset()
end

function var_0_132.restore(arg_203_0)
  var_0_127.doubletap:override()
  var_0_127.onshot_antiaim:override()
end

function var_0_132.disable(arg_204_0)
  var_0_127.doubletap:override(false)
  var_0_127.onshot_antiaim:override(false)

  arg_204_0.disabled = true
end

function var_0_132.detect(arg_205_0)
  local var_205_0 = entity.get_prop(vars.local_player, "m_nTickBase")

  arg_205_0.charged = var_0_30.floor(var_205_0 - globals.tickcount() - 3 - toticks(var_0_33.latency()) * 0.4) <= -15 + (var_0_85.doubletap_fakelag_limit.value - 1) + 5
end

local var_0_141 = false

function var_0_132.on_setup_command(arg_206_0, arg_206_1)
  if arg_206_0.disabled then
    arg_206_0:reset()

    var_0_141 = true

    return
  end

  if var_0_141 then
    var_0_141 = false

    arg_206_0:restore()
  end

  arg_206_0:detect()
  var_0_133:on_setup_command(arg_206_1)
  var_0_135:on_setup_command()
  var_0_137:on_setup_command(arg_206_1)

  arg_206_0.active = var_0_133.active or var_0_135.active
end

var_0_132.doubletap = var_0_133
var_0_132.hideshots = var_0_135
var_0_132.defensive = var_0_137

local var_0_142 = {
  Head = {
    0
  },
  Chest = {
    4,
    5,
    6
  },
  Stomach = {
    2,
    3
  },
  Arms = {
    13,
    14,
    15,
    16,
    17,
    18
  },
  Legs = {
    7,
    8,
    9,
    10
  },
  Feet = {
    11,
    12
  }
}
local var_0_143 = {
  0,
  5,
  2,
  15,
  17,
  9,
  10
}
local var_0_144 = {}
local var_0_145 = 4
local var_0_146 = 22
local var_0_147 = false
local var_0_148 = false
local var_0_149 = false
local var_0_150 = false
local var_0_151 = false
local var_0_152 = {
  last_returning_time = 0,
  active_point_index = 0,
  positions = {},
  middle_pos = var_0_10()
}
local var_0_153 = {
  force_baim = false,
  main = false
}
local var_0_154 = {
  active = false,
  values = {
    global_alpha = var_0_128:new(),
    pos = {},
    alpha = {}
  }
}

function update_hitboxes(arg_207_0, arg_207_1)
  local var_207_0 = {}
  local var_207_1 = arg_207_0.value
  local var_207_2 = {
    "Head",
    "Arms",
    "Legs",
    "Feet"
  }

  for iter_207_0 = 1, #var_207_1 do
    if arg_207_1 and var_0_29.contains(var_207_2, var_207_1[iter_207_0]) then

    else
      local var_207_3 = var_0_142[var_207_1[iter_207_0]]

      for iter_207_1 = 1, #var_207_3 do
        local var_207_4 = var_207_3[iter_207_1]

        if var_0_29.contains(var_0_143, var_207_4) then
          var_0_29.insert(var_207_0, var_207_4)
        end
      end
    end
  end

  var_0_144 = var_207_0
end

var_0_127.target_hitbox:set_callback(update_hitboxes, true)

function skip_func(arg_208_0, arg_208_1)
  if entity.get_classname(arg_208_0) == "CCSPlayer" and entity.is_enemy(arg_208_0) then
    return false
  end

  return true
end

function handle_point(arg_209_0, arg_209_1, arg_209_2, arg_209_3, arg_209_4, arg_209_5, arg_209_6, arg_209_7, arg_209_8)
  local var_209_0 = arg_209_1 and arg_209_1 - arg_209_5 or arg_209_0
  local var_209_1 = var_0_129.extend_vector(var_209_0, arg_209_4 == 0 and 0 or arg_209_3, arg_209_2)
  local var_209_2 = var_0_9.hull(var_209_0, var_209_0 + var_0_10(0, 0, arg_209_8), arg_209_6, arg_209_7, {
    mask = 33636363,
    skip = skip_func
  }).end_pos
  local var_209_3 = var_0_9.hull(var_0_10(var_209_0.x, var_209_0.y, var_209_2.z), var_0_10(var_209_1.x, var_209_1.y, var_209_2.z), arg_209_6, arg_209_7, {
    mask = 33636363,
    skip = skip_func
  }).end_pos

  if var_209_1:dist2d(var_209_3) >= arg_209_3 * 0.97 then
    return false
  end

  return var_0_9.hull(var_209_3, var_0_10(var_209_3.x, var_209_3.y, arg_209_0.z - 240), arg_209_6, arg_209_7, {
    mask = 33636363,
    skip = skip_func
  }).end_pos + arg_209_5
end

local var_0_155 = 18

function setup_points(arg_210_0, arg_210_1, arg_210_2, arg_210_3, arg_210_4)
  local var_210_0 = var_0_10(entity.get_prop(arg_210_0, "m_vecViewOffset"))
  local var_210_1 = var_0_10(entity.get_prop(arg_210_0, "m_vecMins"))
  local var_210_2 = var_0_10(entity.get_prop(arg_210_0, "m_vecMaxs"))

  var_0_152.positions[0] = handle_point(arg_210_1, nil, 0, arg_210_4, 0, var_210_0, var_210_1, var_210_2, var_0_155)

  for iter_210_0 = 1, arg_210_3 do
    local var_210_3 = iter_210_0 % 2 == 0 and arg_210_2 - 90 or arg_210_2 + 90
    local var_210_4 = var_0_152.positions[iter_210_0 <= 2 and 0 or iter_210_0 - 2]

    if not var_210_4 then

    else
      local var_210_5 = handle_point(arg_210_1, var_210_4, var_210_3, arg_210_4, iter_210_0, var_210_0, var_210_1, var_210_2, var_0_155)

      if not var_210_5 or var_210_4 and var_0_30.abs(var_210_4.z - var_210_5.z) > var_0_155 then
        for iter_210_1 = iter_210_0, arg_210_3, 2 do
          var_0_152.positions[iter_210_1] = false
        end
      else
        var_0_152.positions[iter_210_0] = var_210_5
      end
    end
  end

  return var_0_152.positions
end

function weapon_can_fire(arg_211_0, arg_211_1)
  local var_211_0 = entity.get_prop(arg_211_0, "m_flNextAttack")
  local var_211_1 = entity.get_prop(arg_211_1, "m_flNextPrimaryAttack")

  if var_0_30.max(0, var_211_0 or 0, var_211_1 or 0) > globals.curtime() or entity.get_prop(arg_211_1, "m_iClip1") <= 0 then
    return false
  end

  return true
end

local var_0_156 = {
  "CWeaponSSG08",
  "CWeaponAWP",
  "CWeaponG3SG1",
  "CWeaponSCAR20"
}

function can_target(arg_212_0, arg_212_1)
  if not arg_212_1 then
    return false
  end

  local var_212_0 = entity.get_player_weapon(arg_212_0)

  if not weapon_can_fire(arg_212_0, var_212_0) then
    return false
  end

  if not var_0_127.automatic_scope.value and var_0_29.contains(var_0_156, entity.get_classname(var_212_0)) and entity.get_prop(arg_212_0, "m_bIsScoped") ~= 1 then
    return false
  end

  if var_0_132.active and not var_0_132.charged then
    return false
  end

  if entity.get_prop(arg_212_0, "m_flVelocityModifier") ~= 1 then
    return false
  end

  if (entity.get_esp_data(arg_212_1) or {
    alpha = 0
  }).alpha < 0.75 then
    return false
  end

  return true
end

function trace_enemy(arg_213_0, arg_213_1, arg_213_2, arg_213_3)
  local var_213_0 = entity.get_prop(arg_213_2, "m_iHealth")
  local var_213_1 = var_0_127.min_damage_override.value and var_0_127.min_damage_override:get_hotkey() and var_0_127.min_damage_override_value.value or var_0_127.min_damage.value

  for iter_213_0 = 1, #arg_213_0 do
    local var_213_2 = arg_213_0[iter_213_0]

    if not var_213_2 then

    else
      for iter_213_1 = 1, #arg_213_3 do
        local var_213_3 = arg_213_3[iter_213_1]
        local var_213_4 = var_0_10(entity.hitbox_position(arg_213_2, var_213_3))
        local var_213_5, var_213_6 = var_0_33.trace_bullet(arg_213_1, var_213_2.x, var_213_2.y, var_213_2.z, var_213_4.x, var_213_4.y, var_213_4.z, var_213_3 == 0)

        if var_213_3 == 0 then
          var_213_6 = var_213_6 * 4
        end

        if var_213_6 >= var_0_30.min(var_213_1, var_213_0) and var_213_6 > 0 then
          return var_213_2, iter_213_0
        end
      end
    end
  end

  return nil, 0
end

var_0_127.quickpeek.hotkey:set("On hotkey")

function handle(arg_214_0)
  local var_214_0 = var_0_88.ragebotfeatures.aipeek:get() and var_0_88.ragebotfeatures.aipeek_hotkey:get()

  if var_214_0 and not var_0_153.main then
    local var_214_1 = entity.get_local_player()
    local var_214_2 = var_0_10(entity.get_origin(var_214_1))

    var_0_152.middle_pos = var_0_129.extrapolate_position(var_214_1, var_214_2, 13, true)
    var_0_153.main = true
  elseif not var_214_0 and var_0_153.main then
    var_0_127.quickpeek:override()
    var_0_127.quickpeek.hotkey:override()
    var_0_127.quickpeek_mode:override()
    var_0_127.doubletap:override()
    var_0_127.onshot_antiaim:override()

    var_0_153.main = false
  end

  local var_214_3 = var_0_127.force_baim:get()

  if var_214_3 and not var_0_153.force_baim then
    update_hitboxes(var_0_127.target_hitbox, true)

    var_0_153.force_baim = true
  elseif not var_214_3 and var_0_153.force_baim then
    update_hitboxes(var_0_127.target_hitbox)

    var_0_153.force_baim = false
  end

  if not var_214_0 then
    var_0_147 = false
    var_0_148 = false
    var_0_149 = false
    var_0_150 = false
    var_0_151 = false
    var_0_154.active = false

    return
  end

  var_0_127.quickpeek:override(true)
  var_0_127.quickpeek.hotkey:override({
    "Always on"
  })

  local var_214_4 = var_0_88.ragebotfeatures.label:get()
  local var_214_5 = entity.get_local_player()
  local var_214_6 = var_0_10(entity.get_prop(var_214_5, "m_vecVelocity")):length2d()
  local var_214_7 = globals.tickcount()
  local var_214_8 = var_0_12.band(entity.get_prop(var_214_5, "m_fFlags"), 1) ~= 1 or arg_214_0.in_forward == 1 or arg_214_0.in_moveleft == 1 or arg_214_0.in_moveright == 1 or arg_214_0.in_back == 1 or arg_214_0.in_jump == 1
  local var_214_9 = var_0_10(entity.get_origin(var_214_5))
  local var_214_10 = var_0_152.middle_pos
  local var_214_11 = var_214_10:dist2d(var_214_9)

  if var_214_4 == "Offensive" and not var_0_147 and not var_0_148 or var_214_11 > 0.15 and var_214_6 < 1.011 and var_214_6 ~= 0 then
    var_0_152.middle_pos = var_214_9
  end

  local var_214_12 = var_0_33.current_threat()

  var_0_152.current_target = var_214_12

  local var_214_13 = var_214_12 and var_0_10(entity.get_origin(var_214_12)) or var_0_10()
  local var_214_14 = var_214_12 and var_0_10(var_214_10:to(var_214_13):angles()).y or var_0_10(var_0_33.camera_angles()).y
  local var_214_15 = setup_points(var_214_5, var_214_10, var_214_14, var_0_145, var_0_146)

  var_0_154.active = true

  local var_214_16
  local var_214_17 = 0

  if not var_214_8 and not var_0_148 and can_target(var_214_5, var_214_12) then
    var_214_16, var_214_17 = trace_enemy(var_214_15, var_214_5, var_214_12, var_0_144)
  end

  var_0_147 = var_214_16 ~= nil
  var_0_152.active_point_index = var_214_17

  if var_0_147 then
    var_0_129.set_movement(arg_214_0, var_214_16, var_214_5)

    var_0_148 = false
    var_0_149 = true
    var_0_150 = false
    var_0_151 = false
  elseif var_214_8 then
    var_0_148 = false
    var_0_149 = false
    var_0_150 = false
    var_0_151 = false
  elseif var_0_149 or var_214_4 == "Defensive" then
    var_0_148 = true
    var_0_149 = false
    var_0_150 = true
  end

  if not var_0_148 then
    var_0_152.last_returning_time = var_214_7
  end

  if var_0_148 then
    if var_214_11 < 0.15 then
      var_0_148 = false
      var_0_150 = false
      var_0_151 = false
    elseif var_0_150 then
      if var_0_127.doubletap:get_hotkey() and weapon_can_fire(var_214_5, entity.get_player_weapon(var_214_5)) then
        if var_214_7 - var_0_152.last_returning_time == 1 then
          arg_214_0.force_defensive = true
        elseif var_214_7 - var_0_152.last_returning_time >= 7 then
          var_0_127.doubletap:override(false)
          var_0_127.onshot_antiaim:override(false)

          var_0_150 = false
          var_0_151 = true
        end
      elseif not var_0_127.doubletap:get_hotkey() and var_0_127.onshot_antiaim:get_hotkey() and not var_0_132.defensive.active then
        var_0_85.onshot_antiaim:override(false)

        var_0_150 = false
        var_0_151 = true
      end
    end
  end

  var_0_127.quickpeek_mode:override(var_0_148 and {
    "Retreat on shot",
    "Retreat on key release"
  } or nil)

  if var_0_151 then
    var_0_127.doubletap:override(false)
    var_0_127.onshot_antiaim:override(false)
  else
    var_0_127.doubletap:override()
    var_0_127.onshot_antiaim:override()
  end
end

function var_0_56()
  local var_215_0 = entity.get_local_player()

  if not entity.is_alive(var_215_0) or not var_0_127.third_person_alive.value or not var_0_127.third_person_alive:get_hotkey() then
    return
  end

  local var_215_1 = var_0_152.positions
  local var_215_2 = {
    255,
    255,
    255,
    255
  }
  local var_215_3 = var_0_154.active
  local var_215_4 = var_0_154.values
  local var_215_5 = var_0_152.active_point_index

  if var_215_4.global_alpha(0.045, var_215_3) <= 0 then
    return
  end

  for iter_215_0 = 0, #var_215_1 do
    local var_215_6 = var_215_1[iter_215_0]

    if var_215_6 == nil then

    else
      if not var_215_4.alpha[iter_215_0] then
        var_215_4.alpha[iter_215_0] = var_0_128:new()
      end

      if not var_215_4.pos[iter_215_0] then
        var_215_4.pos[iter_215_0] = var_0_128:new(var_0_10())
      end

      local var_215_7 = var_215_4.alpha[iter_215_0](0.045, var_215_6 and var_215_3)

      if var_215_7 <= 0 then

      else
        if var_215_6 then
          var_215_4.pos[iter_215_0](var_215_7 > 0.15 and 0.02 or 0, var_0_10(var_215_6.x, var_215_6.y, var_215_6.z - 26 + 5 * var_215_7 + (var_215_5 == iter_215_0 and 2 or 0)))
        end

        local var_215_8 = var_0_10(renderer.world_to_screen(var_215_4.pos[iter_215_0].value:unpack()))

        if var_215_8.x ~= 0 then
          local var_215_9 = var_215_5 == iter_215_0 and var_215_2 or {
            255,
            255,
            255,
            100
          }

          renderer.circle(var_215_8.x, var_215_8.y, var_215_9[1], var_215_9[2], var_215_9[3], var_215_9[4] * var_215_7, 3, 0, 1)
        end

        local var_215_10 = iter_215_0 <= 2 and 0 or iter_215_0 - 2
        local var_215_11 = var_0_10(renderer.world_to_screen(var_215_4.pos[var_215_10].value:unpack()))
        local var_215_12 = var_0_10(renderer.world_to_screen(var_215_4.pos[iter_215_0].value:unpack()))

        if var_215_11.x ~= 0 and var_215_12.x ~= 0 then
          renderer.line(var_215_11.x, var_215_11.y, var_215_12.x, var_215_12.y, 255, 255, 255, 100 * var_215_7)
        end
      end
    end
  end
end

function var_0_126.on_setup_command(arg_216_0, arg_216_1)
  handle(arg_216_1)
end

function var_0_126.on_paint(arg_217_0)
  if var_0_88.ragebotfeatures.aipeek_render:get() then
    var_0_56()
  end
end

local var_0_157 = 0
local var_0_158 = 0
local var_0_159 = false
local var_0_160 = 0
local var_0_161 = 0
local var_0_162 = 1
local var_0_163 = false
local var_0_164 = 0
local var_0_165 = 0

function player_state(arg_218_0)
  local var_218_0 = entity.get_local_player()

  if var_218_0 == nil then
    return
  end

  local var_218_1 = var_0_6.new(var_218_0)
  local var_218_2 = {
    entity.get_prop(var_218_0, "m_vecVelocity")
  }
  local var_218_3 = entity.get_prop(var_218_0, "m_fFlags")
  local var_218_4 = var_0_37.new("irggr", var_218_1:get_anim_state().on_ground == true and 1 or 0, 0.5)
  local var_218_5 = var_0_37.new("htirg", var_218_1:get_anim_state().hit_in_ground_animation == true and 1 or 0, 0.5)

  if var_218_4 < 1 and var_218_5 < 1 then
    var_0_164 = 1
  else
    var_0_164 = 0
  end

  var_0_165 = var_218_5

  local var_218_6, var_218_7 = var_0_164 > 0, var_0_30.sqrt(var_218_2[1]^2 + var_218_2[2]^2)
  local var_218_8 = entity.get_prop(var_218_0, "m_flDuckAmount") > 0.7 or var_0_32.get(var_0_85.fakeduck)
  local var_218_9 = var_0_32.get(var_0_85.slow[1]) and var_0_32.get(var_0_85.slow[2])
  local var_218_10 = var_0_32.get(var_0_85.freestand[1]) and var_0_32.get(var_0_85.freestand[2])

  if var_0_160 ~= 0 and var_0_99[10].enable2:get() then
    return "Manuals"
  elseif var_218_10 and var_0_99[9].enable2:get() then
    return "Freestand"
  elseif var_218_6 then
    if var_218_8 and var_0_99[6].enable2:get() then
      return "Aerobic+"
    end

    return "Aerobic"
  elseif var_218_8 then
    if var_218_7 > 10 and var_0_99[8].enable2:get() then
      return "Crouch+"
    end

    return "Crouch"
  elseif var_218_7 > 10 then
    if var_218_9 and var_218_7 > 10 and var_0_99[3].enable2:get() then
      return "Walking"
    end

    return "Moving"
  elseif var_218_7 < 10 then
    return "Standing"
  else
    return "Global"
  end
end

local var_0_166 = vtable_bind("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")

function var_0_167()
  if var_0_88.antiaim.yaw_direction:get("Freestand") and var_0_88.antiaim.freestand_hotkey:get() then
    var_0_32.set(var_0_85.freestand[1], true)
    var_0_32.set(var_0_85.freestand[2], "Always on")
  else
    var_0_32.set(var_0_85.freestand[1], false)
    var_0_32.set(var_0_85.freestand[2], "On hotkey")
  end

  if var_0_160 ~= 0 then
    var_0_32.set(var_0_85.freestand[1], false)
  end

  if var_0_88.antiaim.yaw_direction:get("Manuals") and var_0_88.antiaim.manuals_right:get() and var_0_161 + 0.2 < globals.curtime() then
    var_0_160 = var_0_160 == 90 and 0 or 90
    var_0_161 = globals.curtime()
  end

  if var_0_88.antiaim.yaw_direction:get("Manuals") and var_0_88.antiaim.manuals_left:get() and var_0_161 + 0.2 < globals.curtime() then
    var_0_160 = var_0_160 == -90 and 0 or -90
    var_0_161 = globals.curtime()
  end

  if var_0_88.antiaim.yaw_direction:get("Manuals") and var_0_88.antiaim.manuals_forward:get() and var_0_161 + 0.2 < globals.curtime() then
    var_0_160 = var_0_160 == 180 and 0 or 180
    var_0_161 = globals.curtime()
  end

  if var_0_161 > globals.curtime() then
    var_0_161 = globals.curtime()
  end

  if not var_0_88.antiaim.yaw_direction:get("Manuals") or var_0_88.antiaim.manuals_reset:get() and var_0_161 + 0.2 < globals.curtime() then
    var_0_160 = 0
    var_0_161 = 0
  end
end

var_0_33.set_event_callback("pre_render", var_0_167)

function var_0_168()
  if var_0_32.get(var_0_85.fakeduck) and var_0_88.Miscellaneous.edge:get() then
    var_0_32.set(var_0_85.edgeyaw, true)
  else
    var_0_32.set(var_0_85.edgeyaw, false)
  end
end

local var_0_169 = 0

function var_0_170()
  local var_221_0 = entity.get_local_player()
  local var_221_1 = entity.get_prop(var_221_0, "m_nTickBase")

  if var_0_30.abs(var_221_1 - var_0_169) > 64 then
    var_0_169 = 0
  end

  local var_221_2 = 0

  if var_221_1 > var_0_169 then
    var_0_169 = var_221_1
  elseif var_221_1 < var_0_169 then
    var_221_2 = var_0_30.min(13, var_0_30.max(0, var_0_169 - var_221_1 - 1))
  end

  return var_221_2
end

var_0_33.set_event_callback("level_init", function()
  var_0_169 = 0
end)

function is_defensive_active(arg_223_0)
  is_defensive = var_0_170() > 0

  return is_defensive
end

function is_vulnerable()
  for iter_224_0, iter_224_1 in ipairs(entity.get_players(true)) do
    local var_224_0 = entity.get_esp_data(iter_224_1).flags

    if var_0_12.band(var_224_0, var_0_12.lshift(1, 11)) ~= 0 then
      return true
    end
  end

  return false
end

function var_0_171(arg_225_0, arg_225_1, arg_225_2)
  local var_225_0 = var_0_99[var_0_162].defensive_spin:get()

  if var_225_0 == 0 then
    var_225_0 = 1
  end

  local var_225_1 = arg_225_0 * 35 * globals.curtime() % var_225_0
  local var_225_2 = arg_225_1 or 1
  local var_225_3 = arg_225_2

  return var_225_1, var_225_2, var_225_3
end

function var_0_172(arg_226_0, arg_226_1, arg_226_2)
  local var_226_0 = var_0_99[var_0_162].pitch_spin:get()
  local var_226_1 = var_0_99[var_0_162].pitch_spin2:get()
  local var_226_2 = globals.curtime() * arg_226_0 / 15 % 1
  local var_226_3 = var_226_0 + (var_226_1 - var_226_0) * var_226_2
  local var_226_4 = arg_226_1 or 1
  local var_226_5 = arg_226_2

  return var_226_3, var_226_4, var_226_5
end

function var_0_173()
  local var_227_0 = var_0_99[var_0_162].pitch_spin_mod:get()
  local var_227_1 = var_0_99[var_0_162].pitch_spin2_mod:get()
  local var_227_2 = var_0_99[var_0_162].pitch_speed2:get()
  local var_227_3 = (var_227_0 + var_227_1) / 2
  local var_227_4 = (var_227_1 - var_227_0) / 2

  return var_227_3 + var_0_30.sin(globals.curtime() * var_227_2 / 3) * var_227_4
end

local var_0_174 = true
local var_0_175 = true

function var_0_176()
  var_0_174 = false
end

function var_0_177()
  var_0_174 = true
end

function var_0_178(arg_230_0, arg_230_1, arg_230_2, arg_230_3, arg_230_4, arg_230_5)
  return var_0_30.sqrt((arg_230_3 - arg_230_0)^2 + (arg_230_4 - arg_230_1)^2 + (arg_230_5 - arg_230_2)^2)
end

local var_0_179 = globals.realtime()
local var_0_180 = -50

function var_0_181(arg_231_0, arg_231_1, arg_231_2)
  local var_231_0 = globals.realtime()

  if arg_231_2 <= var_231_0 - var_0_179 then
    var_0_180 = var_0_33.random_int(arg_231_0 * 1, arg_231_1 * 1)
    var_0_179 = var_231_0
  end

  return var_0_180
end

function var_0_182(arg_232_0)
  if not var_0_88.Miscellaneous.fast_ladder:get() then
    return
  end

  local var_232_0 = entity.get_local_player()
  local var_232_1, var_232_2 = var_0_33.camera_angles()

  if entity.get_prop(var_232_0, "m_MoveType") == 9 then
    arg_232_0.yaw = var_0_30.floor(arg_232_0.yaw + 0.5)
    arg_232_0.roll = 0

    if arg_232_0.forwardmove == 0 and arg_232_0.sidemove ~= 0 then
      arg_232_0.pitch = 89
      arg_232_0.yaw = arg_232_0.yaw + 180

      if arg_232_0.sidemove < 0 then
        arg_232_0.in_moveleft = 0
        arg_232_0.in_moveright = 1
      end

      if arg_232_0.sidemove > 0 then
        arg_232_0.in_moveleft = 1
        arg_232_0.in_moveright = 0
      end
    end

    if arg_232_0.forwardmove > 0 and var_232_1 < 45 then
      arg_232_0.pitch = 89
      arg_232_0.in_moveright = 1
      arg_232_0.in_moveleft = 0
      arg_232_0.in_forward = 0
      arg_232_0.in_back = 1

      if arg_232_0.sidemove == 0 then
        arg_232_0.yaw = arg_232_0.yaw + 90
      end

      if arg_232_0.sidemove < 0 then
        arg_232_0.yaw = arg_232_0.yaw + 150
      end

      if arg_232_0.sidemove > 0 then
        arg_232_0.yaw = arg_232_0.yaw + 30
      end
    end

    if arg_232_0.forwardmove < 0 then
      arg_232_0.pitch = 89
      arg_232_0.in_moveleft = 1
      arg_232_0.in_moveright = 0
      arg_232_0.in_forward = 1
      arg_232_0.in_back = 0

      if arg_232_0.sidemove == 0 then
        arg_232_0.yaw = arg_232_0.yaw + 90
      end

      if arg_232_0.sidemove > 0 then
        arg_232_0.yaw = arg_232_0.yaw + 150
      end

      if arg_232_0.sidemove < 0 then
        arg_232_0.yaw = arg_232_0.yaw + 30
      end
    end
  end
end

local var_0_183 = 0
local var_0_184 = 0
local var_0_185 = 0
local var_0_186 = 0
local var_0_187 = 0
local var_0_188 = 0
local var_0_189 = 0
local var_0_190 = 1
local var_0_191 = false
local var_0_192 = false

function var_0_193()
  if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then
    return
  end

  return entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11) * 120 - 60 > 0 and -1 or 1
end

function var_0_194()
  local var_234_0 = var_0_99[var_0_162].sway_speed:get() * 0.1
  local var_234_1 = var_0_99[var_0_162].sway_min:get()
  local var_234_2 = var_0_99[var_0_162].sway_max:get()
  local var_234_3 = var_0_99[var_0_162].jitter_streght:get()

  var_0_189 = var_0_189 + var_234_0 * var_0_190

  if var_234_2 <= var_0_189 then
    var_0_189 = var_234_2
    var_0_190 = -1
  elseif var_234_1 >= var_0_189 then
    var_0_189 = var_234_1
    var_0_190 = 1
  end

  local var_234_4 = var_0_30.random(-var_234_3, var_234_3)
  local var_234_5 = var_0_189 + var_234_4

  if var_0_193() == -1 then
    var_234_5 = var_234_5 + var_234_3 / 2
  else
    var_234_5 = var_234_5 - var_234_3 / 2
  end

  local var_234_6 = var_0_30.max(var_234_1, var_0_30.min(var_234_2, var_234_5))

  return var_0_30.max(-180, var_0_30.min(180, var_234_6))
end

function var_0_195(arg_235_0, arg_235_1)
  local var_235_0 = arg_235_1.x - arg_235_0.x
  local var_235_1 = arg_235_1.y - arg_235_0.y
  local var_235_2 = arg_235_1.z - arg_235_0.z
  local var_235_3 = var_0_30.sqrt(var_235_0^2 + var_235_1^2)
  local var_235_4 = var_0_30.atan2(var_235_2, var_235_3) * 57.295779513082
  local var_235_5 = var_0_30.atan2(var_235_1, var_235_0) * 180 / 3.141592653589793

  return {
    z = 0,
    x = var_0_30.normalize_yaw(var_235_4, 90),
    y = var_0_30.normalize_yaw(var_235_5, 180)
  }
end

function var_0_196(arg_236_0)
  local var_236_0 = var_0_33.current_threat()

  if not var_236_0 then
    return
  end

  local var_236_1 = false
  local var_236_2 = var_0_88.antiaim.yaw_base:get() == "At targets"
  local var_236_3 = var_0_10(entity.get_origin(arg_236_0))
  local var_236_4 = var_0_10(entity.get_origin(var_236_0))
  local var_236_5 = (var_236_2 and var_0_195(var_236_3, var_236_4).y or var_0_10(var_0_33.camera_angles()).y) + var_0_32.get(var_0_85.yaw[2])
  local var_236_6 = var_0_30.normalize_yaw(entity.get_prop(arg_236_0, "m_angEyeAngles[1]") - 180, 180)
  local var_236_7 = var_0_30.abs(var_236_5 - var_236_6)

  return var_236_7 > 50 and var_236_7 < 300
end

function var_0_197(arg_237_0)
  local var_237_0 = {
    last_hit = 0,
    side = 1,
    hit_side = 0,
    last_side = 0
  }

  if not arg_237_0 or entity.get_prop(arg_237_0, "m_lifeState") ~= 0 then
    return
  end

  if var_237_0.hit_side ~= 0 and globals.curtime() - var_237_0.last_hit > 5 then
    var_237_0.last_side = 0
    var_237_0.last_hit = 0
    var_237_0.hit_side = 0
  end

  local var_237_1 = var_0_10(var_0_33.eye_position())
  local var_237_2 = var_0_10(var_0_33.camera_angles())
  local var_237_3 = {
    left = 0,
    right = 0
  }

  for iter_237_0 = var_237_2.y - 120, var_237_2.y + 120, 30 do
    if iter_237_0 ~= var_237_2.y then
      local var_237_4 = var_0_30.rad(iter_237_0)
      local var_237_5 = var_237_1.x + 256 * var_0_30.cos(var_237_4)
      local var_237_6 = var_237_1.y + 256 * var_0_30.sin(var_237_4)
      local var_237_7 = var_237_1.z
      local var_237_8 = var_0_33.trace_line(arg_237_0, var_237_1.x, var_237_1.y, var_237_1.z, var_237_5, var_237_6, var_237_7)
      local var_237_9 = iter_237_0 < var_237_2.y and "left" or "right"

      var_237_3[var_237_9] = var_237_3[var_237_9] + var_237_8
    end
  end

  var_237_0.side = var_237_3.left < var_237_3.right and -1 or 1

  if var_237_0.side == var_237_0.last_side then
    return
  end

  var_237_0.last_side = var_237_0.side

  if var_237_0.hit_side ~= 0 then
    var_237_0.side = var_237_0.hit_side
  end

  if var_237_0.side == nil then
    var_237_0.side = 1
  end

  return var_237_0.side
end

function var_0_198()
  local var_238_0 = entity.get_local_player()
  local var_238_1 = var_0_33.current_threat()
  local var_238_2 = false

  if not var_238_1 or entity.is_dormant(var_238_1) then
    local var_238_3 = false

    return
  end

  local var_238_4 = {
    entity.get_origin(var_238_1)
  }
  local var_238_5 = {
    entity.get_prop(var_238_1, "m_vecViewOffset")
  }
  local var_238_6 = {
    var_0_33.eye_position()
  }
  local var_238_7 = {
    var_238_4[1] + var_238_5[1],
    var_238_4[2] + var_238_5[2],
    var_238_4[3] + var_238_5[3]
  }
  local var_238_8 = {
    var_0_30.abs(var_238_7[1] - var_238_6[1]),
    var_0_30.abs(var_238_7[2] - var_238_6[2]),
    var_0_30.abs(var_238_7[3] - var_238_6[3])
  }

  if var_0_30.abs(var_238_8[1] + var_238_8[2]) > 350 then
    local var_238_9 = false

    return
  end

  local var_238_10 = {
    entity.get_prop(var_238_0, "m_vecVelocity")
  }
  local var_238_11 = {
    entity.get_prop(var_238_1, "m_vecVelocity")
  }
  local var_238_12 = globals.tickinterval() * 16
  local var_238_13 = {
    var_238_6[1] + var_238_10[1] * var_238_12,
    var_238_6[2] + var_238_10[2] * var_238_12,
    var_238_6[3] + var_238_10[3] * var_238_12
  }
  local var_238_14 = {
    var_238_7[1] + var_238_11[1] * var_238_12,
    var_238_7[2] + var_238_11[2] * var_238_12,
    var_238_7[3] + var_238_11[3] * var_238_12
  }
  local var_238_15, var_238_16 = var_0_33.trace_line(var_238_0, var_238_13[1], var_238_13[2], var_238_13[3], var_238_14[1], var_238_14[2], var_238_14[3])
  local var_238_17, var_238_18 = var_0_33.trace_line(var_238_0, var_238_14[1], var_238_14[2], var_238_14[3], var_238_13[1], var_238_13[2], var_238_13[3])
  local var_238_19, var_238_20 = var_0_33.trace_line(var_238_0, var_238_6[1], var_238_6[2], var_238_6[3], var_238_7[1], var_238_7[2], var_238_7[3])
  local var_238_21, var_238_22 = var_0_33.trace_line(var_238_0, var_238_6[1], var_238_6[2], var_238_6[3], var_238_4[1], var_238_4[2], var_238_4[3])
  local var_238_23 = var_238_16 == var_238_1 or var_238_15 == 1
  local var_238_24 = var_238_18 == var_238_0 or var_238_17 == 1
  local var_238_25 = var_238_20 == var_238_1 or var_238_19 == 1
  local var_238_26 = var_238_22 == var_238_1 or var_238_21 == 1
  local var_238_27 = entity.get_player_weapon(var_238_1)

  return entity.get_classname(var_238_27) == "CKnife" and (var_238_23 or var_238_24 or var_238_25 or var_238_26)
end

function var_0_30.lerping(arg_239_0, arg_239_1, arg_239_2)
  return arg_239_0 + (arg_239_1 - arg_239_0) * arg_239_2
end

function aa_setup(arg_240_0)
  local var_240_0 = entity.get_local_player()

  if var_240_0 == nil then
    return
  end

  if player_state() == "Manuals" and var_0_99[10].enable2:get() then
    var_0_162 = 10
  elseif player_state() == "Freestand" and var_0_99[9].enable2:get() then
    var_0_162 = 9
  elseif player_state() == "Crouch+" and var_0_99[8].enable2:get() then
    var_0_162 = 8
  elseif player_state() == "Crouch" and var_0_99[7].enable2:get() then
    var_0_162 = 7
  elseif player_state() == "Aerobic+" and var_0_99[6].enable2:get() then
    var_0_162 = 6
  elseif player_state() == "Aerobic" and var_0_99[5].enable2:get() then
    var_0_162 = 5
  elseif player_state() == "Moving" and var_0_99[4].enable2:get() then
    var_0_162 = 4
  elseif player_state() == "Walking" and var_0_99[3].enable2:get() then
    var_0_162 = 3
  elseif player_state() == "Standing" and var_0_99[2].enable2:get() then
    var_0_162 = 2
  else
    var_0_162 = 1
  end

  var_0_163 = arg_240_0.in_jump == 1

  local var_240_1 = {
    entity.get_prop(var_240_0, "m_vecVelocity")
  }

  if var_0_30.sqrt(var_240_1[1]^2 + var_240_1[2]^2) < 5 then
    arg_240_0.in_speed = 1
  end

  local var_240_2 = is_defensive_active(var_240_0)
  local var_240_3 = var_0_197(var_240_0)
  local var_240_4 = var_0_196(var_240_0) and var_0_32.get(var_0_85.freestand[1]) and var_0_32.get(var_0_85.freestand[2])

  if not var_0_32.get(var_0_85.enabled) then
    var_0_32.set(var_0_85.enabled, true)

    return
  end

  var_0_32.set(var_0_87.flenabled[2], "Always on")
  var_0_32.set(var_0_85.roll[1], 0)
  var_0_168()

  local var_240_5 = 0

  if var_0_88.antiaim.manuals_settings:get() == "Default" then
    var_240_5 = 180
  elseif var_0_88.antiaim.manuals_settings:get() == "Static" then
    var_240_5 = 0
  elseif var_0_88.antiaim.manuals_settings:get() == "Jitter" then
    var_240_5 = var_0_30.random(-180, 180)
  end

  local var_240_6 = 0

  if var_0_88.antiaim.freestand_settings:get() == "Default" then
    var_240_6 = 180
  elseif var_0_88.antiaim.freestand_settings:get() == "Static" then
    var_240_6 = 0
  elseif var_0_88.antiaim.freestand_settings:get() == "Jitter" then
    var_240_6 = var_0_30.random(-180, 180)
  end

  if globals.tickcount() % var_0_99[var_0_162].defensive_jitter_speed:get() == 1 then
    var_0_191 = not var_0_191
  end

  if globals.tickcount() % var_0_99[var_0_162].jitter_speed2:get() == 1 then
    var_0_192 = not var_0_192
  end

  local var_240_7 = var_0_99[var_0_162].yaw_delay2:get()
  local var_240_8 = var_0_99[var_0_162].Random_delay:get()
  local var_240_9 = 0

  if var_0_99[var_0_162].hold_delay:get() > 1 then
    var_240_7 = globals.tickcount() % 50 > var_0_99[var_0_162].hold_delay:get() * 4 and 1 or var_0_99[var_0_162].yaw_delay2:get()
  end

  local var_240_10 = true

  if var_0_99[var_0_162].adaptive_def:get() then
    var_240_10 = not var_240_2
  end

  if var_240_10 and globals.tickcount() > var_0_158 + var_240_7 and var_240_9 == var_0_30.random(var_240_9, var_240_8) then
    if arg_240_0.chokedcommands == 0 then
      var_0_159 = not var_0_159
      var_0_158 = globals.tickcount()
    end
  elseif globals.tickcount() < var_0_158 then
    var_0_158 = globals.tickcount()
  end

  if is_vulnerable() then
    if var_0_175 then
      var_0_175 = false
      var_0_174 = true

      var_0_33.set_event_callback("setup_command", var_0_177)
    end

    if globals.tickcount() % 10 == 9 then
      var_0_176()
      var_0_33.unset_event_callback("setup_command", var_0_177)
    end
  else
    var_0_175 = true
    var_0_174 = false
  end

  var_0_32.set(var_0_85.fsbodyyaw, false)
  var_0_32.set(var_0_85.pitch[1], "Default")

  if var_0_160 ~= 0 then
    var_0_32.set(var_0_85.yawbase, "Local view")
  else
    var_0_32.set(var_0_85.yawbase, var_0_88.antiaim.yaw_base:get())
  end

  var_0_32.set(var_0_85.yaw[1], "180")
  var_0_32.set(var_0_85.yawjitter[1], "Off")
  var_0_32.set(var_0_85.yawjitter[2], 0)

  local var_240_11 = var_0_99[var_0_162].mod_type2
  local var_240_12 = {
    l = var_0_99[var_0_162].ofs_1:get(),
    r = var_0_99[var_0_162].ofs_2:get()
  }
  local var_240_13 = var_0_99[var_0_162].spna:get()
  local var_240_14 = var_0_99[var_0_162].rana:get()
  local var_240_15 = 0

  if var_240_11:get("Offset") then
    var_240_15 = var_240_15 + (var_0_159 and var_240_12.l or var_240_12.r)
  end

  if var_240_11:get("Spin") then
    var_240_15 = var_240_15 + (var_0_159 and var_0_30.lerping(-var_240_13, 0, globals.curtime() * 3 % 2 - 1) * 0.5 or var_0_30.lerping(var_240_13, 0, globals.curtime() * 3 % 2 - 1) * 0.5)
  end

  if var_240_11:get("Random") then
    var_240_15 = var_240_15 + var_0_30.random(var_0_159 and -var_240_14 or var_240_14) * 0.5
  end

  if var_0_99[var_0_162].yaw_delay2:get() > 0 and var_0_99[var_0_162].body_yaw_type2:get() == "Jitter" then
    var_0_32.set(var_0_85.bodyyaw[1], "Static")

    if var_0_160 ~= 0 and not var_0_99[10].enable2:get() then
      var_0_32.set(var_0_85.bodyyaw[2], var_240_5)
    elseif var_240_4 and not var_0_99[9].enable2:get() then
      var_0_32.set(var_0_85.bodyyaw[2], var_240_6)
    else
      var_0_32.set(var_0_85.bodyyaw[2], var_0_159 and -var_0_99[var_0_162].body_slider2:get() * 3 or var_0_99[var_0_162].body_slider2:get() * 3)
    end

    var_0_157 = var_240_15
  else
    var_0_32.set(var_0_85.bodyyaw[1], var_0_99[var_0_162].body_yaw_type2:get())
    var_0_32.set(var_0_85.bodyyaw[2], var_0_99[var_0_162].body_slider2:get() * 3)

    var_0_157 = var_240_15
  end

  local var_240_16 = 0

  if var_240_2 and var_0_99[var_0_162].enable:get() and var_0_160 == 0 then
    var_0_32.set(var_0_85.pitch[1], "Custom")

    if var_0_99[var_0_162].pitch_type:get() == "Static" then
      var_240_16 = var_0_99[var_0_162].pitch_slider1:get()
    elseif var_0_99[var_0_162].pitch_type:get() == "Random" then
      var_240_16 = var_0_33.random_int(var_0_99[var_0_162].pitch_slider:get(), var_0_99[var_0_162].pitch_slider2:get())
    elseif var_0_99[var_0_162].pitch_type:get() == "Random Ticks" then
      if globals.tickcount() % 3 == 0 then
        var_240_16 = 89
      elseif globals.tickcount() % 3 == 1 then
        var_240_16 = 0
      elseif globals.tickcount() % 3 == 2 then
        var_240_16 = -89
      end
    elseif var_0_99[var_0_162].pitch_type:get() == "Jitter" then
      local var_240_17 = var_0_99[var_0_162].pitch_jitter:get()
      local var_240_18 = var_0_99[var_0_162].pitch_jitter2:get()

      if globals.tickcount() % 3 == 1 then
        var_240_16 = var_240_17
      else
        var_240_16 = var_240_18
      end
    elseif var_0_99[var_0_162].pitch_type:get() == "Spin" then
      var_240_16 = var_0_172(var_0_99[var_0_162].pitch_speed:get(), 1)
    elseif var_0_99[var_0_162].pitch_type:get() == "Spin[MOD]" then
      var_240_16 = var_0_173()
    elseif var_0_99[var_0_162].pitch_type:get() == "Random Static" then
      local var_240_19 = var_0_99[var_0_162].pitch_slider_static:get()
      local var_240_20 = var_0_99[var_0_162].pitch_slider2_static:get()
      local var_240_21 = var_0_99[var_0_162].pitch_slow_def:get()

      var_240_16 = var_0_181(var_240_19, var_240_20, var_240_21 / 10)
    else
      var_240_16 = 89
    end

    var_0_32.set(var_0_85.pitch[2], var_240_16)
  end

  var_0_32.set(var_0_85.fakelag_enable, var_0_88.antiaim.enabled:get())
  var_0_32.set(var_0_87.fakelag_amount, var_0_88.antiaim.amount:get())
  var_0_32.set(var_0_87.fakelag_limit, var_0_88.antiaim.limit:get())
  var_0_32.set(var_0_87.fakelag_variance, var_0_88.antiaim.variance:get())

  if var_240_2 and var_0_160 == 0 and var_0_99[var_0_162].enable:get() then
    if var_0_99[var_0_162].defense_aa_type:get() == "Spin" then
      local var_240_22 = var_0_171(-var_0_99[var_0_162].defensive_speed:get(), 1)

      var_0_157 = var_0_30.normalize_yaw(var_240_22)
    elseif var_0_99[var_0_162].defense_aa_type:get() == "Random" then
      var_0_157 = var_0_30.random(-var_0_99[var_0_162].defensive_random:get() * 0.5, var_0_99[var_0_162].defensive_random:get() * 0.5)
    elseif var_0_99[var_0_162].defense_aa_type:get() == "Static" then
      var_0_157 = var_0_99[var_0_162].defense_aa_slider:get()
    elseif var_0_99[var_0_162].defense_aa_type:get() == "Static [FS]" then
      var_0_157 = var_0_99[var_0_162].defense_aa_slider:get() * var_240_3
    elseif var_0_99[var_0_162].defense_aa_type:get() == "Skitter" then
      var_0_32.set(var_0_85.yawjitter[1], "Skitter")
      var_0_32.set(var_0_85.yawjitter[2], var_0_99[var_0_162].defensive_skitter:get() * 0.5)
    elseif var_0_99[var_0_162].defense_aa_type:get() == "3-way" then
      var_0_157 = globals.tickcount() % 3 == 0 and var_0_33.random_int(-110, -90) or globals.tickcount() % 3 == 1 and var_0_33.random_int(90, 120) or globals.tickcount() % 3 == 2 and var_0_33.random_int(-180, -150) or 0
    elseif var_0_99[var_0_162].defense_aa_type:get() == "5-way" then
      var_0_157 = globals.tickcount() % 5 == 0 and var_0_33.random_int(-90, -75) or globals.tickcount() % 5 == 1 and var_0_33.random_int(-45, -30) or globals.tickcount() % 5 == 2 and var_0_33.random_int(-180, -160) or globals.tickcount() % 5 == 3 and var_0_33.random_int(45, 60) or globals.tickcount() % 5 == 3 and var_0_33.random_int(90, 110) or 0
    end

    if var_0_99[var_0_162].defense_aa_type:get() == "Jitter" then
      var_0_157 = var_0_191 and var_0_99[var_0_162].defensive_jitter:get() * 0.5 or -var_0_99[var_0_162].defensive_jitter:get() * 0.5
    elseif var_0_99[var_0_162].defense_aa_type:get() == "Jitter[L/R]" then
      var_0_157 = var_0_192 and var_0_99[var_0_162].defensive_left:get() or var_0_99[var_0_162].defensive_right:get()
    end

    if var_0_99[var_0_162].defense_aa_type:get() ~= "Off" then
      var_0_32.set(var_0_85.bodyyaw[1], "Static")
      var_0_32.set(var_0_85.bodyyaw[2], 0)
    end
  end

  if var_240_2 and var_0_99[var_0_162].enable:get() and var_0_160 == 0 and var_0_99[var_0_162].adaptive_desync:get() then
    if var_0_99[var_0_162].defense_aa_type:get() == "Spin" then
      local var_240_23 = var_0_171(-var_0_99[var_0_162].defensive_speed:get(), 1)

      var_0_157 = var_0_30.normalize_yaw(var_240_23)
    elseif var_0_99[var_0_162].defense_aa_type:get() == "Random" then
      var_0_157 = var_0_30.random(-var_0_99[var_0_162].defensive_random:get() * 0.5, var_0_99[var_0_162].defensive_random:get() * 0.5)
    elseif var_0_99[var_0_162].defense_aa_type:get() == "Static" then
      var_0_157 = var_0_99[var_0_162].defense_aa_slider:get()
    elseif var_0_99[var_0_162].defense_aa_type:get() == "Static [FS]" then
      var_0_157 = var_0_99[var_0_162].defense_aa_slider:get() * var_240_3
    elseif var_0_99[var_0_162].defense_aa_type:get() == "Jitter" then
      var_0_157 = var_0_191 and var_0_99[var_0_162].defensive_jitter:get() * 0.5 or -var_0_99[var_0_162].defensive_jitter:get() * 0.5
    elseif var_0_99[var_0_162].defense_aa_type:get() == "Jitter[L/R]" then
      var_0_157 = var_0_192 and var_0_99[var_0_162].defensive_left:get() or var_0_99[var_0_162].defensive_right:get()
    elseif var_0_99[var_0_162].defense_aa_type:get() == "3-way" then
      var_0_157 = globals.tickcount() % 3 == 0 and var_0_33.random_int(-110, -90) or globals.tickcount() % 3 == 1 and var_0_33.random_int(90, 120) or globals.tickcount() % 3 == 2 and var_0_33.random_int(-180, -150) or 0
    elseif var_0_99[var_0_162].defense_aa_type:get() == "5-way" then
      var_0_157 = globals.tickcount() % 5 == 0 and var_0_33.random_int(-90, -75) or globals.tickcount() % 5 == 1 and var_0_33.random_int(-45, -30) or globals.tickcount() % 5 == 2 and var_0_33.random_int(-180, -160) or globals.tickcount() % 5 == 3 and var_0_33.random_int(45, 60) or globals.tickcount() % 5 == 3 and var_0_33.random_int(90, 110) or 0
    elseif var_0_99[var_0_162].defense_aa_type:get() == "Skitter" then
      var_0_32.set(var_0_85.yawjitter[1], "Skitter")
      var_0_32.set(var_0_85.yawjitter[2], var_0_99[var_0_162].defensive_skitter:get() * 0.5)
    end

    if var_0_99[var_0_162].defense_aa_type:get() ~= "Off" then
      var_0_32.set(var_0_85.bodyyaw[1], "Static")
      var_0_32.set(var_0_85.bodyyaw[2], 0)
    end
  end

  local var_240_24 = var_0_174

  if var_0_99[var_0_162].force_lc:get() then
    var_240_24 = true
  end

  arg_240_0.force_defensive = var_240_24

  local var_240_25 = var_0_160 == 0 and var_0_30.normalize_yaw(var_0_157) or var_0_30.normalize_yaw(var_0_160)

  var_0_32.set(var_0_85.yaw[2], var_240_25)

  local var_240_26 = entity.get_players(true)

  if var_0_88.antiaim.features:get("Warmup AA") and entity.get_prop(entity.get_game_rules(), "m_bWarmupPeriod") == 1 then
    var_0_32.set(var_0_85.fakelag_enable, false)
    var_0_32.set(var_0_85.yaw[1], "Spin")
    var_0_32.set(var_0_85.yaw[2], 55)
    var_0_32.set(var_0_85.yawjitter[1], "Off")
    var_0_32.set(var_0_85.yawjitter[2], 0)
    var_0_32.set(var_0_85.bodyyaw[1], "Static")
    var_0_32.set(var_0_85.bodyyaw[2], 1)
    var_0_32.set(var_0_85.pitch[1], "Custom")
    var_0_32.set(var_0_85.pitch[2], 0)
  end

  local var_240_27 = entity.get_player_weapon(var_240_0)
  local var_240_28, var_240_29, var_240_30 = entity.get_prop(var_240_0, "m_vecOrigin")
  local var_240_31 = entity.get_prop(var_240_0, "m_fFlags")
  local var_240_32 = var_0_12.band(var_240_31, 1) == 0 or arg_240_0.in_jump == 1
  local var_240_33 = entity.get_prop(var_240_0, "m_flDuckAmount") > 0.7

  if var_0_88.antiaim.features:get("Safe head") and var_0_160 == 0 and var_240_27 ~= nil then
    if var_0_88.antiaim.safe:get("Knife on Air + Duck") and var_240_32 and var_240_33 and entity.get_classname(var_240_27) == "CKnife" then
      var_0_32.set(var_0_85.pitch[1], "Down")
      var_0_32.set(var_0_85.yawjitter[1], "Off")
      var_0_32.set(var_0_85.yaw[1], "180")
      var_0_32.set(var_0_85.yaw[2], 15)
      var_0_32.set(var_0_85.bodyyaw[1], "static")
      var_0_32.set(var_0_85.bodyyaw[2], 0)
    end

    if var_0_88.antiaim.safe:get("Taser on Air + Duck") and var_240_32 and var_240_33 and entity.get_classname(var_240_27) == "CWeaponTaser" then
      var_0_32.set(var_0_85.pitch[1], "Down")
      var_0_32.set(var_0_85.yawjitter[1], "Off")
      var_0_32.set(var_0_85.yaw[1], "180")
      var_0_32.set(var_0_85.yaw[2], 0)
      var_0_32.set(var_0_85.bodyyaw[1], "static")
      var_0_32.set(var_0_85.bodyyaw[2], 0)
    end

    if var_0_88.antiaim.safe:get("High distance") then
      local var_240_34 = var_0_33.current_threat()

      if not var_240_34 or entity.is_dormant(var_240_34) then
        return
      end

      if var_240_30 > ({
        entity.get_origin(var_240_34)
      })[3] + 55 and (var_0_10(entity.get_prop(me, "m_vecVelocity")):length2d() <= 60 or arg_240_0.in_duck == 1) then
        var_0_32.set(var_0_85.pitch[1], "Down")
        var_0_32.set(var_0_85.yawjitter[1], "Off")
        var_0_32.set(var_0_85.yaw[1], "180")
        var_0_32.set(var_0_85.yaw[2], 5)
        var_0_32.set(var_0_85.bodyyaw[1], "static")
        var_0_32.set(var_0_85.bodyyaw[2], 0)
      end
    end
  end

  if var_0_88.antiaim.features:get("Avoid Backstab") and var_0_198() then
    var_0_32.set(var_0_85.yaw[2], 180)
    var_0_32.set(var_0_85.yawbase, "At targets")
  end

  if var_0_88.antiaim.features:get("Onshot AA Fix") then
    if var_0_32.get(var_0_85.os[1]) and var_0_32.get(var_0_85.os[2]) and not var_0_32.get(var_0_85.dt[1]) and var_0_32.get(var_0_85.dt[2]) and not var_0_32.get(var_0_85.fakeduck) then
      if not hsSaved then
        hsValue = var_0_32.get(var_0_85.fakeLag[1])
        hsSaved = true
      end

      var_0_32.set(var_0_85.fakeLag[1], 1)
    elseif hsSaved then
      var_0_32.set(var_0_85.fakeLag[1], hsValue)

      hsSaved = false
    end
  end
end

local var_0_199 = false

function break_legs(arg_241_0)
  if not var_0_88.Miscellaneous.animation:get() then
    return
  end

  var_0_199 = arg_241_0.in_jump == 0

  if var_0_88.Miscellaneous.m_elements:get("Leg breaker") then
    if var_0_88.Miscellaneous.typebr:get() == "Never slide" then
      var_0_32.set(var_0_85.other_legmovement, arg_241_0.command_number % 3 == 0 and "Always slide" or "Never slide")
    else
      var_0_32.set(var_0_85.other_legmovement, arg_241_0.command_number % 3 == 0 and "Never slide" or "Always slide")
    end
  elseif var_0_88.Miscellaneous.typebr:get() == "Never slide" then
    var_0_32.set(var_0_85.other_legmovement, "Never slide")
  else
    var_0_32.set(var_0_85.other_legmovement, "Always slide")
  end
end

function anim_breaker()
  local var_242_0 = entity.get_local_player()

  if not var_242_0 or not entity.is_alive(var_242_0) then
    return
  end

  local var_242_1 = var_0_6.new(var_242_0)
  local var_242_2 = var_242_1:get_anim_state()

  if not var_242_2 then
    return
  end

  if not var_0_88.Miscellaneous.animation:get() then
    return
  end

  local var_242_3

  var_242_3 = entity.get_prop(var_242_0, "m_flDuckAmount") > 0.7

  if var_0_88.Miscellaneous.m_elements:get("Slide elements") then
    if var_0_88.Miscellaneous.slide_elements:get("While walking") then
      entity.set_prop(var_242_0, "m_flPoseParameter", 0, var_0_20.MOVE_BLEND_WALK)
    end

    if var_0_88.Miscellaneous.slide_elements:get("While running") then
      entity.set_prop(var_242_0, "m_flPoseParameter", 0, var_0_20.MOVE_BLEND_RUN)
    end

    if var_0_88.Miscellaneous.slide_elements:get("While crouching") then
      entity.set_prop(var_242_0, "m_flPoseParameter", 0, var_0_20.MOVE_BLEND_CROUCH)
    end
  end

  if var_0_88.Miscellaneous.m_elements:get("Break legs while in air") then
    local var_242_4 = var_0_88.Miscellaneous.state:get("While in air") and var_0_88.Miscellaneous.m_elements:get("Earthquake") and var_0_30.abs(var_0_30.sin(globals.realtime() * var_0_88.Miscellaneous.speedearth:get())) * var_0_88.Miscellaneous.air_element:get() / 100 or var_0_88.Miscellaneous.air_element:get() / 100

    entity.set_prop(var_242_0, "m_flPoseParameter", var_242_4, 6)
  end

  if var_0_88.Miscellaneous.m_elements:get("Quick peek assist") then
    local var_242_5 = var_242_1:get_anim_overlay(7)

    if not var_242_5 then
      return
    end

    if var_0_88.Miscellaneous.typebr:get() == "Never slide" then
      var_242_5.weight = 0
    end
  end

  if var_0_88.Miscellaneous.m_elements:get("Break legs while landing") then
    local var_242_6 = var_0_88.Miscellaneous.typebr:get() == "Never slide" and 7 or 0
    local var_242_7 = var_242_6 == 0 and globals.tickcount() % 3 == 0 and var_0_88.Miscellaneous.break_land_value:get() / 10 or 7
    local var_242_8 = var_242_6 == 7 and globals.tickcount() % 3 == 0 and var_0_88.Miscellaneous.break_land_value:get() / 10 or 1
    local var_242_9 = var_0_88.Miscellaneous.break_land_value:get() == 0 and var_0_30.abs(var_0_30.sin(globals.realtime() * var_0_88.Miscellaneous.speedearth:get())) * var_0_33.random_float(0, 1) or var_0_30.abs(var_0_30.sin(globals.realtime() * var_0_88.Miscellaneous.speedearth:get())) * var_0_88.Miscellaneous.break_land_value:get() / 10

    if var_0_88.Miscellaneous.state:get("While landing") and var_0_88.Miscellaneous.m_elements:get("Earthquake") then
      entity.set_prop(var_242_0, "m_flPoseParameter", var_242_9, var_242_6)
    elseif var_0_88.Miscellaneous.break_land_value:get() == 10 then
      entity.set_prop(var_242_0, "m_flPoseParameter", 0, var_242_6)
    else
      entity.set_prop(var_242_0, "m_flPoseParameter", var_242_8, var_242_7)
    end
  end

  if var_0_88.Miscellaneous.m_elements:get("Adjust body lean") then
    local var_242_10 = var_242_1:get_anim_overlay(12)

    if not var_242_10 then
      return
    end

    local var_242_11 = entity.get_prop(var_242_0, "m_vecVelocity[0]")

    if var_0_30.abs(var_242_11) >= 3 then
      var_242_10.weight = var_0_88.Miscellaneous.state:get("Adjust body lean") and var_0_88.Miscellaneous.m_elements:get("Earthquake") and var_0_30.abs(var_0_30.sin(globals.realtime() * var_0_88.Miscellaneous.speedearth:get())) * var_0_88.Miscellaneous.body_lean_value:get() / 100 or var_0_88.Miscellaneous.body_lean_value:get() / 100
    end
  end

  if var_0_88.Miscellaneous.m_elements:get("Reset pitch on land") then
    if not var_242_2.hit_in_ground_animation or not var_0_199 then
      return
    end

    entity.set_prop(var_242_0, "m_flPoseParameter", 0.5, var_0_20.BODY_PITCH)
  end
end

var_0_33.set_event_callback("shutdown", function()
  var_0_33.set_cvar("r_aspectratio", 0)
end)

function var_0_200(arg_244_0)
  if arg_244_0 and var_0_88.Miscellaneous.aspect_ratio:get() then
    cvar.r_aspectratio:set_float(arg_244_0)
  else
    cvar.r_aspectratio:set_float(0)
  end
end

function var_0_201()
  local var_245_0 = var_0_88.Miscellaneous.aspect_ratio_slider:get() / 100
  local var_245_1 = var_0_37.new("aspect_ratio", var_245_0, 0.07)

  var_0_200(var_245_1)
end

function var_0_202()
  local var_246_0 = entity.get_local_player()
  local var_246_1 = var_0_88.Miscellaneous.vS:get()
  local var_246_2 = var_0_88.Miscellaneous.xS:get() / 10
  local var_246_3 = entity.get_prop(var_246_0, "m_vecVelocity[0]")
  local var_246_4 = 0

  if var_246_0 and var_0_30.abs(var_246_3) >= 3 then
    var_246_4 = var_0_88.Miscellaneous.CS_S:get() and var_0_30.abs(var_0_30.sin(globals.realtime() * 3)) * 3 or 0
  end

  local var_246_5 = var_0_88.Miscellaneous.yS:get() / 10 + var_246_4
  local var_246_6 = var_0_88.Miscellaneous.zS:get() / 10
  local var_246_7 = var_0_37.new("viewmodel_fov", var_0_88.Miscellaneous.viewmodel:get() and var_246_1 or 68, 0.07)
  local var_246_8 = var_0_37.new("viewmodel_x", var_0_88.Miscellaneous.viewmodel:get() and var_246_2 or 2.5, 0.07)
  local var_246_9 = var_0_37.new("viewmodel_y", var_0_88.Miscellaneous.viewmodel:get() and var_246_5 or 0, 0.07)
  local var_246_10 = var_0_37.new("viewmodel_z", var_0_88.Miscellaneous.viewmodel:get() and var_246_6 or -1.5, 0.07)
  local var_246_11 = entity.get_prop(var_246_0, "m_bIsScoped") == 1

  if var_0_88.Miscellaneous.viewchange:get() and var_246_11 then
    var_246_7 = var_0_37.new("viewmodel_fov", 58, 0.07)
    var_246_8 = var_0_37.new("viewmodel_x", -3, 0.07)
    var_246_9 = var_0_37.new("viewmodel_y", 1 + var_246_4, 0.07)
    var_246_10 = var_0_37.new("viewmodel_z", -4, 0.07)
  end

  var_0_33.set_cvar("viewmodel_fov", var_246_7)
  var_0_33.set_cvar("viewmodel_offset_x", var_246_8)
  var_0_33.set_cvar("viewmodel_offset_y", var_246_9)
  var_0_33.set_cvar("viewmodel_offset_z", var_246_10)
end

function var_0_203()
  local var_247_0 = var_0_88.Miscellaneous.third_person_slider:get()
  local var_247_1 = var_0_37.new("c_distant", var_0_88.Miscellaneous.third_person:get() and var_247_0 or 100, 0.07)

  var_0_33.set_cvar("c_mindistance", var_247_1)
  var_0_33.set_cvar("c_maxdistance", var_247_1)
end

function var_0_204()
  var_0_32.set(var_0_85.scope_overlay, false)

  local var_248_0 = var_0_88.Miscellaneous.scope_gap:get() * var_0_16 / 1080
  local var_248_1 = var_0_88.Miscellaneous.scope_size:get() * var_0_16 / 1080
  local var_248_2 = 0.1
  local var_248_3 = {
    var_0_88.Miscellaneous.scope_color:get()
  }
  local var_248_4 = entity.get_local_player()
  local var_248_5 = entity.get_player_weapon(var_248_4)
  local var_248_6 = entity.get_prop(var_248_5, "m_zoomLevel")
  local var_248_7 = entity.get_prop(var_248_4, "m_bIsScoped") == 1
  local var_248_8

  var_248_8 = entity.get_prop(var_248_4, "m_bResumeZoom") == 1

  if entity.is_alive(var_248_4) then
    local var_248_9

    var_248_9 = var_248_5 ~= nil and var_248_6 ~= nil
  end

  local var_248_10 = var_248_7

  if var_0_88.Miscellaneous.scope_overlay:get() then
    local var_248_11 = var_0_37.new("overlay_alpha", var_248_10 and 1 or 0, var_0_88.Miscellaneous.scope_animation:get("Alpha") and 0.05 or 2)
    local var_248_12 = var_0_37.new("scope_overlay", var_248_10 and 1 or 0, var_0_88.Miscellaneous.scope_animation:get("Overlay") and 0.05 or 2)

    if not var_0_88.Miscellaneous.scope_disablers:get("Left") then
      renderer.gradient(var_0_15 / 2 - var_248_12 * var_248_1 + 2, var_0_16 / 2, var_248_12 * var_248_1 - var_248_12 * var_248_0, 1, var_248_3[1], var_248_3[2], var_248_3[3], 0, var_248_3[1], var_248_3[2], var_248_3[3], var_248_11 * var_248_3[4], true)
    end

    if not var_0_88.Miscellaneous.scope_disablers:get("Right") then
      renderer.gradient(var_0_15 / 2 - 2 + var_248_12 * var_248_0, var_0_16 / 2, var_248_12 * var_248_1 - var_248_12 * var_248_0, 1, var_248_3[1], var_248_3[2], var_248_3[3], var_248_11 * var_248_3[4], var_248_3[1], var_248_3[2], var_248_3[3], 0, true)
    end

    if not var_0_88.Miscellaneous.scope_disablers:get("Top") then
      renderer.gradient(var_0_15 / 2, var_0_16 / 2 - var_248_12 * var_248_1 + 2, 1, var_248_12 * var_248_1 - var_248_12 * var_248_0, var_248_3[1], var_248_3[2], var_248_3[3], 0, var_248_3[1], var_248_3[2], var_248_3[3], var_248_11 * var_248_3[4], false)
    end

    if not var_0_88.Miscellaneous.scope_disablers:get("Bottom") then
      renderer.gradient(var_0_15 / 2, var_0_16 / 2 + var_248_12 * var_248_0, 1, var_248_12 * var_248_1 - var_248_12 * var_248_0, var_248_3[1], var_248_3[2], var_248_3[3], var_248_11 * var_248_3[4], var_248_3[1], var_248_3[2], var_248_3[3], 0, false)
    end
  else
    local var_248_13 = var_0_37.new("scope_overlay", var_248_10 and 1 or 0, 0.1)

    renderer.rectangle(0, var_0_16 / 2, var_0_15, 1, 0, 0, 0, var_248_13 * 255)
    renderer.rectangle(var_0_15 / 2, 0, 1, var_0_16, 0, 0, 0, var_248_13 * 255)
  end
end

function g_paint_ui()
  var_0_32.set(var_0_85.scope_overlay, true)
end

function var_0_17.rec(arg_250_0, arg_250_1, arg_250_2, arg_250_3, arg_250_4, arg_250_5)
  arg_250_4 = var_0_30.min(arg_250_0 / 2, arg_250_1 / 2, arg_250_4)

  local var_250_0, var_250_1, var_250_2, var_250_3 = unpack(arg_250_5)

  renderer.rectangle(arg_250_0, arg_250_1 + arg_250_4, arg_250_2, arg_250_3 - arg_250_4 * 2, var_250_0, var_250_1, var_250_2, var_250_3)
  renderer.rectangle(arg_250_0 + arg_250_4, arg_250_1, arg_250_2 - arg_250_4 * 2, arg_250_4, var_250_0, var_250_1, var_250_2, var_250_3)
  renderer.rectangle(arg_250_0 + arg_250_4, arg_250_1 + arg_250_3 - arg_250_4, arg_250_2 - arg_250_4 * 2, arg_250_4, var_250_0, var_250_1, var_250_2, var_250_3)
  renderer.circle(arg_250_0 + arg_250_4, arg_250_1 + arg_250_4, var_250_0, var_250_1, var_250_2, var_250_3, arg_250_4, 180, 0.25)
  renderer.circle(arg_250_0 - arg_250_4 + arg_250_2, arg_250_1 + arg_250_4, var_250_0, var_250_1, var_250_2, var_250_3, arg_250_4, 90, 0.25)
  renderer.circle(arg_250_0 - arg_250_4 + arg_250_2, arg_250_1 - arg_250_4 + arg_250_3, var_250_0, var_250_1, var_250_2, var_250_3, arg_250_4, 0, 0.25)
  renderer.circle(arg_250_0 + arg_250_4, arg_250_1 - arg_250_4 + arg_250_3, var_250_0, var_250_1, var_250_2, var_250_3, arg_250_4, -90, 0.25)
end

function var_0_17.rec_outline(arg_251_0, arg_251_1, arg_251_2, arg_251_3, arg_251_4, arg_251_5, arg_251_6)
  arg_251_4 = var_0_30.min(arg_251_2 / 2, arg_251_3 / 2, arg_251_4)

  local var_251_0, var_251_1, var_251_2, var_251_3 = unpack(arg_251_6)

  if arg_251_4 == 1 then
    renderer.rectangle(arg_251_0, arg_251_1, arg_251_2, arg_251_5, var_251_0, var_251_1, var_251_2, var_251_3)
    renderer.rectangle(arg_251_0, arg_251_1 + arg_251_3 - arg_251_5, arg_251_2, arg_251_5, var_251_0, var_251_1, var_251_2, var_251_3)
  else
    renderer.rectangle(arg_251_0 + arg_251_4, arg_251_1, arg_251_2 - arg_251_4 * 2, arg_251_5, var_251_0, var_251_1, var_251_2, var_251_3)
    renderer.rectangle(arg_251_0 + arg_251_4, arg_251_1 + arg_251_3 - arg_251_5, arg_251_2 - arg_251_4 * 2, arg_251_5, var_251_0, var_251_1, var_251_2, var_251_3)
    renderer.rectangle(arg_251_0, arg_251_1 + arg_251_4, arg_251_5, arg_251_3 - arg_251_4 * 2, var_251_0, var_251_1, var_251_2, var_251_3)
    renderer.rectangle(arg_251_0 + arg_251_2 - arg_251_5, arg_251_1 + arg_251_4, arg_251_5, arg_251_3 - arg_251_4 * 2, var_251_0, var_251_1, var_251_2, var_251_3)
    renderer.circle_outline(arg_251_0 + arg_251_4, arg_251_1 + arg_251_4, var_251_0, var_251_1, var_251_2, var_251_3, arg_251_4, 180, 0.25, arg_251_5)
    renderer.circle_outline(arg_251_0 + arg_251_4, arg_251_1 + arg_251_3 - arg_251_4, var_251_0, var_251_1, var_251_2, var_251_3, arg_251_4, 90, 0.25, arg_251_5)
    renderer.circle_outline(arg_251_0 + arg_251_2 - arg_251_4, arg_251_1 + arg_251_4, var_251_0, var_251_1, var_251_2, var_251_3, arg_251_4, -90, 0.25, arg_251_5)
    renderer.circle_outline(arg_251_0 + arg_251_2 - arg_251_4, arg_251_1 + arg_251_3 - arg_251_4, var_251_0, var_251_1, var_251_2, var_251_3, arg_251_4, 0, 0.25, arg_251_5)
  end
end

function var_0_17.glow_module(arg_252_0, arg_252_1, arg_252_2, arg_252_3, arg_252_4, arg_252_5, arg_252_6, arg_252_7)
  local var_252_0 = 1
  local var_252_1 = 1
  local var_252_2, var_252_3, var_252_4, var_252_5 = unpack(arg_252_6)

  if arg_252_7 then
    var_0_17.rec(arg_252_0, arg_252_1, arg_252_2, arg_252_3 + 1, arg_252_5, arg_252_7)
  end

  for iter_252_0 = 0, arg_252_4 do
    if var_252_5 * (iter_252_0 / arg_252_4)^1 > 5 then
      local var_252_6 = {
        var_252_2,
        var_252_3,
        var_252_4,
        var_252_5 * (iter_252_0 / arg_252_4)^2
      }

      var_0_17.rec_outline(arg_252_0 + (iter_252_0 - arg_252_4 - var_252_1) * var_252_0, arg_252_1 + (iter_252_0 - arg_252_4 - var_252_1) * var_252_0, arg_252_2 - (iter_252_0 - arg_252_4 - var_252_1) * var_252_0 * 2, arg_252_3 + 1 - (iter_252_0 - arg_252_4 - var_252_1) * var_252_0 * 2, arg_252_5 + var_252_0 * (arg_252_4 - iter_252_0 + var_252_1), var_252_0, var_252_6)
    end
  end
end

function var_0_205(arg_253_0)
  local var_253_0 = entity.get_local_player()
  local var_253_1 = var_0_88.Miscellaneous.zoom_anim:get()
  local var_253_2 = var_0_32.get(var_0_85.fov)
  local var_253_3 = var_0_32.get(var_0_85.zoom) * 0.5
  local var_253_4 = entity.get_player_weapon(var_253_0)

  if not var_253_4 then
    return
  end

  local var_253_5 = entity.get_prop(var_253_4, "m_zoomLevel")
  local var_253_6 = entity.get_prop(var_253_0, "m_bIsScoped") == 1
  local var_253_7 = 0
  local var_253_8 = var_253_6 and (var_253_5 == 1 and 1 or 2) or 0
  local var_253_9 = var_0_37.new("zooming", var_253_1 and var_253_6 and var_253_8 or 0, 0.07)
  local var_253_10 = var_0_37.new("foving", var_253_2, 0.07)

  if var_253_1 then
    arg_253_0.fov = var_253_10 - var_253_3 * var_253_9
  end

  if var_0_88.Miscellaneous.cam_anim:get("Yaw") then
    arg_253_0.yaw = var_0_37.new("zyaw", arg_253_0.yaw, 0.07)
  end

  if var_0_88.Miscellaneous.cam_anim:get("Pitch") then
    arg_253_0.pitch = var_0_37.new("zpitch", arg_253_0.pitch, 0.07)
  end

  if var_0_88.Miscellaneous.cam_anim:get("X") then
    arg_253_0.x = var_0_37.new("zx", arg_253_0.x, 0.07)
  end

  if var_0_88.Miscellaneous.cam_anim:get("Y") then
    arg_253_0.y = var_0_37.new("zy", arg_253_0.y, 0.07)
  end

  if var_0_88.Miscellaneous.cam_anim:get("Z") then
    arg_253_0.z = var_0_37.new("zz", arg_253_0.z, 0.07)
  end
end

local var_0_206 = var_0_33.find_signature("client_panorama.dll", "\x8B5\xCC\xCC\xCC\xCC\xFF\x10\x0F\xB7\xC0")
local var_0_207 = var_0_1.cast("void****", var_0_1.cast("char*", var_0_206) + 2)[0]
local var_0_208 = "struct \n{\n    char __pad_0x0000[0x1cd];\n    bool hide_vm_scope;\n}\n"
local var_0_209 = vtable_thunk(2, var_0_208 .. "*(__thiscall*)(void*, unsigned int)")
local var_0_210 = true

function var_0_211()
  local var_254_0 = entity.get_local_player()

  if not var_254_0 then
    return
  end

  local var_254_1 = entity.get_player_weapon(var_254_0)

  if not var_254_1 then
    return
  end

  local var_254_2 = entity.get_prop(var_254_1, "m_iItemDefinitionIndex")
  local var_254_3 = var_0_209(var_0_207, var_254_2)

  var_0_210 = not var_0_88.Miscellaneous.viewinsc:get()
  var_254_3.hide_vm_scope = var_0_210
end

function var_0_212()
  local var_255_0 = entity.get_local_player()

  if not var_255_0 then
    return
  end

  local var_255_1 = entity.get_player_weapon(var_255_0)

  if not var_255_1 then
    return
  end

  local var_255_2 = entity.get_prop(var_255_1, "m_iItemDefinitionIndex")
  local var_255_3 = var_0_209(var_0_207, var_255_2)

  var_0_210 = true
  var_255_3.hide_vm_scope = var_0_210
end

function doubletap_charged()
  if not var_0_32.get(var_0_85.dt[1]) or not var_0_32.get(var_0_85.dt[2]) or var_0_32.get(var_0_85.fakeduck) then
    return false
  end

  if not entity.is_alive(entity.get_local_player()) or entity.get_local_player() == nil then
    return
  end

  local var_256_0 = entity.get_prop(entity.get_local_player(), "m_hActiveWeapon")

  if var_256_0 == nil then
    return false
  end

  local var_256_1 = entity.get_prop(entity.get_local_player(), "m_flNextAttack") + 0.01
  local var_256_2 = entity.get_prop(var_256_0, "m_flNextPrimaryAttack")

  if var_256_2 == nil then
    return
  end

  local var_256_3 = var_256_2 + 0.01

  if var_256_1 == nil or var_256_3 == nil then
    return false
  end

  return var_256_1 - globals.curtime() < 0 and var_256_3 - globals.curtime() < 0
end

function globalize_dpi()
  if not var_0_88.Miscellaneous.dpi_on:get() then
    return ""
  end

  return "d"
end

local var_0_213 = {}
local var_0_214 = 0
local var_0_215 = 0
local var_0_216 = 0
local var_0_217 = 0
local var_0_218 = 0
local var_0_219 = 0
local var_0_220 = 0

function var_0_221(arg_258_0)
  local var_258_0 = entity.get_local_player()

  if entity.is_alive(var_258_0) then
    var_0_220 = arg_258_0.in_moveright == 1 and -1 or arg_258_0.in_moveleft == 1 and 1 or 0
  end
end

var_0_33.set_event_callback("setup_command", function(arg_259_0)
  var_0_221(arg_259_0)
end)

function var_0_222()
  local var_260_0 = entity.get_local_player()

  if not var_260_0 then
    return
  end

  local var_260_1 = false
  local var_260_2 = entity.get_player_weapon(var_260_0)

  if var_260_2 ~= nil and var_0_7(var_260_2).weapon_type_int == 9 then
    var_260_1 = true
  end

  var_0_214 = var_0_37.new("scoped", var_260_0 and not (not var_260_1 and entity.get_prop(var_260_0, "m_bIsScoped") ~= 1) and 1 or 0, 0.06)

  if var_260_0 and var_0_214 == 1 then
    if not var_0_215 and var_0_220 ~= 0 then
      var_0_216, var_0_215 = -var_0_220, true
    end
  else
    var_0_216, var_0_215 = 0, false
  end

  var_0_217 = var_0_37.new("scope_side", var_0_216, 0.06)
  var_0_218 = var_0_37.new("alpha_scope", var_0_214 == 1 and var_0_217 == 0 and 0.5 or 1, 0.06)
end

var_0_33.set_event_callback("paint", function()
  var_0_222()
end)

function var_0_223(arg_262_0, arg_262_1, arg_262_2, arg_262_3, arg_262_4, arg_262_5, arg_262_6, arg_262_7, ...)
  if arg_262_7 == nil then
    arg_262_7 = 1
  end

  if arg_262_7 <= 0 then
    return
  end

  local var_262_0 = 1
  local var_262_1 = 10 * -var_0_217

  if var_0_217 > 0 then
    var_262_0 = var_262_0 + var_0_217
  elseif var_0_217 < 0 then
    var_262_0 = var_262_0 + var_0_217
  end

  local var_262_2, var_262_3 = renderer.measure_text(arg_262_6, ...)

  arg_262_0 = arg_262_0 - var_262_2 * var_262_0 * 0.5 + var_262_1
  arg_262_5 = arg_262_5 * arg_262_7

  renderer.text(arg_262_0, arg_262_1, arg_262_2, arg_262_3, arg_262_4, arg_262_5, arg_262_6, 0, ...)

  var_0_219 = var_0_219 + (var_262_3 + 1) * arg_262_7

  return arg_262_0, arg_262_1, var_262_0, var_262_2, var_262_3
end

local var_0_224 = 0
local var_0_225 = 0

function var_0_213.crosshair()
  local var_263_0 = entity.get_local_player()

  if not entity.is_alive(var_263_0) then
    return
  end

  local var_263_1 = globalize_dpi()

  var_0_219 = 0

  local var_263_2, var_263_3, var_263_4, var_263_5 = var_0_88.Miscellaneous.crosshair_color:get()
  local var_263_6 = var_0_37.new("crosshair_alpha", var_0_88.Miscellaneous.crosshair:get() and var_0_218 or 0, 0.07)
  local var_263_7 = var_0_37.new("crosshair_enabled", var_0_88.Miscellaneous.crosshair:get() and 1 or 0, 0.07)
  local var_263_8 = var_0_37.new("crosshair_glow", var_0_88.Miscellaneous.crosshair_select:get("Glow module") and var_0_88.Miscellaneous.crosshair:get() and var_0_218 or 0, 0.07)
  local var_263_9 = player_state()
  local var_263_10 = renderer.measure_text(var_263_1 .. "-", var_263_9)

  if var_0_37.new("state_cross", var_0_225 == var_0_162 and var_0_224 == var_263_10 and 1 or 0.5, 0.07) < 0.5 then
    var_0_224 = var_263_10
    var_0_225 = var_0_162
  end

  local var_263_11 = var_0_37.new("cr_dsy", entity.get_prop(var_263_0, "m_flPoseParameter", 11) * 120 - 60, 0.03)

  if var_263_11 > 25 then
    var_263_11 = 25
  end

  if var_263_11 < -25 then
    var_263_11 = -25
  end

  local var_263_12 = "desync:"
  local var_263_13 = var_0_32.get(var_0_85.freestand[1]) and var_0_32.get(var_0_85.freestand[2])
  local var_263_14, var_263_15, var_263_16 = var_0_88.Miscellaneous.accent_color:get()
  local var_263_17 = var_263_14 * (1 - var_0_30.abs(var_0_30.sin(globals.realtime() * 2))) + var_263_2 * var_0_30.abs(var_0_30.sin(globals.realtime() * 2))
  local var_263_18 = var_263_15 * (1 - var_0_30.abs(var_0_30.sin(globals.realtime() * 2))) + var_263_3 * var_0_30.abs(var_0_30.sin(globals.realtime() * 2))
  local var_263_19 = var_263_16 * (1 - var_0_30.abs(var_0_30.sin(globals.realtime() * 2))) + var_263_4 * var_0_30.abs(var_0_30.sin(globals.realtime() * 2))
  local var_263_20 = var_0_37.new("cr_charge", doubletap_charged() and var_263_14 or 255, 0.07)
  local var_263_21 = var_0_37.new("cr_charged", doubletap_charged() and 1 or 0, 0.07)
  local var_263_22 = var_0_37.new("dsa", var_0_88.Miscellaneous.crosshair_select:get("Desync") and var_263_11 ~= 0 and var_263_7 > 0 and 1 or 0, 0.07)
  local var_263_23 = var_0_37.new("sta", var_0_88.Miscellaneous.crosshair_select:get("State") and var_263_7 > 0 and 1 or 0, 0.07)
  local var_263_24 = var_0_37.new("buia", var_0_88.Miscellaneous.crosshair_select:get("Build") and var_263_7 > 0 and 1 or 0, 0.07)
  local var_263_25 = var_0_37.new("fsa", var_0_88.Miscellaneous.crosshair_select:get("Freestanding") and var_263_13 and 1 or 0, 0.07)
  local var_263_26 = var_0_37.new("dta", var_0_88.Miscellaneous.crosshair_select:get("Double tap") and var_0_32.get(var_0_85.dt[1]) and var_0_32.get(var_0_85.dt[2]) and not var_0_32.get(var_0_85.fakeduck) and 1 or 0, 0.07)
  local var_263_27 = var_0_37.new("osa", var_0_88.Miscellaneous.crosshair_select:get("Onshot anti-aim") and var_0_32.get(var_0_85.os[1]) and var_0_32.get(var_0_85.os[2]) and not var_0_32.get(var_0_85.fakeduck) and 1 or 0, 0.07)
  local var_263_28 = var_0_37.new("mda", var_0_88.Miscellaneous.crosshair_select:get("Minimum damage override") and var_0_32.get(var_0_85.minimum_damage_override[2]) and 1 or 0, 0.07)
  local var_263_29 = var_0_37.new("bda", var_0_88.Miscellaneous.crosshair_select:get("Body aim") and var_0_32.get(var_0_85.forcebaim) and 1 or 0, 0.07)
  local var_263_30 = var_0_37.new("sfa", var_0_88.Miscellaneous.crosshair_select:get("Safe point") and var_0_32.get(var_0_85.safepoint) and 1 or 0, 0.07)
  local var_263_31 = var_0_37.new("fda", var_0_88.Miscellaneous.crosshair_select:get("Duck peek assist") and var_0_32.get(var_0_85.fakeduck) and 1 or 0, 0.07)
  local var_263_32 = var_0_37.new("crosshair_y", var_0_88.Miscellaneous.crosshair_y:get(), 0.07)
  local var_263_33 = var_0_37.new("attempt", var_263_32 < 0 and -1 or 1, 0.07)
  local var_263_34 = var_0_37.new("acros_dsy", var_263_22 and var_263_32 < 0 and 5 or 0, 0.07)
  local var_263_35, var_263_36, var_263_37, var_263_38, var_263_39 = var_0_223(var_0_15 * 0.5, var_0_16 * 0.5 + var_263_32 + (var_0_219 - 4 * var_263_7) * var_263_33, var_263_14, var_263_15, var_263_16, 255 * var_263_6, var_263_1 .. "b", var_263_7, var_0_25(globals.curtime() * -1.7, "Downabout.asia", var_263_2, var_263_3, var_263_4, 255 * var_263_6, var_263_14, var_263_15, var_263_16, 255 * var_263_6))

  if var_263_35 ~= nil and var_263_36 ~= nil then
    var_0_17.glow_module(var_263_35, var_263_36, var_263_38, var_263_39, 25, 5, {
      var_263_17,
      var_263_18,
      var_263_19,
      55 * var_263_8
    }, {
      var_263_17,
      var_263_18,
      var_263_19,
      55 * var_263_8
    })
  end

  local var_263_40, var_263_41 = var_0_223(var_0_15 * 0.5, var_0_16 * 0.5 + var_263_32 + var_0_219 * var_263_33 + var_263_34, var_263_14, var_263_15, var_263_16, 0, var_263_1 .. "-", var_263_22, var_263_12:upper())

  if var_263_40 ~= nil and var_263_41 ~= nil then
    renderer.rectangle(var_0_15 * 0.5 - 33 * var_0_217 - 26, var_263_41, 52, 6, 5, 5, 5, 255 * var_263_6 * var_263_22)
    renderer.rectangle(var_0_15 * 0.5 - 33 * var_0_217 - 25, var_263_41 + 1, 50, 4, 20, 20, 20, 255 * var_263_6 * var_263_22)
    renderer.gradient(var_0_15 * 0.5 - 33 * var_0_217 - var_263_11, var_263_41 + 1, var_263_11, 4, var_263_2, var_263_3, var_263_4, 55 * var_263_6 * var_263_22, var_263_2, var_263_3, var_263_4, 255 * var_263_6 * var_263_22, true)
  end

  var_0_223(var_0_15 * 0.5, var_0_16 * 0.5 + var_263_32 + (var_0_219 - 2 * var_263_24) * var_263_33, var_263_17, var_263_18, var_263_19, 255 * var_263_6, var_263_1 .. "-", var_263_24, var_0_18.build:upper())
  var_0_223(var_0_15 * 0.5, var_0_16 * 0.5 + var_263_32 + (var_0_219 - 2 * var_263_23) * var_263_33, var_263_14, var_263_15, var_263_16, 255 * var_263_6, var_263_1 .. "-", var_263_23, var_263_9:upper())
  var_0_223(var_0_15 * 0.5, var_0_16 * 0.5 + var_263_32 + var_0_219 * var_263_33, var_263_20, var_263_15 * var_263_21, var_263_16 * var_263_21, 255 * var_263_6, var_263_1 .. "-", var_263_26, "DOUBLETAP")
  var_0_223(var_0_15 * 0.5, var_0_16 * 0.5 + var_263_32 + var_0_219 * var_263_33, var_263_14, var_263_15, var_263_16, 255 * var_263_6, var_263_1 .. "-", var_263_27, "ONSHOT")
  var_0_223(var_0_15 * 0.5, var_0_16 * 0.5 + var_263_32 + var_0_219 * var_263_33, var_263_14, var_263_15, var_263_16, 255 * var_263_6, var_263_1 .. "-", var_263_29, "BODY")
  var_0_223(var_0_15 * 0.5, var_0_16 * 0.5 + var_263_32 + var_0_219 * var_263_33, var_263_14, var_263_15, var_263_16, 255 * var_263_6, var_263_1 .. "-", var_263_30, "SAFE")
  var_0_223(var_0_15 * 0.5, var_0_16 * 0.5 + var_263_32 + var_0_219 * var_263_33, var_263_14, var_263_15, var_263_16, 255 * var_263_6, var_263_1 .. "-", var_263_31, "DUCK")
  var_0_223(var_0_15 * 0.5, var_0_16 * 0.5 + var_263_32 + var_0_219 * var_263_33, var_263_14, var_263_15, var_263_16, 255 * var_263_6, var_263_1 .. "-", var_263_28, "DMG")
  var_0_223(var_0_15 * 0.5, var_0_16 * 0.5 + var_263_32 + var_0_219 * var_263_33, var_263_14, var_263_15, var_263_16, 255 * var_263_6, var_263_1 .. "-", var_263_25, "FS")
end

local var_0_226 = 0
local var_0_227 = 0
local var_0_228 = 0
local var_0_229 = 0

function renderer.rounded_rectangle(arg_264_0, arg_264_1, arg_264_2, arg_264_3, arg_264_4, arg_264_5, arg_264_6, arg_264_7, arg_264_8)
  arg_264_1 = arg_264_1 + arg_264_8

  local var_264_0 = {
    {
      arg_264_0 + arg_264_8,
      arg_264_1,
      180
    },
    {
      arg_264_0 + arg_264_2 - arg_264_8,
      arg_264_1,
      90
    },
    {
      arg_264_0 + arg_264_8,
      arg_264_1 + arg_264_3 - arg_264_8 * 2,
      270
    },
    {
      arg_264_0 + arg_264_2 - arg_264_8,
      arg_264_1 + arg_264_3 - arg_264_8 * 2,
      0
    }
  }
  local var_264_1 = {
    {
      arg_264_0 + arg_264_8,
      arg_264_1,
      arg_264_2 - arg_264_8 * 2,
      arg_264_3 - arg_264_8 * 2
    },
    {
      arg_264_0 + arg_264_8,
      arg_264_1 - arg_264_8,
      arg_264_2 - arg_264_8 * 2,
      arg_264_8
    },
    {
      arg_264_0 + arg_264_8,
      arg_264_1 + arg_264_3 - arg_264_8 * 2,
      arg_264_2 - arg_264_8 * 2,
      arg_264_8
    },
    {
      arg_264_0,
      arg_264_1,
      arg_264_8,
      arg_264_3 - arg_264_8 * 2
    },
    {
      arg_264_0 + arg_264_2 - arg_264_8,
      arg_264_1,
      arg_264_8,
      arg_264_3 - arg_264_8 * 2
    }
  }

  for iter_264_0, iter_264_1 in next, var_264_0 do
    renderer.circle(iter_264_1[1], iter_264_1[2], arg_264_4, arg_264_5, arg_264_6, arg_264_7, arg_264_8, iter_264_1[3], 0.25)
  end

  for iter_264_2, iter_264_3 in next, var_264_1 do
    renderer.rectangle(iter_264_3[1], iter_264_3[2], iter_264_3[3], iter_264_3[4], arg_264_4, arg_264_5, arg_264_6, arg_264_7)
  end
end

local var_0_230 = {
  pressed = function(arg_265_0)
    return var_0_33.key_state(arg_265_0 or 1)
  end
}
local var_0_231 = {
  is_dragging = false,
  x = var_0_15 * 0.5 - 32.5,
  y = var_0_16 / 3 - 20
}

function var_0_232(arg_266_0, arg_266_1)
  var_0_231.x = arg_266_0 - 32.5
  var_0_231.y = arg_266_1 - 20
end

function var_0_233()
  if var_0_231.x == nil or var_0_231.y == nil then
    var_0_231.x = var_0_15 * 0.5 - 32.5
    var_0_231.y = var_0_16 / 3 - 20
  end

  database.write("velocity_pos_x", var_0_231.x)
  database.write("velocity_pos_y", var_0_231.y)
end

function var_0_234()
  local var_268_0 = database.read("velocity_pos_x", nil)
  local var_268_1 = database.read("velocity_pos_y", nil)

  if var_268_0 == nil or var_268_1 == nil then
    var_0_231.x = var_0_15 * 0.5 - 32.5
    var_0_231.y = var_0_16 / 3 - 20
  else
    var_0_231.x = var_268_0
    var_0_231.y = var_268_1
  end
end

function var_0_235()
  local var_269_0 = entity.get_local_player()

  if not entity.is_alive(var_269_0) then
    return
  end

  local var_269_1, var_269_2, var_269_3, var_269_4 = var_0_88.Miscellaneous.velocity_color:get()
  local var_269_5 = entity.get_prop(var_269_0, "m_flVelocityModifier")

  if not var_0_32.is_menu_open() then
    var_0_228 = var_0_37.new("velocity_alpha", var_0_88.Miscellaneous.velocity:get() and var_269_5 < 1 and 255 or 0, 0.06)
    var_0_229 = var_0_37.new("velocity_amount", var_269_5, 0.06)
  else
    var_0_228 = var_0_37.new("velocity_alpha", var_0_88.Miscellaneous.velocity:get() and 255 or 0, 0.06)
    var_0_229 = var_0_37.new("velocity_amount", globals.tickcount() % 50 / 100 * 2, 0.06)
  end

  if var_0_228 <= 0 then
    return
  end

  local var_269_6 = 65
  local var_269_7 = 70
  local var_269_8 = 48
  local var_269_9, var_269_10 = var_0_32.mouse_position()
  local var_269_11 = var_269_9 >= var_0_231.x and var_269_9 <= var_0_231.x + var_269_6 and var_269_10 >= var_0_231.y and var_269_10 <= var_0_231.y + var_269_7
  local var_269_12 = var_0_228
  local var_269_13 = var_0_228 * 0.1

  if var_0_230.pressed(1) then
    var_0_231.is_dragging = var_269_11
  end

  if var_0_231.is_dragging then
    var_0_232(var_269_9, var_269_10)
  end

  if var_0_230.pressed(2) and var_269_11 then
    var_0_231.x = var_0_15 * 0.5 - 32.5
    var_0_231.y = var_0_16 / 3 - 20
  end

  if not var_0_230.pressed(1) then
    var_0_231.is_dragging = false
  end

  local var_269_14 = var_0_37.new("velback", var_0_231.is_dragging and var_0_32.is_menu_open() and 180 or 0, 0.06)

  renderer.rectangle(0, 0, var_0_15, var_0_16, 0, 0, 0, var_269_14)

  if var_0_231.is_dragging == true then
    var_269_12 = var_0_37.new("velback", 155, 0.06)
    var_269_13 = var_0_37.new("velback", 255, 0.06)
  else
    var_269_12 = var_0_228
    var_269_13 = var_0_228 * 0.1
  end

  renderer.rounded_rectangle(var_0_231.x, var_0_231.y, var_269_6, var_269_7, 110, 110, 110, var_269_13, 6)
  renderer.text(var_0_231.x + var_269_6 / 2 - 18, var_0_231.y + 15, var_269_1, var_269_2, var_269_3, var_269_12, "+-", 0, "")
  renderer.rectangle(var_0_231.x + 9.3, var_0_231.y + 55, var_269_8, 4, 50, 50, 50, var_269_12)
  renderer.rectangle(var_0_231.x + 9.3, var_0_231.y + 55, var_269_8 * var_0_229, 4, var_269_1, var_269_2, var_269_3, var_269_12)
end

local var_0_236 = {
  is_dragging = false,
  x = var_0_15 * 0.5 - 32.5,
  y = var_0_16 / 3 - 125
}

function var_0_237(arg_270_0, arg_270_1)
  var_0_236.x = arg_270_0 - 32.5
  var_0_236.y = arg_270_1 - 20
end

function var_0_238()
  if var_0_236.x == nil or var_0_236.y == nil then
    var_0_236.x = var_0_15 * 0.5 - 32.5
    var_0_236.y = var_0_16 / 3 - 20
  end

  database.write("defensive_pos_x", var_0_236.x)
  database.write("defensive_pos_y", var_0_236.y)
end

function var_0_239()
  local var_272_0 = database.read("defensive_pos_x", nil)
  local var_272_1 = database.read("defensive_pos_y", nil)

  if var_272_0 == nil or var_272_1 == nil then
    var_0_236.x = var_0_15 * 0.5 - 32.5
    var_0_236.y = var_0_16 / 3 - 125
  else
    var_0_236.x = var_272_0
    var_0_236.y = var_272_1
  end
end

function var_0_240()
  local var_273_0 = entity.get_local_player()

  if not entity.is_alive(var_273_0) then
    return
  end

  local var_273_1, var_273_2 = is_defensive_active(var_273_0), doubletap_charged()
  local var_273_3, var_273_4, var_273_5, var_273_6 = var_0_88.Miscellaneous.defensive_color:get()

  function var_273_7(arg_274_0, arg_274_1, arg_274_2, arg_274_3)
    return var_0_30.lerp2(arg_274_0, arg_274_2, 0.07), var_0_30.lerp2(arg_274_1, arg_274_3, 0.07)
  end

  if not var_0_32.is_menu_open() then
    if var_0_32.get(var_0_85.dt[1]) and var_0_32.get(var_0_85.dt[2]) and not var_0_32.get(var_0_85.fakeduck) then
      if var_273_2 and var_273_1 then
        var_0_226, var_0_227 = var_273_7(var_0_226, var_0_227, var_0_88.Miscellaneous.defensive:get() and 255 or 0, 1)
      elseif var_273_2 then
        var_0_226, var_0_227 = var_273_7(var_0_226, var_0_227, 0, 0.5)
      else
        var_0_226, var_0_227 = var_273_7(var_0_226, var_0_227, var_0_88.Miscellaneous.defensive:get() and 255 or 0, 0)
      end
    else
      var_0_226, var_0_227 = var_273_7(var_0_226, var_0_227, 0, 0)
    end
  else
    var_0_226, var_0_227 = var_273_7(var_0_226, var_0_227, var_0_88.Miscellaneous.defensive:get() and 255 or 0, globals.tickcount() % 50 / 100 * 2)
  end

  local var_273_8 = 65
  local var_273_9 = 70
  local var_273_10 = 48
  local var_273_11, var_273_12 = var_0_32.mouse_position()
  local var_273_13 = var_273_11 >= var_0_236.x and var_273_11 <= var_0_236.x + var_273_8 and var_273_12 >= var_0_236.y and var_273_12 <= var_0_236.y + var_273_9
  local var_273_14 = var_0_226
  local var_273_15 = var_0_226 * 0.1

  if var_0_230.pressed(1) then
    var_0_236.is_dragging = var_273_13
  end

  if var_0_236.is_dragging then
    var_0_237(var_273_11, var_273_12)
  end

  if var_0_230.pressed(2) and var_273_13 then
    var_0_236.x = var_0_15 * 0.5 - 32.5
    var_0_236.y = var_0_16 / 3 - 125
  end

  if not var_0_230.pressed(1) then
    var_0_236.is_dragging = false
  end

  local var_273_16 = var_0_37.new("defback", var_0_236.is_dragging and var_0_32.is_menu_open() and 180 or 0, 0.06)

  renderer.rectangle(0, 0, var_0_15, var_0_16, 0, 0, 0, var_273_16)

  if var_0_236.is_dragging == true then
    var_273_14 = var_0_37.new("border_defe", var_0_88.Miscellaneous.defensive:get() and 255 or 0, 0.06)
    var_273_15 = var_0_37.new("border_defe", var_0_88.Miscellaneous.defensive:get() and 155 or 0, 0.06)
  else
    var_273_14 = var_0_226
    var_273_15 = var_0_226 * 0.1
  end

  renderer.rounded_rectangle(var_0_236.x, var_0_236.y, var_273_8, var_273_9, 110, 110, 110, var_273_15, 6)
  renderer.text(var_0_236.x + var_273_8 / 2 - 18, var_0_236.y + 15, var_273_3, var_273_4, var_273_5, var_273_14, "+-", 0, "")
  renderer.rectangle(var_0_236.x + 9.3, var_0_236.y + 55, var_273_10, 4, 50, 50, 50, var_273_14)
  renderer.rectangle(var_0_236.x + 9.3, var_0_236.y + 55, var_273_10 * var_0_227, 4, var_273_3, var_273_4, var_273_5, var_273_14)
end

local var_0_241 = {
  minimum_damage = var_0_32.reference("rage", "aimbot", "minimum damage")
}
local var_0_242 = 0
local var_0_243 = 20

function var_0_244()
  local var_275_0 = entity.get_local_player()

  if not entity.is_alive(var_275_0) then
    return
  end

  local var_275_1 = var_0_32.get(var_0_241.minimum_damage)
  local var_275_2 = var_0_32.get(var_0_85.minimum_damage_override[2])
  local var_275_3 = var_275_2 and 1 or 0.5
  local var_275_4 = var_0_37.new("enabled_damagei", var_0_88.Miscellaneous.damage_ind:get() and var_275_3 or 0, 0.06)
  local var_275_5 = 0

  if var_275_2 then
    var_275_5 = var_0_32.get(var_0_85.minimum_damage_override[3])
  else
    var_275_5 = var_275_1
  end

  if not var_0_88.Miscellaneous.damage_anim:get() then
    if var_0_30.abs(var_0_242 - var_275_5) > 0.1 then
      var_0_242 = var_0_242 + (var_275_5 - var_0_242) / var_0_243
    else
      var_0_242 = var_275_5
    end
  else
    var_0_242 = var_275_5
  end

  local var_275_6, var_275_7, var_275_8, var_275_9 = var_0_88.Miscellaneous.damage_color:get()
  local var_275_10 = var_0_30.floor(var_0_242 + 0.5)
  local var_275_11 = globalize_dpi()
  local var_275_12 = ""

  if var_0_88.Miscellaneous.damage_select:get() == "Small" then
    var_275_12 = "-"
  elseif var_0_88.Miscellaneous.damage_select:get() == "Verdana" then
    var_275_12 = ""
  elseif var_0_88.Miscellaneous.damage_select:get() == "Bold" then
    var_275_12 = "b"
  end

  local var_275_13 = var_0_10(renderer.measure_text(var_275_11, var_275_10))

  renderer.text(var_0_15 * 0.5 + 2, var_0_16 * 0.5 - 15, var_275_6, var_275_7, var_275_8, 255 * var_275_4, var_275_11 .. var_275_12, 0, var_275_10 .. "")
end

function var_0_245()
  local var_276_0 = entity.get_local_player()

  if not entity.is_alive(var_276_0) then
    return
  end

  local var_276_1, var_276_2, var_276_3, var_276_4 = var_0_88.Miscellaneous.arrows_color:get()
  local var_276_5 = entity.get_local_player()
  local var_276_6 = entity.get_prop(var_276_5, "m_bIsScoped") == 1
  local var_276_7 = var_0_37.new("scope_alpha", var_276_5 and var_276_6 and var_276_4 / 4 or var_276_4, 0.06)
  local var_276_8 = 0

  if var_0_88.Miscellaneous.scope_overlay:get() and var_0_88.Miscellaneous.scope_size:get() > 25 then
    var_276_8 = var_0_37.new("arrows_add", var_0_88.Miscellaneous.scope_size:get(), 0.06)
  else
    var_276_8 = var_0_37.new("arrows_add", 55, 0.06)
  end

  local var_276_9 = var_0_88.Miscellaneous.arrows_scope:get("Alpha") and var_276_6 and 125 or 255
  local var_276_10 = var_0_37.new("arrows_alpha", var_276_5 and var_0_160 == 90 and var_276_9 or 0, 0.06)
  local var_276_11 = var_0_37.new("arrows_alpha1", var_276_5 and var_0_160 == -90 and var_276_9 or 0, 0.06)
  local var_276_12 = globalize_dpi()
  local var_276_13 = "<"
  local var_276_14 = ">"
  local var_276_15 = 0

  if var_0_88.Miscellaneous.arrows_type:get() == "⪦ ⪧" then
    var_276_13, var_276_14 = "⪦", "⪧"
    var_276_15 = 4
  elseif var_0_88.Miscellaneous.arrows_type:get() == "≺ ≻" then
    var_276_13, var_276_14 = "≺", "≻"
    var_276_15 = 4
  elseif var_0_88.Miscellaneous.arrows_type:get() == "◀ ▶" then
    var_276_13, var_276_14 = "◀", "▶"
    var_276_15 = 3
  elseif var_0_88.Miscellaneous.arrows_type:get() == "◁ ▷" then
    var_276_13, var_276_14 = "◁", "▷"
    var_276_15 = 3
  elseif var_0_88.Miscellaneous.arrows_type:get() == "❮ ❯" then
    var_276_13, var_276_14 = "❮", "❯"
    var_276_15 = 3
  elseif var_0_88.Miscellaneous.arrows_type:get() == "❰ ❱" then
    var_276_13, var_276_14 = "❰", "❱"
    var_276_15 = 3
  elseif var_0_88.Miscellaneous.arrows_type:get() == "❬ ❭" then
    var_276_13, var_276_14 = "❬", "❭"
    var_276_15 = 3
  elseif var_0_88.Miscellaneous.arrows_type:get() == "⏴ ⏵" then
    var_276_13, var_276_14 = "⏴", "⏵"
    var_276_15 = 4
  elseif var_0_88.Miscellaneous.arrows_type:get() == "⊂ ⊃" then
    var_276_13, var_276_14 = "⊂", "⊃"
    var_276_15 = 4
  elseif var_0_88.Miscellaneous.arrows_type:get() == "⪪ ⪫" then
    var_276_13, var_276_14 = "⪪", "⪫"
    var_276_15 = 4
  elseif var_0_88.Miscellaneous.arrows_type:get() == "⩹ ⩺" then
    var_276_13, var_276_14 = "⩹", "⩺"
    var_276_15 = 4
  end

  local var_276_16 = var_0_37.new("add_scope", var_0_88.Miscellaneous.arrows_scope:get("Level") and var_276_6 and 1 or 0)
  local var_276_17, var_276_18, var_276_19 = var_0_88.Miscellaneous.accent_color:get()

  renderer.text(var_0_15 * 0.5 - var_276_8 + 5, var_0_16 * 0.5 - var_276_15 - 20 * var_276_16, var_276_17, var_276_18, var_276_19, var_276_7, "+c-", nil, var_276_13)
  renderer.text(var_0_15 * 0.5 + var_276_8 - 5, var_0_16 * 0.5 - var_276_15 - 20 * var_276_16, var_276_17, var_276_18, var_276_19, var_276_7, "+c-", nil, var_276_14)
  renderer.text(var_0_15 * 0.5 - var_276_8 + 5, var_0_16 * 0.5 - var_276_15 - 20 * var_276_16, var_276_1, var_276_2, var_276_3, var_276_11, "+c-", nil, var_276_13)
  renderer.text(var_0_15 * 0.5 + var_276_8 - 5, var_0_16 * 0.5 - var_276_15 - 20 * var_276_16, var_276_1, var_276_2, var_276_3, var_276_10, "+c-", nil, var_276_14)
end

function var_0_75.get(arg_277_0)
  local var_277_0 = database.read(var_0_76.database.configs) or {}

  for iter_277_0, iter_277_1 in pairs(var_277_0) do
    if iter_277_1.name == arg_277_0 then
      return {
        config = iter_277_1.config,
        config2 = iter_277_1.config2,
        index = iter_277_0
      }
    end
  end

  for iter_277_2, iter_277_3 in pairs(var_0_77) do
    if iter_277_3.name == arg_277_0 then
      return {
        config = iter_277_3.config,
        config2 = iter_277_3.config2,
        index = iter_277_2
      }
    end
  end

  return false
end

var_0_33.set_event_callback("shutdown", function()
  var_0_32.set_enabled(var_0_85.spread, true)
end)
var_0_88.Miscellaneous.aimbot:set_callback(function()
  if var_0_88.Miscellaneous.aimbot:get() then
    var_0_32.set_enabled(var_0_85.spread, false)
    var_0_32.set(var_0_85.spread, false)
  else
    var_0_32.set_enabled(var_0_85.spread, true)
  end
end)

function var_0_17.add(...)
  args = {
    ...
  }
  len = #args

  for iter_280_0 = 1, len do
    arg = args[iter_280_0]
    r, g, b = unpack(arg)
    msg = {}

    if #arg == 3 then
      var_0_29.insert(msg, " ")
    else
      for iter_280_1 = 4, #arg do
        var_0_29.insert(msg, arg[iter_280_1])
      end
    end

    msg = var_0_29.concat(msg)

    if iter_280_0 < len then
      msg = msg .. "\x00"
    end

    var_0_33.color_log(r, g, b, msg)
  end
end

var_0_17.bullet_impacts = {}

function var_0_17.bullet_impact(arg_281_0)
  local var_281_0 = globals.tickcount()
  local var_281_1 = entity.get_local_player()

  if var_0_33.userid_to_entindex(arg_281_0.userid) ~= var_281_1 then
    return
  end

  if #var_0_17.bullet_impacts > 150 then
    var_0_17.bullet_impacts = {}
  end

  var_0_17.bullet_impacts[#var_0_17.bullet_impacts + 1] = {
    tick = var_281_0,
    eye = var_0_10(var_0_33.eye_position()),
    shot = var_0_10(arg_281_0.x, arg_281_0.y, arg_281_0.z)
  }
end

function var_0_17.get_safety(arg_282_0, arg_282_1)
  local var_282_0 = arg_282_0.boosted
  local var_282_1 = plist.get(arg_282_1, "Override safe point")
  local var_282_2 = {
    var_0_32.get(var_0_85.safepoint),
    var_0_32.get(var_0_85.safepoint) or var_282_1 == "On"
  }

  if not var_282_0 then
    return -1
  end

  if var_282_1 == "Off" or not var_282_2[1] and not var_282_2[2] then
    return 0
  end

  return var_282_2[2] and 2 or var_282_2[1] and 1 or 0
end

function var_0_17.generate_flags(arg_283_0)
  return {
    arg_283_0.self_choke > 1 and 1 or 0,
    arg_283_0.velocity_modifier < 1 and 1 or 0,
    arg_283_0.flags.boosted and 1 or 0
  }
end

var_0_17.max_lerp_low_fps = 2.2222222222222223

function var_0_17.lerp(arg_284_0, arg_284_1, arg_284_2)
  if arg_284_0 == arg_284_1 then
    return arg_284_1
  end

  local var_284_0 = globals.frametime() * 170

  arg_284_2 = arg_284_2 * var_0_30.min(var_284_0, var_0_17.max_lerp_low_fps)

  local var_284_1 = arg_284_0 + (arg_284_1 - arg_284_0) * var_0_30.clamp(arg_284_2, 0.01, 1)

  if var_0_30.abs(var_284_1 - arg_284_1) < 0.01 then
    return arg_284_1
  end

  return var_284_1
end

var_0_17.aimbot_logs = {}

function var_0_17.notifications()
  if not var_0_88.Miscellaneous.aimbot:get() or not var_0_88.Miscellaneous.aimbot_screen:get() then
    return
  end

  for iter_285_0, iter_285_1 in ipairs(var_0_17.aimbot_logs) do
    if iter_285_1.time + 1 > globals.realtime() and iter_285_0 <= 5 then
      iter_285_1.alpha = var_0_17.lerp(iter_285_1.alpha, 255, 0.05)
      iter_285_1.alpha_text = var_0_17.lerp(iter_285_1.alpha_text, 255, 0.05)
      iter_285_1.add_x = var_0_17.lerp(iter_285_1.add_x, 1, 0.05)
    end

    local var_285_0 = iter_285_1.name
    local var_285_1 = iter_285_1.hitgroup
    local var_285_2 = globalize_dpi()
    local var_285_3 = renderer.measure_text(var_285_2 .. "b", var_285_0)
    local var_285_4 = renderer.measure_text(var_285_2 .. "b", var_285_1)
    local var_285_5
    local var_285_6
    local var_285_7
    local var_285_8 = "Downabout.asia"
    local var_285_9 = var_0_88.Miscellaneous.aimbot_com:get("Prefix") and renderer.measure_text(var_285_2 .. "b", var_285_8) + 5 or 0

    if iter_285_1.damage and var_0_88.Miscellaneous.aimbot_on:get("Hit") then
      local var_285_10 = iter_285_1.damage
      local var_285_11 = "Hit "
      local var_285_12 = " in the "
      local var_285_13 = " for "
      local var_285_14 = " damage"
      local var_285_15 = renderer.measure_text(var_285_2 .. "b", var_285_10)
      local var_285_16 = renderer.measure_text(var_285_2 .. "", var_285_11)
      local var_285_17 = renderer.measure_text(var_285_2 .. "", var_285_12)
      local var_285_18 = renderer.measure_text(var_285_2 .. "", var_285_13)
      local var_285_19 = renderer.measure_text(var_285_2 .. "", var_285_14)

      if not var_0_88.Miscellaneous.aimbot_com:get("Damage value") then
        var_285_18 = 0
        var_285_19 = 0
        var_285_15 = 0
      end

      local var_285_20 = var_285_9 + var_285_16 + var_285_3 + var_285_17 + var_285_4 + var_285_18 + var_285_15 + var_285_19

      if iter_285_1.alpha > 0 then
        iter_285_1.add_y = var_0_17.lerp(iter_285_1.add_y, var_0_88.Miscellaneous.aimbot_on:get("Hit") and iter_285_0 * 40 or 0, 0.05)

        if var_0_88.Miscellaneous.aimbot_glow:get() then
          var_0_17.glow_module(var_0_15 / 2 - var_285_20 / 2 - 15, var_0_16 - 124 - iter_285_1.add_y, var_285_20 + 24, 25, 30, var_0_88.Miscellaneous.aimbot_rect:get(), {
            iter_285_1.color[1],
            iter_285_1.color[2],
            iter_285_1.color[3],
            iter_285_1.alpha * 0.33
          }, {
            iter_285_1.color[1],
            iter_285_1.color[2],
            iter_285_1.color[3],
            iter_285_1.alpha * 0.33
          })
        end

        var_0_17.rec(var_0_15 / 2 - var_285_20 / 2 - 15, var_0_16 - 124 - iter_285_1.add_y, var_285_20 + 24, 25, var_0_88.Miscellaneous.aimbot_rect:get(), {
          110,
          110,
          110,
          iter_285_1.alpha * 0.2
        })

        local var_285_21 = var_0_15 / 2 - var_285_20 / 2 - 3
        local var_285_22 = var_0_16 - 56 - iter_285_1.add_y - 62

        if var_0_88.Miscellaneous.aimbot_com:get("Prefix") then
          renderer.text(var_285_21, var_285_22, iter_285_1.color[1], iter_285_1.color[2], iter_285_1.color[3], iter_285_1.alpha_text, var_285_2 .. "b", 0, var_285_8)

          var_285_21 = var_285_21 + var_285_9
        end

        renderer.text(var_285_21, var_285_22, 255, 255, 255, iter_285_1.alpha_text, var_285_2 .. "", 0, var_285_11)

        local var_285_23 = var_285_21 + var_285_16

        renderer.text(var_285_23, var_285_22, iter_285_1.color[1], iter_285_1.color[2], iter_285_1.color[3], iter_285_1.alpha_text, var_285_2 .. "b", 0, var_285_0)

        local var_285_24 = var_285_23 + var_285_3

        renderer.text(var_285_24, var_285_22, 255, 255, 255, iter_285_1.alpha_text, var_285_2 .. "", 0, var_285_12)

        local var_285_25 = var_285_24 + var_285_17

        renderer.text(var_285_25, var_285_22, iter_285_1.color[1], iter_285_1.color[2], iter_285_1.color[3], iter_285_1.alpha_text, var_285_2 .. "b", 0, var_285_1)

        local var_285_26 = var_285_25 + var_285_4

        if var_0_88.Miscellaneous.aimbot_com:get("Damage value") then
          renderer.text(var_285_26, var_285_22, 255, 255, 255, iter_285_1.alpha_text, var_285_2 .. "", 0, var_285_13)

          local var_285_27 = var_285_26 + var_285_18

          renderer.text(var_285_27, var_285_22, iter_285_1.color[1], iter_285_1.color[2], iter_285_1.color[3], iter_285_1.alpha_text, var_285_2 .. "b", 0, var_285_10)

          local var_285_28 = var_285_27 + var_285_15

          renderer.text(var_285_28, var_285_22, 255, 255, 255, iter_285_1.alpha_text, var_285_2 .. "", 0, var_285_14)
        end
      end
    elseif iter_285_1.reason and var_0_88.Miscellaneous.aimbot_on:get("Miss") then
      local var_285_29 = iter_285_1.reason
      local var_285_30 = "Missed "
      local var_285_31 = " in the "
      local var_285_32 = " due to "
      local var_285_33 = var_0_88.Miscellaneous.aimbot_com:get("Miss reason") and renderer.measure_text(var_285_2 .. "b", var_285_29) or 0
      local var_285_34 = renderer.measure_text(var_285_2 .. "", var_285_30)
      local var_285_35 = renderer.measure_text(var_285_2 .. "", var_285_31)
      local var_285_36 = var_0_88.Miscellaneous.aimbot_com:get("Miss reason") and renderer.measure_text(var_285_2 .. "", var_285_32) or 0
      local var_285_37 = var_285_9 + var_285_34 + var_285_3 + var_285_35 + var_285_4 + var_285_36 + var_285_33

      if iter_285_1.alpha > 0 then
        iter_285_1.add_y = var_0_17.lerp(iter_285_1.add_y, var_0_88.Miscellaneous.aimbot_on:get("Miss") and iter_285_0 * 40 or 0, 0.05)

        if var_0_88.Miscellaneous.aimbot_glow:get() then
          var_0_17.glow_module(var_0_15 / 2 - var_285_37 / 2 - 15, var_0_16 - 124 - iter_285_1.add_y, var_285_37 + 24, 25, 30, var_0_88.Miscellaneous.aimbot_rect:get(), {
            iter_285_1.color[1],
            iter_285_1.color[2],
            iter_285_1.color[3],
            iter_285_1.alpha * 0.33
          }, {
            iter_285_1.color[1],
            iter_285_1.color[2],
            iter_285_1.color[3],
            iter_285_1.alpha * 0.33
          })
        end

        var_0_17.rec(var_0_15 / 2 - var_285_37 / 2 - 15, var_0_16 - 124 - iter_285_1.add_y, var_285_37 + 24, 25, var_0_88.Miscellaneous.aimbot_rect:get(), {
          110,
          110,
          110,
          iter_285_1.alpha * 0.2
        })

        local var_285_38 = var_0_15 / 2 - var_285_37 / 2 - 3
        local var_285_39 = var_0_16 - 56 - iter_285_1.add_y - 62

        if var_0_88.Miscellaneous.aimbot_com:get("Prefix") then
          renderer.text(var_285_38, var_285_39, iter_285_1.color[1], iter_285_1.color[2], iter_285_1.color[3], iter_285_1.alpha_text, var_285_2 .. "b", 0, var_285_8)

          var_285_38 = var_285_38 + var_285_9
        end

        renderer.text(var_285_38, var_285_39, 255, 255, 255, iter_285_1.alpha_text, var_285_2 .. "", 0, var_285_30)

        local var_285_40 = var_285_38 + var_285_34

        renderer.text(var_285_40, var_285_39, iter_285_1.color[1], iter_285_1.color[2], iter_285_1.color[3], iter_285_1.alpha_text, var_285_2 .. "b", 0, var_285_0)

        local var_285_41 = var_285_40 + var_285_3

        renderer.text(var_285_41, var_285_39, 255, 255, 255, iter_285_1.alpha_text, var_285_2 .. "", 0, var_285_31)

        local var_285_42 = var_285_41 + var_285_35

        renderer.text(var_285_42, var_285_39, iter_285_1.color[1], iter_285_1.color[2], iter_285_1.color[3], iter_285_1.alpha_text, var_285_2 .. "b", 0, var_285_1)

        local var_285_43 = var_285_42 + var_285_4

        if var_0_88.Miscellaneous.aimbot_com:get("Miss reason") then
          renderer.text(var_285_43, var_285_39, 255, 255, 255, iter_285_1.alpha_text, var_285_2 .. "", 0, var_285_32)

          local var_285_44 = var_285_43 + var_285_36

          renderer.text(var_285_44, var_285_39, iter_285_1.color[1], iter_285_1.color[2], iter_285_1.color[3], iter_285_1.alpha_text, var_285_2 .. "b", 0, var_285_29)

          local var_285_45 = var_285_44 + var_285_33
        end
      end
    end

    if iter_285_1.alpha <= 0 then
      iter_285_1[iter_285_0] = nil
    elseif iter_285_1.time + 3 < globals.realtime() or iter_285_0 > 5 then
      iter_285_1.alpha = var_0_17.lerp(iter_285_1.alpha, 0, 0.05)
      iter_285_1.alpha_text = var_0_17.lerp(iter_285_1.alpha_text, 0, 0.05)
      iter_285_1.add_x = var_0_17.lerp(iter_285_1.add_x, 0, 0.05)
      iter_285_1.add_y = var_0_17.lerp(iter_285_1.add_y, iter_285_0 * 60, 0.05)
    end

    if iter_285_1.alpha < 1 then
      var_0_29.remove(var_0_17.aimbot_logs, iter_285_0)
    end
  end
end

var_0_17.hitboxes = {
  "generic",
  "head",
  "chest",
  "stomach",
  "left arm",
  "right arm",
  "left leg",
  "right leg",
  "neck",
  "?",
  "gear"
}

function var_0_17.on_aim_fire(arg_286_0)
  local var_286_0 = arg_286_0.target
  local var_286_1 = entity.get_local_player()

  var_0_17[arg_286_0.id] = {
    original = arg_286_0,
    dropped_packets = {},
    handle_time = globals.realtime(),
    self_choke = globals.chokedcommands(),
    flags = {
      boosted = arg_286_0.boosted
    },
    feet_yaw = entity.get_prop(var_286_0, "m_flPoseParameter", 11) * 120 - 60,
    correction = plist.get(var_286_0, "Correction active"),
    safety = var_0_17.get_safety(arg_286_0, var_286_0),
    shot_pos = var_0_10(arg_286_0.x, arg_286_0.y, arg_286_0.z),
    eye = var_0_10(var_0_33.eye_position()),
    view = var_0_10(var_0_33.camera_angles()),
    velocity_modifier = entity.get_prop(var_286_1, "m_flVelocityModifier"),
    total_hits = entity.get_prop(var_286_1, "m_totalHitsOnServer"),
    history = globals.tickcount() - arg_286_0.tick
  }
end

function var_0_17.on_aim_hit(arg_287_0)
  if var_0_17[arg_287_0.id] == nil then
    return
  end

  local var_287_0 = {
    type = var_0_30.max(0, entity.get_prop(arg_287_0.target, "m_iHealth")) > 0,
    prefix = {
      var_0_88.Miscellaneous.aimbot_hit:get()
    },
    hit = {
      var_0_88.Miscellaneous.aimbot_hit:get()
    },
    name = entity.get_player_name(arg_287_0.target),
    hitgroup = var_0_17.hitboxes[arg_287_0.hitgroup + 1] or "?",
    flags = var_0_31.format("%s", var_0_29.concat(var_0_17.generate_flags(var_0_17[arg_287_0.id]))),
    aimed_hitgroup = var_0_17.hitboxes[var_0_17[arg_287_0.id].original.hitgroup + 1] or "?",
    aimed_hitchance = var_0_31.format("%d%%", var_0_30.floor(var_0_17[arg_287_0.id].original.hit_chance + 0.5)),
    hp = var_0_30.max(0, entity.get_prop(arg_287_0.target, "m_iHealth")),
    spread_angle = var_0_31.format("%.2f°", var_0_17.get_inaccuracy_tick(var_0_17[arg_287_0.id], globals.tickcount())),
    correction = var_0_31.format("%d:%d°", var_0_17[arg_287_0.id].correction and 1 or 0, var_0_17[arg_287_0.id].feet_yaw < 10 and var_0_17[arg_287_0.id].feet_yaw > -10 and 0 or var_0_17[arg_287_0.id].feet_yaw)
  }
  local var_287_1, var_287_2, var_287_3, var_287_4 = var_0_88.Miscellaneous.aimbot_hit:get()

  if var_0_88.Miscellaneous.aimbot_on:get("Hit") then
    if var_0_88.Miscellaneous.aimbot:get() and var_0_88.Miscellaneous.aimbot_screen:get() then
      var_0_29.insert(var_0_17.aimbot_logs, 1, {
        add_y = 0,
        alpha = 0,
        alpha_text = 0,
        add_x = 0,
        name = var_287_0.name,
        hitgroup = var_287_0.hitgroup,
        damage = tostring(arg_287_0.damage),
        time = globals.realtime(),
        color = {
          var_287_1,
          var_287_2,
          var_287_3,
          var_287_4
        }
      })
    else
      var_0_17.aimbot_logs = {}
    end
  end

  if var_0_88.Miscellaneous.aimbot:get() then
    var_0_17.add({
      var_287_0.prefix[1],
      var_287_0.prefix[2],
      var_287_0.prefix[3],
      "[+]"
    }, {
      134,
      134,
      134,
      " "
    }, {
      255,
      255,
      255,
      var_287_0.type and "Damaged " or "Killed "
    }, {
      var_287_0.hit[1],
      var_287_0.hit[2],
      var_287_0.hit[3],
      var_287_0.name
    }, {
      255,
      255,
      255,
      " in the "
    }, {
      var_287_0.hit[1],
      var_287_0.hit[2],
      var_287_0.hit[3],
      var_287_0.hitgroup
    }, {
      255,
      255,
      255,
      var_287_0.hitgroup ~= var_287_0.aimed_hitgroup and " (" or ""
    }, {
      var_287_0.hit[1],
      var_287_0.hit[2],
      var_287_0.hit[3],
      var_287_0.hitgroup ~= var_287_0.aimed_hitgroup and var_287_0.aimed_hitgroup or ""
    }, {
      255,
      255,
      255,
      var_287_0.hitgroup ~= var_287_0.aimed_hitgroup and ")" or ""
    }, {
      255,
      255,
      255,
      " for " or ""
    }, {
      var_287_0.hit[1],
      var_287_0.hit[2],
      var_287_0.hit[3],
      arg_287_0.damage or ""
    }, {
      255,
      255,
      255,
      arg_287_0.damage ~= var_0_17[arg_287_0.id].original.damage and " (" or ""
    }, {
      var_287_0.hit[1],
      var_287_0.hit[2],
      var_287_0.hit[3],
      arg_287_0.damage ~= var_0_17[arg_287_0.id].original.damage and var_0_17[arg_287_0.id].original.damage or ""
    }, {
      255,
      255,
      255,
      arg_287_0.damage ~= var_0_17[arg_287_0.id].original.damage and ")" or ""
    }, {
      255,
      255,
      255,
      " damage" or ""
    }, {
      255,
      255,
      255,
      " (hc: "
    }, {
      var_287_0.hit[1],
      var_287_0.hit[2],
      var_287_0.hit[3],
      var_287_0.aimed_hitchance
    }, {
      255,
      255,
      255,
      " | safety: "
    }, {
      var_287_0.hit[1],
      var_287_0.hit[2],
      var_287_0.hit[3],
      var_0_17[arg_287_0.id].safety
    }, {
      255,
      255,
      255,
      " | bt: "
    }, {
      var_287_0.hit[1],
      var_287_0.hit[2],
      var_287_0.hit[3],
      var_0_17[arg_287_0.id].history
    }, {
      255,
      255,
      255,
      ")"
    })
  end
end

local var_0_246 = {
  hegrenade = "Naded",
  knife = "Knifed",
  inferno = "Burned"
}

function var_0_17.on_aim_another(arg_288_0)
  local var_288_0 = entity.get_local_player()
  local var_288_1 = var_0_33.userid_to_entindex(arg_288_0.attacker)

  if not var_288_0 then
    return
  end

  if var_288_1 == nil or var_288_1 ~= var_288_0 then
    return
  end

  local var_288_2 = {
    prefix = {
      var_0_88.Miscellaneous.aimbot_hit:get()
    },
    hit = {
      var_0_88.Miscellaneous.aimbot_hit:get()
    },
    hitgroup = var_0_17.hitboxes[arg_288_0.hitgroup + 1] or "?"
  }

  if var_0_88.Miscellaneous.aimbot:get() and var_288_2.hitgroup == "generic" and var_0_246[arg_288_0.weapon] ~= nil then
    local var_288_3 = var_0_33.userid_to_entindex(arg_288_0.userid)
    local var_288_4 = entity.get_player_name(var_288_3)

    if var_288_3 == var_288_0 then
      return
    end

    var_0_17.add({
      var_288_2.prefix[1],
      var_288_2.prefix[2],
      var_288_2.prefix[3],
      "[+]"
    }, {
      134,
      134,
      134,
      " "
    }, {
      255,
      255,
      255,
      var_0_246[arg_288_0.weapon] .. " "
    }, {
      var_288_2.hit[1],
      var_288_2.hit[2],
      var_288_2.hit[3],
      var_288_4
    }, {
      255,
      255,
      255,
      " in the "
    }, {
      var_288_2.hit[1],
      var_288_2.hit[2],
      var_288_2.hit[3],
      var_288_2.hitgroup
    }, {
      255,
      255,
      255,
      " for "
    }, {
      var_288_2.hit[1],
      var_288_2.hit[2],
      var_288_2.hit[3],
      arg_288_0.dmg_health
    }, {
      255,
      255,
      255,
      " damage"
    })
  end
end

function var_0_17.on_aim_miss(arg_289_0)
  local var_289_0 = entity.get_local_player()
  local var_289_1 = {
    prefix = {
      var_0_88.Miscellaneous.aimbot_miss:get()
    },
    hit = {
      var_0_88.Miscellaneous.aimbot_miss:get()
    },
    name = entity.get_player_name(arg_289_0.target),
    hitgroup = var_0_17.hitboxes[arg_289_0.hitgroup + 1] or "?",
    flags = var_0_31.format("%s", var_0_29.concat(var_0_17.generate_flags(var_0_17[arg_289_0.id]))),
    aimed_hitgroup = var_0_17.hitboxes[var_0_17[arg_289_0.id].original.hitgroup + 1] or "?",
    aimed_hitchance = var_0_31.format("%d%%", var_0_30.floor(var_0_17[arg_289_0.id].original.hit_chance + 0.5)),
    hp = var_0_30.max(0, entity.get_prop(arg_289_0.target, "m_iHealth")),
    reason = arg_289_0.reason,
    spread_angle = var_0_31.format("%.2f°", var_0_17.get_inaccuracy_tick(var_0_17[arg_289_0.id], globals.tickcount())),
    correction = var_0_31.format("%d:%d°", var_0_17[arg_289_0.id].correction and 1 or 0, var_0_17[arg_289_0.id].feet_yaw < 10 and var_0_17[arg_289_0.id].feet_yaw > -10 and 0 or var_0_17[arg_289_0.id].feet_yaw)
  }
  local var_289_2, var_289_3, var_289_4, var_289_5 = var_0_88.Miscellaneous.aimbot_miss:get()

  if var_289_1.reason == "?" then
    var_289_1.reason = "unknown"

    if var_0_17[arg_289_0.id].total_hits ~= entity.get_prop(var_289_0, "m_totalHitsOnServer") then
      var_289_1.reason = "damage rejection"
    end
  end

  if var_0_88.Miscellaneous.aimbot_on:get("Miss") then
    if var_0_88.Miscellaneous.aimbot:get() and var_0_88.Miscellaneous.aimbot_screen:get() then
      var_0_29.insert(var_0_17.aimbot_logs, 1, {
        add_y = 0,
        alpha = 0,
        alpha_text = 0,
        add_x = 0,
        name = var_289_1.name,
        hitgroup = var_289_1.hitgroup,
        reason = var_289_1.reason,
        time = globals.realtime(),
        color = {
          var_289_2,
          var_289_3,
          var_289_4,
          var_289_5
        }
      })
    else
      var_0_17.aimbot_logs = {}
    end
  end

  if var_0_88.Miscellaneous.aimbot:get() then
    var_0_17.add({
      var_289_1.prefix[1],
      var_289_1.prefix[2],
      var_289_1.prefix[3],
      "[-]"
    }, {
      134,
      134,
      134,
      " "
    }, {
      255,
      255,
      255,
      "Missed "
    }, {
      var_289_1.hit[1],
      var_289_1.hit[2],
      var_289_1.hit[3],
      var_289_1.name
    }, {
      255,
      255,
      255,
      " in the "
    }, {
      var_289_1.hit[1],
      var_289_1.hit[2],
      var_289_1.hit[3],
      var_289_1.hitgroup
    }, {
      255,
      255,
      255,
      " due to "
    }, {
      var_289_1.hit[1],
      var_289_1.hit[2],
      var_289_1.hit[3],
      var_289_1.reason
    }, {
      255,
      255,
      255,
      " (hc: "
    }, {
      var_289_1.hit[1],
      var_289_1.hit[2],
      var_289_1.hit[3],
      var_289_1.aimed_hitchance
    }, {
      255,
      255,
      255,
      " | safety: "
    }, {
      var_289_1.hit[1],
      var_289_1.hit[2],
      var_289_1.hit[3],
      var_0_17[arg_289_0.id].safety
    }, {
      255,
      255,
      255,
      " | bt: "
    }, {
      var_289_1.hit[1],
      var_289_1.hit[2],
      var_289_1.hit[3],
      var_0_17[arg_289_0.id].history
    }, {
      255,
      255,
      255,
      ")"
    })
  end
end

function var_0_17.get_inaccuracy_tick(arg_290_0, arg_290_1)
  local var_290_0 = -1

  for iter_290_0, iter_290_1 in pairs(var_0_17.bullet_impacts) do
    if iter_290_1.tick == arg_290_1 then
      local var_290_1 = (arg_290_0.eye - arg_290_0.shot_pos):angles()
      local var_290_2 = (arg_290_0.eye - iter_290_1.shot):angles()

      var_290_0 = var_0_10(var_290_1 - var_290_2):length2d()

      break
    end
  end

  return var_290_0
end

local var_0_247 = {
  s_0 = {
    qp = {
      var_0_32.reference("RAGE", "Other", "Quick peek assist")
    },
    weapon_type = var_0_32.reference("Rage", "Weapon type", "Weapon type"),
    rage_cb = {
      var_0_32.reference("RAGE", "Aimbot", "Enabled")
    },
    fakeduck = var_0_32.reference("RAGE", "Other", "Duck peek assist"),
    os = {
      var_0_32.reference("AA", "Other", "On shot anti-aim")
    },
    dt = {
      var_0_32.reference("RAGE", "Aimbot", "Double tap")
    }
  }
}

function var_0_248()
  local var_291_0 = entity.get_local_player()

  if not var_291_0 then
    return
  end

  if var_0_88.ragebotfeatures.dt:get() then
    local var_291_1 = entity.get_prop(var_291_0, "m_nTickBase") - globals.tickcount()
    local var_291_2 = var_0_32.get(var_0_247.s_0.dt[1]) and var_0_32.get(var_0_247.s_0.dt[2]) and not var_0_32.get(var_0_247.s_0.fakeduck)
    local var_291_3 = var_0_32.get(var_0_247.s_0.os[2]) and var_0_32.get(var_0_247.s_0.os[1]) and not var_0_32.get(var_0_247.s_0.fakeduck)
    local var_291_4 = entity.get_prop(var_291_0, "m_hActiveWeapon")

    if var_291_4 == nil then
      return
    end

    local var_291_5 = entity.get_prop(var_291_4, "m_iItemDefinitionIndex")

    if var_291_5 == nil or var_291_5 == 64 then
      return
    end

    local var_291_6 = entity.get_prop(var_291_4, "m_fLastShotTime")

    if var_291_6 == nil then
      return
    end

    local var_291_7 = ((var_291_5 == 40 or var_291_5 == 9 or var_291_5 == 64 or var_291_5 == 27 or var_291_5 == 29 or var_291_5 == 35) and 0 or 0.5) >= globals.curtime() - var_291_6

    if var_291_1 > 0 and var_291_2 then
      if var_291_7 then
        var_0_32.set(var_0_247.s_0.rage_cb[2], "Always on")
      else
        var_0_32.set(var_0_247.s_0.rage_cb[2], "On hotkey")
      end
    elseif var_291_1 > 0 and var_291_3 then
      if var_291_7 then
        var_0_32.set(var_0_247.s_0.rage_cb[2], "Always on")
      else
        var_0_32.set(var_0_247.s_0.rage_cb[2], "On hotkey")
      end
    else
      var_0_32.set(var_0_247.s_0.rage_cb[2], "Always on")
    end
  end
end

function watermark_custom()
  if not entity.get_local_player() then
    return
  end

  local var_292_0 = var_0_88.Miscellaneous.watermark_name:get()
  local var_292_1, var_292_2, var_292_3, var_292_4 = var_0_88.Miscellaneous.watermark_color:get()
  local var_292_5 = var_0_37.new("alphw", not var_0_88.Miscellaneous.crosshair:get() and 255 or 0, 0.06)
  local var_292_6 = globalize_dpi()
  local var_292_7 = ""

  if var_0_88.Miscellaneous.watermark_mode:get() == "Small" then
    var_292_7 = "c-"
  elseif var_0_88.Miscellaneous.watermark_mode:get() == "Verdana" then
    var_292_7 = "c"
  elseif var_0_88.Miscellaneous.watermark_mode:get() == "Bold" then
    var_292_7 = "cb"
  elseif var_0_88.Miscellaneous.watermark_mode:get() == "Calibri" then
    var_292_7 = "c+"
  end

  local var_292_8, var_292_9, var_292_10 = var_0_88.Miscellaneous.accent_color:get()

  if var_0_88.Miscellaneous.watermark_color_mode:get() == "Static" then
    renderer.text(var_0_15 * 0.5, var_0_16 - 10, var_292_1, var_292_2, var_292_3, var_292_5, var_292_6 .. var_292_7, 0, var_292_0)
  elseif var_0_88.Miscellaneous.watermark_color_mode:get() == "Gradient" then
    renderer.text(var_0_15 * 0.5, var_0_16 - 10, var_292_1, var_292_2, var_292_3, var_292_5, var_292_6 .. var_292_7, 0, var_0_25(globals.curtime() * -1.2, var_292_0, var_292_1, var_292_2, var_292_3, var_292_5, var_292_8, var_292_9, var_292_10, var_292_5))
  elseif var_0_88.Miscellaneous.watermark_color_mode:get() == "Rainbow" and var_292_5 > 0 then
    renderer.text(var_0_15 * 0.5, var_0_16 - 10, var_292_1, var_292_2, var_292_3, var_292_5, var_292_6 .. var_292_7, 0, var_0_26(globals.curtime() * -1.2, var_292_0))
  end
end

local var_0_249 = {
  clamp = function(arg_293_0, arg_293_1, arg_293_2)
    assert(arg_293_0 and arg_293_1 and arg_293_2, "")

    if arg_293_2 < arg_293_1 then
      arg_293_1, arg_293_2 = arg_293_2, arg_293_1
    end

    return var_0_30.max(arg_293_1, var_0_30.min(arg_293_2, arg_293_0))
  end,
  interpolation = function(arg_294_0, arg_294_1, arg_294_2)
    return (arg_294_1 - arg_294_0) * arg_294_2 + arg_294_0
  end
}

function var_0_249.lerp(arg_295_0, arg_295_1, arg_295_2)
  arg_295_2 = arg_295_2 or 0.005
  arg_295_2 = var_0_249.clamp(globals.frametime() * arg_295_2 * 175, 0.01, 1)

  local var_295_0 = var_0_249.interpolation(arg_295_0, arg_295_1, arg_295_2)

  if arg_295_1 == 0 and var_295_0 < 0.01 and var_295_0 > -0.01 then
    var_295_0 = 0
  elseif arg_295_1 == 1 and var_295_0 < 1.01 and var_295_0 > 0.99 then
    var_295_0 = 1
  end

  return var_295_0
end

local var_0_250 = {}
local var_0_251 = {}
local var_0_252 = {
  active = {}
}
local var_0_253 = {}
local var_0_254 = {}

function var_0_250.index(arg_296_0)
  var_0_254[#var_0_254 + 1] = arg_296_0
end

function var_0_255(arg_297_0)
  if var_0_31.match(arg_297_0, "^A$") or var_0_31.match(arg_297_0, "^A - ") then
    return "A"
  elseif var_0_31.match(arg_297_0, "^B$") or var_0_31.match(arg_297_0, "^B - ") then
    return "B"
  elseif arg_297_0 == "FATAL" or var_0_31.match(arg_297_0, " HP") then
    return "FATAL"
  elseif var_0_31.match(arg_297_0, "^HIT_PERCENTAGE ") then
    return "HIT_PERCENTAGE"
  elseif var_0_31.match(arg_297_0, "TA: ") then
    return "TA:"
  else
    return arg_297_0
  end
end

function var_0_256(arg_298_0)
  if var_0_88.Miscellaneous.custom_ind_gs_icon:get() then
    if arg_298_0 == "OSAA" then
      return "☣ OSAA"
    elseif arg_298_0 == "DUCK" then
      return "☭ DUCK"
    elseif arg_298_0 == "DT" then
      return "⚔ DT"
    elseif arg_298_0 == "JS" then
      return "☠ JS"
    elseif arg_298_0 == "DA" then
      return "⛈ DA"
    elseif arg_298_0 == "FS" then
      return "⚖ FS"
    elseif arg_298_0 == "MD" then
      return "✂ MD"
    elseif arg_298_0 == "BODY" then
      return " BODY"
    elseif arg_298_0 == "SAFE" then
      return " SAFE"
    elseif arg_298_0 == "PING" then
      return "⏱ PING"
    elseif #arg_298_0 == 1 and (arg_298_0 == "A" or arg_298_0 == "B") then
      return "⏲ " .. arg_298_0
    elseif var_0_31.match(arg_298_0, "B - ") or var_0_31.match(arg_298_0, "A - ") then
      return "⏲ " .. arg_298_0
    elseif arg_298_0 == "FATAL" or var_0_31.match(arg_298_0, " HP") then
      return "⏱ " .. arg_298_0
    elseif var_0_31.match(arg_298_0, "HIT: ") then
      return " " .. arg_298_0
    elseif var_0_31.match(arg_298_0, "^HM: ") then
      return " " .. var_0_31.match(arg_298_0, "^HM: (.*)")
    else
      return arg_298_0
    end
  else
    return arg_298_0
  end
end

function var_0_250.draw()
  local var_299_0 = {}
  local var_299_1 = var_0_16 - 300

  var_0_251 = var_0_254
  var_0_254 = {}

  for iter_299_0, iter_299_1 in pairs(var_0_251) do
    local var_299_2 = var_0_256(iter_299_1.text)
    local var_299_3 = var_0_255(iter_299_1.text)

    var_0_253[var_299_3] = {
      r = iter_299_1.r,
      g = iter_299_1.g,
      b = iter_299_1.b,
      a = iter_299_1.a
    }

    if not var_0_252.active[var_299_3] then
      var_0_252.active[var_299_3] = {
        a = 0,
        r = 0,
        alpha = 0,
        b = 0,
        g = 0,
        active = true,
        target_y = var_299_1,
        current_y = var_299_1,
        display_text = var_299_2
      }
    else
      var_0_252.active[var_299_3].display_text = var_299_2
    end

    var_299_0[var_299_3] = true
    var_0_252.active[var_299_3].target_y = var_299_1

    local var_299_4 = globalize_dpi()

    var_299_1 = var_299_1 - (var_0_10(renderer.measure_text(var_299_4 .. "+", var_299_2)).y + var_0_88.Miscellaneous.custom_ind_gs_size:get()) + var_0_88.Miscellaneous.custom_ind_gs_rect:get()
  end

  for iter_299_2, iter_299_3 in pairs(var_0_252.active) do
    local var_299_5 = iter_299_3.display_text or iter_299_2
    local var_299_6 = var_0_88.Miscellaneous.custom_ind_gs:get() and 0.1 or 2

    if var_299_0[iter_299_2] then
      iter_299_3.alpha = var_0_249.lerp(iter_299_3.alpha, 1, var_299_6)
      iter_299_3.r = var_0_249.lerp(iter_299_3.r, var_0_253[iter_299_2].r, var_299_6)
      iter_299_3.g = var_0_249.lerp(iter_299_3.g, var_0_253[iter_299_2].g, var_299_6)
      iter_299_3.b = var_0_249.lerp(iter_299_3.b, var_0_253[iter_299_2].b, var_299_6)
      iter_299_3.a = var_0_249.lerp(iter_299_3.a, var_0_253[iter_299_2].a, var_299_6)
      iter_299_3.active = true
    else
      iter_299_3.alpha = var_0_249.lerp(iter_299_3.alpha, 0, var_299_6)
      iter_299_3.r = var_0_249.lerp(iter_299_3.r, var_0_253[iter_299_2].r, var_299_6)
      iter_299_3.g = var_0_249.lerp(iter_299_3.g, var_0_253[iter_299_2].g, var_299_6)
      iter_299_3.b = var_0_249.lerp(iter_299_3.b, var_0_253[iter_299_2].b, var_299_6)
      iter_299_3.a = var_0_249.lerp(iter_299_3.a, var_0_253[iter_299_2].a, var_299_6)

    end

    iter_299_3.current_y = var_0_249.lerp(iter_299_3.current_y, iter_299_3.target_y, var_299_6)

    do
      local var_299_7 = globalize_dpi()
      local var_299_8 = var_0_10(renderer.measure_text(var_299_7 .. "+", var_299_5))
      local var_299_9 = var_0_30.floor(var_299_8.x / 2)
      local var_299_10 = iter_299_3.current_y

      renderer.gradient(10, var_299_10, var_299_9 + 24 - var_0_88.Miscellaneous.custom_ind_gs_rect1:get(), var_299_8.y + 4 - var_0_88.Miscellaneous.custom_ind_gs_rect:get(), 0, 0, 0, 0, 0, 0, 0, var_0_88.Miscellaneous.custom_ind_gs_back:get() * iter_299_3.alpha, true)
      renderer.gradient(34 - var_0_88.Miscellaneous.custom_ind_gs_rect1:get() + var_299_9, var_299_10, 29 + var_299_9 - var_0_88.Miscellaneous.custom_ind_gs_rect1:get(), var_299_8.y + 4 - var_0_88.Miscellaneous.custom_ind_gs_rect:get(), 0, 0, 0, var_0_88.Miscellaneous.custom_ind_gs_back:get() * iter_299_3.alpha, 0, 0, 0, 0, true)
      renderer.text(34 - var_0_88.Miscellaneous.custom_ind_gs_rect1:get(), var_299_10 + 2 - var_0_88.Miscellaneous.custom_ind_gs_rect:get(), iter_299_3.r, iter_299_3.g, iter_299_3.b, iter_299_3.a * iter_299_3.alpha, var_299_7 .. "+", 0, var_299_5)

      if var_0_88.Miscellaneous.custom_ind_gs_color:get() then
        local var_299_11, var_299_12, var_299_13 = var_0_88.Miscellaneous.custom_ind_gs_colorcp:get()

        renderer.text(34 - var_0_88.Miscellaneous.custom_ind_gs_rect1:get(), var_299_10 + 2 - var_0_88.Miscellaneous.custom_ind_gs_rect:get(), var_299_11, var_299_12, var_299_13, 55 * iter_299_3.alpha, var_299_7 .. "+-", 0, var_299_5)
      end
    end

  end
end

local var_0_257 = {}

function var_0_250.output(arg_300_0)
  var_0_29.insert(var_0_257, {
    alpha = 0,
    text = arg_300_0.text,
    realtime = globals.realtime() + 5,
    r = arg_300_0.r,
    g = arg_300_0.g,
    b = arg_300_0.b,
    a = arg_300_0.a,
    newline = arg_300_0.text:sub(-1) ~= "\x00"
  })
end

var_0_33.set_event_callback("output", var_0_250.output)

function var_0_250.logs()
  if not var_0_257 or #var_0_257 == 0 then
    return
  end

  local var_301_0 = globalize_dpi()
  local var_301_1 = ""
  local var_301_2 = var_0_88.Miscellaneous.output_font:get()

  if var_301_2 == "Small" then
    var_301_1 = "-"
  elseif var_301_2 == "Verdana" then
    var_301_1 = ""
  elseif var_301_2 == "Bold" then
    var_301_1 = "b"
  end

  for iter_301_0 = #var_0_257, 1, -1 do
    local var_301_3 = var_0_257[iter_301_0]

    var_301_3.measure = renderer.text(var_301_0 .. var_301_1, var_301_3.text)

    if not var_301_3 then
      var_0_29.remove(var_0_257, iter_301_0)
    else
      local var_301_4 = var_0_88.Miscellaneous.output_anim:get() and 0.1 or 1

      if var_301_3.realtime > globals.realtime() then
        var_301_3.alpha = var_0_30.lerp2(var_301_3.alpha, 1, var_301_4)
      else
        var_301_3.alpha = var_0_30.lerp2(var_301_3.alpha, 0, var_301_4)
      end

      if var_301_3.alpha <= 0 then
        var_0_29.remove(var_0_257, iter_301_0)
      end
    end
  end

  local var_301_5 = var_0_88.Miscellaneous.output_y:get()
  local var_301_6 = var_0_88.Miscellaneous.output_x:get()

  for iter_301_1, iter_301_2 in ipairs(var_0_257) do
    local var_301_7 = iter_301_1 > 1 and var_0_257[iter_301_1] and var_0_257[iter_301_1].text or iter_301_2.text
    local var_301_8 = var_0_10(renderer.measure_text(var_301_0 .. var_301_1, var_301_7))

    if var_301_1 == "-" then
      var_301_7 = iter_301_1 > 1 and var_0_257[iter_301_1] and var_0_257[iter_301_1].text:upper() or iter_301_2.text:upper()
      var_301_8 = var_0_10(renderer.measure_text(var_301_0 .. var_301_1, var_301_7))
    end

    if iter_301_2.newline and var_0_88.Miscellaneous.output_back:get() then
      renderer.gradient(var_0_88.Miscellaneous.output_x:get(), var_301_5 - 4, var_301_6 / 2, var_301_8.y + 4, 0, 0, 0, 0, 0, 0, 0, 55 * iter_301_2.alpha, true)
      renderer.gradient(var_301_6 / 2 + var_0_88.Miscellaneous.output_x:get(), var_301_5 - 4, var_301_6 / 2, var_301_8.y + 4, 0, 0, 0, 55 * iter_301_2.alpha, 0, 0, 0, 0, true)
    end

    renderer.text(var_301_6, var_301_5 - 2, iter_301_2.r, iter_301_2.g, iter_301_2.b, iter_301_2.a * iter_301_2.alpha, var_301_0 .. var_301_1, nil, var_301_7)

    if iter_301_2.newline then
      local var_301_9 = var_0_88.Miscellaneous.output_back:get() and 10 or 5

      var_301_6 = var_0_88.Miscellaneous.output_x:get()
      var_301_5 = var_301_5 + (var_301_8.y + var_301_9) * iter_301_2.alpha
    else
      var_301_6 = var_301_6 + var_301_8.x
    end
  end
end

var_0_33.set_event_callback("paint_ui", var_0_250.logs)

local var_0_258 = {
  "❝𝘿𝙞𝙨𝙘𝙧𝙚𝙩𝙚𝙡𝙮, 𝙄 𝙨𝙦𝙪𝙞𝙧𝙩𝙚𝙙 𝙩𝙝𝙚 𝙙𝙞𝙛𝙛𝙚𝙧𝙚𝙣𝙘𝙚 𝙞𝙣𝙩𝙤 𝙖 𝙗𝙞𝙣.❝",
  "❝𝙒𝙝𝙮 𝙮𝙤𝙪 𝙙𝙚𝙖𝙙..?❝",
  "❝𝙍𝙞𝙨𝙚𝙖𝙗𝙤𝙫𝙚.𝙖𝙨𝙞𝙖❝",
  "❝𝙉𝙚𝙬 𝙪𝙥𝙙𝙖𝙩𝙚 𝙤𝙬𝙣 𝙖𝙡𝙡❝",
  "❝𝘿𝙚𝙖𝙙 𝙙𝙮𝙣𝙖𝙨𝙩𝙮.❝",
  "❝𝘼𝙣𝙤𝙩𝙝𝙚𝙧 𝙤𝙣𝙚 𝙞𝙨 200.❝",
  "❝𝙃1𝙖3, 𝙬𝙞𝙡𝙡 𝙛𝙪𝙣?❝",
  "❝𝙒𝙚𝙡𝙘𝙤𝙢𝙚, 1.❝",
  "❝𝙂𝙤𝙩 𝙧𝙖𝙥𝙚𝙙.❝",
  "❝𝙍𝙞𝙨𝙚𝙖𝙗𝙤𝙫𝙚.𝙖𝙨𝙞𝙖❝",
  "❝𝙔𝙤𝙪𝙧 𝙜𝙧𝙖𝙙𝙪𝙨 𝙞𝙨 𝙤𝙣𝙚.❝",
  "͇Б͇у͇д͇ь͇ ͇м͇е͇р͇т͇в.",
  "͇Т͇ы͇ ͇в͇ы͇г͇л͇я͇д͇и͇ш͇ь͇ ͇к͇р͇а͇с͇и͇в͇ы͇м͇,͇ ͇к͇о͇г͇д͇а͇ ͇м͇е͇р͇т͇в͇.",
  "͇Н͇е͇ ͇з͇л͇и͇с͇ь͇,͇ ͇д͇а͇л͇ь͇ш͇е͇ ͇д͇о͇р͇о͇г͇а͇ ͇в͇ ͇а͇д͇.",
  "❝𝙊 𝙜𝙪𝙚𝙩𝙤 é 𝙢𝙪𝙞𝙩𝙤 𝙗𝙤𝙣𝙞𝙩𝙤.❝",
  "❝𝘾𝙖𝙧𝙜𝙤 𝙩𝙬𝙤 𝙝𝙪𝙣𝙙𝙧𝙚𝙙.❝",
  "❝𝙁𝙐𝘾𝙆 𝘼𝙇𝙇.❝",
  "❝𝙊𝙣𝙡𝙮 𝙩𝙖𝙥𝙨.❝",
  "❝𝙄`𝙢 𝙃1𝙖3, 𝙮𝙤𝙪 𝙨𝙪𝙘𝙠𝙚𝙧.❝",
  "❝𝙎𝙪𝙘𝙠 𝙢𝙮 𝙗𝙖𝙡𝙨.❝",
  "❝𝙍𝙖𝙥𝙚𝙙 𝙗𝙮 𝙃1𝙖3.❝",
  "❝𝙍𝙞𝙨𝙚𝙖𝙗𝙤𝙫𝙚.𝙖𝙨𝙞𝙖❝",
  "❝𝙍𝙤𝙖𝙙 𝙩𝙤 𝙝𝙚𝙡𝙡.❝",
  "❝𝙃𝙚𝙡𝙡𝙤, 𝓨𝓲𝓲𝓾7𝓲.❝",
  "❝𝙏𝙖𝙥𝙚𝙙 𝙗𝙮 𝙧𝙞𝙨𝙚𝙖𝙗𝙤𝙫𝙚.❝",
  "❝𝙍𝙄𝙎𝙀𝘼𝘽𝙊𝙑𝙀 𝙒𝙄𝙇𝙇 𝘼𝙇𝙒𝘼𝙔𝙎 𝘽𝙀 𝘼𝙃𝙀𝘼𝘿.❝",
  "❝𝙊𝙬𝙣𝙚𝙙 𝙗𝙮 𝙧𝙞𝙨𝙚𝙖𝙗𝙤𝙫𝙚.𝙖𝙨𝙞𝙖❝",
  "❝𝙃1𝙖3 𝙥𝙖𝙬𝙨 𝙖𝙣𝙙 𝙚𝙖𝙧𝙨.❝",
  "❝𝙏𝙧𝙖𝙨𝙝, 𝙚𝙯.❝",
  "❝𝙇𝙊𝙎𝙀𝙍.❝",
  "❝1❝",
  "❝𝙎𝙪𝙘𝙠𝙚𝙧, 𝙨𝙪𝙘𝙠𝙚𝙧!❝",
  "❝𝙊𝙬𝙣𝙚𝙙 𝙗𝙮 𝙃1𝙖3.❝",
  "❝𝙀𝙕 𝙂𝘼𝙈𝙀.❝",
  "❝𝙧𝙞𝙨𝙚𝙖𝙗𝙤𝙫𝙚 / 𝙝1𝙖3 𝙭 𝙔𝙞𝙞𝙪7𝙞❝"
}
local var_0_259 = var_0_33.userid_to_entindex
local var_0_260 = entity.get_local_player
local var_0_261 = entity.is_enemy
local var_0_262 = var_0_33.exec

function var_0_263(arg_302_0)
  if not var_0_88.Miscellaneous.Chat_spammer:get() then
    return
  end

  local var_302_0 = arg_302_0.userid
  local var_302_1 = arg_302_0.attacker

  if var_302_0 == nil or var_302_1 == nil then
    return
  end

  local var_302_2 = var_0_259(var_302_0)
  local var_302_3 = var_0_259(var_302_1)

  if var_0_88.Miscellaneous.Chat_spammer_type:get() == "Downabout.asia" then
    if var_302_3 == var_0_260() and var_0_261(var_302_2) then
      var_0_33.delay_call(1, function()
        var_0_262("say ", var_0_258[var_0_30.random(1, #var_0_258)])
      end)
    end
  elseif var_0_88.Miscellaneous.Chat_spammer_type:get() == "1" and var_302_3 == var_0_260() and var_0_261(var_302_2) then
    var_0_33.delay_call(0.5, function()
      var_0_262("say ", 1)
    end)
  end
end

function var_0_264(arg_305_0)
  local var_305_0 = entity.get_local_player()

  if not var_305_0 then
    return
  end

  if not entity.is_alive(var_305_0) then
    return
  end

  local var_305_1 = entity.get_players(true)
  local var_305_2 = var_0_10(entity.get_prop(var_305_0, "m_vecOrigin"))
  local var_305_3 = entity.get_player_weapon(var_305_0)

  if entity.get_classname(var_305_3) ~= "CWeaponSSG08" then
    return
  end

  local var_305_4 = ({
    entity.get_prop(var_305_0, "m_vecVelocity")
  })[3] > 0
  local var_305_5 = entity.get_prop(var_305_0, "m_fFlags")
  local var_305_6 = var_0_12.band(var_305_5, 1) == 0

  if var_0_88.ragebotfeatures.Jumpstop:get() and var_0_88.ragebotfeatures.Jumpstop_hotkey:get() then
    local var_305_7 = var_0_33.current_threat()

    if not var_305_7 then
      return
    end

    if not var_305_6 then
      return
    end

    if not var_305_4 then
      return
    end

    local var_305_8, var_305_9, var_305_10 = entity.get_prop(var_305_7, "m_vecOrigin")

    if var_0_178(var_305_2.x, var_305_2.y, var_305_2.z, var_305_8, var_305_9, var_305_10) <= var_0_88.ragebotfeatures.Jumpstop_distance:get() and arg_305_0.quick_stop then
      arg_305_0.in_speed = 1
    end
  end
end

local var_0_265 = 3
local var_0_266 = 1.5
local var_0_267 = 0
local var_0_268 = true

if not readfile("Downabout/nekochan_bg.png") then
  var_0_19("https://Leaks.s7ae.cc/res/nekochan-bg.png", "Downabout/nekochan_bg.png")
end

function var_0_269()
  local var_306_0 = renderer.load_png(readfile("Downabout/nekochan_bg.png"), 1, 1)
  local var_306_1 = var_0_33.unix_time() - var_0_78

  if var_306_1 <= var_0_266 then
    var_0_267 = var_0_37.new("alpha", var_306_1 / var_0_266 * 255, 0.06)
  elseif var_306_1 <= var_0_265 - var_0_266 then
    var_0_267 = var_0_37.new("alpha", 255, 0.06)
  elseif var_306_1 <= var_0_265 then
    var_0_267 = var_0_37.new("alpha", (var_0_265 - var_306_1) / var_0_266 * 255, 0.06)
  else
    var_0_268 = false

    return
  end

  renderer.rectangle(0, 0, var_0_15, var_0_16, 0, 0, 0, var_0_30.floor(var_0_267) * 0.5)
  renderer.texture(var_306_0, var_0_15 * 0.5 - 225, var_0_16 * 0.5 - 400, 500, 720, 255, 255, 255, var_0_30.floor(var_0_267), "f")
end

function var_0_75.save(arg_307_0)
  local var_307_0 = database.read(var_0_76.database.configs) or {}

  if arg_307_0:match("[^%w]") ~= nil then
    return
  end

  local var_307_1 = var_0_4.encode(var_0_8.stringify(var_0_39:save()))
  local var_307_2 = var_0_4.encode(var_0_8.stringify(var_0_41:save()))
  local var_307_3 = var_0_75.get(arg_307_0)

  if not var_307_3 then
    var_0_29.insert(var_307_0, {
      name = arg_307_0,
      config = var_307_1,
      config2 = var_307_2
    })
  else
    var_307_0[var_307_3.index].config = var_307_1
    var_307_0[var_307_3.index].config2 = var_307_2
  end

  database.write(var_0_76.database.configs, var_307_0)
end

function var_0_75.delete(arg_308_0)
  local var_308_0 = database.read(var_0_76.database.configs) or {}

  for iter_308_0, iter_308_1 in pairs(var_308_0) do
    if iter_308_1.name == arg_308_0 then
      var_0_29.remove(var_308_0, iter_308_0)

      break
    end
  end

  for iter_308_2, iter_308_3 in pairs(var_0_77) do
    if iter_308_3.name == arg_308_0 then
      return false
    end
  end

  database.write(var_0_76.database.configs, var_308_0)
end

function var_0_75.config_list()
  local var_309_0 = database.read(var_0_76.database.configs) or {}
  local var_309_1 = {}

  for iter_309_0, iter_309_1 in pairs(var_0_77) do
    var_0_29.insert(var_309_1, iter_309_1.name)
  end

  for iter_309_2, iter_309_3 in pairs(var_309_0) do
    var_0_29.insert(var_309_1, iter_309_3.name)
  end

  return var_309_1
end

var_0_41 = var_0_43.setup(var_0_99)
var_0_39 = var_0_43.setup(var_0_88)

function var_0_75.load_settings(arg_310_0, arg_310_1)
  var_0_39:load(arg_310_0)
  var_0_41:load(arg_310_1)
end

function var_0_75.import_settings()
  local var_311_0 = var_0_5.get():gsub("Downabout.asia::GS::Recode", "")
  local var_311_1 = var_0_8.parse(var_0_4.decode(var_311_0))

  var_0_75.load_settings(var_311_1.config, var_311_1.config2)
end

function var_0_75.export_settings(arg_312_0)
  local var_312_0 = {
    config = var_0_39:save(),
    config2 = var_0_41:save()
  }
  local var_312_1 = var_0_8.stringify(var_312_0)
  local var_312_2 = "Downabout.asia::GS::Recode::" .. var_0_4.encode(var_312_1)

  var_0_5.set(var_312_2)
end

function var_0_75.load(arg_313_0)
  local var_313_0 = var_0_75.get(arg_313_0)

  var_0_75.load_settings(var_0_8.parse(var_0_4.decode(var_313_0.config)), var_0_8.parse(var_0_4.decode(var_313_0.config2)))
end

var_0_88.config.list_box:set_callback(function(arg_314_0)
  if arg_314_0 == nil then
    return
  end

  local var_314_0 = ""
  local var_314_1 = var_0_75.config_list()

  if var_314_1 == nil then
    return
  end

  local var_314_2 = var_314_1[arg_314_0:get() + 1] or ""

  var_0_88.config.name:set(var_314_2)
end)
var_0_88.config.buttom_load:set_callback(function()
  local var_315_0 = var_0_88.config.name:get()

  if var_315_0 == "" then
    return
  end

  local var_315_1, var_315_2 = pcall(var_0_75.load, var_315_0)

  var_0_234()
  var_0_239()

  if var_315_1 then
    var_315_0 = var_315_0:gsub("*", "")

    print("Successfully loaded " .. var_315_0)
  else
    print("Failed to load " .. var_315_0)
    print("Debug: ", var_315_2)
  end
end)
var_0_88.config.buttom_create:set_callback(function()
  local var_316_0 = var_0_88.config.name:get()

  if var_316_0 == "" then
    return
  end

  for iter_316_0, iter_316_1 in pairs(var_0_77) do
    if iter_316_1.name == var_316_0:gsub("*", "") then
      print("You cant save built-in preset")

      return
    end
  end

  if var_316_0:match("[^%w]") ~= nil then
    print("Failed to save " .. var_316_0 .. " due to invalid characters")

    return
  end

  function var_316_1()
    var_0_75.save(var_316_0)
    var_0_88.config.list_box:update(var_0_75.config_list())
  end

  var_0_233()
  var_0_238()

  if pcall(var_316_1) then
    print("Successfully saved " .. var_316_0)
  else
    print("Failed to save " .. var_316_0)
  end
end)
var_0_88.config.buttom_delete:set_callback(function()
  local var_318_0 = var_0_88.config.name:get()

  if var_318_0 == "" then
    return
  end

  if var_0_75.delete(var_318_0) == false then
    print("Failed to delete " .. var_318_0)
    var_0_88.config.list_box:update(var_0_75.config_list())

    return
  end

  for iter_318_0, iter_318_1 in pairs(var_0_77) do
    if iter_318_1.name == var_318_0:gsub("*", "") then
      print("You can`t delete built-in preset " .. var_318_0:gsub("*", ""))

      return
    end
  end

  var_0_75.delete(var_318_0)
  var_0_88.config.list_box:update(var_0_75.config_list())
  var_0_88.config.list_box:set(#var_0_77 - 1 or "")
  var_0_88.config.name:set(#database.read(var_0_76.database.configs) == 0 and "" or var_0_75.config_list()[#var_0_77])
  print("Successfully deleted " .. var_318_0)
end)
var_0_88.config.buttom_import:set_callback(function()
  function var_319_0()
    var_0_75.import_settings()
  end

  if pcall(var_319_0) then
    print("Successfully imported settings")
  else
    print("Failed to import settings")
  end
end)
var_0_88.config.buttom_export:set_callback(function()
  local var_321_0 = var_0_88.config.name:get()

  if var_321_0 == "" then
    return
  end

  function var_321_1()
    var_0_75.export_settings(var_321_0)
  end

  if pcall(var_321_1) then
    print("Successfully exported settings")
  else
    print("Failed to export settings")
  end
end)
;(function()
  if database.read(var_0_76.database.configs) == nil then
    database.write(var_0_76.database.configs, {})
  end

  local var_323_0 = "eyJjb25maWcyIjpbeyJlbmFibGUiOmZhbHNlLCJtb2RfdHlwZTIiOiJPZmYiLCJ5YXdfZGVsYXkyIjo0LCJ5YXdfcmlnaHQyIjowLCJkZWZlbnNpdmVfcmlnaHQiOjAsIndheTIyIjowLCJkZWZlbnNpdmVfcmFuZG9tIjowLCJkZWZlbnNpdmVfc3BpbiI6MCwiZGVmZW5zaXZlX3JhbmRvbWl6ZSI6MCwiZGVmZW5zaXZlX3NraXR0ZXIiOjAsIndheTU1IjowLCJwaXRjaF9zbGlkZXIxIjowLCJ3YXkxIjowLCJib2R5X3NsaWRlcjIiOjAsInBpdGNoX3NsaWRlcjIiOjAsIlJhbmRvbV9kZWxheSI6MCwid2F5MzMiOjAsInBpdGNoX3R5cGUiOiJPZmYiLCJwaXRjaF9zcGVlZDIiOjIwLCJwaXRjaF9zcGluIjowLCJ5YXdfbHIiOmZhbHNlLCJkZWZlbnNpdmVfaml0dGVyIjowLCJkZWZlbnNlX2FhX3R5cGUiOiJPZmYiLCJ5YXdfb2Zmc2V0X3NsaWRlciI6MCwid2F5NDQiOjAsImRlbGF5IjpmYWxzZSwiZm9yY2VfbGMiOmZhbHNlLCJlbmFibGUyIjpmYWxzZSwicGl0Y2hfc3Bpbl9tb2QiOjAsImRlZmVuc2l2ZV9zcGVlZCI6MCwiYWRhcHRpdmVfZGVzeW5jIjpmYWxzZSwicGl0Y2hfc3BpbjIiOjAsIndheTExIjowLCJ5YXdfcmFuZG9tMiI6MCwicGl0Y2hfc3BpbjJfbW9kIjowLCJ5YXdfbGVmdDIiOjAsImRlZmVuc2VfYWFfc2xpZGVyIjowLCJwaXRjaF9qaXR0ZXIyIjowLCJwaXRjaF9zcGVlZCI6MjAsIm1vZF9kbTIiOjAsInBpdGNoX2ppdHRlciI6MCwicGl0Y2hfc2xpZGVyIjowLCJ3YXkzIjowLCJ3YXkyIjowLCJib2R5X3lhd190eXBlMiI6Ik9mZiIsImRlZmVuc2l2ZV9sZWZ0IjowfSx7ImVuYWJsZSI6ZmFsc2UsIm1vZF90eXBlMiI6Ik9mZnNldCIsInlhd19kZWxheTIiOjMsInlhd19yaWdodDIiOi01LCJkZWZlbnNpdmVfcmlnaHQiOi01LCJ3YXkyMiI6MCwiZGVmZW5zaXZlX3JhbmRvbSI6OTcsImRlZmVuc2l2ZV9zcGluIjo5NywiZGVmZW5zaXZlX3JhbmRvbWl6ZSI6MCwiZGVmZW5zaXZlX3NraXR0ZXIiOjk3LCJ3YXk1NSI6MCwicGl0Y2hfc2xpZGVyMSI6MCwid2F5MSI6MCwiYm9keV9zbGlkZXIyIjotNDUsInBpdGNoX3NsaWRlcjIiOjAsIlJhbmRvbV9kZWxheSI6MCwid2F5MzMiOjAsInBpdGNoX3R5cGUiOiJTdGF0aWMiLCJwaXRjaF9zcGVlZDIiOjIwLCJwaXRjaF9zcGluIjowLCJ5YXdfbHIiOnRydWUsImRlZmVuc2l2ZV9qaXR0ZXIiOjk3LCJkZWZlbnNlX2FhX3R5cGUiOiJKaXR0ZXIiLCJ5YXdfb2Zmc2V0X3NsaWRlciI6OCwid2F5NDQiOjAsImRlbGF5IjpmYWxzZSwiZm9yY2VfbGMiOmZhbHNlLCJlbmFibGUyIjp0cnVlLCJwaXRjaF9zcGluX21vZCI6MCwiZGVmZW5zaXZlX3NwZWVkIjo0LCJhZGFwdGl2ZV9kZXN5bmMiOmZhbHNlLCJwaXRjaF9zcGluMiI6MCwid2F5MTEiOjAsInlhd19yYW5kb20yIjowLCJwaXRjaF9zcGluMl9tb2QiOjAsInlhd19sZWZ0MiI6LTE5LCJkZWZlbnNlX2FhX3NsaWRlciI6OTcsInBpdGNoX2ppdHRlcjIiOjAsInBpdGNoX3NwZWVkIjoyMCwibW9kX2RtMiI6MzQsInBpdGNoX2ppdHRlciI6MCwicGl0Y2hfc2xpZGVyIjowLCJ3YXkzIjowLCJ3YXkyIjowLCJib2R5X3lhd190eXBlMiI6IkppdHRlciIsImRlZmVuc2l2ZV9sZWZ0IjotMTl9LHsiZW5hYmxlIjpmYWxzZSwibW9kX3R5cGUyIjoiUmFuZG9tIiwieWF3X2RlbGF5MiI6MSwieWF3X3JpZ2h0MiI6MzIsImRlZmVuc2l2ZV9yaWdodCI6MzIsIndheTIyIjowLCJkZWZlbnNpdmVfcmFuZG9tIjowLCJkZWZlbnNpdmVfc3BpbiI6MCwiZGVmZW5zaXZlX3JhbmRvbWl6ZSI6MCwiZGVmZW5zaXZlX3NraXR0ZXIiOjAsIndheTU1IjowLCJwaXRjaF9zbGlkZXIxIjowLCJ3YXkxIjowLCJib2R5X3NsaWRlcjIiOi0xNjIsInBpdGNoX3NsaWRlcjIiOjAsIlJhbmRvbV9kZWxheSI6MCwid2F5MzMiOjAsInBpdGNoX3R5cGUiOiJPZmYiLCJwaXRjaF9zcGVlZDIiOjIwLCJwaXRjaF9zcGluIjowLCJ5YXdfbHIiOnRydWUsImRlZmVuc2l2ZV9qaXR0ZXIiOjAsImRlZmVuc2VfYWFfdHlwZSI6Ik9mZiIsInlhd19vZmZzZXRfc2xpZGVyIjowLCJ3YXk0NCI6MCwiZGVsYXkiOmZhbHNlLCJmb3JjZV9sYyI6ZmFsc2UsImVuYWJsZTIiOnRydWUsInBpdGNoX3NwaW5fbW9kIjowLCJkZWZlbnNpdmVfc3BlZWQiOjAsImFkYXB0aXZlX2Rlc3luYyI6ZmFsc2UsInBpdGNoX3NwaW4yIjowLCJ3YXkxMSI6MCwieWF3X3JhbmRvbTIiOjAsInBpdGNoX3NwaW4yX21vZCI6MCwieWF3X2xlZnQyIjotMTIsImRlZmVuc2VfYWFfc2xpZGVyIjowLCJwaXRjaF9qaXR0ZXIyIjowLCJwaXRjaF9zcGVlZCI6MjAsIm1vZF9kbTIiOjc5LCJwaXRjaF9qaXR0ZXIiOjAsInBpdGNoX3NsaWRlciI6MCwid2F5MyI6MCwid2F5MiI6MCwiYm9keV95YXdfdHlwZTIiOiJTdGF0aWMiLCJkZWZlbnNpdmVfbGVmdCI6LTEyfSx7ImVuYWJsZSI6ZmFsc2UsIm1vZF90eXBlMiI6IkNlbnRlciIsInlhd19kZWxheTIiOjIsInlhd19yaWdodDIiOjIzLCJkZWZlbnNpdmVfcmlnaHQiOjIzLCJ3YXkyMiI6MCwiZGVmZW5zaXZlX3JhbmRvbSI6MTgwLCJkZWZlbnNpdmVfc3BpbiI6MTgwLCJkZWZlbnNpdmVfcmFuZG9taXplIjowLCJkZWZlbnNpdmVfc2tpdHRlciI6MTgwLCJ3YXk1NSI6MCwicGl0Y2hfc2xpZGVyMSI6MCwid2F5MSI6MCwiYm9keV9zbGlkZXIyIjoxMzUsInBpdGNoX3NsaWRlcjIiOjAsIlJhbmRvbV9kZWxheSI6MCwid2F5MzMiOjAsInBpdGNoX3R5cGUiOiJTcGluW01PRF0iLCJwaXRjaF9zcGVlZDIiOjIwLCJwaXRjaF9zcGluIjowLCJ5YXdfbHIiOnRydWUsImRlZmVuc2l2ZV9qaXR0ZXIiOjE4MCwiZGVmZW5zZV9hYV90eXBlIjoiU2tpdHRlciIsInlhd19vZmZzZXRfc2xpZGVyIjotOSwid2F5NDQiOjAsImRlbGF5Ijp0cnVlLCJmb3JjZV9sYyI6ZmFsc2UsImVuYWJsZTIiOnRydWUsInBpdGNoX3NwaW5fbW9kIjowLCJkZWZlbnNpdmVfc3BlZWQiOjUsImFkYXB0aXZlX2Rlc3luYyI6dHJ1ZSwicGl0Y2hfc3BpbjIiOjAsIndheTExIjowLCJ5YXdfcmFuZG9tMiI6MCwicGl0Y2hfc3BpbjJfbW9kIjowLCJ5YXdfbGVmdDIiOi0yNSwiZGVmZW5zZV9hYV9zbGlkZXIiOjE4MCwicGl0Y2hfaml0dGVyMiI6MCwicGl0Y2hfc3BlZWQiOjIwLCJtb2RfZG0yIjo3LCJwaXRjaF9qaXR0ZXIiOjAsInBpdGNoX3NsaWRlciI6MCwid2F5MyI6MCwid2F5MiI6MCwiYm9keV95YXdfdHlwZTIiOiJKaXR0ZXIiLCJkZWZlbnNpdmVfbGVmdCI6LTI1fSx7ImVuYWJsZSI6dHJ1ZSwibW9kX3R5cGUyIjoiQ2VudGVyIiwieWF3X2RlbGF5MiI6MCwieWF3X3JpZ2h0MiI6LTE1LCJkZWZlbnNpdmVfcmlnaHQiOi04MCwid2F5MjIiOjAsImRlZmVuc2l2ZV9yYW5kb20iOjkwLCJkZWZlbnNpdmVfc3BpbiI6OTAsImRlZmVuc2l2ZV9yYW5kb21pemUiOjE4LCJkZWZlbnNpdmVfc2tpdHRlciI6OTAsIndheTU1IjowLCJwaXRjaF9zbGlkZXIxIjowLCJ3YXkxIjowLCJib2R5X3NsaWRlcjIiOi01NiwicGl0Y2hfc2xpZGVyMiI6MCwiUmFuZG9tX2RlbGF5IjowLCJ3YXkzMyI6MCwicGl0Y2hfdHlwZSI6IlNwaW5bTU9EXSIsInBpdGNoX3NwZWVkMiI6NTAsInBpdGNoX3NwaW4iOjAsInlhd19sciI6dHJ1ZSwiZGVmZW5zaXZlX2ppdHRlciI6OTAsImRlZmVuc2VfYWFfdHlwZSI6IkppdHRlcltMXC9SXSIsInlhd19vZmZzZXRfc2xpZGVyIjowLCJ3YXk0NCI6MCwiZGVsYXkiOmZhbHNlLCJmb3JjZV9sYyI6dHJ1ZSwiZW5hYmxlMiI6dHJ1ZSwicGl0Y2hfc3Bpbl9tb2QiOjg5LCJkZWZlbnNpdmVfc3BlZWQiOjMsImFkYXB0aXZlX2Rlc3luYyI6ZmFsc2UsInBpdGNoX3NwaW4yIjowLCJ3YXkxMSI6MCwieWF3X3JhbmRvbTIiOjgsInBpdGNoX3NwaW4yX21vZCI6LTg5LCJ5YXdfbGVmdDIiOi01LCJkZWZlbnNlX2FhX3NsaWRlciI6OTAsInBpdGNoX2ppdHRlcjIiOjAsInBpdGNoX3NwZWVkIjoyMCwibW9kX2RtMiI6MywicGl0Y2hfaml0dGVyIjowLCJwaXRjaF9zbGlkZXIiOjAsIndheTMiOjAsIndheTIiOjAsImJvZHlfeWF3X3R5cGUyIjoiSml0dGVyIiwiZGVmZW5zaXZlX2xlZnQiOjg5fSx7ImVuYWJsZSI6dHJ1ZSwibW9kX3R5cGUyIjoiQ2VudGVyIiwieWF3X2RlbGF5MiI6MCwieWF3X3JpZ2h0MiI6MzMsImRlZmVuc2l2ZV9yaWdodCI6ODksIndheTIyIjowLCJkZWZlbnNpdmVfcmFuZG9tIjo5OSwiZGVmZW5zaXZlX3NwaW4iOjk5LCJkZWZlbnNpdmVfcmFuZG9taXplIjoyMCwiZGVmZW5zaXZlX3NraXR0ZXIiOjk5LCJ3YXk1NSI6MCwicGl0Y2hfc2xpZGVyMSI6LTY4LCJ3YXkxIjowLCJib2R5X3NsaWRlcjIiOjI1LCJwaXRjaF9zbGlkZXIyIjowLCJSYW5kb21fZGVsYXkiOjAsIndheTMzIjowLCJwaXRjaF90eXBlIjoiU3BpbltNT0RdIiwicGl0Y2hfc3BlZWQyIjo1MCwicGl0Y2hfc3BpbiI6MCwieWF3X2xyIjp0cnVlLCJkZWZlbnNpdmVfaml0dGVyIjo5OSwiZGVmZW5zZV9hYV90eXBlIjoiSml0dGVyW0xcL1JdIiwieWF3X29mZnNldF9zbGlkZXIiOjIsIndheTQ0IjowLCJkZWxheSI6ZmFsc2UsImZvcmNlX2xjIjp0cnVlLCJlbmFibGUyIjp0cnVlLCJwaXRjaF9zcGluX21vZCI6LTg5LCJkZWZlbnNpdmVfc3BlZWQiOjQsImFkYXB0aXZlX2Rlc3luYyI6ZmFsc2UsInBpdGNoX3NwaW4yIjowLCJ3YXkxMSI6MCwieWF3X3JhbmRvbTIiOjAsInBpdGNoX3NwaW4yX21vZCI6ODksInlhd19sZWZ0MiI6LTMzLCJkZWZlbnNlX2FhX3NsaWRlciI6OTksInBpdGNoX2ppdHRlcjIiOjAsInBpdGNoX3NwZWVkIjoyMCwibW9kX2RtMiI6MSwicGl0Y2hfaml0dGVyIjowLCJwaXRjaF9zbGlkZXIiOjAsIndheTMiOjAsIndheTIiOjAsImJvZHlfeWF3X3R5cGUyIjoiSml0dGVyIiwiZGVmZW5zaXZlX2xlZnQiOi04NH0seyJlbmFibGUiOmZhbHNlLCJtb2RfdHlwZTIiOiJPZmZzZXQiLCJ5YXdfZGVsYXkyIjowLCJ5YXdfcmlnaHQyIjozNywiZGVmZW5zaXZlX3JpZ2h0IjozNywid2F5MjIiOjAsImRlZmVuc2l2ZV9yYW5kb20iOjAsImRlZmVuc2l2ZV9zcGluIjowLCJkZWZlbnNpdmVfcmFuZG9taXplIjowLCJkZWZlbnNpdmVfc2tpdHRlciI6MCwid2F5NTUiOjAsInBpdGNoX3NsaWRlcjEiOi0xNSwid2F5MSI6MCwiYm9keV9zbGlkZXIyIjotOTksInBpdGNoX3NsaWRlcjIiOjAsIlJhbmRvbV9kZWxheSI6MCwid2F5MzMiOjAsInBpdGNoX3R5cGUiOiJTdGF0aWMiLCJwaXRjaF9zcGVlZDIiOjIwLCJwaXRjaF9zcGluIjowLCJ5YXdfbHIiOnRydWUsImRlZmVuc2l2ZV9qaXR0ZXIiOjAsImRlZmVuc2VfYWFfdHlwZSI6IkppdHRlciIsInlhd19vZmZzZXRfc2xpZGVyIjowLCJ3YXk0NCI6MCwiZGVsYXkiOmZhbHNlLCJmb3JjZV9sYyI6ZmFsc2UsImVuYWJsZTIiOnRydWUsInBpdGNoX3NwaW5fbW9kIjowLCJkZWZlbnNpdmVfc3BlZWQiOi01LCJhZGFwdGl2ZV9kZXN5bmMiOmZhbHNlLCJwaXRjaF9zcGluMiI6MCwid2F5MTEiOjAsInlhd19yYW5kb20yIjowLCJwaXRjaF9zcGluMl9tb2QiOjAsInlhd19sZWZ0MiI6LTI3LCJkZWZlbnNlX2FhX3NsaWRlciI6MCwicGl0Y2hfaml0dGVyMiI6MCwicGl0Y2hfc3BlZWQiOjIwLCJtb2RfZG0yIjo5LCJwaXRjaF9qaXR0ZXIiOjAsInBpdGNoX3NsaWRlciI6MCwid2F5MyI6MCwid2F5MiI6MCwiYm9keV95YXdfdHlwZTIiOiJKaXR0ZXIiLCJkZWZlbnNpdmVfbGVmdCI6LTI3fSx7ImVuYWJsZSI6ZmFsc2UsIm1vZF90eXBlMiI6Ik9mZnNldCIsInlhd19kZWxheTIiOjAsInlhd19yaWdodDIiOjM0LCJkZWZlbnNpdmVfcmlnaHQiOjM0LCJ3YXkyMiI6MCwiZGVmZW5zaXZlX3JhbmRvbSI6OTcsImRlZmVuc2l2ZV9zcGluIjo5NywiZGVmZW5zaXZlX3JhbmRvbWl6ZSI6MCwiZGVmZW5zaXZlX3NraXR0ZXIiOjk3LCJ3YXk1NSI6MCwicGl0Y2hfc2xpZGVyMSI6MCwid2F5MSI6MCwiYm9keV9zbGlkZXIyIjoxLCJwaXRjaF9zbGlkZXIyIjowLCJSYW5kb21fZGVsYXkiOjAsIndheTMzIjowLCJwaXRjaF90eXBlIjoiU3RhdGljIiwicGl0Y2hfc3BlZWQyIjoyMCwicGl0Y2hfc3BpbiI6MCwieWF3X2xyIjp0cnVlLCJkZWZlbnNpdmVfaml0dGVyIjo5NywiZGVmZW5zZV9hYV90eXBlIjoiU2tpdHRlciIsInlhd19vZmZzZXRfc2xpZGVyIjowLCJ3YXk0NCI6MCwiZGVsYXkiOmZhbHNlLCJmb3JjZV9sYyI6ZmFsc2UsImVuYWJsZTIiOnRydWUsInBpdGNoX3NwaW5fbW9kIjowLCJkZWZlbnNpdmVfc3BlZWQiOi00LCJhZGFwdGl2ZV9kZXN5bmMiOmZhbHNlLCJwaXRjaF9zcGluMiI6MCwid2F5MTEiOjAsInlhd19yYW5kb20yIjowLCJwaXRjaF9zcGluMl9tb2QiOjAsInlhd19sZWZ0MiI6LTMwLCJkZWZlbnNlX2FhX3NsaWRlciI6OTcsInBpdGNoX2ppdHRlcjIiOjAsInBpdGNoX3NwZWVkIjoyMCwibW9kX2RtMiI6LTE2LCJwaXRjaF9qaXR0ZXIiOjAsInBpdGNoX3NsaWRlciI6MCwid2F5MyI6MCwid2F5MiI6MCwiYm9keV95YXdfdHlwZTIiOiJKaXR0ZXIiLCJkZWZlbnNpdmVfbGVmdCI6LTMwfV0sImNvbmZpZyI6eyJjb25maWciOnsibGlzdF9ib3giOjF9LCJtYWluIjp7InRhYiI6Iu6HgSBDb25maWd1cmF0aW9uIn0sImFudGlhaW0iOnsidGFiIjoi7oeeIEZlYXR1cmVzIiwibWFudWFsc19yZXNldCI6WzEsMCwifiJdLCJtYW51YWxzX2ZvcndhcmQiOlsxLDAsIn4iXSwieWF3X2RpcmVjdGlvbiI6WyJGcmVlc3RhbmQiLCJ+Il0sImZyZWVzdGFuZF9zZXR0aW5ncyI6IlN0YXRpYyIsIm1hbnVhbHNfcmlnaHQiOlsxLDAsIn4iXSwiZnJlZXN0YW5kX2hvdGtleSI6WzEsNSwifiJdLCJ5YXdfYmFzZSI6IkF0IHRhcmdldHMiLCJmZWF0dXJlcyI6WyJTYWZlIGhlYWQiLCJ+Il0sInZhcmlhbmNlIjoxLCJhbW91bnQiOiJNYXhpbXVtIiwibWFudWFsc19sZWZ0IjpbMSwwLCJ+Il0sImJydXRlX21vZGUiOiJBZGFwdGl2ZSIsImxpbWl0IjoxNSwibWFudWFsc19zZXR0aW5ncyI6IkRlZmF1bHQiLCJlbmFibGVkIjp0cnVlLCJjb25kaXRpb24iOiJBaXJcciIsInNhZmUiOlsifiJdfSwiYWltdG9vbHMiOnsic2FmZV9taXNzZXMzIjoyLCJlc3BfY29sb3IiOiIjQkJBRkY2RkYiLCJib2R5X2hwNiI6ODAsInJlc29sdmVyIjp0cnVlLCJzYWZlX2hwMiI6ODAsImJvZHlfcHJlZmVyMiI6WyJ+Il0sInNhZmVfaHAzIjo4MCwiYm9keV9ocDQiOjgwLCJzYWZlX3ByZWZlcjMiOlsifiJdLCJzYWZlX3ByZWZlcjQiOlsifiJdLCJzYWZlX3ByZWZlcjUiOlsifiJdLCJib2R5X2hwMiI6ODAsInNhZmVfaHAiOjgwLCJib2R5X3ByZWZlciI6WyJ+Il0sInNhZmVfbWlzc2VzNSI6Miwic2FmZV9ocDUiOjgwLCJzYWZlX21pc3NlczQiOjIsImJvZHlfaHAzIjo4MCwic2FmZV9wcmVmZXIyIjpbIn4iXSwiaW50ZWxlZ2VudCI6ZmFsc2UsInNhZmVfaHA0Ijo4MCwiYm9keV9taXNzZXM0IjoyLCJ0YXJnZXQiOnRydWUsInNhZmVfcHJlZmVyNiI6WyJ+Il0sImJvZHlfcHJlZmVyNCI6WyJ+Il0sImJvZHlfbWlzc2VzMiI6Miwic2FmZV9taXNzZXMiOjIsImJvZHlfcHJlZmVyNSI6WyJ+Il0sInNhZmVfbWlzc2VzNiI6MiwiYm9keV9ocCI6ODAsImJvZHlfbWlzc2VzIjoyLCJib2R5X21pc3NlczUiOjIsIm1haW5fY29tYm9ib3giOiJQaXN0b2wiLCJjb21ib19pbnRlbGdlbnQiOlsifiJdLCJib2R5X21pc3NlczMiOjIsIm1vZGUiOiJUYXJnZXQiLCJzYWZlX21pc3NlczIiOjIsIm1haW5fc3dpdGNoIjpmYWxzZSwiYm9keV9taXNzZXM2IjoyLCJzYWZlX3ByZWZlciI6WyJ+Il0sImVzcF9mbGFncyI6ZmFsc2UsImJvZHlfcHJlZmVyMyI6WyJ+Il0sInNhZmVfaHA2Ijo4MCwiYm9keV9ocDUiOjgwLCJib2R5X3ByZWZlcjYiOlsifiJdfSwiTWlzY2VsbGFuZW91cyI6eyJ0YWIiOiLuioQgVmlzdWFscyIsImFuaW1hdGlvbiI6ZmFsc2UsImFycm93cyI6ZmFsc2UsImJvZHlfbGVhbl92YWx1ZSI6MCwiaW5kZXhlcyI6WyJ+Il0sInNjb3BlX2dhcCI6MTUsImFpbWJvdF9taXNzIjoiI0JCQUZGNkZGIiwiZmlsdGVyX2NvbnNvbGUiOmZhbHNlLCJicmVha19sYW5kX3ZhbHVlIjo1LCJ3YXRlcm1hcmtfY29sb3IiOiIjQkJBRkY2RkYiLCJhc3BlY3RfcmF0aW8iOnRydWUsInF1aWNrX3N3aXRjaCI6ZmFsc2UsImFpbWJvdCI6ZmFsc2UsImNyb3NzaGFpciI6ZmFsc2UsInN0YXRlIjoiQWx3YXlzIG9uIiwiYXJyb3dzX2NvbG9yIjoiI0JCQUZGNkZGIiwiZGFtYWdlX2luZCI6dHJ1ZSwiZGVmZW5zaXZlX2NvbG9yIjoiI0JCQUZGNkZGIiwidmVsb2NpdHkiOmZhbHNlLCJlZGdlIjpmYWxzZSwibV9lbGVtZW50cyI6WyJ+Il0sImFpbWJvdF9zY3JlZW5fY29sb3IiOiIjQkJBRkY2RkYiLCJ2aWV3bW9kZWwiOmZhbHNlLCJ0aGlyZF9wZXJzb24iOnRydWUsIm1hZ25pdHVkZSI6MCwiQ2hhdF9zcGFtbWVyX3R5cGUiOiJLaXR0eWhvb2siLCJzY29wZV9jb2xvciI6IiNCQkFGRjZGRiIsIndhdGVybWFyayI6ZmFsc2UsImFpbWJvdF9zY3JlZW4iOmZhbHNlLCJzY29wZV9hbmltYXRpb24iOjEyLCJkZWZlbnNpdmUiOmZhbHNlLCJzbGlkZV9lbGVtZW50cyI6WyJ+Il0sImNyb3NzaGFpcl9jb2xvciI6IiNCQkFGRjZGRiIsIndhdGVybWFya190eXBlIjoiTGVmdCIsImFpbWJvdF9oaXQiOiIjQkJBRkY2RkYiLCJDaGF0X3NwYW1tZXIiOmZhbHNlLCJzY29wZV9zaXplIjoxOTAsInNjb3BlX2Rpc2FibGVycyI6WyJ+Il0sImZhc3RfbGFkZGVyIjpmYWxzZSwidlMiOjY4LCJzY29wZV9vdmVybGF5IjpmYWxzZSwiYXNwZWN0X3JhdGlvX3NsaWRlciI6MTMxLCJ0aGlyZF9wZXJzb25fc2xpZGVyIjo2MSwielMiOjAsImRhbWFnZV9hbmltIjpmYWxzZSwieFMiOjAsInZlbG9jaXR5X2NvbG9yIjoiI0JCQUZGNkZGIiwic3BlZWQiOjIsInlTIjowLCJhaXJfZWxlbWVudCI6Ik5vbmUifSwicmFnZWJvdGZlYXR1cmVzIjp7Ikp1bXBzdG9wX2hvdGtleSI6WzEsMCwifiJdLCJwcmVkaWN0X2hvdGtleSI6WzEsMCwifiJdLCJKdW1wc3RvcCI6ZmFsc2UsIkp1bXBzdG9wX2Rpc3RhbmNlIjoxMDAwLCJKdW1wc3RvcF9oaXRjaGFuY2UiOmZhbHNlLCJwcmVkaWN0IjpmYWxzZSwiYXV0b190ZWxlcG9ydCI6ZmFsc2UsImF1dG9fdHBfc2xpZGVyIjo3LCJhdXRvX3RwIjpbMSwwLCJ+Il0sImR0IjpmYWxzZSwiSnVtcHN0b3BfaGl0Y2hhbmNlX3NsaWRlciI6NTB9fX0="
  local var_323_1 = var_0_4.decode(var_323_0, "base64")
  local var_323_2 = var_0_8.parse(var_323_1)

  var_0_29.insert(var_0_77, {
    name = "*Default",
    config = var_0_4.encode(var_0_8.stringify(var_323_2.config)),
    config2 = var_0_4.encode(var_0_8.stringify(var_323_2.config2))
  })
  var_0_88.config.name:set("*Default")
  var_0_88.config.list_box:update(var_0_75.config_list())
  var_0_88.config.list_box:update(var_0_75.config_list())
end)()

local var_0_270 = {
  aimbot = var_0_32.reference("RAGE", "Aimbot", "Enabled"),
  doubletap = {
    main = {
      var_0_32.reference("RAGE", "Aimbot", "Double tap")
    },
    fakelag_limit = var_0_32.reference("RAGE", "Aimbot", "Double tap fake lag limit")
  }
}
local var_0_271 = {
  rage_cb = {
    var_0_32.reference("RAGE", "Aimbot", "Enabled")
  },
  os = {
    var_0_32.reference("aa", "other", "On shot anti-aim")
  },
  dt = {
    var_0_32.reference("RAGE", "Aimbot", "Double tap")
  },
  fake_duck = var_0_32.reference("RAGE", "Other", "Duck peek assist")
}

function var_0_272()
  local var_324_0 = entity.get_prop(entity.get_local_player(), "m_nTickBase") - globals.tickcount()
  local var_324_1 = var_0_32.get(var_0_271.os[1]) and var_0_32.get(var_0_271.os[2]) and not var_0_32.get(var_0_271.fake_duck)
  local var_324_2 = var_0_32.get(var_0_271.dt[1]) and var_0_32.get(var_0_271.dt[2]) and not var_0_32.get(var_0_271.fake_duck)
  local var_324_3 = entity.get_prop(entity.get_local_player(), "m_hActiveWeapon")

  if var_324_3 == nil then
    return
  end

  if not var_0_88.ragebotfeatures.dt:get() then
    return
  end

  local var_324_4 = entity.get_prop(var_324_3, "m_iItemDefinitionIndex")

  if var_324_4 == nil or var_324_4 == 64 then
    return
  end

  local var_324_5 = entity.get_prop(var_324_3, "m_fLastShotTime")

  if var_324_5 == nil then
    return
  end

  local var_324_6 = ((var_324_4 == 40 or var_324_4 == 9 or var_324_4 == 64 or var_324_4 == 27 or var_324_4 == 29 or var_324_4 == 35) and 0 or 0.5) >= globals.curtime() - var_324_5

  if var_324_0 > 0 and var_324_1 then
    if var_324_6 then
      var_0_32.set(var_0_271.rage_cb[2], "Always on")
    else
      var_0_32.set(var_0_271.rage_cb[2], "On hotkey")
    end
  elseif var_324_0 > 0 and var_324_2 then
    if var_324_6 then
      var_0_32.set(var_0_271.rage_cb[2], "Always on")
    else
      var_0_32.set(var_0_271.rage_cb[2], "On hotkey")
    end
  else
    var_0_32.set(var_0_271.rage_cb[2], "Always on")
  end
end

function var_0_273(arg_325_0)
  if not var_0_88.Miscellaneous.quick_switch:get() then
    return
  end

  local var_325_0 = entity.get_local_player()

  if var_0_33.userid_to_entindex(arg_325_0.userid) ~= var_325_0 then
    return
  end

  var_0_33.exec("slot3")
  var_0_33.exec("slot2")
  var_0_33.exec("slot1")
end

function var_0_274(arg_326_0)
  if not var_0_88.Miscellaneous.quick_switch:get() then
    return
  end

  local var_326_0 = entity.get_local_player()

  if var_0_33.userid_to_entindex(arg_326_0.userid) ~= var_326_0 then
    return
  end

  if arg_326_0.weapon == "weapon_taser" and cvar.sv_infinite_ammo:get_int() ~= 1 and cvar.mp_taser_recharge_time:get_int() < 0 then
    var_0_33.exec("slot3")
    var_0_33.exec("slot2")
    var_0_33.exec("slot1")
  end
end

function block(arg_327_0)
  if var_0_32.is_menu_open() and (var_0_230.pressed(1) or var_0_230.pressed(2)) then
    arg_327_0.in_attack = false
    arg_327_0.in_attack2 = false
  end
end

function target()
  if not var_0_88.ragebotfeatures.target:get() then
    return
  end

  local var_328_0 = var_0_33.current_threat()
  local var_328_1 = entity.get_player_name(var_328_0)

  if not entity.is_alive(var_328_0) then
    return
  end

  if not entity.is_alive(entity.get_local_player()) then
    return
  end

  renderer.indicator(230, 230, 230, 230, "HIT: " .. var_328_1)
end

function bruteforce(arg_329_0)
  if not entity.is_alive(entity.get_local_player()) then
    return
  end

  local var_329_0 = var_0_33.userid_to_entindex(arg_329_0.userid)

  if var_329_0 ~= var_0_33.current_threat() then
    return
  end

  if entity.is_dormant(var_329_0) or not entity.is_enemy(var_329_0) then
    return
  end

  if var_0_88.antiaim.features:get("Anti Bruteforce") then
    if var_0_88.antiaim.brute_mode:get() == "Adaptive" then
      var_0_157 = var_0_157 + var_0_30.random(-10, 10) % 2
    elseif var_0_88.antiaim.brute_mode:get() == "Decrease" then
      var_0_157 = var_0_157 + var_0_30.random(-10, -1) % 2
    elseif var_0_88.antiaim.brute_mode:get() == "Increase" then
      var_0_157 = var_0_157 + var_0_30.random(1, 10) % 2
    end
  end
end

local var_0_275 = {}

function var_0_30.angle_diff(arg_330_0, arg_330_1)
  return (arg_330_0 - arg_330_1 + 540) % 360 - 180
end

function var_0_276(arg_331_0)
  local var_331_0 = var_0_30.angle_diff(arg_331_0.torso_yaw, arg_331_0.eye_angles_x)

  return var_331_0 > 0 and -1 or var_331_0 < 0 and 1 or 0
end

function var_0_275.clamping()
  local var_332_0 = var_0_33.current_threat()

  if not entity.is_alive(var_332_0) then
    return
  end

  local var_332_1 = var_0_6.new(var_332_0):get_anim_state()
  local var_332_2 = entity.get_prop(var_332_0, "m_angEyeAngles[1]") or 0
  local var_332_3 = var_0_30.angle_diff(var_332_2, var_0_30.abs(var_332_1.goal_feet_yaw))
  local var_332_4 = var_0_30.clamp(var_332_1.feet_speed_forwards_or_sideways, 0, 1)
  local var_332_5 = var_0_30.max(1, var_332_1.feet_speed_unknown_forwards_or_sideways)
  local var_332_6 = (var_332_1.stop_to_full_running_fraction * -0.30000001 - 0.19999999) * var_332_4 + 1
  local var_332_7 = var_0_276(var_332_1)
  local var_332_8 = var_332_3 * var_332_6 * var_332_7

  return var_332_0, var_332_8
end

function var_0_275.resolve()
  local var_333_0, var_333_1 = var_0_275.clamping()
  local var_333_2 = var_0_33.current_threat()

  if not entity.is_alive(var_333_2) then
    return
  end

  if var_333_2 ~= nil then
    var_0_33.update_player_list()
  end

  plist.set(var_333_2, "Force body yaw", var_333_1 ~= 0 or var_333_1 ~= nil)
  plist.set(var_333_2, "Force body yaw value", var_333_1)
  plist.set(var_333_2, "Correction active", true)
end

function var_0_275.desolve()
  local var_334_0 = var_0_275.clamping()

  plist.set(var_334_0, "Force body yaw", false)
  plist.set(var_334_0, "Force body yaw value", 0)
end

var_0_88.ragebotfeatures.resolve:set_event("net_update_end", var_0_275.resolve)
var_0_88.ragebotfeatures.resolve:set_callback(function(arg_335_0)
  if not arg_335_0.value then
    var_0_275.desolve()
  end
end)
defer(var_0_275.desolve)

if not LPH_OBFUSCATED then
  function LPH_NO_VIRTUALIZE(...)
    return ...
  end
end

local var_0_277 = {
  total = 0,
  hit = {},
  missed = {
    0,
    0,
    0,
    0,
    0
  }
}
local var_0_278 = {
  "generic",
  "head",
  "chest",
  "stomach",
  "left arm",
  "right arm",
  "left leg",
  "right leg",
  "neck",
  "unknown",
  "gear"
}

var_0_33.set_event_callback("aim_hit", LPH_NO_VIRTUALIZE(function(arg_337_0)
  var_0_29.insert(var_0_277.hit, {
    entity.get_player_name(arg_337_0.target),
    arg_337_0.hit_chance,
    arg_337_0.damage,
    var_0_278[arg_337_0.hitgroup + 1] or "unknown"
  })
end))
var_0_33.set_event_callback("aim_miss", LPH_NO_VIRTUALIZE(function(arg_338_0)
  if arg_338_0.reason == "spread" then
    var_0_277.missed[1] = var_0_277.missed[1] + 1
  end

  if arg_338_0.reason == "prediction error" then
    var_0_277.missed[2] = var_0_277.missed[2] + 1
  end

  if arg_338_0.reason == "death" then
    var_0_277.missed[3] = var_0_277.missed[3] + 1
  end

  if arg_338_0.reason == "?" then
    var_0_277.missed[4] = var_0_277.missed[4] + 1
  end
end))
var_0_88.Miscellaneous.filter_console:set_callback(function()
  if var_0_88.Miscellaneous.filter_console:get() then
    var_0_33.exec("cam_collision 0")
  else
    var_0_33.exec("cam_collision 1")
  end

  if var_0_88.Miscellaneous.filter_console:get() then
    cvar.developer:set_int(0)
    cvar.con_filter_enable:set_int(1)
    cvar.con_filter_text:set_string("IrWL5106TZZKNFPz4P4Gl3pSN?J370f5hi373ZjPg%VOVh6lN")
    var_0_33.exec("con_filter_enable 1")
  else
    cvar.con_filter_enable:set_int(0)
    cvar.con_filter_text:set_string("")
    var_0_33.exec("con_filter_enable 0")
  end
end)
var_0_33.set_event_callback("indicator", var_0_250.index)
var_0_33.set_event_callback("paint_ui", LPH_NO_VIRTUALIZE(function()
  hide_original_menu(false)

  if var_0_88.main.tab:get() == "Anti-aim" and var_0_88.antiaim.tab:get() == "Builder" then
    traverse_table_on(var_0_86)
  else
    traverse_table(var_0_86)
  end

  traverse_table(var_0_87)
  var_0_203()
  g_paint_ui()

  if var_0_32.is_menu_open() then
    var_0_88.main.label:set("\v☣️\rDownabout.\vasia/\a9FCA2BFFRecode")
    var_0_88.information.time:set("\v☕\rSession time: \v" .. get_elapsed_time())
  end

  if var_0_268 then
    var_0_269()
  end
end))
var_0_33.set_event_callback("shutdown", LPH_NO_VIRTUALIZE(function()
  hide_original_menu(true)
  traverse_table_on(var_0_86)
  traverse_table_on(var_0_87)
  cvar.con_filter_enable:set_int(0)
  cvar.con_filter_text:set_string("")
  var_0_33.exec("con_filter_enable 0")
  var_0_33.set_cvar("weapon_debug_spread_show", 0)
  var_0_212()
end))
var_0_33.set_event_callback("setup_command", LPH_NO_VIRTUALIZE(function(arg_342_0)
  aa_setup(arg_342_0)
  var_0_272()
  var_0_264(arg_342_0)
  var_0_182(arg_342_0)
  break_legs(arg_342_0)
  block(arg_342_0)
  var_0_248()
  var_0_126:on_setup_command(arg_342_0)
end))
var_0_33.set_event_callback("bullet_impact", LPH_NO_VIRTUALIZE(function(arg_343_0)
  bruteforce(arg_343_0)
end))
var_0_33.set_event_callback("aim_fire", LPH_NO_VIRTUALIZE(function(arg_344_0)
  var_0_17.on_aim_fire(arg_344_0)
end))
var_0_33.set_event_callback("player_hurt", LPH_NO_VIRTUALIZE(function(arg_345_0)
  var_0_17.on_aim_another(arg_345_0)
end))
var_0_33.set_event_callback("aim_miss", LPH_NO_VIRTUALIZE(function(arg_346_0)
  var_0_17.on_aim_miss(arg_346_0)
end))
var_0_33.set_event_callback("aim_hit", LPH_NO_VIRTUALIZE(function(arg_347_0)
  var_0_17.on_aim_hit(arg_347_0)
end))
var_0_33.set_event_callback("bullet_impact", LPH_NO_VIRTUALIZE(function(arg_348_0)
  var_0_17.bullet_impact(arg_348_0)
end))
var_0_33.set_event_callback("player_death", LPH_NO_VIRTUALIZE(function(arg_349_0)
  var_0_263(arg_349_0)
end))
var_0_33.set_event_callback("grenade_thrown", LPH_NO_VIRTUALIZE(function(arg_350_0)
  var_0_273(arg_350_0)
end))
var_0_33.set_event_callback("weapon_fire", LPH_NO_VIRTUALIZE(function(arg_351_0)
  var_0_274(arg_351_0)
end))
var_0_33.set_event_callback("pre_render", LPH_NO_VIRTUALIZE(function()
  anim_breaker()
end))
var_0_33.set_event_callback("paint_ui", LPH_NO_VIRTUALIZE(function()
  watermark_custom()
  var_0_201()
  var_0_202()
  var_0_235()
  var_0_240()
  var_0_213.crosshair()
  var_0_244()

  if var_0_88.Miscellaneous.arrows:get() then
    var_0_245()
  end

  if var_0_88.Miscellaneous.scope_crosshair:get() then
    var_0_33.set_cvar("weapon_debug_spread_show", 3)
  else
    var_0_33.set_cvar("weapon_debug_spread_show", 0)
  end

  if var_0_88.ragebotfeatures.Jumpstop:get() and var_0_88.ragebotfeatures.Jumpstop_hotkey:get() then
    renderer.indicator(230, 230, 230, 230, "JS")
  end

  target()
  var_0_17.notifications()

  if var_0_88.Miscellaneous.statistic:get() and var_0_88.Miscellaneous.custom_ind_gs:get() and var_0_88.Miscellaneous.custom_ind_gs_icon:get() then
    var_0_277.missed[5] = var_0_277.missed[1] + var_0_277.missed[2] + var_0_277.missed[4]

    renderer.indicator(230, 230, 230, 230, "HM: " .. var_0_31.format("%d %%", #var_0_277.hit + var_0_277.missed[5] ~= 0 and #var_0_277.hit / (#var_0_277.hit + var_0_277.missed[5]) * 100 or 0))
  elseif var_0_88.Miscellaneous.statistic:get() then
    renderer.indicator(230, 230, 230, 230, var_0_31.format("%d%%", #var_0_277.hit + var_0_277.missed[5] ~= 0 and #var_0_277.hit / (#var_0_277.hit + var_0_277.missed[5]) * 100 or 0))
  end

  if var_0_268 then
    var_0_269()
  end
end))
var_0_33.set_event_callback("run_command", LPH_NO_VIRTUALIZE(function()
  var_0_211()
end))
var_0_33.set_event_callback("override_view", LPH_NO_VIRTUALIZE(function(arg_355_0)
  var_0_205(arg_355_0)
end))
var_0_33.set_event_callback("paint", LPH_NO_VIRTUALIZE(function()
  var_0_250.draw()
  var_0_204()
  var_0_126:on_paint()
end))



                

do
    local clantag_string = {
        "Downabout"
    }

    local clantag_length = 9
    local tick_rate = 25
    local ping_compensation = 10

    local function update_clantag()
        if not ui.get(var_0_88.Miscellaneous.clantags.ref) then return end
        ui.set(var_0_85.clantag, false)
        local index = math.floor(globals.tickcount() / (tick_rate - ping_compensation * math.floor(client.latency() / 50))) % #clantag_string
        local tag = clantag_string[index+1]
        if index > #clantag_string - clantag_length then
            tag = string.sub(tag, 1, clantag_length)
        end
        client.set_clan_tag(tag)
    end

    local function animate_clantag()
        if not ui.get(var_0_88.Miscellaneous.clantags.ref) then return end
        client.set_clan_tag(clantag_string[1])
    end

    local function clantag_Reset()
        client.set_clan_tag("")
    end

    client.set_event_callback("paint", update_clantag)
    animate_clantag()

    ui.set_callback(var_0_88.Miscellaneous.clantags.ref, function()
        if not ui.get(var_0_88.Miscellaneous.clantags.ref) then
            client.delay_call(0.2, clantag_Reset)
        end
    end)
end


do
    local strafer = ui.reference('MISC', 'Movement', 'Air strafe')
    local strafer_direction = ui.reference('MISC', 'Movement', 'Air strafe direction')
    local strafer_smoothing = ui.reference('MISC', 'Movement', 'Air strafe smoothing')
    local slowmotion = { ui.reference('AA', 'Other', 'Slow motion') }

    local ffi_cache = {}
    
    local function invoke_cache(condition, should_call, a, b)
        local name = tostring(condition)
        ffi_cache[name] = ffi_cache[name] or ui.get(condition)
        if should_call then
            if type(a) == 'function' then a() else ui.set(condition, a) end
        else
            if ffi_cache[name] then
                if b and type(b) == 'function' then b(ffi_cache[name]) else ui.set(condition, ffi_cache[name]) end
                ffi_cache[name] = nil
            end
        end
    end

    local function contains(tab, val)
        for i = 1, #tab do if tab[i] == val then return true end end
        return false
    end
    
    local function clamp(val, min, max)
        local value = val
        value = value < min and min or value
        value = value > max and max or value
        return value
    end

    local function command(e)
        local wasd_only = ui.get(var_0_88.Miscellaneous.movement_keys_only.ref)
        if not wasd_only then return end

        local air_accel = cvar.sv_airaccelerate:get_int()
        local end_val = -0.614*air_accel + 686/11
        local list = { e.in_forward, e.in_back, e.in_moveleft, e.in_moveright }
        local can_sharp = air_accel <= 45 and not contains(list, 1) or e.in_jump == 0
        local passed = false
        local in_speed = e.in_speed == 1
        local in_slowmo = ui.get(slowmotion[1]) and ui.get(slowmotion[2])

        if in_speed and in_slowmo then
            passed = true
            e.in_speed = 0
        end

        local me = entity.get_local_player()
        local vec_vel = { entity.get_prop(me, 'm_vecVelocity') }
        local in_air = e.in_jump == 1 or vec_vel[3]^2 > 0
        local velocity = math.floor(math.sqrt(vec_vel[1]^2 + vec_vel[2]^2) + 0.5)

        invoke_cache(strafer, not wasd_only and in_speed and in_air, false)
        ui.set(strafer_smoothing, can_sharp and 0 or clamp(end_val, 1, 60))
        
        if wasd_only then
            local dir = { 'View angles', 'Movement keys' }
            ui.set(strafer, in_air and velocity > 10 and not passed)
            ui.set(strafer_direction, contains(list, 1) and dir or { dir[1] })
        end
    end

    local function shutdown()
        invoke_cache(strafer, false)
    end

    client.set_event_callback('setup_command', command)
    client.set_event_callback('shutdown', shutdown)
end


do
    local queue = {}
    local hitmarkenable = false
    local r, g, b, a = 255, 255, 255, 255

    local function menu()
        hitmarkenable = ui.get(var_0_88.Miscellaneous.hitmark_enable.ref)
        r, g, b, a = ui.get(var_0_88.Miscellaneous.hitmark_color.ref)
        ui.set_visible(var_0_88.Miscellaneous.hitmark_color.ref, hitmarkenable)
    end

    local function aim_fire(c)
        queue[globals.tickcount()] = {c.x, c.y, c.z, globals.curtime() + 2}
    end

    local function paint()
        if hitmarkenable then
            for _, data in pairs(queue) do
                if globals.curtime() <= data[4] then
                    local x1, y1 = renderer.world_to_screen(data[1], data[2], data[3])
                    if x1 and y1 then
                        renderer.line(x1 - 6, y1, x1 + 6, y1, r, g, b, a)
                        renderer.line(x1, y1 - 6, x1, y1 + 6, r, g, b, a)
                    end
                end
            end
        end
    end

    local function round_prestart()
        queue = {}
    end

    ui.set_callback(var_0_88.Miscellaneous.hitmark_enable.ref, menu)
    ui.set_callback(var_0_88.Miscellaneous.hitmark_color.ref, menu)
    menu()

    client.set_event_callback("aim_fire", aim_fire)
    client.set_event_callback("paint", paint)
    client.set_event_callback("round_prestart", round_prestart)
end



do
    local ref = {
        mindmg = ui.reference("RAGE", "Aimbot", "Minimum damage"),
        dormantEsp = ui.reference("VISUALS", "Player ESP", "Dormant"),
    }

    local player_info_prev = {}
    local roundStarted = 0

    local function modify_velocity(e, goalspeed)
        local minspeed = math.sqrt((e.forwardmove * e.forwardmove) + (e.sidemove * e.sidemove))
        if goalspeed <= 0 or minspeed <= 0 then
            return
        end

        if e.in_duck == 1 then
            goalspeed = goalspeed * 2.94117647
        end

        if minspeed <= goalspeed then
            return
        end

        local speedfactor = goalspeed / minspeed
        e.forwardmove = e.forwardmove * speedfactor
        e.sidemove = e.sidemove * speedfactor
    end

    local function on_setup_command(cmd)
        if not ui.get(var_0_88.ragebotfeatures.dormant_switch.ref) then
            return
        end

        local lp = entity.get_local_player()

        local my_weapon = entity.get_player_weapon(lp)
        if not my_weapon then
            return
        end

        local ent = native_GetClientEntity(my_weapon)
        if ent == nil or not native_IsWeapon(ent) then
            return
        end

        local inaccuracy = native_GetInaccuracy(ent)
        if inaccuracy == nil then
            return
        end

        local tickcount = globals.tickcount()
        local player_resource = entity.get_player_resource()
        local eyepos = var_0_10(client.eye_position())
        local simtime = entity.get_prop(lp, "m_flSimulationTime")
        local weapon = var_0_7(my_weapon)
        local scoped = entity.get_prop(lp, "m_bIsScoped") == 1
        local onground = bit.band(entity.get_prop(lp, 'm_fFlags'), bit.lshift(1, 0))
        if tickcount < roundStarted then return end

        local can_shoot
        if weapon.is_revolver then
            can_shoot = simtime > entity.get_prop(my_weapon, "m_flNextPrimaryAttack")
        elseif weapon.is_melee_weapon then
            can_shoot = false
        else
            can_shoot = simtime > math.max(entity.get_prop(lp, "m_flNextAttack"), entity.get_prop(my_weapon, "m_flNextPrimaryAttack"), entity.get_prop(my_weapon, "m_flNextSecondaryAttack"))
        end

        local player_info = {}

        for player=1, globals.maxplayers() do
            if entity.get_prop(player_resource, "m_bConnected", player) == 1 then
                if plist.get(player, "Add to whitelist") then goto skip end
                if entity.is_dormant(player) and entity.is_enemy(player) then
                    local can_hit

                    local origin = var_0_10(entity.get_origin(player))
                    local x1, y1, x2, y2, alpha_multiplier = entity.get_bounding_box(player)
                    
                    if player_info_prev[player] ~= nil and origin.x ~= 0 and alpha_multiplier > 0 then
                        local old_origin, old_alpha, old_hittable = unpack(player_info_prev[player])

                        local dormant_accurate = alpha_multiplier > 0.795

                        if dormant_accurate then
                            local target = origin + var_0_10(0, 0, 40)
                            local pitch, yaw = (eyepos - target):angles()
                            local ent, dmg = client.trace_bullet(lp, eyepos.x, eyepos.y, eyepos.z, target.x, target.y, target.z, true)

                            can_hit = (dmg > ui.get(var_0_88.ragebotfeatures.dormant_mindmg.ref)) and (not client.visible(target.x, target.y, target.z))
                            if can_shoot and can_hit and ui.get(var_0_88.ragebotfeatures.dormant_key.ref) then
                                modify_velocity(cmd, (scoped and weapon.max_player_speed_alt or weapon.max_player_speed)*0.33)

                                if not scoped and weapon.type == "sniperrifle" and cmd.in_jump == 0 and onground == 1 then
                                    cmd.in_attack2 = 1
                                end
                                
                                if inaccuracy < 0.009 and cmd.chokedcommands == 0 then
                                    cmd.pitch = pitch
                                    cmd.yaw = yaw
                                    cmd.in_attack = 1
                                    can_shoot = false
                                end
                            end
                        end
                    end
                    player_info[player] = {origin, alpha_multiplier, can_hit}
                end
            end
            ::skip::
        end
        player_info_prev = player_info
    end

    client.register_esp_flag("DA", 255, 255, 255, function(player)
        if ui.get(var_0_88.ragebotfeatures.dormant_switch.ref) and entity.is_enemy(player) and player_info_prev[player] ~= nil and entity.is_alive(entity.get_local_player()) then
            local _, _, can_hit = unpack(player_info_prev[player])
            return can_hit
        end
    end)
    
    local function painter()
        if not entity.is_alive(entity.get_local_player()) then return end
        if ui.get(var_0_88.ragebotfeatures.dormant_switch.ref) and ui.get(var_0_88.ragebotfeatures.dormant_key.ref) and ui.get(var_0_88.ragebotfeatures.dormant_indicator.ref) then
            local colors = {132,196,20,245}
            for k, v in pairs(player_info_prev) do 
                if k ~= nil then 
                    if v[3] == true then 
                        colors = {252,222,30,245}
                        break
                    end
                end
            end
            renderer.indicator(colors[1],colors[2],colors[3],colors[4], "DA")
        end
    end
    
    local function resetter()
        local freezetime = (cvar.mp_freezetime:get_float()+1) / globals.tickinterval()
        roundStarted = globals.tickcount() + freezetime
    end

    client.delay_call(0, function()
        ui.set_visible(var_0_88.ragebotfeatures.dormant_key.ref, true)
        ui.set_visible(var_0_88.ragebotfeatures.dormant_mindmg.ref, true)
        ui.set_visible(var_0_88.ragebotfeatures.dormant_indicator.ref, true)
    end)

    ui.set_callback(var_0_88.ragebotfeatures.dormant_switch.ref, function()
        local enabled = ui.get(var_0_88.ragebotfeatures.dormant_switch.ref)
        
        ui.set_visible(var_0_88.ragebotfeatures.dormant_key.ref, enabled)
        ui.set_visible(var_0_88.ragebotfeatures.dormant_mindmg.ref, enabled)
        ui.set_visible(var_0_88.ragebotfeatures.dormant_indicator.ref, enabled)
        
        local update_callback = enabled and client.set_event_callback or client.unset_event_callback
        if enabled then ui.set(ref.dormantEsp, enabled) end
        update_callback("setup_command", on_setup_command)
        update_callback("paint", painter)
        update_callback("round_prestart", resetter)
    end)
end