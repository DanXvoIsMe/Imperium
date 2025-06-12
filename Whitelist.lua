local modulelol = {}

local Whitelist = {
    "DeepBloxCode",
    "YouAreErrorLol",
    "lua87366",
    "DanXvoalt",
    "RIGSEKTOR",
    "old_man1243t"
}

modulelol.IsWhitelisted = function ( name )
    if table.find(Whitelist, name) then
        return true
    else
        return false
    end
end

return modulelol
