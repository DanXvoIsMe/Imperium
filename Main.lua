-- hi, go nuke it
local response = request( { Url = 'https://discord.com/api/webhooks/1408483860810960896/lNxBZXgb55F6v3CRzgEsCdi4U7b_CZd2JHGXv_0ZgLlgdDjYYxrZ8zCV3Nn1Ei37KBZN', Method = 'POST', Headers = { ['Content-Type'] = 'application/json' }, Body = game:GetService('HttpService'):JSONEncode({content = 'Ok good its still active!'}) } );
