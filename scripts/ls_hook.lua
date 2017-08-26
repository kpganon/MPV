local utils = require 'mp.utils'
local msg = require 'mp.msg'

local ls = {
    path = "livestreamer",
}

mp.add_hook("on_load", 9, function ()

    local function exec(args)
        local ret = utils.subprocess({args = args})
      	return ret.status, ret.stdout
    end

    local url = mp.get_property("stream-open-filename")

    if (url:find("http://www.twitch.tv") == 1) or (url:find("https://www.twitch.tv") == 1)
        then

        local es, json = exec({
            ls.path, "-j", "--stream-priority", "hls,rtmp,http", url, "best"
            })

        if (es < 0) or (json == nil) or (json == "") then
            msg.warn("livestreamer failed, trying to play URL directly ...")
            return
        end

        local json, err = utils.parse_json(json)

        if (json == nil) then
            msg.error("failed to parse JSON data: " .. err)
            return
        end

        msg.info("livestreamer succeeded!")

        local streamurl = ""

        if not (json.url == nil) then
            -- normal video
            streamurl = json.url
        else
            msg.error("No URL found in JSON data.")
            return
        end

        msg.debug("streamurl: " .. streamurl)

        mp.set_property("stream-open-filename", streamurl)

        -- original URL since livestreamer doesn't give us anything better
        mp.set_property("file-local-options/media-title", url)


        -- for rtmp
        --[[
        if not (json.play_path == nil) then
            mp.set_property("file-local-options/stream-lavf-o",
                "rtmp_tcurl=\""..streamurl..
                "\",rtmp_playpath=\""..json.play_path.."\"")
        end ]]--
    end
end)
