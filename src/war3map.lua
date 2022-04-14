local isBuild = false

if(isBuild)then
    EXTERNAL_PATH = "src\\"
else
	EXTERNAL_PATH = "Maps\\lua\\src\\"
end

require "scripts\\blizzard"
require (EXTERNAL_PATH .. "main")