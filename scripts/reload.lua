-- reload.lua
--
-- When an online video is stuck buffering or got very slow CDN
-- source, restarting often helps. This script provides automatic
-- reloading of videos that doesn't have buffering progress for some
-- time while keeping the current time position. It also adds `Ctrl+r`
-- keybinding to reload video manually.
--
-- SETTINGS
--
-- To override default setting put `lua-settings/reload.conf` file in
-- mpv user folder, on linux it is `~/.config/mpv`.  NOTE: config file
-- name should match the name of the script.
--
-- Default `reload.conf` settings:
--
-- ```
-- # enable automatic reload on timeout
-- paused_for_cache_timer_enabled=yes

-- # checking paused_for_cache property interval in seconds,
-- # can not be less than 0.05 (50 ms)
-- paused_for_cache_timer_interval=1

-- # time in seconds to wait until reload
-- paused_for_cache_timer_timeout=10
--
-- # keybinding to reload stream from current time position
-- # you can disable keybinding by setting it to empty value
-- # reload_key_binding=
-- reload_key_binding=Ctrl+r
-- ```
--
-- DEBUGGING
--
-- Debug messages will be printed to stdout with mpv command line option
-- `--msg-level='reload=debug'`

local msg = require 'mp.msg'
local options = require 'mp.options'
local utils = require 'mp.utils'


local settings = {
   paused_for_cache_timer_enabled = true,
   paused_for_cache_timer_interval = 1,
   paused_for_cache_timer_timeout = 10,
   reload_key_binding = "Ctrl+r",
}

local paused_for_cache_seconds = 0
local paused_for_cache_timer = nil

function read_settings()
   options.read_options(settings, mp.get_script_name())
   msg.debug(utils.to_string(settings))
end

function debug_info(event)
   msg.debug("event =", utils.to_string(event))
   msg.debug("path =", mp.get_property("path"))
   msg.debug("time-pos =", mp.get_property("time-pos"))
   msg.debug("paused-for-cache =", mp.get_property("paused-for-cache"))
   msg.debug("stream-path =", mp.get_property("stream-path"))
   msg.debug("stream-pos =", mp.get_property("stream-pos"))
   msg.debug("stream-end =", mp.get_property("stream-end"))
   msg.debug("duration =", mp.get_property("duration"))
   msg.debug("seekable =", mp.get_property("seekable"))
end

function reload_time_pos(path, time_pos)
   msg.debug("reload_time_pos; time_pos = ", time_pos)
   mp.commandv("loadfile", path, "replace", "start=+" .. time_pos)
end

function reload(path)
   msg.debug("reload")
   mp.commandv("loadfile", path, "replace")
end

function reload_resume()
   local path = mp.get_property("path")
   local time_pos = mp.get_property("time-pos")

   -- Tries to determine live stream vs. pre-recordered VOD.
   -- VOD has fixed start position. When reloading vod, to keep current
   -- time position we should provide offset from the start.
   -- Stream doesn't have fixed start. Decent choice would be to reload
   -- stream from it's current 'live' positon. So we don't pass the offset when
   -- reloading streams.
   if mp.get_property_native("duration") then
      msg.info("reloading video from", time_pos, "second")
      reload_time_pos(path, time_pos)
   else
      msg.info("reloading stream")
      reload(path)
   end
end

function reset_timer()
   msg.debug("reset_timer; paused_for_cache_seconds =", paused_for_cache_seconds)
   if paused_for_cache_timer then
      paused_for_cache_timer:kill()
      paused_for_cache_timer = nil
      paused_for_cache_seconds = 0
   end
end

function start_timer(interval_seconds, timeout_seconds)
   msg.debug("start_timer")
   paused_for_cache_timer = mp.add_periodic_timer(
      interval_seconds,
      function()
         paused_for_cache_seconds = paused_for_cache_seconds + interval_seconds
         if paused_for_cache_seconds >= timeout_seconds then
            reset_timer()
            reload_resume()
         end
   end)
end

function paused_for_cache_handler(property, is_paused)
   if is_paused then
      if not paused_for_cache_timer then
         start_timer(
            settings.paused_for_cache_timer_interval,
            settings.paused_for_cache_timer_timeout)
      end
   else
      if paused_for_cache_timer then
         reset_timer()
      end
   end
end

-- main

read_settings()

if settings.reload_key_binding ~= "" then
   mp.add_key_binding(settings.reload_key_binding, "reload_resume", reload_resume)
end

if settings.paused_for_cache_timer_enabled then
   mp.observe_property("paused-for-cache", "bool", paused_for_cache_handler)
end

-- mp.register_event("file-loaded", debug_info)
