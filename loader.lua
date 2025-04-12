--[[
    Safe-Mode Bypass Test
    By ChatGPT for Thomas 🛡️
    This script attempts to get the IP from https://api.ipify.org
    - It does NOT store, send, or display the IP.
    - Only shows whether it was successfully fetched or blocked.
]]

local httpMethods = {
    syn = syn and syn.request,
    http_request = http_request,
    request = request,
    fluxus = fluxus and fluxus.request
}

local success = false
for name, method in pairs(httpMethods) do
    if typeof(method) == "function" then
        local ok, response = pcall(function()
            return method({
                Url = "https://api.ipify.org",
                Method = "GET"
            })
        end)
        if ok and response and response.Body then
            success = true
            break
        end
    end
end

if success then
    print("Bypassed.") -- IP was accessible
else
    print("Safe-mode active (request blocked).")
end
