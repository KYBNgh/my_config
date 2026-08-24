-- cut.lua
local start_time = -1
local end_time = -1

function get_time()
    return mp.get_property_number("time-pos", 0)
end

function set_start()
    start_time = get_time()
    mp.osd_message(string.format("start: %.3f 秒", start_time))
end

function set_end()
    end_time = get_time()
    mp.osd_message(string.format("end: %.3f 秒", end_time))
end

function export_cut()
    if start_time < 0 or end_time < 0 or start_time >= end_time then
        mp.osd_message("invalid time", 2)
        return
    end
    
    local path = mp.get_property("path")
    local full_filename = mp.get_property("filename")
    local filename = mp.get_property("filename/no-ext")
   
    local ext = string.match(full_filename, "%.(%w+)$")
    
    if not ext then
        ext = "mp4"
    end

    local out_name = string.format("%s_cut_%.3f-%.3f.%s", filename, start_time, end_time, ext)
    
    local cmd = string.format('ffmpeg -ss %.3f -to %.3f -i "%s" -c copy "%s"', start_time, end_time, path, out_name)
    
    mp.osd_message("created cut_commands.sh", 3)
    mp.msg.info("FFmpeg command: " .. cmd)
    
    local f = io.open("cut_commands.sh", "a")
    if f then
        f:write(cmd .. "\n")
        f:close()
    end
    
    start_time = -1
    end_time = -1
end

mp.add_key_binding("i", "set-start", set_start)
mp.add_key_binding("o", "set-end", set_end)
mp.add_key_binding("c", "export-cut", export_cut)
