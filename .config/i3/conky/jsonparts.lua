-- vim: ts=4 sw=4 noet ai cindent syntax=lua

--[[
You may consider change glyph using FontAwesome icon
http://fontawesome.io/cheatsheet/

* Sample: Battery Icon: 
]]


parts = {}

-- user variables
local wlandev = 'wlp2s0'

-- shortcut
local _h = jsonhelper

-- template variables: Color Indicator
local color_indicator_dark = {
  good      = '#909737',
  degraded  = '#b27d12',
  bad       = '#802828'
}

local color_indicator_bright = {
  good      = '#202080',
  degraded  = '#802080',
  bad       = '#802020'
}

local ci = color_indicator_dark

-- Time
parts.time = _h.common('', nil, '${time %H:%M }')

-- Date
parts.date = _h.common('', nil, '${time %D}')

-- Volume
local volume_command = [[amixer -D pulse sget Master,0 | egrep -o '([0-9]+%|\[(on|off)\])' | head -2 | sed ':a;N;$!ba;s/\n/ /g']]
parts.volume = _h.common('', 'VOL', "${execi 1 " .. volume_command .. "}")

-- Spotify
local spotify_command = [[spotifycli --status-short]]
parts.spotify = _h.common('', nil, "${execi 1 " .. spotify_command .. "}",'#1db954')


-- Host
parts.host = _h.common('', 'Host', '$nodename') 

-- Uptime
parts.uptime = _h.common('', 'Uptime', '$uptime')

-- Memory
parts.mem = _h.common('', 'RAM', '$mem/$memmax')

-- Lua Function Demo 
-- https://github.com/brndnmtthws/conky/issues/62

function _h.exec(command)
    local file = assert(io.popen(command, 'r'))
    local s = file:read('*all')
    file:close()

    s = string.gsub(s, '^%s+', '') 
    s = string.gsub(s, '%s+$', '') 
    s = string.gsub(s, '[\n\r]+', ' ')

    return s
end

-- read once
local machine = _h.exec('uname -r')  
parts.machine = _h.common('', nil, machine)

-- Media Player Daemon
parts.mpd = [[
${if_mpd_playing} 
]] .. _h.icon('') .. [[,
    {"full_text":"${mpd_artist 20}", "color" : "\#545454", 
     "separator" : false, "separator_block_width":3 },
    {"full_text":" - ", "color" : "\#909737", 
     "separator" : false, "separator_block_width":3 },
    {"full_text":"${mpd_title 30}", "color" : "\#5c5dad", 
     "separator" : false, "separator_block_width":6 }
${else} 
    {"full_text":"", "color":"\#c92525", 
     "separator" : false, "separator_block_width":6 }
${endif} 
]]

-- CPU temperature:
parts.cputemp = _h.common('', 'CPU') .. [[,
${if_match ${hwmon 0 temp 1}<45}
    ]] .. _h.value('${hwmon 0 temp 1}°C', ci.good) .. [[
${else}${if_match ${hwmon 0 temp 1}<55}
    ]] .. _h.value('${hwmon 0 temp 1}°C', ci.degraded) .. [[
${else}${if_match ${hwmon 0 temp 1}>=55}
    ]] .. _h.value('${hwmon 0 temp 1}°C', ci.bad) .. [[
${endif}${endif}${endif}
]]

-- Download
parts.download = _h.common(' ', 'DOWN') .. [[,
${if_match ${downspeedf ]] .. wlandev .. [[}<1000}
    ]] .. _h.value('${downspeed ' .. wlandev .. '}', ci.good) .. [[
${else}${if_match ${downspeedf ]] .. wlandev .. [[}<3000}
    ]] .. _h.value('${downspeed ' .. wlandev .. '}', ci.degraded) .. [[
${else}${if_match ${downspeedf ]] .. wlandev .. [[}>=3000}
    ]] .. _h.value('${downspeed ' .. wlandev .. '}', ci.bad) .. [[
${endif}${endif}${endif}
]]

-- Upload
parts.upload = _h.common('', 'UP') .. [[,
${if_match ${upspeedf ]] .. wlandev .. [[}<300}
    ]] .. _h.value('${upspeed ' .. wlandev .. '}', ci.good) .. [[
${else}${if_match ${upspeedf ]] .. wlandev .. [[}<800}
    ]] .. _h.value('${upspeed ' .. wlandev .. '}', ci.degraded) .. [[
${else}${if_match ${upspeedf ]] .. wlandev .. [[}>=800}
    ]] .. _h.value('${upspeed ' .. wlandev .. '}', ci.bad) .. [[
${endif}${endif}${endif}
]]

-- Memory
parts.memory = _h.common('', 'MEM') .. [[,
${if_match ${memperc}<30}
    ]] .. _h.value('${memeasyfree}', ci.good) .. [[
${else}${if_match ${memperc}<70}
    ]] .. _h.value('${memeasyfree}',ci.degraded) .. [[
${else}${if_match ${memperc}>=70}
    ]] .. _h.value('${memeasyfree}', ci.bad) .. [[
${endif}${endif}${endif}
]]

-- CPU 0
parts.cpu0 = _h.common('', 'CPU') .. [[,
${if_match ${cpu cpu0}<50}
    ]] .. _h.value('${cpu cpu0}%', ci.good) .. [[
${else}${if_match ${cpu cpu0}<60E}
    ]] .. _h.value('${cpu cpu0}%',ci.degraded) .. [[
${else}${if_match ${cpu cpu0}<=100}
    ]] .. _h.value('${cpu cpu0}%', ci.bad) .. [[
${endif}${endif}${endif}
]]

-- Battery
parts.battery = _h.common('', 'BAT') .. [[,
${if_match ${battery_percent}<30}
    ]] .. _h.value('${battery_percent}%', ci.bad) .. [[
${else}${if_match ${battery_percent}<70}
    ]] .. _h.value('${battery_percent}%', ci.degraded) .. [[
${else}${if_match ${battery_percent}>=70}
    ]] .. _h.value('${battery_percent}%', ci.good) .. [[
${endif}${endif}${endif}
]]

-- Disk usage /
parts.diskROOT = _h.common('', '/') .. [[,
${if_match ${fs_free_perc /} < 5}
    ]] .. _h.value('${fs_free /}', ci.bad) .. [[
${else}${if_match ${fs_free_perc /}<10}
    ]] .. _h.value('${fs_free /}',ci.degraded) .. [[
${else}${if_match ${fs_free_perc /}>=10}
    ]] .. _h.value('${fs_free /}', ci.good) .. [[
${endif}${endif}${endif}
]]

-- Disk usage /home
parts.diskHOME = _h.common('', '/home') .. [[,
${if_match ${fs_free_perc /home} < 5}
    ]] .. _h.value('${fs_free /home}', ci.bad) .. [[
${else}${if_match ${fs_free_perc /home}<10}
    ]] .. _h.value('${fs_free /home}',ci.degraded) .. [[
${else}${if_match ${fs_free_perc /home}>=10}
    ]] .. _h.value('${fs_free /home}', ci.good) .. [[
${endif}${endif}${endif}
]]


-- Template
parts.template = [[
]] .. _h.separator() .. [[,
]] .. _h.icon('') .. [[,
]] .. _h.text('') .. [[,
]] .. _h.value('', '#aaaaaa') .. [[
]]


