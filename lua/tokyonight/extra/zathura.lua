local util = require("tokyonight.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  local zathuraColors = {}
  -- Borrow code from fish template
  for k, v in pairs(colors) do
    if type(v) == "string" then
      zathuraColors[k] = v:gsub("^#", "")
    end
  end

  local zathura = util.template(
    -- HACK: This is probably a terrible way of putting back the pound signs for the options that *do* use hex codes
    -- Figure out a way to have it so that the options that do need to be changed actually are changed
    [[
# Tokyonight color theme for Zathura
# Swaps Foreground for Background to get a light version if the user prefers
#
# Tokyonight color theme
#
set notification-error-bg "#${red}"
set notification-error-fg "#${fg}"
set notification-warning-bg "#${yellow}"
set notification-warning-fg "#${terminal_black}"
set notification-bg "#${bg}"
set notification-fg "#${fg}"
set completion-bg "#${bg}"
set completion-fg "#${fg_dark}"
set completion-group-bg "#${bg}"
set completion-group-fg "#${fg_dark}"
set completion-highlight-bg "#${terminal_black}"
set completion-highlight-fg "#${fg}"
set index-bg "#${bg}"
set index-fg "#${fg}"
set index-active-bg "#${terminal_black}"
set index-active-fg "#${fg}"
set inputbar-bg "#${bg}"
set inputbar-fg "#${fg}"
set statusbar-bg "#${bg}"
set statusbar-fg "#${fg}"
set highlight-color "rgba(${yellow})"
set highlight-active-color "rgba(${green})"
set default-bg "#${bg}"
set default-fg "#${fg}"
set render-loading true
set render-loading-fg "#${bg}"
set render-loading-bg "#${fg}"
#
# Recolor mode settings
# <C-r> to switch modes
#
set recolor-lightcolor "#${bg}"
set recolor-darkcolor "#${fg}"
]], -- TODO: Trim the first character from the color strings,
    -- and then convert hex codes to decimal.
    -- rgba uses an entirely different format that uses decimal instead of hex.
    -- This is probably going to be harder than I thought...
    zathuraColors
  )
  return zathura
end

return M
