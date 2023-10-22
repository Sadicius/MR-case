if MArwenn.Framework == "qb" then
    RSGCore = exports['rsg-core']:GetCoreObject()
elseif MArwenn.Framework == "oldqb" then 
    RSGCore = nil
end

local playTime = 9999999999
local lastSelected = nil
local lastValidatedCase = nil

Citizen.CreateThread(function()
    if MArwenn.Framework == "oldqb" then 
        while RSGCore == nil do
            TriggerEvent('RSGCore:GetObject', function(obj) RSGCore = obj end)
            Citizen.Wait(200)
        end
	elseif MArwenn.Framework == "qb" then
		while RSGCore == nil do
            Citizen.Wait(200)
        end
    end
    Wait(1000)	
    playTime = GetGameTimer() + (MArwenn.NeededPlayTime * 60000)
end)

RegisterNetEvent('RSGCore:Client:OnPlayerLoaded')
AddEventHandler('RSGCore:Client:OnPlayerLoaded', function()
    playTime = GetGameTimer() + (MArwenn.NeededPlayTime * 60000)
end)

RegisterNUICallback('closeMenu', function(data, cb)
	SetNuiFocus(false, false)
end)

local openMenuSpamProtect = 0
RegisterCommand(MArwenn.OpenCommand, function()
    if openMenuSpamProtect < GetGameTimer() then 
        openMenuSpamProtect = GetGameTimer() + 1500
        RSGCore.Functions.TriggerCallback("MR-case:getPlayerDetails", function(result)
            local firstname = result.charName
            local lastname = ""
           -- apiKey = result.apiKey
           -- if result.steamid then
          --     steamID = "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=" .. apiKey .. "&steamids=" .. result.steamid
          --  else
          --      steamID = 'null'
           -- end
            SetNuiFocus(true,true)
            SendNUIMessage({
                type = 'openUi', 
                premiumCases = MArwenn.PremiumCases,
                standardCases = MArwenn.StandardCases,
                myGoldCoin = result.goldcoin,
                mySilverCoin = result.silvercoin,
                myFirstName = firstname,
                myLastName = lastname,
                sellCoins = MArwenn.SellCoins,
                webSiteLink = MArwenn.WebsiteLink,
                discordLink = MArwenn.DiscordLink,
                steamid = steamID,
                translate = MArwenn.Translate,
                lastItems = result.lastItems,
            })	
        end)
    end
end)




local collectItemSpamProtect = 0
RegisterNUICallback('collectItem', function(data, cb)
    if collectItemSpamProtect < GetGameTimer() then 
        collectItemSpamProtect = GetGameTimer() + 1500
		if lastSelected.itemName == data.collectedItem.itemName then 
        RSGCore.Functions.TriggerCallback("MR-case:collectItem", function(result)
            cb(result)
			end, lastSelected, lastValidatedCase)
       -- end, data)
    end
	end
end)


local sellItemSpamProtect = 0
RegisterNUICallback("sellItem", function(data, cb)
    if sellItemSpamProtect < GetGameTimer() then 
        sellItemSpamProtect = GetGameTimer() + 1500
        if lastSelected.sellCredit == data.sellItem.sellCredit then 
            RSGCore.Functions.TriggerCallback("MR-case:sellItem", function(result)
                cb(result)
            end, lastValidatedCase, lastSelected)
       	        Wait(100)
          	lastValidatedCase = nil
        	lastSelected = nil
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

local openCaseSpamProtect = 0
RegisterNUICallback('caseOpenSelect', function(data, cb)
    if openCaseSpamProtect < GetGameTimer() then 
        openCaseSpamProtect = GetGameTimer() + 1500
        if data then 
            lastValidatedCase = nil
            lastSelected = nil
            local selectedCaseSeries = MArwenn.StandardCases
            if data.selectedCase.caseType and data.selectedCase.caseType == "premium" then
                selectedCaseSeries = MArwenn.PremiumCases
            end
            for k, v in pairs(selectedCaseSeries) do 
                if v.uniqueId == data.selectedCase.uniqueId then 
                    lastValidatedCase = v
                    break
                end
            end
            if lastValidatedCase then 
                local randomItemList = {}
                for k, v in pairs(lastValidatedCase.items) do 
                    local chance = math.ceil(v.chance / 0.1)
                    for i = 0, chance do 
                        table.insert(randomItemList, v)
                    end
                end
                lastSelected = randomItemList[math.random(1, #randomItemList)]
                RSGCore.Functions.TriggerCallback("MR-case:selectedCaseOpen", function(result)
                    if result then 
                        cb(lastSelected)
                    else
                        cb(false)
                    end
                end, lastValidatedCase, lastSelected)
            else
                cb(false)
            end
        else
            cb(false)
        end
    else
        cb(false)
    end
	
end)

local sendInputSpamProtect = 0
RegisterNUICallback('sendInput', function(data, cb)
	if sendInputSpamProtect <= GetGameTimer() then
		sendInputSpamProtect = GetGameTimer() + 2000 
		RSGCore.Functions.TriggerCallback("MR-case:sendInput", function(result)
			if result then 	
				cb(tonumber(result))
			else
				cb(false)
			end
		end, data)
    else
        cb(false)
	end
end)

RegisterNetEvent('MR-case:serverNotif')
AddEventHandler('MR-case:serverNotif', function(data)
	SendNUIMessage({
        type = 'serverNotif', 
        notifInfo = data,
    })	
end)


function disp_time(time)
    local days = math.floor(time/86400)
    local remaining = time % 86400
    local hours = math.floor(remaining/3600)
    remaining = remaining % 3600
    local minutes = math.floor(remaining/60)
    remaining = remaining % 60
    local seconds = remaining
    if (hours < 10) then
        hours = "0" .. tostring(hours)
    end
    if (minutes < 10) then
        minutes = "0" .. tostring(minutes)
    end
    if (seconds < 10) then
        seconds = "0" .. tostring(seconds)
    end
    if hours ~= "00" then 
        answer = hours..'h '..minutes..'m'
    else
        answer = minutes..'m'

    end
    return answer
end

Citizen.CreateThread(function()
    while true do
        Wait(5000)
        local checkTime = tonumber(getNeededPlayTime())
        if checkTime <= 0 then
            playTime = GetGameTimer() + (MArwenn.NeededPlayTime * 60000)
            if MArwenn.PlayTimeRewardType == "GOLDCOIN" then 
                TriggerServerEvent('MR-case:addGoldCoin', MArwenn.PlayTimeRewardCoin)
            else
                TriggerServerEvent('MR-case:addSilverCoin', MArwenn.PlayTimeRewardCoin) 
            end
        end
    end
end)


getNeededPlayTime = function()
    return math.round((playTime - GetGameTimer()) / 60000, 2)
end

function math.round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end