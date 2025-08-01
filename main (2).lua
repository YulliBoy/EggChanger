-- Grow a Garden Egg Exploiter Script

-- Configuration
local CONFIG = {
    AutoHatch = true, -- Automatically hatch eggs with rare pets
    TargetPets = {"Dragonfly", "Queen Bee", "Disco Bee", "Golden Lab"} -- List of pets you want to target
}

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Functions
local function getEggData(egg)
    -- This function should return the pet type and rarity inside the egg
    -- You need to reverse engineer the game to get this data
    local petData = {
        Type = "Unknown",
        Rarity = "Common"
    }
    return petData
end

local function hatchEgg(egg)
    -- This function should hatch the egg
    -- You need to find the correct remote event or function to hatch the egg
    local hatchEvent = ReplicatedStorage:WaitForChild("HatchEggEvent")
    hatchEvent:FireServer(egg)
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        RunService.RenderStepped:Connect(function()
            for _, egg in ipairs(workspace.Eggs:GetChildren()) do
                local petData = getEggData(egg)
                if table.find(CONFIG.TargetPets, petData.Type) and petData.Rarity ~= "Common" then
                    if CONFIG.AutoHatch then
                        hatchEgg(egg)
                    else
                        print("Rare pet found: " .. petData.Type .. " (" .. petData.Rarity .. ")")
                    end
                end
            end
        end)
    end)
end

-- Main
Players.PlayerAdded:Connect(onPlayerAdded)