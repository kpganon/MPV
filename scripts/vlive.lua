local sub_path = mp.get_opt("vlive")
if not sub_path then return end

function get_first_timestamp(fname)
  for line in io.lines(fname) do
    local ts = line:match("^%d+:%d+:%d+%.%d+")
    if ts then return ts end
  end
end

function parse_time(ts)
  local h, m, s, ms = ts:match("^(%d+):(%d+):(%d+)%.(%d+)$")
  h, m, s, ms = tonumber(h), tonumber(m), tonumber(s), tonumber(ms)
  return h * 3600 + m * 60 + s + ms / 1000
end

-- Loop until first subtitle chunk is appeared.
local wait_limit = 30
function wait_for_sub()
  local ts = get_first_timestamp(sub_path)
  if ts then
    main(parse_time(ts))
    return
  end

  wait_limit = wait_limit - 1
  if wait_limit > 0 then
    mp.add_timeout(0.5, wait_for_sub)
  end
end


-- Main loop.
function main(shift)
  mp.commandv("sub-add", sub_path)
  mp.set_property_number("sub-delay", shift)
  mp.add_periodic_timer(1, function()
    mp.commandv("sub-reload")
  end)
end

wait_for_sub()
