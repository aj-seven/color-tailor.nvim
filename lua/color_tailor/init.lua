local M = {}
local gen = require("color_tailor.color_shades")

local function build_tailwind_config(name, shades)
  local lines = {}
  table.insert(lines, string.format("'%s': {", name))
  for k, v in pairs(shades) do
    table.insert(lines, string.format("  %s: '%s',", k, v))
  end
  table.insert(lines, "},")
  return table.concat(lines, "\n")
end

M.run = function(baseColor, colorName, action)
  local shades = gen.generate_shades(baseColor)
  local config = build_tailwind_config(colorName, shades)

  if action == "copy" then
    vim.fn.setreg("+", config)
    print("✅ Tailwind config copied to clipboard!")
  elseif action == "file" then
    local path = vim.fn.stdpath("config") .. "/tailwind-colors/" .. colorName .. ".js"
    vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
    local f = io.open(path, "w")
    f:write(config)
    f:close()
    print("📁 Saved to: " .. path)
  else
    print("🎨 Shades for '" .. colorName .. "':")
    for k, v in pairs(shades) do
      print("  " .. k .. " → " .. v)
    end
  end
end

return M

