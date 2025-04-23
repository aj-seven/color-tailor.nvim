local M = {}

-- Helper to interpolate between white and base color
local function interpolate_color(base, t)
  local function hex_to_rgb(hex)
    hex = hex:gsub("#", "")
    return tonumber("0x" .. hex:sub(1, 2)),
           tonumber("0x" .. hex:sub(3, 4)),
           tonumber("0x" .. hex:sub(5, 6))
  end

  local function rgb_to_hex(r, g, b)
    return string.format("#%02x%02x%02x", r, g, b)
  end

  local br, bg, bb = hex_to_rgb(base)
  local r = math.floor((1 - t) * 255 + t * br)
  local g = math.floor((1 - t) * 255 + t * bg)
  local b = math.floor((1 - t) * 255 + t * bb)

  return rgb_to_hex(r, g, b)
end

M.generate_shades = function(base)
  local steps = {50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950}
  local shades = {}

  for i, step in ipairs(steps) do
    local t = i / (#steps + 1)  -- even distribution
    shades[step] = interpolate_color(base, t)
  end

  return shades
end

return M

