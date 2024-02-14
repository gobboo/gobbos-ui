GOBBO = GOBBO or {}
GOBBO.UI = GOBBO.UI or {}

local function loadDirectory(dir)
    local fil, fol = file.Find(dir .. "/*", "LUA")

    for k, v in ipairs(fil) do
        local dirs = dir .. "/" .. v

        if v:StartWith("cl_") then
            if SERVER then AddCSLuaFile(dirs)
            else include(dirs) end
        elseif v:StartWith("sh_") then
            AddCSLuaFile(dirs)
            include(dirs)
        else
            if SERVER then include(dirs) end
        end
    end

    for k,v in pairs(fol) do
        loadDirectory(dir .. "/" .. v)
    end

    print("Gobbo's UI | Loaded " .. dir)
end

local function loadAddon()
    loadDirectory("gobbo")
end

if SERVER then
    resource.AddFile("resource/fonts/SonnyVol2-ExtraBold.ttf")
    resource.AddFile("resource/fonts/SonnyVol2-Regular.ttf")
end

loadAddon()
