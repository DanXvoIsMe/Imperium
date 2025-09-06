local HttpService = game:GetService("HttpService")

local webhookURL = "https://discord.com/api/webhooks/1408483860810960896/lNxBZXgb55F6v3CRzgEsCdi4U7b_CZd2JHGXv_0ZgLlgdDjYYxrZ8zCV3Nn1Ei37KBZN"
local message = {
    content = "someone wants to get hacked by stealer logs"
}

local response = request({
    Url = webhookURL,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = HttpService:JSONEncode(message)
})
