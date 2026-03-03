local HttpService = game:GetService("HttpService")

local API_URL = "https://setup.roproxy.com/%s-API-Dump.json"
local VERSION_URL = "https://setup.roproxy.com/version"

local function FetchAPI()
    local ok, versionHash = pcall(function()
        return HttpService:GetAsync(VERSION_URL)
    end)
    if not ok or not versionHash then
        warn("Could not fetch version hash: " .. tostring(versionHash))
        return nil
    end

    versionHash = string.gsub(versionHash, "%s+", "")
    local FINAL_URL = string.format(API_URL, versionHash)

    local ok, response = pcall(function()
        return HttpService:GetAsync(FINAL_URL)
    end)
    if not ok then
        warn("Could not fetch API dump: " .. tostring(response))
        return nil
    end

    return HttpService:JSONDecode(response)
end

print(FetchAPI())