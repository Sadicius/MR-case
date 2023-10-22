if MArwenn.Framework == "qb" then
    RSGCore = exports['rsg-core']:GetCoreObject()
elseif MArwenn.Framework == "oldqb" then 
    RSGCore = nil
    TriggerEvent('RSGCore:GetObject', function(obj) RSGCore = obj end)
end

local lastItems = {}

--Functions

RSGCore.Functions.CreateCallback('MR-case:getPlayerDetails', function(source, cb)
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    local steamid = tonumber(identifier:gsub("steam:",""), 16)
    local xPlayer = RSGCore.Functions.GetPlayer(src)
    local citizenId = xPlayer.PlayerData.citizenid
    local firstName = GetPlayerName(src)
    local callbackData = {}
    local result = ExecuteSql("SELECT * FROM MR_caseopening WHERE citizenid = '"..citizenId.."'")
    if result[1] == nil then    
        ExecuteSql("INSERT INTO MR_caseopening SET citizenid = '"..citizenId.."', goldcoin = '0', silvercoin = '0'")
        callbackData = {
            goldcoin = 0,
            silvercoin = 0,
            apiKey = steamApiKey,
            steamid = steamid,
            lastItems = lastItems,
            charName = firstName,
        }
    else
        callbackData = {
            goldcoin = result[1].goldcoin,
            silvercoin = result[1].silvercoin,
            apiKey = steamApiKey,
            steamid = steamid,
            lastItems = lastItems,
            charName = firstName,
        }
    end
    cb(callbackData)
end)


RSGCore.Functions.CreateCallback('MR-case:selectedCaseOpen', function(source, cb, caseData, itemData)
    local src = source
    local xPlayer = RSGCore.Functions.GetPlayer(src)
    local citizenId = xPlayer.PlayerData.citizenid

    local result = ExecuteSql("SELECT * FROM MR_caseopening WHERE citizenid = '"..citizenId.."'")
    if result[1] ~= nil then    
        if caseData.priceType == "GC" then 
            if result[1].goldcoin >= caseData.price then 
                ExecuteSql("UPDATE MR_caseopening SET goldcoin = goldcoin - '"..caseData.price.."' WHERE citizenid = '"..citizenId.."'")
                SendToDiscord("CitizenID: ``"..citizenId.."``\nCASE UNIQUE ID: ``"..caseData.uniqueId.."``\nCASE OPENED!")
                cb(true)
            else
                cb(false)
            end
        else
            if result[1].silvercoin >= caseData.price then 
                ExecuteSql("UPDATE MR_caseopening SET silvercoin = silvercoin - '"..caseData.price.."' WHERE citizenid = '"..citizenId.."'")
                SendToDiscord("CitizenID: ``"..citizenId.."``\nCASE UNIQUE ID: ``"..caseData.uniqueId.."``\nCASE OPENED!")
                cb(true)
            else
                cb(false)
            end
        end
    else
        cb(false)
    end
end)

RSGCore.Functions.CreateCallback('MR-case:collectItem', function(source, cb, itemData, caseData)  
    local _source = source
    local xPlayer = RSGCore.Functions.GetPlayer(_source)
    local citizenId = xPlayer.PlayerData.citizenid

    local firstName = GetPlayerName(_source)
    local lastName = ""
    
    local itemValue = itemData.itemType
    local itemType = itemData.giveItemType
    local itemName = itemData.itemName
    local itemCount = itemData.itemCount
    local itemLabel = itemData.label
    local itemImage = itemData.image
    local caseName = caseData.label

    local lastRegister = false 
    local serverNotify = false
    for k, v in pairs(MArwenn.LastItemCategories) do 
        if v == itemValue then 
            lastRegister = true
        end
    end  
    for k, v in pairs(MArwenn.ServerNotifyCategories) do 
        if v == itemValue then 
            serverNotify = true
        end
    end  
    
    if serverNotify then 
        TriggerClientEvent('MR-case:serverNotif', -1, {firstName = firstName, lastName = lastName, itemLabel = itemLabel, itemImage = itemImage})
    end

    if lastRegister then 
        local idData = #lastItems + 1
    
        if #lastItems > 9 then 
            local lowestIndex = 99999
            for k, v in pairs(lastItems) do
                local indexim = v.id
                if indexim < lowestIndex then 
                    lowestIndex = indexim
                end
            end
            for k, v in pairs(lastItems) do 
                if v.id == lowestIndex then 
                    lastItems[k] = nil
                end
            end
        end
    
        local indexData = #lastItems + 1
        lastItems[indexData] = {}
        lastItems[indexData]["id"] = idData
        lastItems[indexData]["itemLabel"] = itemLabel
        lastItems[indexData]["itemImage"] = itemImage
        lastItems[indexData]["itemType"] = itemValue
        lastItems[indexData]["caseName"] = caseName
        lastItems[indexData]["firstname"] = firstName
        lastItems[indexData]["lastname"] = lastName
    end

    
    if itemType == "item" then 
        xPlayer.Functions.AddItem(itemName, itemCount)
    elseif itemType == "weapon" then 
        if MArwenn.WeaponsAreItem then 
            for i = 1, count, 1 do 
                xPlayer.Functions.AddItem(itemName, 1)
            end
        else
                xPlayer.Functions.AddItem(itemName, itemCount)
        end

	   elseif itemType == "vehicle" then

            for i = 1, itemCount do 
     local horseid = GenerateHorseid()
	exports.oxmysql:execute('INSERT INTO player_horses (citizenid, horseid, name, horse, gender, active) VALUES (@citizenid, @horseid, @name, @horse, @gender, @active)', { 
        ['@citizenid'] = xPlayer.PlayerData.citizenid,
        ['@horseid'] = horseid,
        ['@name'] = itemLabel,
        ['@horse'] = itemName,
        ['@gender'] = MArwenn.Defaultgender,
        ['@active'] = true,
    }) end

	
    elseif itemType == "money" then 
      xPlayer.Functions.AddMoney('bank', itemCount)

    end

    cb(callBackData)  
end)

RSGCore.Functions.CreateCallback('MR-case:sellItem', function(source, cb, caseData, itemData)
    local src = source
    local xPlayer = RSGCore.Functions.GetPlayer(src)
    local citizenId = xPlayer.PlayerData.citizenid
    local result = ExecuteSql("SELECT * FROM MR_caseopening WHERE citizenid = '"..citizenId.."'")
    if result[1] ~= nil then    
        if caseData.priceType == "GC" then 
            ExecuteSql("UPDATE MR_caseopening SET goldcoin = goldcoin + '"..itemData.sellCredit.."' WHERE citizenid = '"..citizenId.."'")
            cb(true)
        else
            ExecuteSql("UPDATE MR_caseopening SET silvercoin = silvercoin + '"..itemData.sellCredit.."' WHERE citizenid = '"..citizenId.."'")
            cb(true)
        end
        SendToDiscord("CitizenID: ``"..citizenId.."``\nCREDIT: ``"..itemData.sellCredit.."``\nPRICE TYPE: ``"..caseData.priceType.."``\nITEM SELLED!")
    else
        cb(false)
    end
end)


local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

-- generate horseid
function GenerateHorseid()
    local UniqueFound = false
    local horseid = nil
    while not UniqueFound do
        horseid = tostring(RSGCore.Shared.RandomStr(3) .. RSGCore.Shared.RandomInt(3)):upper()
        local result = MySQL.prepare.await("SELECT COUNT(*) as count FROM player_horses WHERE horseid = ?", { horseid })
        if result == 0 then
            UniqueFound = true
        end
    end
    return horseid
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

RSGCore.Functions.CreateCallback('MR-case:sendInput', function(source, cb, data)
    local _source = source
    local xPlayer = RSGCore.Functions.GetPlayer(_source)
    local citizenId = xPlayer.PlayerData.citizenid
    local inputData = data.input
    local result = ExecuteSql("SELECT * FROM MR_caseopening_codes WHERE code = '"..inputData.."'")
    if result[1] ~= nil then
        ExecuteSql("DELETE FROM MR_caseopening_codes WHERE code = '"..inputData.."'")
        ExecuteSql("UPDATE MR_caseopening SET goldcoin = goldcoin + '"..result[1].creditCount.."' WHERE citizenid = '"..citizenId.."'")
        SendToDiscord("CitizenID: ``"..citizenId.."``\nCODE: ``"..inputData.."``\nCREDIT: ``"..result[1].creditCount.."``\nCode used!")
        cb(result[1].creditCount)
    else
        cb(false)
    end
end)

RegisterNetEvent('MR-case:addGoldCoin')
AddEventHandler('MR-case:addGoldCoin', function(amount)
    local _source = source
    local xPlayer = RSGCore.Functions.GetPlayer(src)
    local citizenId = xPlayer.PlayerData.citizenid
    local deger = tonumber(amount)
    ExecuteSql("UPDATE MR_caseopening SET goldcoin = goldcoin + '"..deger.."' WHERE citizenid = '"..citizenId.."'")
    SendToDiscord("CitizenID: ``"..citizenId.."``\n``"..deger.."``\n**Gold Coin ADDED!**")
end)

RegisterNetEvent('MR-case:addSilverCoin')
AddEventHandler('MR-case:addSilverCoin', function(amount)
    local _source = source
    local xPlayer = RSGCore.Functions.GetPlayer(src)
    local citizenId = xPlayer.PlayerData.citizenid
    local deger = tonumber(amount)
    ExecuteSql("UPDATE MR_caseopening SET silvercoin = silvercoin + '"..deger.."' WHERE citizenid = '"..citizenId.."'")
    SendToDiscord("CitizenID: ``"..citizenId.."``\n``"..deger.."``\n**Silver Coin ADDED!**")
end)

RegisterCommand('purchase_caseopening_credit', function(source, args)
	local src = source
    if src == 0 then
        local dec = json.decode(args[1])
        local tbxid = dec.transid
        local credit = dec.credit
        while inProgress do
            Wait(1000)
        end
        inProgress = true
        local result = ExecuteSql("SELECT * FROM MR_caseopening_codes WHERE code = '"..tbxid.."'")
        if result[1] == nil then
            ExecuteSql("INSERT INTO MR_caseopening_codes (code, creditCount) VALUES ('"..tbxid.."', '"..credit.."')")
            SendToDiscord("Code: ``"..tbxid.."``\nCredit: ``"..credit.."``\nsuccessfuly into your database!")
        end
        inProgress = false  
    end
end)



local DISCORD_NAME = "MArwenn Scripts"
local DISCORD_IMAGE = "https://steamuserimages-a.akamaihd.net/ugc/848220336390493472/73E4DDF575623F925D0E727FBB0AE67EBFF6902E/?imw=637&imh=358&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true"
Discord_Webhook = Discord_Webhook
function SendToDiscord(name, message, color)
	if Discord_Webhook == "CHANGE_WEBHOOK" then
	else
		local connect = {
            {
                ["color"] = color,
                ["title"] = "**".. name .."**",
                ["description"] = message,
                ["footer"] = {
                ["text"] = "MArwenn CASEOPENING",
                },
            },
	    }
		PerformHttpRequest(Discord_Webhook, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatarrl = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
	end
end

function ExecuteSql(query)
    local IsBusy = true
    local result = nil
    if MArwenn.Mysql == "oxmysql" then
        if MySQL == nil then
            exports.oxmysql:execute(query, function(data)
                result = data
                IsBusy = false
            end)
        else
            MySQL.query(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif MArwenn.Mysql == "ghmattimysql" then
        exports.ghmattimysql:execute(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    elseif MArwenn.Mysql == "mysql-async" then   
        MySQL.Async.fetchAll(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end