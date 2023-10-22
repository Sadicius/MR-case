

MArwenn = {}

MArwenn.Framework = "qb" -- / oldqb | qb = export system | oldqb = triggerevent system
MArwenn.Mysql = "oxmysql" -- Check fxmanifest.lua when you change it! | ghmattimysql / oxmysql / mysql-async
MArwenn.OpenCommand = "case"

MArwenn.WeaponsAreItem = false -- If your weapons are item then you should set this TRUE.

MArwenn.NeededPlayTime = 60 -- MINUTES
MArwenn.PlayTimeRewardType = "GOLDCOIN" -- GOLDCOIN OR SILVERCOIN
MArwenn.PlayTimeRewardCoin = 10 
MArwenn.Defaultgender = "male"
MArwenn.WebsiteLink = "https://www.google.com/"
MArwenn.DiscordLink = "https://discord.gg/"

-- ITEM TYPES : "common", "uncommon", "rare", "mythical", "legendary"
MArwenn.LastItemCategories = {"uncommon", "rare", "mythical", "legendary"} -- When items of the type written on the left are won, they appear in the recently won items tab
MArwenn.ServerNotifyCategories = {"uncommon", "mythical", "legendary"} -- When items of the type written on the left are won, a notification is sent to the entire server

MArwenn.Translate = {
    title1 = "CASE",
    title2 = "OPENING",
    premium = "PREMIUM",
    standard = "STANDARD",
    cases = "CASES",
    website = "WEBSITE",
    discord = "DISCORD",
    premiumCases = "PREMIUM CASES",
    standardCases = "STANDARD CASES",
    openCase = "OPEN CASE",
    openFast = "OPEN FAST",
    coinShopTitle = "GC SHOP",
    new = "NEW",
    goBack = "GO BACK",
    caseItems = "CASE ITEMS",
    items = "ITEMS",
    congratulations = "CONGRATULATIONS",
    congDescription = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum assumenda, a minima reiciendis modi quo expedita dignissimos?",
    collect = "COLLECT",
    sell = "SELL",
    accept = "ACCEPT",
    creditLoaded = "Credit Successfully LOADED",
    failed = "FAILED",
    youDntHaveEnoughCredit = "YOU DONT HAVE ENOUGH CREDIT!",
}


-- giveItemType's = "item", "vehicle", "money"
-- items in the case should have a chance total of 100 !! IMPORTANT !! IMPORTANT !! IMPORTANT !!
MArwenn.PremiumCases = {
    {
        uniqueId = 1, -- IDs must be different and sequential
        label = "PETS Case",
        price = 200, 
        priceType = "GC", -- GC OR SC
        caseTheme = "red", -- red, blue, orange, purple, green
        caseType = "premium", -- do not touch!
        isNew = true,
        items = { -- giveItemType's = "item", "vehicle", "money", "weapon"
                  -- items in the case should have a chance total of 100 !! IMPORTANT !! IMPORTANT !! IMPORTANT !!
            { itemName = "foxhound", label = "foxhound", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/animal_dog_bluetickcoonhound.png" },
            { itemName = "sheperd", label = "sheperd", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/animal_dog_australianshepherd.png" },
            { itemName = "coonhound", label = "coonhound", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/animal_dog_americanfoxhound.png" },
            { itemName = "catahoulacur", label = "catahoulacur", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/animal_dog_catahoularcur.png" },
            { itemName = "hound", label = "hound", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/animal_dog_hound.png" },
            { itemName = "bayretriever", label = "bayretriever", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/animal_dog_chesbayretriever.png" },
            { itemName = "collie", label = "collie", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/animal_dog_collie.png" },
            { itemName = "husky", label = "husky", chance = 7.5, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/animal_dog_husky.png" },
            { itemName = "lab", label = "lab", chance = 5, sellCredit = 40, itemType = "uncommon", itemCount = 1, giveItemType = "weapon", image = "./images/items/animal_dog_lab.png" },
            { itemName = "poodle", label = "poodle", chance = 5, sellCredit = 40, itemType = "uncommon", itemCount = 1, giveItemType = "weapon", image = "./images/items/animal_dog_poodle.png" },
            { itemName = "street", label = "street", chance = 5, sellCredit = 40, itemType = "uncommon", itemCount = 1, giveItemType = "weapon", image = "./images/items/animal_dog_street.png" },
            { itemName = "bear", label = "bear", chance = 100, sellCredit = 100, itemType = "uncommon", itemCount = 1, giveItemType = "item", image = "./images/items/bear.png" },
            { itemName = "lionmangy", label = "lion", chance = 5, sellCredit = 100, itemType = "rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/lion.png" },
            { itemName = "panther", label = "panther", chance = 5, sellCredit = 100, itemType = "rare", itemCount = 1, giveItemType = "weapon", image = "./images/items/panther.png" },
     },
    },
    {
        uniqueId = 2, -- IDs must be different and sequential
        label = "HORSE Case",
        price = 300,
        priceType = "GC", -- GC OR SC
        caseTheme = "orange", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = true, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "a_c_horse_arabian_black", label = "arabian black", chance = 10, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "vehicle", image = "./images/items/arabian-black.png" },
            { itemName = "a_c_horse_arabian_grey", label = "arabian grey", chance = 10, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "vehicle", image = "./images/items/arabian-grey.png" },
            { itemName = "a_c_horse_arabian_redchestnut", label = "arabian redchestnut", chance = 10, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "vehicle", image = "./images/items/arabian-redchestnut.png" },
            { itemName = "a_c_horse_arabian_redchestnut_pc", label = "arabian redchestnut", chance = 10, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "vehicle", image = "./images/items/arabian-redchestnut-pc.png" },
            { itemName = "a_c_horse_arabian_rosegreybay", label = "arabian rosegreybay", chance = 10, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "vehicle", image = "./images/items/arabian-rosegreybay.png" },
            { itemName = "a_c_horse_arabian_warpedbrindle_pc", label = "arabian warpedbrindle", chance = 10, sellCredit = 15, itemType = "common", itemCount = 1, giveItemType = "vehicle", image = "./images/items/arabian-warpedbrindle.png" },
            { itemName = "a_c_horse_arabian_white", label = "arabian white", chance = 100, sellCredit = 40, itemType = "uncommon", itemCount = 1, giveItemType = "vehicle", image = "./images/items/arabian-white.png" },
            { itemName = "a_c_horse_andalusian_rosegray", label = "andalusian rosegray", chance = 7.5, sellCredit = 40, itemType = "uncommon", itemCount = 1, giveItemType = "vehicle", image = "./images/items/andalusian-rosegray.png" },
            { itemName = "a_c_horse_andalusian_perlino", label = "andalusian perlino", chance = 7.5, sellCredit = 40, itemType = "uncommon", itemCount = 1, giveItemType = "vehicle", image = "./images/items/andalusian-perlino.png" },
            { itemName = "a_c_horse_andalusian_darkbay", label = "andalusian darkbay", chance = 5, sellCredit = 100, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/andalusian-darkbay.png" },
            { itemName = "a_c_horse_turkoman_silver", label = "turkoman silver", chance = 5, sellCredit = 100, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/items/turkoman-silver.png" },
            { itemName = "a_c_horse_turkoman_gold", label = "turkoman gold", chance = 2, sellCredit = 150, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/items/turkoman-gold.png" },
            { itemName = "a_c_horse_turkoman_darkbay", label = "turkoman darkbay", chance = 2, sellCredit = 150, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/items/turkoman-darkbay.png" },
            { itemName = "a_c_horse_mustang_goldendun", label = "mustang goldendun", chance = 2, sellCredit = 150, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/items/mustang-goldendun.png" },
        },
    },
    {
        uniqueId = 3, -- IDs must be different and sequential
        label = "Money Case",
        price = 230,
        priceType = "GC", -- GC OR SC
        caseTheme = "green", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "money", label = "10.000$", chance = 15, sellCredit = 10, itemType = "common", itemCount = 10000, giveItemType = "money", image = "./images/items/money-1.png" },
            { itemName = "money", label = "12.000$", chance = 15, sellCredit = 10, itemType = "common", itemCount = 12000, giveItemType = "money", image = "./images/items/money-1.png" },
            { itemName = "money", label = "13.000$", chance = 15, sellCredit = 10, itemType = "common", itemCount = 13000, giveItemType = "money", image = "./images/items/money-1.png" },
            { itemName = "money", label = "14.000$", chance = 15, sellCredit = 10, itemType = "common", itemCount = 14000, giveItemType = "money", image = "./images/items/money-1.png" },
            { itemName = "money", label = "15.000$", chance = 10, sellCredit = 10, itemType = "uncommon", itemCount = 15000, giveItemType = "money", image = "./images/items/money-1.png" },
            { itemName = "money", label = "16.000$", chance = 10, sellCredit = 10, itemType = "uncommon", itemCount = 16000, giveItemType = "money", image = "./images/items/money-1.png" },
            { itemName = "money", label = "20.000$", chance = 5, sellCredit = 40, itemType = "rare", itemCount = 20000, giveItemType = "money", image = "./images/items/money-2.png" },
            { itemName = "money", label = "23.000$", chance = 5, sellCredit = 40, itemType = "rare", itemCount = 23000, giveItemType = "money", image = "./images/items/money-2.png" },
            { itemName = "money", label = "27.000$", chance = 5, sellCredit = 40, itemType = "rare", itemCount = 27000, giveItemType = "money", image = "./images/items/money-2.png" },
            { itemName = "money", label = "40.000$", chance = 2, sellCredit = 100, itemType = "mythical", itemCount = 40000, giveItemType = "money", image = "./images/items/money-3.png" },
            { itemName = "money", label = "50.000$", chance = 2, sellCredit = 100, itemType = "mythical", itemCount = 50000, giveItemType = "money", image = "./images/items/money-3.png" },
            { itemName = "money", label = "100.000$", chance = 1, sellCredit = 250, itemType = "legendary", itemCount = 100000, giveItemType = "money", image = "./images/items/money-4.png" },
        },
    },
    {
        uniqueId = 4, -- IDs must be different and sequential
        label = "WEAPON CASE",
        price = 400,
        priceType = "GC", -- GC OR SC
        caseTheme = "blue", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_melee_knife", label = "knife", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_melee_knife.png" },
            { itemName = "weapon_melee_knife_jawbone", label = "jawbone", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_melee_knife_jawbone.png" },
            { itemName = "weapon_melee_hammer", label = "hammer", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_melee_hammer.png" },
            { itemName = "weapon_melee_cleaver", label = "cleaver", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_melee_cleaver.png" },
            { itemName = "weapon_melee_davy_lantern", label = "davy lantern", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_melee_davy_lantern.png" },
            { itemName = "weapon_melee_lantern_halloween", label = "lantern halloween", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_melee_lantern_halloween.png" },
            { itemName = "weapon_melee_hatchet", label = "hatchet", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_melee_hatchet.png" },
            { itemName = "weapon_melee_machete", label = "machete", chance = 0.5, sellCredit = 25, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_melee_machete.png" },
        },
    },
    {
        uniqueId = 5, -- IDs must be different and sequential
        label = "WEAPON CASE",
        price = 500,
        priceType = "GC", -- GC OR SC
        caseTheme = "orange", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_thrown_throwing_knives", label = "hrowing knives", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_thrown_throwing_knives.png" },
            { itemName = "weapon_thrown_tomahawk", label = "thrown tomahawk", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_thrown_tomahawk.png" },
            { itemName = "weapon_thrown_bolas", label = "thrown bolas", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_thrown_bolas.png" },
            { itemName = "weapon_thrown_dynamite", label = "thrown dynamite", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_thrown_dynamite.png" },
            { itemName = "weapon_thrown_molotov", label = "thrown molotov", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_thrown_molotov.png" },
            { itemName = "weapon_bow_improved", label = "bow improved", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_bow_improved.png" },
            { itemName = "weapon_thrown_poisonbottle", label = "thrown poisonbottle", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_thrown_poisonbottle.png" },
            { itemName = "handcuffs", label = "hand cuffs", chance = 0.5, sellCredit = 25, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/handcuffs.png" },
        },
    },
    {
        uniqueId = 6, -- IDs must be different and sequential
        label = "AMMO CASE",
        price = 600,
        priceType = "GC", -- GC OR SC
        caseTheme = "purple", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "ammo_repeater", label = "ammo_repeater", chance = 30, sellCredit = 10, itemType = "common", itemCount = 20, giveItemType = "item", image = "./images/items/ammo_bullet_normal.png" },
            { itemName = "ammo_revolver", label = "ammo_revolver", chance = 30, sellCredit = 10, itemType = "common", itemCount = 20, giveItemType = "item", image = "./images/items/ammo_bullet_revolver.png" },
            { itemName = "ammo_rifle", label = "ammo_rifle", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 20, giveItemType = "item", image = "./images/items/ammo_bullet_repeater.png" },
            { itemName = "ammo_rifle_elephant", label = "ammo_rifle_elephant", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 20, giveItemType = "item", image = "./images/items/ammo_bullet_rifle.png" },
            { itemName = "ammo_pistol", label = "ammo_pistol", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 20, giveItemType = "item", image = "./images/items/pistol_ammo.png" },
            { itemName = "ammo_shotgun", label = "ammo_shotgun", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 20, giveItemType = "item", image = "./images/items/ammo_shotgun.png" },
            { itemName = "ammo_arrow", label = "ammo_arrow", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 20, giveItemType = "item", image = "./images/items/ammo_arrow.png" },
            { itemName = "ammo_varmint", label = "ammo_varmint", chance = 0.5, sellCredit = 25, itemType = "legendary", itemCount = 20, giveItemType = "item", image = "./images/items/ammo_bullet_varmint.png" },
        },
    },
    {
        uniqueId = 7, -- IDs must be different and sequential
        label = "WEAPON CASE",
        price = 700,
        priceType = "GC", -- GC OR SC
        caseTheme = "blue", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_pistol_m1899", label = "pistol m1899", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_pistol_m1899.png" },
            { itemName = "weapon_pistol_semiauto", label = "pistol semiauto", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_pistol_semiauto.png" },
            { itemName = "weapon_repeater_winchester", label = "repeater winchester", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_repeater_winchester.png" },
            { itemName = "weapon_repeater_henry", label = "repeater henry", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_repeater_henry.png" },
            { itemName = "weapon_repeater_carbine", label = "repeater carbine", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_repeater_carbine.png" },
            { itemName = "weapon_revolver_cattleman_mexican", label = "cattleman mexican", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_revolver_cattleman_mexican.png" },
            { itemName = "weapon_revolver_doubleaction_gambler", label = "revolver doubleaction gambler", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_revolver_doubleaction_gambler.png" },
            { itemName = "weapon_revolver_navy_crossover", label = "revolver navy crossover", chance = 0.5, sellCredit = 25, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_revolver_navy_crossover.png" },
        },
    },
    {
        uniqueId = 8, -- IDs must be different and sequential
        label = "WEAPON CASE",
        price = 800,
        priceType = "GC", -- GC OR SC
         caseTheme = "red", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_sniperrifle_carcano", label = "sniperrifle carcano", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_sniperrifle_carcano.png" },
            { itemName = "weapon_sniperrifle_rollingblock_exotic", label = "sniperrifle rollingblock exotic", chance = 30, sellCredit = 10, itemType = "common", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_sniperrifle_rollingblock_exotic.png" },
            { itemName = "weapon_shotgun_doublebarrel_exotic", label = "shotgun doublebarrel exotic", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_shotgun_doublebarrel_exotic.png" },
            { itemName = "weapon_shotgun_semiauto", label = "shotgun semiauto", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_shotgun_semiauto.png" },
            { itemName = "weapon_rifle_varmint", label = "rifle varmint", chance = 10, sellCredit = 15, itemType = "rare", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_rifle_varmint.png" },
            { itemName = "weapon_rifle_springfield", label = "rifle springfield", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_rifle_springfield.png" },
            { itemName = "weapon_sniperrifle_rollingblock", label = "sniperrifle rollingblock", chance = 4.5, sellCredit = 20, itemType = "mythical", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_sniperrifle_rollingblock.png" },
            { itemName = "weapon_rifle_boltaction", label = "rifle boltaction", chance = 0.5, sellCredit = 25, itemType = "legendary", itemCount = 1, giveItemType = "item", image = "./images/items/weapon_rifle_boltaction.png" },
        },
    },
}

MArwenn.StandardCases = {

}

MArwenn.SellCoins = {
    {
        coinCount = 100,
        realPrice = 10,
        directLink = "https://www.google.com/1",
    },
    {
        coinCount = 200,
        realPrice = 20,
        directLink = "https://www.google.com/2",
    },
    {
        coinCount = 300,
        realPrice = 30,
        directLink = "https://www.google.com/3",
    },
    {
        coinCount = 400,
        realPrice = 40,
        directLink = "https://www.google.com/4",
    },
    {
        coinCount = 500,
        realPrice = 50,
        directLink = "https://www.google.com/5",
    },
    {
        coinCount = 600,
        realPrice = 60,
        directLink = "https://www.google.com/6",
    },
    {
        coinCount = 700,
        realPrice = 70,
        directLink = "https://www.google.com/7",
    },
    {
        coinCount = 1000,
        realPrice = 80,
        directLink = "",
    },
    
}

