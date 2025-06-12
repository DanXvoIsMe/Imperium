local modulelol = {}

local Whitelist = {
    "DeepBloxCode",
    "YouAreErrorLol",
    "lua87366",
    "DanXvoalt",
    "RIGSEKTOR"
}

modulelol.IsWhitelisted = function ( name )
    if table.find(Whitelist, name) then
        return true
    else
        return false
    end
end

return modulelol
