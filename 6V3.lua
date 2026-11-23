getgenv().Get6V3PvPActive = false
if getgenv().__Get6V3GhoulCombat then
    getgenv().__Get6V3GhoulCombat.Active = false
end
local v1 = {}
getgenv().Get6V3Run = v1
local function v2()
    return getgenv().Get6V3Run == v1
end
do
    local v3 = getgenv()
    local v4 = 4
    local v5 = v3.VapeHunterCapeController
    if not v5 or v5.Version ~= v4 then
        if v5 then
            v5.equipped = false
        end
        local v6 = { Version = v4, equipped = false, nextInventory = 0, nextEquip = 0 }
        local v7 = {
            ["Pilot Helmet"] = 130,
            ["Hunter Cape (Black)"] = 80,
            ["Hunter Cape (Green)"] = 80,
            ["Hunter Cape (Red)"] = 80,
            ["Bandanna (Black)"] = 80,
            ["Bandanna (Green)"] = 80,
            ["Bandanna (Red)"] = 80,
            ["Dojo Belt (Black)"] = 80,
            ["Headband (Black)"] = 70,
            ["Dojo Belt (Red)"] = 60,
            ["Headband (Red)"] = 60,
            ["Jaw Shield"] = 50,
            ["Pretty Helmet"] = 50,
            ["Shark Tooth Necklace"] = 50,
            ["Tooth Necklace"] = 50,
            ["Dino Hood"] = 50,
            ["Easter Bunny Cape"] = 50,
            ["Frosty Helmet"] = 50,
            ["Dojo Belt (Purple)"] = 40,
            ["Headband (Purple)"] = 40,
            ["Ghoul Mask"] = 35,
            ["Dojo Belt (Blue)"] = 30,
            ["Headband (Blue)"] = 30,
            ["Santa Hat"] = 30,
            ["Kitsune Ribbon"] = 30,
            ["Divine Cloak"] = 30,
            ["Oni Helmet"] = 30,
            ["Swan Glasses"] = 25,
            ["Feathered Visage"] = 25,
            ["Dojo Belt (Green)"] = 20,
            ["Headband (Green)"] = 20,
            ["Elf Hat"] = 20,
            ["Peppermint Helmet"] = 20,
            ["Pumpkin Mask"] = 20,
            ["Red Ribbon"] = 20,
            ["Cool Shades"] = 17.5,
            ["Dojo Belt (Yellow)"] = 15,
            ["Dojo Belt (Orange)"] = 15,
            ["Headband (Yellow)"] = 15,
            ["Headband (Orange)"] = 15,
            ["Cupid's Top Hat"] = 14,
            ["Romantic Bouquet"] = 14,
            ["Dojo Belt (White)"] = 10,
            ["Headband (White)"] = 10
        }
        local v8, v9 = {}, v7
        for v10 in pairs(v7) do
            table.insert(v8, v10)
        end
        table.sort(v8, function(p11, p12)
            if v7[p11] == v7[p12] then
                local v13, v14 = p11:find("Hunter Cape", 1, true), p12:find("Hunter Cape", 1, true)
                if v13 ~= nil ~= (v14 ~= nil) then
                    return v13 ~= nil
                end
                return p11 < p12
            end
            return v7[p11] > v7[p12]
        end)
        v6.Bonuses = v7
        local v15, v16, v17
        v3.VapeHunterCapeController = v6
        v3.VapeHunterTweenSpeed = function(p18)
            return v6.equipped and 325 or p18
        end
        local function v19(p20)
            local v21 = game:GetService("ReplicatedStorage")
            local v22 = v21:FindFirstChild("ItemReplicationService")
            local v23 = v21:FindFirstChild("ItemConfig")
            if not v22 or not v23 or not v22:FindFirstChild("KEYS") then
                return nil
            end
            v15 = v15 or require(v22)
            v16 = v16 or require(v22.KEYS)
            v17 = v17 or require(v23)
            if v15.IsInitialized == false then
                return nil
            end
            local v24, v25 = pcall(function()
                return v15:GetItems(v16.QUANTITY)
            end)
            if not v24 or type(v25) ~= "table" or next(v25) == nil then
                local v26 = v15._UserCache or v15.UserCache
                local v27 = v26 and v26[p20.UserId]
                if v27 then
                    v25 = v27:GetItems(v16.QUANTITY)
                end
            end
            if type(v25) ~= "table" then
                return nil
            end
            local v28 = {}
            for v29, v30 in pairs(v25) do
                if v30.ItemId and ((tonumber(v30.Value) or 0) > 0) then
                    local v31, v32 = pcall(function()
                        return v17.match(v30.ItemId):unwrap()
                    end)
                    if v31 and v32 then
                        local v33, v34 = v32.Index or {}, v32.Display or {}
                        for v35, v36 in pairs({ v33.DebugLabel, v33.StorageKey, v34.Name }) do
                            if type(v36) == "string" then
                                local v37 = v36:gsub("%s*%[.-%]%s*$", "")
                                if v9[v37] then
                                    v28[v37] = v30
                                end
                            end
                        end
                    end
                end
            end
            for v38, v39 in ipairs(v8) do
                if v28[v39] then
                    return v39, v28[v39]
                end
            end
        end
        local function v40()
            local v41 = game:GetService("Players").LocalPlayer
            local v42 = v41 and v41.Character
            local v43 = v42 and v42:FindFirstChildOfClass("Humanoid")
            v6.equipped = false
            if not v43 or v43.Health <= 0 then
                return
            end
            local v44
            for v45, v46 in ipairs(v42:GetChildren()) do
                if v9[v46.Name] and not v46:IsA("Tool") or (v46:IsA("StringValue") and v9[v46.Value]) then
                    local v47 = v9[v46.Name] and v46.Name or v46.Value
                    if not v44 or v7[v47] > v7[v44] then
                        v44 = v47
                    end
                end
            end
            local v48 = v41:FindFirstChild("Data")
            local v49 = v48 and v48:FindFirstChild("Accessory")
            if v49 and v49:IsA("StringValue") and v9[v49.Value] then
                v44 = v49.Value
            end
            local v50 = game:GetService("ReplicatedStorage")
            local v51 = v50:FindFirstChild("ItemReplicationService")
            local v52 = v50:FindFirstChild("ItemConfig")
            if v51 and v52 and v51:FindFirstChild("KEYS") then
                v15 = v15 or require(v51)
                v16 = v16 or require(v51.KEYS)
                v17 = v17 or require(v52)
                if v15.IsInitialized ~= false then
                    local v53 = v15._UserCache or v15.UserCache
                    local v54 = v53 and v53[v41.UserId]
                    local v55 = v54 and v54:GetItems(v16.IS_EQUIPPED) or v15:GetItems(v16.IS_EQUIPPED)
                    for v56, v57 in pairs(v55 or {}) do
                        if v57.Value == true then
                            local v58, v59 = pcall(function()
                                return v17.match(v57.ItemId):unwrap()
                            end)
                            local v60 = v58 and v59 and v59.Index and v59.Index.StorageKey
                            if v60 and v9[v60] and (not v44 or v7[v60] > v7[v44]) then
                                v44 = v60
                            end
                        end
                    end
                end
            end
            v6.equipped = v44 ~= nil
            v6.Accessory = v44
            v6.MovementBonus = v44 and v7[v44] or 0
            v6.LastError = nil
            if os.clock() < v6.nextEquip then
                return
            end
            local v61 = v41:FindFirstChild("Backpack")
            for v62, v63 in ipairs(v8) do
                local v64 = v61 and v61:FindFirstChild(v63) or v42:FindFirstChild(v63)
                if v64 and v64:IsA("Tool") and (not v44 or v7[v63] > v7[v44]) then
                    v6.nextEquip = os.clock() + 3
                    v43:EquipTool(v64)
                    return
                end
            end
            if os.clock() < v6.nextInventory then
                return
            end
            v6.nextInventory = os.clock() + 5
            local v65, v66 = v19(v41)
            if v3.VapeHunterCapeController ~= v6 or v41.Character ~= v42 then
                return
            end
            v6.OwnedCape = v65
            if not v65 or (v44 and (v7[v65] <= v7[v44])) then
                return
            end
            local v67 = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
            local v68 = v67 and v67:FindFirstChild("CommF_")
            if not v68 then
                return
            end
            v6.nextEquip = os.clock() + 3
            local v69 = v66 and v66.NetworkedUID
            v6.OwnedUID = v69
            v6.LastEquipResult = v68.InvokeServer(v68, "LoadItem", v69 or v65)
        end
        task.spawn(function()
            local v70 = setthreadidentity or setidentity or set_thread_identity
            if v70 then
                pcall(v70, 2)
            end
            while v3.VapeHunterCapeController == v6 do
                local v71, v72 = pcall(v40)
                if not v71 then
                    v6.equipped = false
                    v6.LastError = tostring(v72)
                end
                task.wait(1)
            end
        end)
    end
end
do
    if type(getgenv().Kurinian) ~= "table" then
        getgenv().Kurinian = {}
    end
    local v73 = getgenv().Kurinian
    local v74 = tostring(getgenv().Get6V3ConfigId or v73.ConfigId or ""):match("^%s*(.-)%s*$")
    if v74 ~= "" then
        local v75 = game:GetService("Players").LocalPlayer
        local v76 = game:GetService("HttpService")
        local v77 = tostring(getgenv().Get6V3ApiBase or "https://kurinian-hub.xyz"):gsub("/+$", "")
        local v78 = v77 .. "/api/get6v3?configId=" .. v76:UrlEncode(v74) .. "&username=" .. v76:UrlEncode(v75.Name)
        local v79 = syn and syn.request or http_request or request or (http and http.request)
        local v80, v81 = nil, "Cannot read Get6V3 config"
        for v82 = 1, 3 do
            local v83 = false
            local v93, v94 = pcall(function()
                local v84
                if v79 then
                    local v85 = v79({
                        Url = v78,
                        Method = "GET",
                        Headers = { ["Cache-Control"] = "no-cache" }
                    })
                    local v86 = tonumber(v85.StatusCode or v85.status or 0) or 0
                    v83 = v86 >= 400 and (v86 < 500)
                    v84 = v85.Body or v85.body
                    if v86 < 200 or v86 >= 300 then
                        local v87 = v76.JSONDecode(v76, v84 or "{}")
                        error(v87.error or "HTTP " .. tostring(v86))
                    end
                else
                    v84 = game:HttpGet(v78)
                end
                local v88 = v76:JSONDecode(v84)
                assert(v88.success and (type(v88.config) == "table"), v88.error or "Invalid Get6V3 config")
                local v89 = v88.config
                assert(string.lower(tostring(v89.username)) == string.lower(v75.Name), "Config belongs to another account")
                assert(type(v89.races) == "table" and (#v89.races > 0), "No races assigned to this account")
                local v90 = {
                    Human = true,
                    Mink = true,
                    Fishman = true,
                    Skypiea = true,
                    Ghoul = true,
                    Cyborg = true
                }
                for v91, v92 in ipairs(v89.races) do
                    assert(v90[v92], "Unsupported race: " .. tostring(v92))
                end
                v80 = v89
            end)
            if v93 and v80 then
                break
            end
            v81 = tostring(v94)
            if v83 then
                break
            end
            if v82 < 3 then
                task.wait(1)
            end
        end
        if not v80 then
            warn("[Get6V3] " .. v81 .. " | Stopped; no fallback to another account's races")
            return
        end
        v73.ConfigId = v74
        v73.RaceList = v80.races
        v73.FPS = tonumber(v80.fps) or 15
        if type(v73.Chest) ~= "table" then
            v73.Chest = {}
        end
        v73.Chest.Collect = tonumber(v80.chestCollect) or 55
        v73.Chest.Hop = v80.chestHop == true
        warn("[Get6V3] " .. v75.Name .. " | " .. v74 .. " | " .. table.concat(v73.RaceList, ", "))
    end
    v73.FPS = tonumber(v73.FPS) or 15
    if type(v73.Chest) ~= "table" then
        v73.Chest = { Collect = 55, Hop = true }
    end
    if type(v73.RaceList) ~= "table" then
        v73.RaceList = {
            "Human",
            "Mink",
            "Fishman",
            "Skypiea",
            "Ghoul",
            "Cyborg"
        }
    end
end
local v95 = (type(getgenv().Kurinian) == "table" and type(getgenv().Kurinian.Chest) == "table" and getgenv().Kurinian.Chest.Collect) or 55
while not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("SetTeam", "Pirates")
    task.wait(1)
end
local v96 = game.PlaceId
local v97 = {
    [2753915549] = "World1",
    [85211729168715] = "World1",
    [4442272183] = "World2",
    [79091703265657] = "World2",
    [7449423635] = "World3",
    [100117331123089] = "World3"
}
local v98 = false
Services = setmetatable({}, {
    __index = function(p99, p100)
        local v101, v102 = pcall(function()
            return cloneref(game:GetService(p100))
        end)
        if v101 then
            rawset(p99, p100, v102)
            return v102
        else
            error("Invalid Roblox Service: " .. tostring(p100))
        end
    end
})
local v103 = getgenv().Kurinian
local v104 = Services.ReplicatedStorage
local v105 = Services.TweenService
local v106 = Services.RunService
local v107 = Services.CollectionService
local v108 = Services.VirtualInputManager
local v109 = Services.Players.LocalPlayer
GatCanChuaNguoiDep = v104.Remotes.CommF_:InvokeServer("CheckTempleDoor")
AiChoMaDiGatCan = v104.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 4
local v110 = v109.Character.HumanoidRootPart
local v111 = v109.Name .. "_cyborg.txt"
v109.CharacterAdded:Connect(function(p112)
    p112:WaitForChild("HumanoidRootPart")
    v110 = p112.HumanoidRootPart
end)
if v109 then
    Character = v109.Character
    Humanoid = Character:FindFirstChildWhichIsA("Humanoid") or Character:WaitForChild("Humanoid")
    HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart")
end
isHopping = false
local v113 = nil
local v114 = Vector3.new(-6496.89795, 89.0350037, -116.509003)
local v115 = Vector3.new(924.639771, 125.397652, 32844.3906)
local v116 = 3000
local v117 = 8000
local v118 = nil
local v119 = false
local v120 = nil
game:GetService("TeleportService").TeleportInitFailed:Connect(function(p121, p122, p123)
    if p122 == Enum.TeleportResult.GameFull then
        print("Full nguoi")
    else
        game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer("teleport", game.JobId)
    end
end)
spawn(function()
    while task.wait(1) do
        pcall(function()
            if not v109.Character:FindFirstChild("HasBuso") then
                v104.Remotes.CommF_:InvokeServer("Buso")
            end
        end)
    end
end)
getgenv().StopV3 = false
getgenv().KilledBosses = {}
local v124 = v109.Character
repeat
    task.wait(2)
until v124 and v124:FindFirstChild("HumanoidRootPart") and v124:FindFirstChildWhichIsA("Humanoid") and v124:IsDescendantOf(workspace.Characters)
local v125 = game:GetService("CoreGui")
local v126 = game:GetService("Players")
local v127 = game:GetService("TweenService")
local v128 = game:GetService("RunService")
LocalPlayer = game.Players.LocalPlayer
localPlayer = v126.LocalPlayer
local v129 = "KaitunV4_TestUI"
local v130 = localPlayer:WaitForChild("PlayerGui")
local v131, v132 = pcall(function()
    return gethui()
end)
if v131 and v132 then
    v130 = v132
end
if v130:FindFirstChild(v129) then
    v130[v129]:Destroy()
end
local v133 = Instance.new("ScreenGui")
v133.Name = v129
v133.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
v133.Parent = v130
local v134 = Color3.fromRGB(255, 255, 255)
local v135 = 0.7
local v136 = Color3.fromRGB(70, 130, 255)
local v137 = Color3.fromRGB(30, 30, 35)
local v138 = Color3.fromRGB(110, 110, 120)
local v139 = Color3.fromRGB(200, 200, 210)
local v140 = Instance.new("Frame")
v140.Size = UDim2.new(0, 400, 0, 46)
v140.Position = UDim2.new(0.5, -200, 0, 20)
v140.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
v140.BackgroundTransparency = 0.15
v140.ZIndex = 20
Instance.new("UICorner", v140).CornerRadius = UDim.new(1, 0)
v140.Parent = v133
local v141 = Instance.new("UIStroke", v140)
v141.Color = Color3.fromRGB(255, 255, 255)
v141.Thickness = 1.5
v141.Transparency = 0.2
local v142 = Instance.new("UIGradient", v141)
v142.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 130, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 130, 255))
})
local v143 = Instance.new("Frame", v140)
v143.Size = UDim2.new(0, 20, 0, 20)
v143.Position = UDim2.new(0, 20, 0.5, -10)
v143.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", v143).CornerRadius = UDim.new(1, 0)
local v144 = Instance.new("UIGradient", v143)
v144.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, v136),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 25))
})
local v145 = Instance.new("TextLabel", v140)
v145.Size = UDim2.new(1, -60, 1, 0)
v145.Position = UDim2.new(0, 50, 0, 0)
v145.BackgroundTransparency = 1
v145.Text = "Loading..."
v145.TextColor3 = Color3.fromRGB(240, 240, 245)
v145.Font = Enum.Font.Code
v145.TextSize = 16
v145.TextXAlignment = Enum.TextXAlignment.Left
v145.Parent = v140
local function v146(p147)
    v145.Text = p147
end
if v103.BlackScreen then
    local v148 = Instance.new("ScreenGui", v109.PlayerGui)
    v148.Name = "Blank"
    v148.ResetOnSpawn = false
    v148.DisplayOrder = -math.huge
    v148.IgnoreGuiInset = true
    local v149 = Instance.new("Frame", v148)
    v149.Name = "BlackScreen"
    v149.Size = UDim2.new(1, 0, 1, 0)
    v149.BackgroundColor3 = Color3.new(0, 0, 0)
    v149.ZIndex = -math.huge
    local v150 = Instance.new("TextButton", gethui())
    v150.Name = "LeftButton"
    v150.AnchorPoint = Vector2.new(0, 0.5)
    v150.Position = UDim2.new(0, 400, 0.7, 0)
    v150.Size = UDim2.new(0, 150, 0, 150)
    v150.Text = "Disable"
    v150.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    v150.TextSize = 32
    if v149.Visible then
        v128:Set3dRenderingEnabled(false)
    end
    v150.MouseButton1Click:Connect(function()
        v150.Text = v150.Text == "Disable" and "Enable" or "Disable"
        v128.Set3dRenderingEnabled(v128, v150.Text == "Disable" and false or true)
        v149.Visible = not v149.Visible
    end)
end
ReplicatedStorage = v104
_G.FastAttack = 0
local v151 = { Run = v1, Sent = 0, Errors = 0 }
getgenv().Get6V3NPCAttack = v151
local function v152()
    local v153 = getgenv().__Get6V3GhoulCombat
    return getgenv().Get6V3PvPActive == true or (v153 and (v153.Active == true)) or _G.Get6V3CoopHelping == true
end
local function v154()
    local v155 = v109.Character
    local v156 = v155 and v155:FindFirstChild("HumanoidRootPart")
    local v157 = v155 and v155:FindFirstChildOfClass("Humanoid")
    local v158 = v155 and v155:FindFirstChildOfClass("Tool")
    if not v156 or not v157 or v157.Health <= 0 or not v158 or (v158.ToolTip ~= "Melee" and (v158.ToolTip ~= "Sword")) then
        return {}
    end
    local v159 = workspace:FindFirstChild("Enemies")
    local v160 = {}
    if v159 then
        for v161, v162 in ipairs(v159:GetChildren()) do
            local v163 = v162:FindFirstChildOfClass("Humanoid")
            local v164 = v162:FindFirstChild("HumanoidRootPart")
            if v163 and (v163.Health > 0) and v164 and ((v164.Position - v156.Position).Magnitude <= 65) then
                table.insert(v160, { v162, v164 })
                if #v160 >= 3 then
                    break
                end
            end
        end
    end
    return v160
end
getgenv().Attack = function()
    _G.FastAttack = 0
    if not v2() or getgenv().StopV3 or v152() then
        return
    end
    v151.Until = tick() + 0.3
end
local function v165(p166)
    local v167 = v104:FindFirstChild("Modules")
    local v168 = v167 and v167:FindFirstChild("Net")
    if not v168 then
        v151.Status = "Waiting for Net"
        return
    end
    local v169 = os.clock()
    if not v151.Remote or not v151.Remote.Parent then
        if v169 >= (v151.NextResolve or 0) then
            v151.NextResolve = v169 + 3
            for v170, v171 in ipairs({
    "Util",
    "Common",
    "Remotes",
    "Assets",
    "FX"
}) do
                local v172 = v104:FindFirstChild(v171)
                for v173, v174 in ipairs(v172 and v172:GetChildren() or {}) do
                    if v174:IsA("RemoteEvent") and tonumber(v174:GetAttribute("Id")) then
                        v151.Remote = v174
                        v151.RemoteId = tonumber(v174:GetAttribute("Id"))
                        break
                    end
                end
                if v151.Remote then
                    break
                end
            end
        end
    end
    if not v151.Seed and not v151.SeedLoading and (v169 >= (v151.NextSeed or 0)) then
        local v175 = v168:FindFirstChild("seed")
        if v175 and v175:IsA("RemoteFunction") then
            v151.SeedLoading = true
            v151.NextSeed = v169 + 5
            task.spawn(function()
                local v176, v177 = pcall(function()
                    return v175:InvokeServer()
                end)
                if v176 then
                    v151.Seed = tonumber(v177)
                end
                v151.SeedLoading = false
            end)
        end
    end
    local v178 = p166[1][1]:FindFirstChild("Head") or p166[1][2]
    local v179 = v168:FindFirstChild("RE/RegisterAttack")
    local v180 = v168:FindFirstChild("RE/RegisterHit")
    local v181 = false
    if v179 then
        v179:FireServer()
    end
    if v180 then
        v180:FireServer(v178, p166)
        v181 = true
    end
    if v151.Remote and v151.Seed then
        local v182 = math.floor(workspace:GetServerTimeNow() / 10 % 10) + 1
        local v184 = ("RE/RegisterHit"):gsub(".", function(p183)
            return string.char(bit32.bxor(p183:byte(), v182))
        end)
        v151.Remote:FireServer(v184, bit32.bxor(v151.RemoteId + 909090, v151.Seed * 2), v178, p166)
        v181 = true
    end
    v151.Status = v181 and "NPC fast attack" or "Waiting for attack remotes"
    if v181 then
        v151.Sent = v151.Sent + 1
    end
end
task.spawn(function()
    while v2() and not getgenv().StopV3 do
        task.wait(0.15)
        _G.FastAttack = 0
        if not v152() then
            local v186, v187 = pcall(function()
                local v185 = v154()
                if #v185 > 0 and (os.clock() >= (getgenv().VapeNextAttackPacket or 0)) then
                    getgenv().VapeNextAttackPacket = os.clock() + 0.15
                    v165(v185)
                end
            end)
            if not v186 then
                v151.Errors = v151.Errors + 1
                v151.Error = tostring(v187)
                v151.Remote = nil
                v151.Seed = nil
                v151.Status = "Retrying NPC attack after error"
            end
        else
            v151.Status = "Paused for player combat"
        end
    end
end)
local function v188(p189)
    getgenv().Get6V3PvPActive = false
    local v190 = getgenv().__Get6V3GhoulCombat
    if v190 then
        v190.Active = false
        v190.Aim = nil
    end
    v151.Target = p189 and p189.Name
    _G.SHOULDSPAMSKILLS = false
    getgenv().AimPos = nil
    getgenv().LatestPredictedPos = nil
end
local function v191()
    local v192 = tick()
    if v192 < (getgenv().Get6V3NextM1 or 0) then
        return
    end
    getgenv().Get6V3NextM1 = v192 + 0.3
    local v193 = v109.Character and v109.Character:FindFirstChildOfClass("Tool")
    if not v193 or (v193.ToolTip ~= "Melee" and (v193.ToolTip ~= "Sword")) then
        return
    end
    pcall(function()
        local v194 = game:GetService("VirtualUser")
        v194:CaptureController()
        v194:ClickButton1(Vector2.new(851, 158), workspace.CurrentCamera.CFrame)
    end)
end
local function v195(p196)
    local v197, v198 = pcall(function()
        return p196 == tonumber(workspace:GetAttribute("MAP"):match("%d+"))
    end)
    return v197 and v198
end
local function v199(p200)
    return (v109.Backpack:FindFirstChild(p200) or (v109.Character and v109.Character:FindFirstChild(p200))) and true or false
end
local function v201(p202)
    return v109.Backpack:FindFirstChild(p202) or (v109.Character and v109.Character:FindFirstChild(p202))
end
local function v203(p204)
    if not v109.Character then
        return
    end
    local v205 = v109.Character:FindFirstChildOfClass("Tool")
    if v205 and (v205.ToolTip == p204) then
        return v205
    end
    for v206, v207 in pairs(v109.Backpack:GetChildren()) do
        if v207:IsA("Tool") and (v207.ToolTip == p204) then
            v109.Character:FindFirstChildOfClass("Humanoid"):EquipTool(v207)
            return v207
        end
    end
    return nil
end
local function v208(p209)
    for v210, v211 in pairs(v104:GetChildren()) do
        if v211:IsA("Model") and (typeof(p209) == "table" and table.find(p209, v211.Name) or v211.Name == p209) and v211:FindFirstChild("Humanoid") and (v211.Humanoid.Health > 0) then
            return v211
        end
    end
    for v212, v213 in pairs(workspace.Enemies:GetChildren()) do
        if v213:IsA("Model") and (typeof(p209) == "table" and table.find(p209, v213.Name) or v213.Name == p209) and v213:FindFirstChild("Humanoid") and (v213.Humanoid.Health > 0) then
            return v213
        end
    end
    return nil
end
local function v214(...)
    local v215 = { ... }
    local v216, v217 = pcall(function()
        return v104.Remotes.CommF_:InvokeServer(unpack(v215))
    end)
    return v216, v217
end
local function v218(p219, p220, ...)
    local v221 = { ... }
    local v222, v223 = false, nil
    task.spawn(function()
        local v224, v225 = pcall(function()
            return v104.Remotes.CommF_:InvokeServer(p219, unpack(v221))
        end)
        if v224 then
            v223 = v225
        end
        v222 = true
    end)
    local v226 = tick()
    while not v222 and (tick() - v226 < (p220 or 10)) do
        task.wait(0.2)
    end
    return v223
end
local function v227()
    local v228, v229 = pcall(function()
        return v109.Data.Race.Value
    end)
    return v228 and v229 or nil
end
local function v230(p231, p232)
    if not v2() or getgenv().StopV3 then
        return
    end
    if not p232 and not v152() then
        return
    end
    v108:SendKeyEvent(true, p231, false, game)
    task.wait(0.05)
    v108:SendKeyEvent(false, p231, false, game)
    task.wait(0.3)
end
local function v233(p234, p235, p236)
    p236 = p236 or 350
    if not p234 or not p235 then
        return
    end
    local v237 = (p235.Position - p234.Position).Magnitude
    local v238 = v105:Create(p234, TweenInfo.new(v237 / p236, Enum.EasingStyle.Linear), { CFrame = p235 })
    v238:Play()
end
local function v239(p240)
    local v241 = Vector3.zero
    local v242 = 0
    for v243, v244 in pairs(workspace.Enemies:GetChildren()) do
        if v244.Name == p240 and v244:FindFirstChild("HumanoidRootPart") then
            v241 = v241 + v244.HumanoidRootPart.Position
            v242 = v242 + 1
        end
    end
    if v242 == 0 then
        return nil
    end
    return v241 / v242
end
local v245 = {
    ["Quake-Quake"] = true,
    ["Buddha-Buddha"] = true,
    ["Love-Love"] = true,
    ["Spider-Spider"] = true,
    ["Sound-Sound"] = true,
    ["Phoenix-Phoenix"] = true,
    ["Portal-Portal"] = true,
    ["Rumble-Rumble"] = true,
    ["Pain-Pain"] = true,
    ["Blizzard-Blizzard"] = true,
    ["Gravity-Gravity"] = true,
    ["Mammoth-Mammoth"] = true,
    ["T-Rex-T-Rex"] = true,
    ["Gas-Gas"] = true,
    ["Yeti-Yeti"] = true,
    ["Tiger-Tiger"] = true,
    ["Dough-Dough"] = true,
    ["Shadow-Shadow"] = true,
    ["Venom-Venom"] = true,
    ["Control-Control"] = true,
    ["Spirit-Spirit"] = true,
    ["Dragon-Dragon"] = true,
    ["Leopard-Leopard"] = true,
    ["Kitsune-Kitsune"] = true,
    ["Creation-Creation"] = true
}
local function v246()
    for v247, v248 in ipairs(GetInventoryItems()) do
        if v248.IsFruit and (v248.Count > 0) and not v245[v248.ItemId] then
            return v248
        end
    end
    return nil
end
local v249 = game:GetService("HttpService")
local v250 = game:GetService("Players")
local v251 = game:GetService("TeleportService")
Hop = {}
local v252 = getgenv and getgenv() or _G
v252.FailedJobIds = v252.FailedJobIds or {}
local v253 = v252.FailedJobIds
local v254 = {}
local v255 = false
local v256 = 3 * 60
Hop.BaseUrl = v252.HopApiBaseUrl or "https://memaybeo.kurinian-hub.xyz"
local function v257()
    local v258 = game:GetService("HttpService")
    local v259 = getgenv and getgenv() or _G
    local v260 = {}
    v260.Request = function(p261, p262, p263, p264)
        if type(p261) ~= "string" or not p261:match("^https://") then
            return nil, "HTTPS API URL required"
        end
        local v265 = "92b62b279e2d9869c739467fcfb54d01e5f35253c3f8e659cc4eaead65cf46de"
        if type(v265) ~= "string" or #v265 < 32 then
            return nil, "Set HopApiKey first"
        end
        local v266 = syn and syn.request or http_request or request or (http and http.request)
        if type(v266) ~= "function" then
            return nil, "HTTP request unavailable"
        end
        local v267 = {
            Url = p261:gsub("/+$", "") .. p263,
            Method = p262,
            Headers = { ["Content-Type"] = "application/json", Authorization = "Bearer " .. v265 }
        }
        if p264 then
            v267.Body = v258:JSONEncode(p264)
        end
        local v268, v269 = pcall(v266, v267)
        if not v268 or type(v269) ~= "table" then
            return nil, "API request failed"
        end
        if tonumber(v269.StatusCode) ~= 200 then
            return nil, "API HTTP " .. tostring(v269.StatusCode)
        end
        local v270, v271 = pcall(v258.JSONDecode, v258, v269.Body)
        if not v270 or type(v271) ~= "table" then
            return nil, "Invalid API response"
        end
        return v271
    end
    v260.Decode = function(p272, p273)
        if type(p273) ~= "string" or #p273 > 512 or not p273:match("^JID1%.[%w_-]+$") then
            return nil, "Invalid encoded Job ID"
        end
        local v274, v275 = v260.Request(p272, "POST", "/api/job-id/decode", { token = p273 })
        if not v274 then
            return nil, v275
        end
        local v276 = v274.jobId
        if type(v276) ~= "string" or #v276 ~= 36 or not v276:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
            return nil, "Invalid decoded Job ID"
        end
        return v276
    end
    v260.Encode = function(p277, p278)
        local v279, v280 = v260.Request(p277, "POST", "/api/job-id/encode", { jobId = p278 })
        if not v279 then
            return nil, v280
        end
        return v279.token
    end
    v259.JobIdCodec = v260
    return v260
end
local v281 = v252.JobIdCodec or v257()
Hop.DecodeJobId = function(p282)
    return v281.Decode(Hop.BaseUrl, p282)
end
local v283 = game:GetService("Players")
local v284 = game:GetService("TeleportService")
local function v285(p286)
    return string.lower((tostring(p286):gsub("%s+", "")))
end
local function v287(p288)
    if type(p288) == "number" then
        return p288
    end
    return tonumber(tostring(p288 or ""):match("(%d+)")) or 99
end
local function v289(p290)
    local v291 = {}
    for v292 in tostring(p290 or ""):gmatch("(%d+)") do
        v291[#v291 + 1] = tonumber(v292)
    end
    if #v291 >= 3 then
        return v291[#v291 - 2] * 3600 + (v291[#v291 - 1] * 60) + v291[#v291]
    elseif #v291 == 2 then
        return v291[1] * 60 + v291[2]
    end
    return v291[1] or 0
end
local function v293(p294)
    if type(p294) ~= "table" then
        return nil
    end
    local v295 = p294.jobId or p294.jobid or p294.joinId
    if type(v295) ~= "string" or v295 == "" then
        return nil
    end
    local v296 = p294.sea
    if v296 ~= nil then
        v296 = tonumber(tostring(v296):match("(%d+)"))
    end
    return {
        token = v295,
        placeId = tonumber(p294.placeId or p294.placeid) or game.PlaceId,
        players = v287(p294.players),
        ageSeconds = v289(p294.age),
        sea = v296,
        moon = p294.moon
    }
end
local function v297(p298)
    local v299, v300 = v281.Request(Hop.BaseUrl, "GET", "/api/bloxfruit/" .. p298)
    if type(v299) ~= "table" then
        return nil, v300
    end
    local v301 = v299.data or v299.servers
    if type(v301) ~= "table" then
        return nil, "Invalid server list"
    end
    return v301
end
local function v302(p303)
    if p303.jobId == game.JobId or v253[p303.jobId] then
        return false
    end
    local v304 = false
    local v309, v310 = pcall(function()
        return v284.TeleportInitFailed:Connect(function(p305, p306, p307, p308)
            if p305 ~= v283.LocalPlayer then
                return
            end
            if p308 and (tonumber(p308) ~= tonumber(game.PlaceId)) then
                return
            end
            v304 = true
            v253[p303.jobId] = tick()
            if p306 == Enum.TeleportResult.GameFull then
                warn("[Hop] Server full")
            end
        end)
    end)
    if not v309 or not v310 then
        return false
    end
    local function v311(p312)
        local v313 = tick() + p312
        repeat
            task.wait(0.25)
        until v304 or tick() >= v313
        return not v304
    end
    local v315, v316 = pcall(function()
        local v314 = game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser", 5)
        assert(v314, "Server browser unavailable")
        return v314:InvokeServer("teleport", p303.jobId)
    end)
    local v317 = false
    if v315 and (v316 ~= false) then
        v317 = v311(8)
    else
        v304 = false
        local v318 = pcall(function()
            v284:TeleportToPlaceInstance(game.PlaceId, p303.jobId, v283.LocalPlayer)
        end)
        if v318 then
            v317 = v311(3)
        end
    end
    v310:Disconnect()
    if not v317 then
        v253[p303.jobId] = tick()
    end
    return v317
end
Hop.API = function(p319, p320, p321)
    if v255 then
        return false
    end
    v255 = true
    p320 = tonumber(p320) or 12
    p321 = tonumber(p321) or 25
    local v344, v345 = pcall(function()
        local v322 = v285(p319)
        v254[v322] = v254[v322] or {}
        local v323 = v254[v322]
        local v324 = math.max(1, math.floor(p321 / 5))
        for v325 = 1, v324 do
            local v326, v327 = v297(v322)
            if v326 then
                local v328 = tonumber(tostring(workspace:GetAttribute("MAP") or ""):match("(%d+)"))
                local v329, v330, v331 = {}, {}, {}
                for v332, v333 in ipairs(v326) do
                    local v334 = v293(v333)
                    if v334 and (v334.placeId == tonumber(game.PlaceId)) and (not v328 or not v334.sea or v334.sea == v328) and (v334.ageSeconds < v256) and (v334.players > 2) and (v334.players < p320) then
                        local v335 = Hop.DecodeJobId(v334.token)
                        if v335 and not v329[v335] then
                            v329[v335] = true
                            v334.jobId = v335
                            if v335 ~= game.JobId and not v253[v335] then
                                local v336 = v323[v335] and v331 or v330
                                v336[#v336 + 1] = v334
                            end
                            v323[v335] = true
                        end
                    end
                end
                local function v337(p338, p339)
                    return p338.ageSeconds < p339.ageSeconds
                end
                table.sort(v330, v337)
                table.sort(v331, v337)
                for v340, v341 in ipairs({ v330, v331 }) do
                    for v342, v343 in ipairs(v341) do
                        if v302(v343) then
                            return true
                        end
                    end
                end
            elseif v327 then
                warn("[Hop] " .. tostring(v327))
            end
            if v325 < v324 then
                task.wait(5)
            end
        end
        return false
    end)
    v255 = false
    if not v344 then
        warn("[Hop] " .. tostring(v345))
    end
    return v344 and (v345 == true)
end
Hop.A = function(p346)
    if not p346 then
        p346 = 8
    end
    local v347 = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
    for v348, v349 in pairs(v347) do
        if v349.playing < p346 and (v349.id ~= game.JobId) then
            game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer("teleport", v349.id)
            break
        end
    end
end
local function v350(p351, p352, p353)
    Hop.API(p351, p352, p353)
end
local v354 = {
    Human = "Human",
    Mink = "Rabbit",
    Fishman = "Shark",
    Skypiea = "Angel",
    Ghoul = "Ghoul",
    Cyborg = "Cyborg"
}
local v355 = {
    Human = "Full Power",
    Mink = "Godspeed",
    Fishman = "Warrior of the Sea",
    Skypiea = "Perfect Being",
    Ghoul = "Hell Hound",
    Cyborg = "War Machine"
}
local v356, v357, v358, v359
local function v360()
    if v357 and v358 and v359 then
        return true
    end
    pcall(function()
        local v361 = game:GetService("ReplicatedStorage")
        v356 = v356 or v361:WaitForChild("ItemReplicationService", 10)
        v357 = v357 or (v356 and require(v356))
        v358 = v358 or (v356 and require(v356.KEYS))
        v359 = v359 or require(v361:WaitForChild("ItemConfig", 10))
    end)
    return v357 ~= nil and (v358 ~= nil) and (v359 ~= nil)
end
local function v362()
    local v363 = {}
    local v364 = v357 and (v357._UserCache or v357.UserCache)
    local v365 = v364 and v364[LocalPlayer.UserId]
    if not v365 then
        return v363
    end
    pcall(function()
        for v366, v367 in pairs(v365:GetItems("Mastery") or {}) do
            if v367.ItemId then
                v363[v367.ItemId] = tonumber(v367.Value) or 0
            end
        end
    end)
    return v363
end
local function v368()
    local v369 = {}
    if not v360() then
        return v369
    end
    local v370 = tick() + 5
    while v357.IsInitialized ~= true and (tick() < v370) do
        task.wait()
    end
    local v371 = v362()
    local v372, v373 = pcall(function()
        return v357:GetItems(v358.QUANTITY)
    end)
    if v372 and v373 then
        for v374, v375 in pairs(v373) do
            if v375.Value and (v375.Value > 0) then
                local v376, v377 = pcall(function()
                    return v359.match(v375.ItemId):unwrap().Index.DebugLabel
                end)
                if v376 and v377 then
                    local v378 = v377:gsub("%s*%[.-%]%s*$", "")
                    table.insert(v369, { Name = v378, Count = v375.Value, ItemId = v375.ItemId, Mastery = v371[v375.ItemId] or 0 })
                end
            end
        end
    end
    return v369
end
Boneconoi = {}
RefreshInventory = function()
    Boneconoi.Backpack2 = {}
    for v379, v380 in ipairs(v368()) do
        Boneconoi.Backpack2[v380.Name] = v380
    end
    Boneconoi.Backpack = Boneconoi.Backpack2
end
RefreshInventory()
game:GetService("ReplicatedStorage").Remotes.CommE.OnClientEvent:Connect(function(...)
    local v381 = { ... }
    if string.find(v381[1], "Item") then
        RefreshInventory()
    end
end)
HasRaceV3 = function(p382)
    local v383 = v227()
    if v383 ~= p382 then
        return false
    end
    local v384 = v218("getRaceLevel", 10)
    if tonumber(v384) and (tonumber(v384) >= 3) then
        return true
    end
    local v385 = v218("Wenlocktoad", 10, "1")
    if v385 == -2 then
        return true
    end
    return false
end
local function v386(p387)
    local v388 = v218("getTitles", 10)
    if type(v388) ~= "table" then
        return false
    end
    local v389 = v354[p387]
    if not v389 then
        return false
    end
    for v390, v391 in pairs(v388) do
        if v391.Unlocked and v391.Description and v391.Description:find("V3") and v391.Description:find(v389) then
            return true
        end
    end
    return false
end
local function v392()
    print(" V3 Status:")
    for v393, v394 in ipairs(type(getgenv().Kurinian) == "table" and type(getgenv().Kurinian.RaceList) == "table" and getgenv().Kurinian.RaceList or {}) do
        print(HasRaceV3(v394) and "   ✓ " .. v394 or "   ✗ " .. v394)
    end
    print("Version Race :" .. v104.Remotes.CommF_:InvokeServer("getRaceLevel"))
end
local function v395(p396, p397)
    pcall(function()
        sethiddenproperty(v109, "SimulationRadius", math.huge)
    end)
    local v398 = v109.Character
    local v399 = v398 and v398:FindFirstChild("HumanoidRootPart")
    if not v399 then
        return
    end
    local v400 = v399.Position
    local v401 = p397 or Vector3.new(v400.X, v400.Y - 28, v400.Z)
    for v402, v403 in pairs(workspace.Enemies:GetChildren()) do
        if v403:FindFirstChild("Humanoid") and v403:FindFirstChild("HumanoidRootPart") and (v403.Humanoid.Health > 0) then
            if not p396 or v403.Name == p396 or (typeof(p396) == "table" and table.find(p396, v403.Name)) then
                local v404 = (v403.HumanoidRootPart.Position - v400).Magnitude
                if v404 <= 350 then
                    v403.HumanoidRootPart.CFrame = CFrame.new(v401)
                    v403.HumanoidRootPart.CanCollide = false
                    v403.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
                    v403.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
                    v403.Humanoid.WalkSpeed = 0
                    v403.Humanoid.JumpPower = 0
                    if v403.Humanoid:FindFirstChild("Animator") then
                        v403.Humanoid.Animator:Destroy()
                    end
                end
            end
        end
    end
end
BringMonster = function(p405, p406)
    p406 = p406 or 3
    if p406 < 2 then
        return
    end
    pcall(function()
        setscriptable(v109, "SimulationRadius", true)
    end)
    pcall(function()
        sethiddenproperty(v109, "SimulationRadius", math.huge)
    end)
    xpcall(function()
        local v407 = v109.Character
        local v408 = v407 and v407:FindFirstChild("HumanoidRootPart")
        if not v408 then
            return
        end
        local v409, v410 = {}, nil
        for v411, v412 in next, workspace.Enemies:GetChildren() do
            local v413 = v412:FindFirstChildWhichIsA("Humanoid")
            local v414 = v412:FindFirstChild("HumanoidRootPart")
            if v413 and v414 and (v413.Health > 0) and (not p405 or v412.Name == p405) and ((v408.Position - v414.Position).Magnitude <= (p406 or 3) * 250) then
                v409[#v409 + 1], v410 = v412, v410 or v414.CFrame
                if #v409 >= (p406 or 3) then
                    break
                end
            end
        end
        if not v410 then
            return
        end
        for v415 = 1, #v409 do
            local v416 = v409[v415]:FindFirstChild("HumanoidRootPart")
            if v416 and (not isnetworkowner or isnetworkowner(v416)) then
                v416.AssemblyLinearVelocity = Vector3.zero
                v416.AssemblyAngularVelocity = Vector3.zero
                v416.CFrame = v410 * CFrame.new((v415 - 1) * 2, 0, 0)
            end
        end
    end, function(p417)
        warn("Modules Error [BM]: " .. p417)
    end)
end
KillMonster = function(p418)
    xpcall(function()
        for v419, v420 in next, workspace.Enemies:GetChildren() do
            local v421 = v420:FindFirstChildWhichIsA("Humanoid")
            local v422 = v420:FindFirstChild("HumanoidRootPart")
            if v421 and (v421.Health > 0) and v422 and (not p418 or v420.Name == p418 or (typeof(p418) == "table" and table.find(p418, v420.Name))) then
                local v423 = game.Players.LocalPlayer.Character
                local v424 = v423 and v423:FindFirstChild("HumanoidRootPart")
                if not v424 then
                    return
                end
                TweenTo(v422.CFrame * CFrame.new(0, 28, 0))
                v188(v420)
                local v425 = v203("Melee") or v203("Sword")
                getgenv().Attack()
                v395(p418, v422.Position)
                return
            end
        end
        for v426, v427 in next, Services.ReplicatedStorage:GetChildren() do
            local v428 = v427:FindFirstChild("HumanoidRootPart")
            if v427:IsA("Model") and v428 and (not p418 or v427.Name == p418 or (typeof(p418) == "table" and table.find(p418, v427.Name))) then
                TweenTo(v428.CFrame * CFrame.new(0, 28, 0))
                return
            end
        end
    end, function(p429)
        warn("KillMonster ERROR:", p429)
    end)
end
local function v430(p431)
    p431 = p431 or 8
    pcall(function()
        local v432 = game:GetService("HttpService")
        local v433 = v432:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
        for v434, v435 in pairs(v433) do
            if v435.playing < p431 and (v435.id ~= game.JobId) then
                game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer("teleport", v435.id)
                task.wait(10)
                break
            end
        end
    end)
end
local function v436()
    local v437 = v109.Character
    local v438 = v437 and v437:FindFirstChild("HumanoidRootPart")
    if not v438 then
        return nil, false
    end
    local v439 = v437:FindFirstChildOfClass("Humanoid")
    if v439 and v439.Sit then
        local v440 = v439.SeatPart
        if not v440 then
            local v441 = v438:FindFirstChild("SeatWeld")
            v440 = v441 and v441.Part0
        end
        if v440 and v440:IsA("BasePart") then
            return v440, true
        end
    end
    return v438, false
end
TweenTo = function(p442, p443)
    if not p442 then
        return
    end
    if not p443 then
        v109.Character.Humanoid.Sit = false
    end
    local v444 = typeof(p442) ~= "CFrame" and ConvertTo(CFrame, p442) or p442
    local v445, v446 = v436()
    if not v445 then
        return
    end
    if v113 then
        pcall(function()
            v113:Cancel()
        end)
    end
    if game.Players.LocalPlayer:GetAttribute("ExactLocation") and (game.Players.LocalPlayer:GetAttribute("ExactLocation") == "Submerged Island") then
        local v447 = { "TeleportToSpawn" }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(v447))
        task.wait(6)
    end
    for v448, v449 in LocalPlayer.Character:GetDescendants() do
        if v449:IsA("BasePart") then
            v449.CanCollide = false
        end
    end
    local v450 = game.Players.LocalPlayer.Character:WaitForChild("Head")
    if not v450:FindFirstChild("cho nam gg") then
        local v451 = Instance.new("BodyVelocity")
        v451.Name = "cho nam gg"
        v451.MaxForce = Vector3.new(0, math.huge, 0)
        v451.Velocity = Vector3.zero
        v451.Parent = v450
    end
    v444 = CFrame.new(v444.Position)
    if not v446 then
        local v452 = v445.CFrame.Position
        local v453 = v444.Position
        local v454 = (v452 - v453).Magnitude
        local v455 = (v452 - v115).Magnitude < v116
        local v456 = (v453 - v115).Magnitude < v116
        if v454 > v117 and (v455 ~= v456) then
            local v457 = not v455 and v114 or v115
            if (v452 - v457).Magnitude > 40 then
                v118 = nil
                TweenTo(CFrame.new(v457))
                return
            end
            local v458 = os.clock()
            if not v118 then
                v118 = v458
            end
            if v458 - v118 < 20 then
                return
            end
            v118 = nil
        else
            v118 = nil
        end
    end
    local v459 = v445.CFrame
    v445.CFrame = CFrame.new(v459.X, v444.Y, v459.Z)
    local v460 = CaculateDistance(v445.CFrame, v444)
    v113 = Services.TweenService:Create(v445, TweenInfo.new(v460 / getgenv().VapeHunterTweenSpeed(185), Enum.EasingStyle.Linear), { CFrame = v444 })
    v113:Play()
end
local function v461()
    eco = Boneconoi.Backpack.Ectoplasm and (Boneconoi.Backpack.Ectoplasm.Count or 0) or 0
    return eco
end
local function v462()
    local v463 = {}
    for v464, v465 in pairs(game:GetService("Players"):GetPlayers()) do
        if v465 ~= v109 and v465.Character and v465.Character:FindFirstChild("HumanoidRootPart") and v465.Character:FindFirstChild("Humanoid") and (v465.Character.Humanoid.Health > 0) then
            table.insert(v463, v465)
        end
    end
    return v463
end
local function v466(p467)
    local v468, v469 = pcall(function()
        return p467.Data.Level.Value
    end)
    return v468 and v469 or 0
end
local function v470(p471)
    local v472, v473 = pcall(function()
        return p471.Data.Race.Value
    end)
    return v472 and v473 or nil
end
local function v474(p475)
    return math.abs(v109.Data.Level.Value - v466(p475)) <= 200
end
local function v476()
    local v477 = v462()
    if #v477 == 0 then
        return nil
    end
    table.sort(v477, function(p478, p479)
        return v466(p478) < v466(p479)
    end)
    return v477[1]
end
local function v480(p481)
    for v482, v483 in pairs(v462()) do
        if v470(v483) == p481 then
            return v483
        end
    end
    return nil
end
local function v484()
    local v485, v486 = pcall(function()
        return not v109.PlayerGui.Main.PvpDisabled.Visible
    end)
    return v485 and v486
end
spawn(function()
    while wait(1) do
        if not damopvp then
            damopvp = true
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
            wait(6)
            damopvp = false
        end
    end
end)
local v487 = { tween = nil, root = nil, goal = nil }
local function v488()
    if v487.tween then
        pcall(function()
            v487.tween:Cancel()
        end)
    end
    local v489 = v487.root
    local v490 = v489 and v489:FindFirstChild("Get6V3PlayerFloat")
    if v490 then
        v490:Destroy()
    end
    v487.tween, v487.root, v487.goal = nil, nil, nil
    _G.Get6V3PlayerApproaching = false
end
local function v491(p492, p493, p494)
    local v495 = v109.Character
    local v496 = v495 and v495:FindFirstChild("HumanoidRootPart")
    local v497 = v495 and v495:FindFirstChildOfClass("Humanoid")
    if not v496 or not v497 or v497.Health <= 0 or getgenv().StopV3 then
        v488()
        return math.huge
    end
    if v487.root and (v487.root ~= v496) then
        v488()
    end
    v487.root = v496
    v497.Sit = false
    for v498, v499 in ipairs(v495:GetDescendants()) do
        if v499:IsA("BasePart") then
            v499.CanCollide = false
        end
    end
    if v113 then
        pcall(function()
            v113:Cancel()
        end)
        v113 = nil
    end
    if not v496:FindFirstChild("Get6V3PlayerFloat") then
        local v500 = Instance.new("BodyVelocity")
        v500.Name = "Get6V3PlayerFloat"
        v500.MaxForce = Vector3.new(0, math.huge, 0)
        v500.Velocity = Vector3.zero
        v500.Parent = v496
    end
    local v501 = (v496.Position - p492.Position).Magnitude
    _G.Get6V3PlayerApproaching = v501 > (p494 or 3)
    if v501 <= 0.5 then
        if v487.tween then
            v487.tween:Cancel()
        end
        v487.tween = nil
        return v501
    end
    if v487.root ~= v496 or not v487.goal or (v487.goal - p492.Position).Magnitude >= (p494 and 3 or 0.5) or not v487.tween or v487.tween.PlaybackState ~= Enum.PlaybackState.Playing then
        if v487.tween then
            v487.tween:Cancel()
        end
        v487.root, v487.goal = v496, p492.Position
        v487.tween = v105.Create(v105, v496, TweenInfo.new(v501 / getgenv().VapeHunterTweenSpeed(p493 or 185), Enum.EasingStyle.Linear), { CFrame = p492 })
        v487.tween:Play()
    end
    return v501
end
local function v502(p503, p504)
    if not p503 or not p503.Character then
        return false
    end
    if not v474(p503) then
        v146("Skip " .. p503.Name .. " ( > 200 Lv)")
        task.wait(1)
        return false
    end
    local v505 = p503.Character
    local v506 = v505:FindFirstChild("HumanoidRootPart")
    local v507 = v505:FindFirstChild("Humanoid")
    if not v506 or not v507 or v507.Health <= 0 then
        return false
    end
    local v508 = v507.Health
    local v509 = tick()
    v119 = true
    getgenv().Get6V3PvPActive = true
    _G.FastAttack = 0
    repeat
        task.wait(0.1)
        if getgenv().Get6V3Coop and not getgenv().Get6V3Coop.AllowedTarget(p503.Name) then
            break
        end
        if p503.Character ~= v505 or not v507 or v507.Health <= 0 or getgenv().StopV3 then
            break
        end
        local v510 = v109.Character
        local v511 = v510 and v510:FindFirstChild("HumanoidRootPart")
        local v512 = v510 and v510:FindFirstChildOfClass("Humanoid")
        if not v511 or not v512 or v512.Health <= 0 then
            break
        end
        v506 = v505:FindFirstChild("HumanoidRootPart")
        if not v506 then
            break
        end
        if p503:GetAttribute("IslandRaiding") then
            v146("Skip " .. p503.Name .. " ( Raiding )")
            break
        end
        v146(p504 .. " | Attack: " .. p503.Name .. " | HP: " .. math.floor(v507.Health))
        v491(v506.CFrame * CFrame.new(0, 0, 2))
        local v513 = (v511.Position - v506.Position).Magnitude
        _G.Get6V3PlayerApproaching = v513 > 3
        if v513 <= 3 then
            v203("Melee")
            v191()
            for v514, v515 in ipairs({ "Z", "X", "C" }) do
                if getgenv().StopV3 or not v2() or v507.Health <= 0 or (v511.Position - v506.Position).Magnitude > 3 then
                    break
                end
                v230(v515)
            end
            if v507.Health < v508 then
                v508 = v507.Health
                v509 = tick()
            elseif tick() - v509 > 10 then
                v146("Player not enable Pvp -> check other player")
                break
            end
        else
            v509 = tick()
        end
    until not v507 or v507.Health <= 0
    getgenv().Get6V3PvPActive = false
    v488()
    local v516 = v507 and (v507.Health <= 0)
    if v516 then
        v146("Done kill player")
    end
    return v516 == true
end
local function v517()
    return type(getgenv().Kurinian) == "table" and type(getgenv().Kurinian.AttackPlayer) == "table" and getgenv().Kurinian.AttackPlayer or {}
end
local function v518()
    local v519 = getgenv().Get6V3Coop
    if v519 and v519.Fresh() and v519.assignment then
        return v519.assignment.helpers or {}
    end
    local v520 = v517()
    local v_ah = v520.AcccountHelp or v520.AccountHelp
    return type(v_ah) == "table" and v_ah or {}
end
local function v521(p522)
    p522 = p522 or (v109 and v109.Name) or ""
    local v523 = getgenv().Get6V3Coop
    if v523 and v523.enabled then
        if not v523.Fresh() then
            return false
        end
        if tostring(p522):lower() == v109.Name:lower() then
            return v523.role == "help"
        end
        for v524, v525 in ipairs(v523.assignment and v523.assignment.helpers or {}) do
            if tostring(v525):lower() == tostring(p522):lower() then
                return true
            end
        end
        return false
    end
    if v517().HopAccountHelp ~= true then
        return false
    end
    for v526, v527 in ipairs(v518()) do
        if v527 and (v527 ~= "") and (string.lower(tostring(v527)) == string.lower(tostring(p522))) then
            return true
        end
    end
    return false
end
local function v528()
    local v529 = v517()
    local v530 = v529.AcccountHelpPos or v529.AccountHelpPos
    if type(v530) == "table" then
        if v530.x and v530.y and v530.z then
            return CFrame.new(v530.x, v530.y, v530.z)
        end
        if #v530 >= 3 and tonumber(v530[1]) then
            return CFrame.new(v530[1], v530[2], v530[3])
        end
    end
    return CFrame.new(-1836.58191, 44.5890656, 1360.30652)
end
local v531 = syn and syn.request or http_request or request or (http and http.request)
local function v532()
    if type(v531) ~= "function" then
        return false
    end
    local v533 = pcall(function()
        return v531({
            Url = "https://kurinian-hub.xyz/api/mainaccount/" .. tostring(v109.Name),
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = game:GetService("HttpService"):JSONEncode({
                jobid = tostring(game.JobId),
                placeid = tostring(game.PlaceId),
                time = os.time(),
                fullmoon = false,
                trialStatus = "angel_help",
                race = v470(v109)
            })
        })
    end)
    return v533
end
local v534 = { ["4442272183"] = true, ["79091703265657"] = true }
local v535 = ""
local function v536()
    v535 = ""
    local v537 = getgenv().Get6V3Coop
    if v537 and v537.enabled and v537.Fresh() and v537.assignment then
        v535 = "waiting_config_helpers"
        return v537.assignment.jobId
    end
    if v517().HopAccountHelp ~= true then
        v535 = "disabled"
        return nil
    end
    for v538, v539 in ipairs(v518()) do
        if v539 and (v539 ~= "") then
            local v540
            pcall(function()
                v540 = game:HttpGet("https://kurinian-hub.xyz/api/mainaccount/" .. tostring(v539))
            end)
            if (not v540 or v540 == "") and (type(v531) == "function") then
                pcall(function()
                    local v541 = v531({
                        Url = "https://kurinian-hub.xyz/api/mainaccount/" .. tostring(v539),
                        Method = "GET"
                    })
                    if v541 then
                        v540 = v541.Body
                    end
                end)
            end
            if not v540 or v540 == "" then
                v535 = tostring(v539) .. ":http-fail"
            else
                local v542, v543 = pcall(function()
                    return game:GetService("HttpService"):JSONDecode(v540)
                end)
                local v544 = v542 and v543 and v543.data
                if not v544 or not v544.jobid then
                    v535 = tostring(v539) .. ":no-post"
                elseif os.time() - (tonumber(v544.time) or 0) >= 30 then
                    v535 = tostring(v539) .. ":stale-" .. tostring(os.time() - (tonumber(v544.time) or 0)) .. "s"
                elseif not v534[tostring(v544.placeid or "")] then
                    v535 = tostring(v539) .. ":sea=" .. tostring(v544.placeid or "?")
                elseif tostring(v544.jobid) == tostring(game.JobId) then
                    v535 = tostring(v539) .. ":same-server"
                else
                    return tostring(v544.jobid)
                end
            end
        end
    end
    return nil
end
local function v545(p546)
    if not p546 or p546 == "" or p546 == game.JobId then
        return false
    end
    local v547 = pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer("teleport", p546)
    end)
    return v547
end
getgenv().Get6V3Coop = (function()
    local v548 = getgenv().Kurinian or {}
    local v549 = tostring(getgenv().Get6V3ConfigId or v548.ConfigId or ""):match("^%s*(.-)%s*$")
    local v550 = {
        enabled = v549 ~= "",
        role = "idle",
        assignment = nil,
        at = 0,
        polling = false,
        checkedAt = 0
    }
    _G.Get6V3CoopHelping = false
    local v551, v552 = nil, false
    local v553 = tostring(getgenv().Get6V3ApiBase or "https://kurinian-hub.xyz"):gsub("/+$", "")
    v550.Fresh = function()
        return v550.enabled and (v550.at > 0) and (tick() - v550.at < 5)
    end
    v550.Poll = function(p554)
        if p554 and v550.enabled then
            while v550.polling do
                task.wait(0.1)
            end
            v550.at = 0
        end
        if not v550.enabled or v550.polling or (not p554 and (tick() - v550.checkedAt < 1)) then
            return
        end
        v550.polling = true
        v550.checkedAt = tick()
        pcall(function()
            local v555 = v227()
            if p554 or v555 ~= v551 or tick() - (v550.doneAt or 0) > 3 then
                v551, v552 = v555, HasRaceV3(v555)
                v550.doneAt = tick()
            end
            if type(v531) ~= "function" then
                return
            end
            local v556 = game:GetService("HttpService")
            local v557 = v531({
                Url = v553 .. "/api/get6v3/coop",
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = v556:JSONEncode({
                    configId = v549,
                    username = v109.Name,
                    race = v555,
                    currentDone = v552,
                    jobId = game.JobId,
                    placeId = game.PlaceId
                })
            })
            if tonumber(v557.StatusCode) ~= 200 then
                return
            end
            local v558 = v556:JSONDecode(v557.Body)
            if not v558.success then
                return
            end
            v550.role, v550.assignment, v550.at = v558.role, v558.assignment, tick()
            _G.Get6V3CoopHelping = v550.role == "help"
        end)
        v550.polling = false
    end
    v550.AllowedTarget = function(p559)
        if not v550.enabled then
            return true
        end
        if not v550.Fresh() then
            return false
        end
        if not v550.assignment then
            return true
        end
        if v550.role ~= "main" then
            return false
        end
        for v560, v561 in ipairs(v550.assignment.helpers or {}) do
            if v561 == p559 then
                return true
            end
        end
        return false
    end
    v550.Wait = function()
        if not v550.enabled then
            return
        end
        v550.Poll(false)
        while not getgenv().StopV3 and v2() and (not v550.Fresh() or v550.role == "help") do
            v488()
            getgenv().AimPos = nil
            getgenv().LatestPredictedPos = nil
            if v550.Fresh() and v550.assignment then
                v146("Config help | " .. v550.assignment.race .. " → " .. v550.assignment.main)
                if v97[game.PlaceId] ~= "World2" then
                    v104.Remotes.CommF_:InvokeServer("TravelDressrosa")
                elseif tostring(game.JobId) ~= tostring(v550.assignment.jobId) then
                    v545(v550.assignment.jobId)
                else
                    local v562 = v109.Character
                    local v563 = v562 and v562:FindFirstChild("HumanoidRootPart")
                    local v564 = v562 and v562:FindFirstChildOfClass("Humanoid")
                    if v563 and v564 and (v564.Health > 0) then
                        pcall(function()
                            v104.Remotes.CommF_:InvokeServer("EnablePvp")
                        end)
                        if (v563.Position - v528().Position).Magnitude > 5 then
                            TweenTo(v528())
                        end
                    end
                end
            else
                v146("Waiting for config cooperation heartbeat")
            end
            task.wait(1)
            v550.Poll(false)
        end
        if v550.Fresh() and (v550.role == "main") and v550.assignment then
            local v565 = v109.Character and v109.Character:FindFirstChild("HumanoidRootPart")
            if v565 and ((v565.Position - v528().Position).Magnitude > 25) then
                TweenTo(v528())
            end
        end
    end
    if v550.enabled then
        v550.Poll(true)
        task.spawn(function()
            while true do
                task.wait(1)
                v550.Poll(false)
            end
        end)
    end
    return v550
end)()
local function v566()
    for v567, v568 in ipairs({ v109.Backpack, v109.Character }) do
        if v568 then
            for v569, v570 in ipairs(v568:GetChildren()) do
                if v570:IsA("Tool") and v570:FindFirstChild("EatRemote", true) then
                    return v570
                end
            end
        end
    end
    return nil
end
local function v571()
    for v572, v573 in ipairs({ v109.Backpack, v109.Character }) do
        if v573 then
            for v574, v575 in ipairs(v573:GetChildren()) do
                if v575:IsA("Tool") and v575:FindFirstChild("EatRemote", true) then
                    local v576 = v575:GetAttribute("OriginalName") or v575.Name
                    pcall(function()
                        v104.Remotes.CommF_:InvokeServer("StoreFruit", v576, v575)
                    end)
                end
            end
        end
    end
end
local function v577()
    v146("Cyborg V3 | Random fruit...")
    TweenTo(CFrame.new(-422.202271, 72.4190063, 386.306335))
    task.wait(2)
    local v578, v579 = pcall(function()
        return v104.Remotes.CommF_:InvokeServer("Cousin", "Buy")
    end)
    if v578 and (v579 == 1) then
        v146("Cyborg V3 | Đã mua trái Random!")
        task.wait(2)
        return true
    else
        v146("Cyborg V3 | Không đủ tiền mua trái!")
        task.wait(3)
        return false
    end
end
getgenv().KilledPlayers = getgenv().KilledPlayers or {}
local function v580()
    local v581 = 0
    for v582, v583 in pairs(getgenv().KilledPlayers) do
        if v583 then
            v581 = v581 + 1
        end
    end
    return v581
end
StopTween = function()
    v119 = false
    if v120 and v109.Character and v109.Character:FindFirstChild("HumanoidRootPart") then
        v120.CFrame = v109.Character.HumanoidRootPart.CFrame
    end
end
local function v584()
    local v585 = { "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer" }
    task.wait(1)
    local v586, v587 = nil, math.huge
    for v588, v589 in pairs(workspace.Enemies:GetChildren()) do
        if table.find(v585, v589.Name) and v589:FindFirstChild("Humanoid") and (v589.Humanoid.Health > 0) and v589:FindFirstChild("HumanoidRootPart") then
            local v590 = (v109.Character.HumanoidRootPart.Position - v589.HumanoidRootPart.Position).Magnitude
            if v590 < v587 then
                v587 = v590
                v586 = v589
            end
        end
    end
    if v586 then
        v146("Farm Ecto " .. v461() .. "/100 | " .. v586.Name)
        local v591 = v586:FindFirstChild("HumanoidRootPart")
        if not v591 then
            TweenTo(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625))
        end
        TweenTo(v591.CFrame * CFrame.new(0, 28, 0))
        repeat
            task.wait(0.1)
            if getgenv().StopV3 then
                break
            end
            v591 = v586:FindFirstChild("HumanoidRootPart")
            if not v591 then
                break
            end
            if (v109.Character.HumanoidRootPart.Position - v591.Position).Magnitude > 80 then
                TweenTo(v591.CFrame * CFrame.new(0, 28, 0))
            else
                v188(v586)
                v395(v585, v591.Position)
                v203("Melee")
                getgenv().Attack()
            end
        until not v586.Parent or v586.Humanoid.Health <= 0 or getgenv().StopV3
    else
        TweenTo(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625))
    end
end
ConvertTo = function(p592, p593)
    if typeof(p593) == "CFrame" then
        p593 = p593.Position
    end
    return p592.new(p593.x or p593.X or 0, p593.y or p593.Y or 0, p593.z or p593.Z or 0)
end
CaculateDistance = function(p594, p595)
    if not p594 then
        return 0
    end
    p595 = p595 or (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame) or CFrame.new()
    local function v596(p597)
        if typeof(p597) == "Vector3" then
            return p597
        elseif typeof(p597) == "CFrame" then
            return p597.Position
        elseif typeof(p597) == "Instance" then
            local v598 = p597:FindFirstChild("HumanoidRootPart")
            return v598 and v598.Position or Vector3.zero
        end
        return Vector3.zero
    end
    return (v596(p594) - v596(p595)).Magnitude
end
local function v599()
    return v350("Cursed Captain", 12, 5)
end
local function v600()
    return v350("Mirage", 12, 5)
end
local function v601()
    local v602 = v208("Cursed Captain")
    if v602 then
        v146("Attack Cursed Captain!")
        local v603 = v602:FindFirstChild("HumanoidRootPart")
        if v603 then
            TweenTo(v603.CFrame * CFrame.new(0, 25, 0))
        end
        v603 = v602:FindFirstChild("HumanoidRootPart")
        if not v603 then
            Hop.API("CursedCaptain", 12, 5)
        end
        v146("Attack Cursed Captain HP: " .. math.floor(v602.Humanoid.Health / v602.Humanoid.MaxHealth * 100) .. "%")
        KillMonster("Cursed Captain")
        if v602 and v602.Parent and (v602.Humanoid.Health <= 0) then
            v146(" Cursed Captain Die")
            return
        end
    else
        Hop.API("CursedCaptain", 12, 5)
    end
end
local function v604()
    local v605 = v461()
    if v605 < 100 then
        return false
    end
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "BuyCheck", 4)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Change", 4)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 4)
    return v227() == "Ghoul"
end
local function v606()
    v146(" Start Get Ghoul Race")
    while not getgenv().StopV3 and v2() do
        task.wait(1)
        if v227() == "Ghoul" then
            v146("Đã có Ghoul!")
            break
        end
        local v607 = v461()
        if v607 < 100 then
            v146("Farm Ecto " .. v607 .. "/100")
            v584()
        elseif not v199("Hellfire Torch") then
            v601()
            return
        else
            v146("Done Ecto, Torch → Mua Ghoul!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "BuyCheck", 4)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Change", 4)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 4)
            task.wait(2)
            if v227() == "Ghoul" then
                v146(" Buy Ghoul Race done")
                break
            else
                v146(" Buy Failed, retry....")
            end
        end
    end
end
local function v608(p609)
    local v610 = tonumber(p609) or tonumber(v103["Need Fragments"]) or 0
    local v611 = tonumber(v109.Data.Fragments.Value) or 0
    if v611 >= v610 then
        return true
    end
    if getgenv().StopV3 then
        return false
    end
    local v612 = v109.Character
    local v613 = v612 and v612:FindFirstChildOfClass("Humanoid")
    local v614 = v612 and v612:FindFirstChild("HumanoidRootPart")
    if not v613 or v613.Health <= 0 or not v614 then
        v146("Frag | Đợi hồi sinh...")
        return false
    end
    if not v195(3) then
        v146("Frag " .. v611 .. "/" .. v610 .. " | Go Sea 3")
        v104.Remotes.CommF_:InvokeServer("TravelZou")
        task.wait(10)
        return false
    end
    local v615 = v208("Cake Prince")
    local v616 = v615 and v615:FindFirstChildOfClass("Humanoid")
    local v617 = v615 and v615:FindFirstChild("HumanoidRootPart")
    if v615 and v615.Parent and v616 and (v616.Health > 0) and v617 then
        local v618 = math.floor(v616.Health / math.max(1, v616.MaxHealth) * 100)
        v146("Frag " .. v611 .. "/" .. v610 .. " | Cake Prince " .. v618 .. "%")
        v188(v615)
        v203("Melee")
        TweenTo(v617.CFrame * CFrame.new(0, 18, 0))
        local v619 = getgenv().Attack
        if type(v619) == "function" then
            v619()
        end
        return false
    end
    v146("Frag " .. v611 .. "/" .. v610 .. " | Tìm Cake Prince qua API...")
    v350({ "CakePrince" }, 12, 5)
    return false
end
local v620 = 0
local function v621(p622)
    if not p622 then
        return true
    end
    local v623 = p622:FindFirstChildOfClass("Humanoid")
    return not v623 or v623.Health <= 0
end
local function v624(p625)
    for v626, v627 in pairs(workspace.Enemies:GetChildren()) do
        if v627.Name == p625 and v627:FindFirstChild("Humanoid") and (v627.Humanoid.Health > 0) then
            return v627
        end
    end
    return nil
end
local v628 = true
local function v629(p630, p631)
    if not v628 then
        return
    end
    v628 = false
    task.spawn(function()
        v108:SendKeyEvent(true, p630, false, game)
        task.wait(p631 or 0)
        v108:SendKeyEvent(false, p630, false, game)
        v628 = true
    end)
end
local function v632(p633)
    for v634, v635 in ipairs(type(getgenv().Kurinian) == "table" and type(getgenv().Kurinian.RaceList) == "table" and getgenv().Kurinian.RaceList or {}) do
        if string.lower(tostring(v635)) == string.lower(tostring(p633)) then
            return true
        end
    end
    return false
end
local function v636(p637)
    local v638 = v109.Character
    if not v638 then
        return false
    end
    if v638:FindFirstChild(p637) then
        return true
    end
    local v639 = v638:FindFirstChildOfClass("Humanoid")
    local v640 = v109.Backpack and v109.Backpack:FindFirstChild(p637)
    if v639 and v640 then
        pcall(function()
            v639:EquipTool(v640)
        end)
        return true
    end
    return false
end
getgenv().tablefruitausea3 = {}
whitelistedfruit = {}
TableDevilFruit = {}
local v641, v642, v643 = next, game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits", false)
for v644, v645 in v641, v642, v643 do
    if v645.Price >= 1000000 then
        table.insert(whitelistedfruit, string.split(v645.Name, "-")[1] .. " Fruit")
        getgenv().tablefruitausea3[v645.Name] = v645.Price
    end
    TableDevilFruit[v645.Name] = false
end
getgenv().tablefruitausea3["Dragon (East)-Dragon (East)"] = 15000000
getgenv().tablefruitausea3["Dragon (West)-Dragon (West)"] = 15000000
local v646, v647 = require(game:GetService("ReplicatedStorage"):WaitForChild("ItemReplicationService")), require(game:GetService("ReplicatedStorage"):WaitForChild("ItemConfig"))
local function v648()
    local v649, v650 = {}, require(game:GetService("ReplicatedStorage"):WaitForChild("ItemReplicationService")).KEYS
    for v651, v652 in v646:GetItems(v650.QUANTITY) do
        if v652.Value and (v652.Value > 0) then
            local v653, v654 = pcall(function()
                return v647.match(v652.ItemId):unwrap()
            end)
            if v653 and v654 and v654.Display then
                local v655, v656 = v654.Display.Category, v654.Index and v654.Index.StorageKey
                local v657, v658 = if v655 == "Blox Fruit" then v656 or v654.Display.Name or "ItemId_" .. v652.ItemId else v654.Display.Name or v656 or "ItemId_" .. v652.ItemId, v646:ReadItem(v650.MASTERY, v652.ItemId, v652.NetworkedUID) or 0
                table.insert(v649, {
                    Name = v657,
                    Type = v655,
                    Count = v652.Value,
                    Mastery = v658,
                    ItemId = v652.ItemId,
                    UID = v652.NetworkedUID
                })
            end
        end
    end
    return v649
end
CheckFruitplr = function()
    local v659
    for v660, v661 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        v659 = if string.find(v661.Name, "Fruit") then v661.Name else v659
    end
    for v662, v663 in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        v659 = if string.find(v663.Name, "Fruit") then v663.Name else v659
    end
    return v659
end
TakeFruitInventory = function(p664)
    local v665, v666, v667 = next, v648()
    local v668, v669 = 1 / 0
    for v670, v671 in v665, v666, v667 do
        if v671.Type == "Blox Fruit" then
            if not p664 then
                for v672, v673 in pairs(getgenv().tablefruitausea3) do
                    if v671.Name == v672 then
                        if tonumber(v673) < tonumber(v668) then
                            v668, v669 = v673, v672
                        end
                    end
                end
            elseif not getgenv().tablefruitausea3[v671.Name] then
                return v671.Name
            end
        end
    end
    return v669
end
local function v674()
    if not v632("Cyborg") then
        return false
    end
    if not v195(2) then
        return false
    end
    if not v199("Fist of Darkness") then
        getgenv().MinkFoDClicked = false
        return false
    end
    if getgenv().MinkFoDClicked then
        return true
    end
    if v636("Fist of Darkness") then
        task.wait(0.5)
        pcall(function()
            fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
        end)
        getgenv().MinkFoDClicked = true
        v146("Mink V3 | FoD -> click RaidSummon (Cyborg)")
        task.wait(2)
        return true
    end
    return false
end
FarmBeli = function(p675)
    local v676 = v109 and v109.Character
    if v676 and (v676 ~= v124) then
        v124 = v676
        HumanoidRootPart = v676:FindFirstChild("HumanoidRootPart") or v676:WaitForChild("HumanoidRootPart", 5)
    end
    local v677, v678 = {}, 0
    local v679 = v107:GetTagged("_ChestTagged")
    if not v124 or v621(v124) then
        print("Not found character")
        task.wait(3)
        return
    end
    if not HumanoidRootPart then
        return
    end
    if v199("Fist of Darkness") then
        v674()
    else
        getgenv().MinkFoDClicked = false
    end
    for v680, v681 in next, v107:GetTagged("_ChestTagged") do
        if v681 and v681.CanTouch then
            local v682 = (v681.Position - HumanoidRootPart.Position).Magnitude
            table.insert(v677, { obj = v681, dist = v682 })
        end
    end
    if #v677 > 0 and (v620 < v95) then
        table.sort(v677, function(p683, p684)
            return p683.dist < p684.dist
        end)
        if true then
            for v685, v686 in next, v677 do
                local v687 = v686.obj
                if v687:IsA("BasePart") and v687.Name:find("Chest") then
                    if v687.CanTouch then
                        local v688 = false
                        local v689 = 0
                        pcall(function()
                            v689 = v109.Data.Beli.Value
                        end)
                        local v690 = 0
                        pcall(function()
                            v690 = (HumanoidRootPart.Position - v687.Position).Magnitude
                        end)
                        local v691 = tick() + math.max(6, v690 / getgenv().VapeHunterTweenSpeed(185) + 4)
                        repeat
                            task.wait()
                            v146("Collect Chests | Collected: " .. v678 .. "/" .. v620 .. "/" .. v95 .. " Chests")
                            if not v621(v124) then
                                for v692, v693 in ipairs(v124:GetDescendants()) do
                                    if v693:IsA("BasePart") then
                                        v693.CanCollide = false
                                    end
                                end
                                TweenTo(v687.CFrame + Vector3.new(0, 3, 0))
                            end
                            v629("Space")
                            if not v687.Parent then
                                break
                            end
                        until not v687.CanTouch or v621(v124) or tick() > v691
                        local v694 = v689
                        pcall(function()
                            v694 = v109.Data.Beli.Value
                        end)
                        if v694 > v689 then
                            v688 = true
                        else
                            v146("Ghost chest? skipped (no beli gain)")
                        end
                        if v199("Fist of Darkness") and (p675 == "getcy") then
                            v146("Fist of Darkness")
                            fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                            return
                        end
                        if v620 >= v95 then
                            v146("Stopped: Max Chests reached")
                            v430(8)
                        elseif v624("Darkbeard") then
                            break
                        end
                        if v621(v124) then
                            print("Character died, break")
                            break
                        elseif v688 then
                            v678 = v678 + 1
                            v620 = v620 + 1
                            if not v621(v124) and (v678 >= 50) and not v199("Fist of Darkness") then
                                if v124 and v124:FindFirstChildWhichIsA("Humanoid") then
                                    v124:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
                                    v146("Collect Chests | Reset: Collected: 50 Chests")
                                end
                                v678 = 0
                                task.wait(1)
                            end
                        end
                    end
                    if v685 % 250 == 0 then
                        task.wait(0.1)
                    end
                end
            end
        end
    else
        if not v199("Fist of Darkness") and not v624("Darkbeard") then
            if v103.Chest and (v103.Chest.Hop == true) then
                v146("Het chest => Hop")
                v430(10)
            else
                v146("Het chest - doi respawn (Hop=false)")
                task.wait(5)
            end
        end
    end
end
local function v695()
    for v696, v697 in pairs(workspace.Boats:GetChildren()) do
        if v697:FindFirstChild("Owner") and (tostring(v697.Owner.Value) == tostring(v109.Name)) then
            return v697
        end
    end
    return false
end
local function v698()
    if not workspace:FindFirstChild("SeaBeasts") then
        return nil
    end
    for v699, v700 in pairs(workspace.SeaBeasts:GetChildren()) do
        if v700:FindFirstChild("HumanoidRootPart") and v700:FindFirstChild("Health") and (v700.Health.Value > 0) then
            return v700
        end
    end
    return nil
end
local function v701(p702)
    if not p702 or not p702:FindFirstChild("HumanoidRootPart") then
        return false
    end
    if not p702:FindFirstChild("Health") or p702.Health.Value <= 0 then
        return false
    end
    if v109.Character.Humanoid.Sit then
        v109.Character.Humanoid.Sit = false
        task.wait(1)
    end
    StopTween()
    repeat
        task.wait(0.3)
        if getgenv().StopV3 then
            break
        end
        if not p702 or not p702.Parent then
            break
        end
        if not p702:FindFirstChild("Health") or p702.Health.Value <= 0 then
            break
        end
        if not p702:FindFirstChild("HumanoidRootPart") then
            break
        end
        if not v109.Character or not v109.Character:FindFirstChild("HumanoidRootPart") then
            break
        end
        local v703 = p702:FindFirstChild("MaxHealth")
        local v704 = p702.Health.Value
        local v705 = v703 and v703.Value or v704
        v146("Fishman V3 | Sea Beast HP: " .. math.floor(v704 / v705 * 100) .. "%")
        local v706 = workspace.Map:FindFirstChild("WaterBase-Plane")
        local v707 = v706 and v706.Position.Y + 200 or 200
        local v708 = p702.HumanoidRootPart.Position
        v119 = true
        TweenTo(CFrame.new(v708.X, v707, v708.Z))
        if v109:DistanceFromCharacter(v708) <= 500 then
            v203("Blox Fruit")
            task.wait(0.1)
            v230("Z", true)
            v230("X", true)
            v230("C", true)
            v203("Melee")
            task.wait(0.1)
            v230("Z", true)
            v230("X", true)
            v230("C", true)
            v203("Sword")
            task.wait(0.1)
            v230("Z", true)
            v230("X", true)
            v203("Gun")
            task.wait(0.1)
            v230("Z", true)
            v230("X", true)
        end
    until not p702 or not p702.Parent or not p702:FindFirstChild("Health") or p702.Health.Value <= 0 or getgenv().StopV3
    StopTween()
    return p702 and p702:FindFirstChild("Health") and (p702.Health.Value <= 0)
end
local function v709()
    local v710 = v698()
    if v710 then
        v701(v710)
        return
    end
    local v711 = v695()
    if not v711 then
        v146("Fishman V3 | Buy Boat")
        TweenTo(CFrame.new(-110.271713, 9.76438141, 2956.36841))
        if v109.Character and ((CFrame.new(-110.271713, 9.76438141, 2956.36841).Position - v109.Character.HumanoidRootPart.Position).Magnitude <= 15) then
            v104.Remotes.CommF_:InvokeServer("BuyBoat", "MarineBrigade")
            task.wait(2)
        end
        return
    end
    if not v109.Character.Humanoid.Sit then
        v146("Fishman V3 | go to drive")
        TweenTo(v711.VehicleSeat.CFrame * CFrame.new(0, 1, 0), "Sit")
        task.wait(2)
        return
    end
    local v712 = v698()
    if v712 then
        v109.Character.Humanoid.Sit = false
        StopTween()
        task.wait(1)
        v701(v712)
    else
        v146("Fishman V3 | Drive to find Sea beast")
        TweenTo(CFrame.new(-10000000, 31, 37016.25) * CFrame.new(0, 50, 0), "Sit")
    end
end
local function v713(p714)
    local v715 = workspace:FindFirstChild(p714) or workspace:FindFirstChild(p714:gsub(" ", ""))
    if v715 then
        if v715:IsA("BasePart") then
            return v715
        elseif v715:IsA("Model") then
            return v715.PrimaryPart or v715:FindFirstChildWhichIsA("BasePart")
        end
    end
    return nil
end
local function v716()
    local v717 = v109:FindFirstChild("PlayerGui")
    if not v717 then
        return false
    end
    local v718 = v717:FindFirstChild("Main") and v717.Main:FindFirstChild("Quest")
    if v718 and v718.Visible then
        return true
    end
    local v719 = v717:FindFirstChild("TrackedQuestFrame")
    if v719 and v719.Enabled and v719:FindFirstChild("Frame") and v719.Frame.Visible then
        return true
    end
    return false
end
local function v720()
    while task.wait(0.5) do
        if not _G.FarmV2 then
            break
        end
        local v721 = nil
        pcall(function()
            v721 = v104.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
        end)
        if v721 and (v721 < 3) and not Boneconoi.Backpack["Warrior Helmet"] then
            v146("V2 | Lam Bartilo Quest truoc...")
            if v721 == 0 or v721 == nil then
                v146("Bartilo | Danh 50 Swan Pirate")
                if not v716() then
                    pcall(function()
                        v104.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
                    end)
                    task.wait(0.5)
                end
                local v722 = v208("Swan Pirate")
                if v722 and v722:FindFirstChild("HumanoidRootPart") then
                    v203("Melee")
                    v395("Swan Pirate", v722.HumanoidRootPart.Position)
                    KillMonster("Swan Pirate")
                else
                    TweenTo(CFrame.new(980.099, 121.331, 1287.209))
                end
            elseif v721 == 1 then
                v146("Bartilo | Danh Boss Jeremy")
                local v723 = v208("Jeremy")
                if v723 and v723:FindFirstChild("HumanoidRootPart") then
                    v203("Melee")
                    KillMonster("Jeremy")
                else
                    TweenTo(CFrame.new(2316, 449, 787))
                end
            elseif v721 == 2 then
                v146("Bartilo | Mo ban co Colosseum")
                local v724 = {
                    CFrame.new(-1836, 11, 1714),
                    CFrame.new(-1850.5, 13.2, 1750.9),
                    CFrame.new(-1858.9, 19.4, 1712),
                    CFrame.new(-1803.9, 16.6, 1750.9),
                    CFrame.new(-1858.6, 16.9, 1724.8),
                    CFrame.new(-1869.5, 16, 1681),
                    CFrame.new(-1800.1, 15.2, 1681),
                    CFrame.new(-1820.5, 12, 1730)
                }
                for v725, v726 in ipairs(v724) do
                    TweenTo(v726)
                    task.wait(0.5)
                end
            end
            continue
        end
        local v727 = v104.Remotes.CommF_:InvokeServer("Alchemist", "1")
        if v727 == 0 then
            v146("V2 | Nhan quest Alchemist")
            v104.Remotes.CommF_:InvokeServer("Alchemist", "2")
            task.wait(1)
        elseif v727 == 1 then
            local v728 = v201("Flower 1")
            local v729 = v201("Flower 2")
            local v730 = v201("Flower 3")
            local v731 = v713("Flower 1") or v713("Flower1")
            local v732 = v713("Flower 2") or v713("Flower2")
            if not v728 and v731 and ((v731.Transparency or 0) < 0.9) then
                v146("V2 | Nhat Flower 1 (Do)")
                TweenTo(v731.CFrame * CFrame.new(0, 1, 0))
                pcall(function()
                    firetouchinterest(v109.Character.HumanoidRootPart, v731, 0)
                end)
                pcall(function()
                    firetouchinterest(v109.Character.HumanoidRootPart, v731, 1)
                end)
            elseif not v729 and v732 and ((v732.Transparency or 0) < 0.9) then
                v146("V2 | Nhat Flower 2 (Xanh)")
                TweenTo(v732.CFrame * CFrame.new(0, 1, 0))
                pcall(function()
                    firetouchinterest(v109.Character.HumanoidRootPart, v732, 0)
                end)
                pcall(function()
                    firetouchinterest(v109.Character.HumanoidRootPart, v732, 1)
                end)
            elseif not v730 then
                v146("V2 | Kill Swan Pirate (Flower 3)")
                local v733 = v208("Swan Pirate")
                if v733 and v733:FindFirstChild("HumanoidRootPart") then
                    v203("Melee")
                    v395("Swan Pirate", v733.HumanoidRootPart.Position)
                    KillMonster("Swan Pirate")
                else
                    TweenTo(CFrame.new(980.099, 121.331, 1287.209))
                end
            elseif not v728 or not v729 then
                local v734 = game.Lighting.ClockTime >= 18 or game.Lighting.ClockTime < 5
                if not v728 and not v734 then
                    v146("V2 | Cho Flower 1 spawn ban ngay...")
                elseif not v729 and v734 then
                    v146("V2 | Cho Flower 2 spawn ban dem...")
                else
                    v146("V2 | Het hoa tren map -> Hop Server...")
                    v430()
                end
            else
                v146("V2 | Du 3 hoa -> Nop Alchemist")
                TweenTo(CFrame.new(556.9, 38.3, 8.7))
                if (v109.Character.HumanoidRootPart.Position - Vector3.new(556.9, 38.3, 8.7)).Magnitude < 25 then
                    v104.Remotes.CommF_:InvokeServer("Alchemist", "3")
                    task.wait(1)
                end
            end
        elseif v727 == 2 then
            v146("V2 | Du hoa -> Nop quest Alchemist")
            TweenTo(CFrame.new(556.9, 38.3, 8.7))
            v104.Remotes.CommF_:InvokeServer("Alchemist", "3")
            task.wait(1)
        elseif v727 == -2 or (tonumber(v218("getRaceLevel", 5)) or 0) >= 2 then
            v146("✓ V2 Hoan thanh!")
            _G.FarmV2 = false
            break
        end
    end
end
local function v735()
    return v104.Remotes.CommF_:InvokeServer("CyborgTrainer", "Check") == true
end
local function v736()
    v146(" Get Cyborg")
    if not isfile(v111) then
        writefile(v111, "NaN")
    end
    pcall(function()
        local v737
        v737 = hookfunction(require(v104.Notification).new, newcclosure(function(...)
            local v738 = ({ ... })[1]
            if typeof(v738) == "string" then
                if v738:lower():find("supply a <core brain>") or v738:find("<Fist of Darkness> has been") then
                    writefile(v111, "unlock")
                elseif v738:find("Microchip not found") then
                    writefile(v111, "chest")
                end
            end
            return v737(...)
        end))
    end)
    while not getgenv().StopV3 and v2() do
        task.wait(1)
        if v227() == "Cyborg" then
            v146("Have Cyborg!")
            break
        end
        if v109.Data.Fragments.Value >= 2500 then
            v104.Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
            task.wait(2)
            if v227() == "Cyborg" then
                break
            end
        end
        local v739 = "NaN"
        pcall(function()
            v739 = readfile(v111)
        end)
        if v739 == "NaN" then
            if not v195(2) then
                v146("Get Cyborg | Go sea 2")
                v104.Remotes.CommF_:InvokeServer("TravelDressrosa")
                task.wait(10)
            else
                v146("Get Cyborg | Summon Raid")
                pcall(function()
                    fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                end)
                v104.Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
                task.wait(3)
            end
        elseif v739 == "chest" then
            if not v195(2) then
                v146("GET CYBORG | go Sea 2")
                v104.Remotes.CommF_:InvokeServer("TravelDressrosa")
                task.wait(10)
            else
                if v199("Fist of Darkness") then
                    local v740 = v109.Backpack:FindFirstChild("Fist of Darkness")
                    if v740 then
                        v109.Character:FindFirstChildOfClass("Humanoid"):EquipTool(v740)
                        task.wait(0.5)
                    end
                    pcall(function()
                        fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                    end)
                    task.wait(3)
                else
                    FarmBeli("getcy")
                end
            end
        elseif v739 == "unlock" then
            local v741 = v109.Data.Fragments.Value
            if v741 >= 5000 or v199("Microchip") or v199("Core Brain") then
                if not v195(2) then
                    v146("GET CYBORG | go Sea 2")
                    v104.Remotes.CommF_:InvokeServer("TravelDressrosa")
                    task.wait(10)
                else
                    local v742 = false
                    for v743, v744 in pairs(workspace.Enemies:GetChildren()) do
                        if v744.Name == "Order" and v744:FindFirstChild("Humanoid") and (v744.Humanoid.Health > 0) then
                            v742 = true
                            v146("GET CYBORG | Attack Order")
                            v203("Melee")
                            KillMonster("Order")
                            break
                        end
                    end
                    if not v742 then
                        if not v199("Microchip") and not v199("Core Brain") then
                            v104.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
                            task.wait(1)
                        end
                        pcall(function()
                            fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                        end)
                        v104.Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
                        task.wait(2)
                    end
                end
            else
                v146("TU Farm Frag Di Thang Lon")
            end
        end
    end
end
local function v745(p746)
    local v747 = tonumber(v103.MinFragments)
    local v748 = math.max(3000, v747 and (v747 == v747) and (v747 < math.huge) and math.floor(v747) or 3000)
    local v749 = { Active = true, Target = v748, Race = p746 }
    getgenv().Get6V3FragmentFarm = v749
    while not getgenv().StopV3 and v2() do
        local v750 = v109.Data:FindFirstChild("Fragments")
        local v751 = v750 and tonumber(v750.Value)
        if v751 and (v751 >= v748) then
            v749.Active = false
            return true
        end
        v146("Reroll " .. p746 .. " | Farm fragments " .. tostring(v751 or "?") .. "/" .. v748)
        local v752, v753 = pcall(function()
            if v103["Method Farm Frag"] == "Raid" then
                FarmF(v748)
            else
                v608(v748)
            end
        end)
        if not v752 then
            v749.Error = tostring(v753)
            warn("[Get6V3 Fragments] " .. v749.Error)
        end
        task.wait(1)
    end
    v749.Active = false
    return false
end
local function v754(p755)
    local v756 = v227()
    if v756 == p755 then
        return true
    end
    if v632(v756) and not v386(v756) then
        v146(" Farm " .. tostring(v756) .. " truoc (do phi roll)")
        return v756
    end
    v146(" Change " .. tostring(v756) .. " → " .. p755)
    if p755 == "Ghoul" then
        local v757 = v461()
        if v757 >= 100 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "BuyCheck", 4)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Change", 4)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 4)
            task.wait(2)
            if v227() == "Ghoul" then
                return true
            end
        end
        return true
    end
    if p755 == "Cyborg" then
        local v758 = pcall(function()
            return v735()
        end) and v735()
        if v758 then
            if v109.Data.Fragments.Value >= 2500 then
                v214("CyborgTrainer", "Buy")
                task.wait(2)
                if v227() == "Cyborg" then
                    return true
                end
            end
            v146(" Cyborg unlocked, farm function sẽ xử lý...")
            return true
        else
            v146(" Chưa unlock Cyborg → farm function sẽ xử lý...")
            return true
        end
    end
    for v759 = 1, 50 do
        if getgenv().StopV3 then
            return false
        end
        if not v745(p755) then
            return false
        end
        if v227() == p755 then
            return true
        end
        v146(" Reroll " .. v759 .. "/50 → " .. p755)
        v214("BlackbeardReward", "Reroll", "1")
        task.wait(0.5)
        v214("BlackbeardReward", "Reroll", "2")
        task.wait(2)
        local v760 = v227()
        if v760 == p755 then
            v146(" → " .. p755)
            return true
        end
        if v760 ~= p755 and v632(v760) and not v386(v760) then
            v146(" Roll ra " .. tostring(v760) .. " (trong list) -> farm truoc")
            return v760
        end
        task.wait(3)
    end
    return false
end
ConvertTo = function(p761, p762)
    return p761.new(p762.x, p762.y, p762.z)
end
CaculateDistance = function(p763, p764)
    if not p763 then
        return 0
    end
    p764 = p764 or game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    local v765, v766 = ConvertTo(Vector3, p763), ConvertTo(Vector3, p764)
    return (v765 - v766).magnitude
end
GetMonAsSortedRange = function()
    local v767 = {}
    table.foreach(Services.Workspace.Enemies:GetChildren(), function(p768, p769)
        if p769 and p769:FindFirstChild("Humanoid") and p769:FindFirstChild("HumanoidRootPart") and (p769.Humanoid.Health > 0) then
            table.insert(v767, p769)
        end
    end)
    table.foreach(game.ReplicatedStorage:GetChildren(), function(p770, p771)
        if p771 and p771:FindFirstChild("Humanoid") and p771:FindFirstChild("HumanoidRootPart") and (p771.Humanoid.Health > 0) then
            table.insert(v767, p771)
        end
    end)
    table.sort(v767, function(p772, p773)
        return CaculateDistance(p772.HumanoidRootPart.CFrame) < CaculateDistance(p773.HumanoidRootPart.CFrame)
    end)
    return v767
end
FarmF = function(p774)
    while wait(0.5) do
        if getgenv().StopV3 then
            return false
        end
        local v775 = v109.PlayerGui:FindFirstChild("Main")
        local v776 = v775 and v775:FindFirstChild("TopHUDList")
        local v777 = v776 and v776:FindFirstChild("RaidTimer")
        local v778 = v777 and v777.Visible
        if p774 and (v109.Data.Fragments.Value >= p774) and not v778 then
            return true
        end
        if v778 then
            PlayerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            IslandsList = {
                {},
                {},
                {},
                {},
                {}
            }
            for v779, v780 in ipairs(workspace._WorldOrigin.Locations:GetChildren()) do
                if string.find(v780.Name, "Island ") and (CaculateDistance(v780.Position, Vector3.new(0, 0, 0)) > 7000) then
                    (function()
                        local v781 = string.gsub(v780.Name, "Island ", "")
                        local v782 = tonumber(v781)
                        table.insert(IslandsList[v782], v780)
                    end)()
                end
            end
            local v783
            for v784 = 5, 1, -1 do
                for v785, v786 in IslandsList[v784] do
                    if CaculateDistance(v786.Position) < 2000 then
                        v783 = v786
                        break
                    end
                end
                if v783 then
                    break
                end
            end
            v146("Auto Raid | " .. (v783 and v783.Name or "Searching") .. " /5")
            local v787 = false
            for v788, v789 in ipairs(GetMonAsSortedRange()) do
                local v790 = os.time()
                while v789 and v789:FindFirstChild("HumanoidRootPart") and (v789.Humanoid.Health > 0) and (CaculateDistance(v789.HumanoidRootPart.Position) < 1000) and (os.time() - v790 < 60) and task.wait(0.05) do
                    if v783 and (v783.Name == "Island 5") then
                        pcall(function()
                            sethiddenproperty(v109, "SimulationRadius", math.huge)
                            if v789 and v789:FindFirstChild("Humanoid") then
                                v789:BreakJoints()
                                v789.Humanoid.Health = 0
                                v789.HumanoidRootPart.CanCollide = false
                            end
                        end)
                    end
                    v787 = true
                    KillMonster(v789.Name)
                end
            end
            if not v787 and v783 then
                TweenTo(v783.Position + Vector3.new(0, 100, 0))
            end
        else
            if not v201("Special Microchip") then
                v146("Chưa có microchip, đang mua...")
                local v791 = v246()
                local v792 = false
                if v791 then
                    v104.Remotes.CommF_:InvokeServer("LoadFruit", tostring(v791.Name))
                    task.wait(0.3)
                    v104.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", "Flame")
                    task.wait(1)
                    if v201("Special Microchip") then
                        v146("Đã mua microchip!")
                        v792 = true
                    end
                end
                if not v792 then
                    v146("Không mua được chip, thử lại sau 3s...")
                    task.wait(3)
                    continue
                end
            end
            if v201("Special Microchip") then
                v146("Start raid...")
                pcall(function()
                    fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                    fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                end)
                local v793 = tick()
                repeat
                    task.wait(0.5)
                    v778 = v777 and v777.Visible
                until v778 or tick() - v793 > 20
                if v778 then
                    v146("Raid đã bắt đầu!")
                    task.wait(2)
                else
                    v146("Start raid thất bại, thử lại...")
                    task.wait(3)
                end
            end
        end
    end
end
getgenv().V3Farms = {
    Human = function()
        local v794 = v104.Remotes.CommF_:InvokeServer("getRaceLevel")
        if v794 == 1 then
            v146("Human | V2")
            _G.FarmV2 = true
            v720()
        end
        if v794 == 2 then
            local v795 = v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
            if v795 == 0 then
                v146("Human V3 | Get quest")
                v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                getgenv().KilledBosses = {}
            elseif v795 == 1 then
                local v796 = {
                    {
                        name = "Orbitus",
                        pos = CFrame.new(-2172.74, 103.32, -4015.03)
                    },
                    { name = "Jeremy", pos = CFrame.new(2006.93, 448.96, 853.98) },
                    { name = "Diamond", pos = CFrame.new(-1576.72, 198.59, 13.72) }
                }
                local v797 = false
                for v798, v799 in ipairs(v796) do
                    if getgenv().StopV3 then
                        break
                    end
                    if getgenv().KilledBosses[v799.name] then
                        continue
                    end
                    local v800 = v208(v799.name)
                    if v800 then
                        v797 = true
                        local v801 = v800:FindFirstChild("HumanoidRootPart")
                        if v801 then
                            TweenTo(v801.CFrame * CFrame.new(0, 25, 0))
                        end
                        repeat
                            task.wait(0.3)
                            v146("Human V3 | Boss " .. v798 .. ": " .. v799.name .. " | " .. math.floor(v800.Humanoid.Health / v800.Humanoid.MaxHealth * 100) .. "%")
                            v188(v800)
                            v203("Melee")
                            getgenv().Attack()
                            v801 = v800:FindFirstChild("HumanoidRootPart")
                            if not v801 then
                                break
                            end
                            if (v109.Character.HumanoidRootPart.Position - v801.Position).Magnitude > 80 then
                                TweenTo(v801.CFrame * CFrame.new(0, 25, 0))
                            end
                        until not v800.Parent or v800.Humanoid.Health <= 0 or getgenv().StopV3
                        getgenv().KilledBosses[v799.name] = true
                        break
                    else
                        Hop.A(10)
                    end
                end
                if not v797 then
                    for v802, v803 in ipairs(v796) do
                        if not getgenv().KilledBosses[v803.name] then
                            v146("Human V3 | Chờ " .. v803.name)
                            TweenTo(v803.pos)
                            break
                        end
                    end
                end
            elseif v795 == 2 then
                v146("Human V3 | Nộp")
                v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                getgenv().KilledBosses = {}
                task.wait(1)
            elseif v795 == -2 then
                v146(" Human V3 DONE!")
                getgenv().KilledBosses = {}
            end
        end
    end,
    Mink = function()
        local v804 = v104.Remotes.CommF_:InvokeServer("getRaceLevel")
        if v804 == 1 then
            v146("Mink | V2")
            _G.FarmV2 = true
            v720()
        end
        if v804 == 2 then
            spawn(function()
                while wait(3) do
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                end
            end)
            local v805 = v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
            if v805 == 0 then
                v146("Mink V3 | Get quest")
                v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                v620 = 0
            elseif v805 == 1 then
                v146("Mink V3 | Farm chest")
                FarmBeli()
                if v620 >= 30 then
                    v146("Mink V3 | Du 30 chest - tra quest")
                    v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                    v620 = 0
                    task.wait(1)
                end
            elseif v805 == 2 then
                v146("Mink V3 | Nộp")
                v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                v620 = 0
                task.wait(1)
            elseif v805 == -2 then
                v146(" Mink V3 DONE!")
            end
        end
    end,
    Fishman = function()
        local v806 = v104.Remotes.CommF_:InvokeServer("getRaceLevel")
        if v806 == 1 then
            v146("Fishman | V2")
            _G.FarmV2 = true
            v720()
        end
        if v806 == 2 then
            local v807 = v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
            if v807 == 0 then
                v146("Fishman V3 | Nhận quest")
                v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
            elseif v807 == 1 then
                v146("Fishman V3 | Sea Beast")
                v709()
            elseif v807 == 2 then
                v146("Fishman V3 | Nộp")
                v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                task.wait(1)
            elseif v807 == -2 then
                v146(" Fishman V3 DONE!")
            end
        end
    end,
    Skypiea = function()
        local v808 = v218("getRaceLevel", 10)
        if v808 == 1 then
            v146("Skypiea | V2")
            _G.FarmV2 = true
            v720()
        end
        if v808 == 2 then
            local v809 = v218("Wenlocktoad", 10, "1")
            if v809 == 0 then
                v146("Skypiea V3 | Nhận quest")
                v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                getgenv().KilledPlayers = {}
            elseif v809 == 1 then
                v146("Skypiea V3 | Tìm mục tiêu hợp lệ (+/- 200 Lv)")
                local v810 = nil
                for v811, v812 in pairs(v462()) do
                    if v521(v812.Name) and (v470(v812) == "Skypiea") and v474(v812) then
                        v810 = v812
                        break
                    end
                end
                if not v810 then
                    for v813, v814 in pairs(v462()) do
                        if getgenv().Get6V3Coop.AllowedTarget(v814.Name) and (v470(v814) == "Skypiea") and v474(v814) then
                            v810 = v814
                            break
                        end
                    end
                end
                if v810 then
                    local v815 = v502(v810, "Skypiea V3")
                    if v815 then
                        getgenv().KilledPlayers[v810.UserId] = true
                        v146(" Skypiea V3 | Đã giết " .. v810.Name)
                        task.wait(3)
                    end
                else
                    local v816 = v536()
                    if v816 then
                        v146("Skypiea V3 | Join server help angel")
                        v545(v816)
                        task.wait(5)
                    else
                        v146(" Skypiea help: " .. v535 .. " -> Hop Server")
                        task.wait(3)
                        v430()
                    end
                end
            elseif v809 == 2 then
                v146("Skypiea V3 | Nộp quest")
                v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                getgenv().KilledPlayers = {}
                task.wait(1)
            elseif v809 == -2 then
                v146(" Skypiea V3 DONE!")
                getgenv().KilledPlayers = {}
            end
        end
    end,
    Ghoul = function()
        local v817 = {
            BlackScreen = false,
            transform = false,
            SpinLock = "WhiteGlow",
            mode = "method1",
            ["Boost Fps"] = true,
            ["Select Sea"] = "Sea 3",
            ["Bounty Find"] = "3000000",
            Webhook = { Enabled = true, Url = "" },
            Melee = {
                Enable = true,
                Z = {
                    Enable = true,
                    HoldTime = 0,
                    Priority = 1,
                    Count = 3,
                    CountInterval = 0
                },
                X = {
                    Enable = true,
                    HoldTime = 0,
                    Priority = 5,
                    Count = 3,
                    CountInterval = 0
                },
                C = {
                    Enable = true,
                    HoldTime = 0,
                    Priority = 9,
                    Count = 3,
                    CountInterval = 0
                }
            },
            Sword = {
                Enable = true,
                Z = {
                    Enable = true,
                    HoldTime = 0,
                    Priority = 2,
                    Count = 2,
                    CountInterval = 0
                },
                X = {
                    Enable = true,
                    HoldTime = 0,
                    Priority = 6,
                    Count = 2,
                    CountInterval = 0
                }
            },
            Gun = {
                Enable = false,
                GunMode = false,
                Z = {
                    Enable = true,
                    HoldTime = 0,
                    Priority = 3,
                    Count = 2,
                    CountInterval = 0
                },
                X = {
                    Enable = false,
                    HoldTime = 0,
                    Priority = 7,
                    Count = 2,
                    CountInterval = 0
                }
            },
            Fruit = {
                Enable = true,
                Z = {
                    Enable = true,
                    HoldTime = 0,
                    Priority = 4,
                    Count = 2,
                    CountInterval = 0
                },
                X = {
                    Enable = true,
                    HoldTime = 0,
                    Priority = 8,
                    Count = 2,
                    CountInterval = 0
                },
                C = {
                    Enable = true,
                    HoldTime = 0,
                    Priority = 10,
                    Count = 2,
                    CountInterval = 0
                },
                V = {
                    Enable = false,
                    HoldTime = 0,
                    Priority = 11,
                    Count = 1,
                    CountInterval = 0
                },
                F = {
                    Enable = true,
                    HoldTime = 0,
                    Priority = 12,
                    Count = 2,
                    CountInterval = 0
                }
            }
        }
        local v818 = getgenv()
        v818.__Get6V3GhoulCombat = v818.__Get6V3GhoulCombat or { Sent = 0, Errors = 0, SkipUntil = {} }
        local v819 = v818.__Get6V3GhoulCombat
        if v819.BlacklistJob ~= game.JobId then
            v819.BlacklistJob = game.JobId
            v819.Blacklist = {}
        end
        v819.Blacklist = v819.Blacklist or {}
        local function v820(p821, p822, p823)
            local v824 = p823 or 120
            v819.Blacklist[p821.UserId] = { Until = tick() + v824, Reason = p822, Name = p821.Name }
            v819.SkipUntil[p821.UserId] = tick() + v824
        end
        local v825 = v818.Kurinian and (type(v818.Kurinian.GhoulV3) == "table") and v818.Kurinian.GhoulV3 or {}
        local v826 = math.clamp(getgenv().VapeHunterTweenSpeed(tonumber(v825.TweenSpeed) or 275), 50, 350)
        local v827 = math.clamp(tonumber(v825.SkillRange) or 60, 10, 100)
        if not v819.Hooked then
            local v838, v839 = pcall(function()
                local v828 = getrawmetatable(game)
                local v829 = v828.__namecall
                local v830 = game.FindFirstChildOfClass
                local v831 = game.IsDescendantOf
                local v837 = newcclosure(function(p832, ...)
                    local v833 = getnamecallmethod()
                    if v819.Active and v819.Aim and not v818.StopV3 and (v833 == "FireServer" or v833 == "InvokeServer") then
                        local v834 = v109.Character
                        local v835 = v834 and v830(v834, "Tool")
                        if v835 and v831(p832, v835) then
                            local v836 = table.pack(...)
                            if typeof(v836[1]) == "Vector3" then
                                v836[1] = v819.Aim
                            elseif typeof(v836[1]) == "CFrame" then
                                v836[1] = CFrame.new(v819.Aim)
                            end
                            return v829(p832, table.unpack(v836, 1, v836.n))
                        end
                    end
                    return v829(p832, ...)
                end)
                setreadonly(v828, false)
                v828.__namecall = v837
                setreadonly(v828, true)
            end)
            v819.Hooked = v838
            v819.HookError = not v838 and tostring(v839) or nil
        end
        local function v840(p841)
            local v842 = p841 and p841.Character
            local v843 = v842 and v842:FindFirstChild("HumanoidRootPart")
            if not v843 then
                return nil
            end
            local v844 = v843.AssemblyLinearVelocity
            local v845 = v844 * 0.12
            if v845.Magnitude ~= v845.Magnitude then
                return v843.Position
            end
            if v845.Magnitude > 35 then
                v845 = v845.Unit * 35
            end
            return v843.Position + v845
        end
        local function v846(p847)
            local v848 = p847 == "Fruit" and "Blox Fruit" or p847
            for v849, v850 in ipairs({ v109.Character, v109:FindFirstChild("Backpack") }) do
                if v850 then
                    for v851, v852 in ipairs(v850:GetChildren()) do
                        if v852:IsA("Tool") and (v852.ToolTip == v848) then
                            return v852
                        end
                    end
                end
            end
        end
        local function v853(p854, p855)
            local v856 = v109:FindFirstChild("PlayerGui")
            local v857 = v856 and v856:FindFirstChild("Main")
            local v858 = v857 and v857:FindFirstChild("Skills")
            local v859 = v858 and v858:FindFirstChild(p854.Name)
            local v860 = v859 and v859:FindFirstChild(p855)
            local v861 = v860 and v860:FindFirstChild("Cooldown")
            if not v861 or not v861:IsA("GuiObject") then
                return false
            end
            if v861.Size.X.Scale > 0.001 or v861.Size.X.Offset > 1 then
                return false
            end
            local v862 = v860:FindFirstChild("Level")
            local v863 = v862 and tonumber(v862.Text:match("%d+"))
            local v864 = p854:FindFirstChild("Level")
            local v865 = v864 and tonumber(v864.Value) or tonumber(p854:GetAttribute("Mastery"))
            return not v863 or (v865 ~= nil and (v865 >= v863))
        end
        local function v866(p867, p868, p869)
            local v870 = Enum.KeyCode[p867]
            if not v870 or not p869() then
                return false
            end
            local v872, v873 = pcall(function()
                v108:SendKeyEvent(true, v870, false, game)
                local v871 = tick()
                repeat
                    task.wait(0.03)
                until not p869() or tick() - v871 >= math.clamp(tonumber(p868) or 0.1, 0.08, 2)
            end)
            local v874, v875 = pcall(function()
                v108:SendKeyEvent(false, v870, false, game)
            end)
            if not v872 or not v874 then
                v819.Errors = v819.Errors + 1
                v819.LastError = tostring(v873 or v875)
                return false
            end
            v819.Sent = v819.Sent + 1
            return true
        end
        local function v876(p877)
            local v878 = p877.Character
            if not v878 then
                return false
            end
            for v879, v880 in ipairs({ "NoPvP", "SafeZone" }) do
                local v881 = v878:FindFirstChild(v880)
                if v881 and (not v881:IsA("BoolValue") or v881.Value) then
                    return true
                end
            end
            local v882 = v878:FindFirstChild("HumanoidRootPart")
            local v883 = workspace:FindFirstChild("_WorldOrigin")
            local v884 = v883 and v883:FindFirstChild("SafeZones")
            if v882 and v884 then
                for v885, v886 in ipairs(v884:GetChildren()) do
                    if v886:IsA("BasePart") then
                        local v887 = v886.CFrame:PointToObjectSpace(v882.Position)
                        local v888 = v886.Size * 0.5
                        if (v882.Position - v886.Position).Magnitude <= 350 or (math.abs(v887.X) <= v888.X and (math.abs(v887.Y) <= v888.Y) and (math.abs(v887.Z) <= v888.Z)) then
                            return true
                        end
                    end
                end
            end
            return false
        end
        local function v889(p890)
            local v891 = p890.Character
            for v892, v893 in ipairs({ p890, v891 }) do
                for v894, v895 in ipairs({ "PvpDisabled", "PvPDisabled", "PVPDisabled", "NoPvP" }) do
                    if v893:GetAttribute(v895) == true then
                        return true
                    end
                    local v896 = v893:FindFirstChild(v895)
                    if v896 and v896:IsA("BoolValue") and v896.Value then
                        return true
                    end
                end
            end
            return v891 and (v891:FindFirstChildOfClass("ForceField") ~= nil)
        end
        local function v897(p898)
            if v876(p898) then
                v820(p898, "Safe zone / Cafe", 120)
                return true
            end
            if v889(p898) then
                v820(p898, "PvP disabled / protection", 180)
                return true
            end
            return false
        end
        local function v899(p900)
            if getgenv().Get6V3Coop and not getgenv().Get6V3Coop.AllowedTarget(p900.Name) then
                return false
            end
            if p900 == v109 then
                return false
            end
            if not p900.Character or not p900.Character:FindFirstChild("HumanoidRootPart") then
                return false
            end
            local v901 = p900.Character:FindFirstChild("Humanoid")
            if not v901 or v901.Health <= 0 then
                return false
            end
            local v902 = v819.Blacklist[p900.UserId]
            if v902 and (tick() < v902.Until) then
                return false
            end
            if v902 then
                v819.Blacklist[p900.UserId] = nil
            end
            if v897(p900) then
                return false
            end
            return true
        end
        local function v903()
            local v904 = workspace:FindFirstChild("Map")
            if v904 then
                local v905 = v904:FindFirstChild("WaterBase-Plane")
                if v905 then
                    return v905.Position.Y + (v905.Size.Y / 2) + 2
                end
            end
            return 15
        end
        if v227() ~= "Ghoul" then
            local v906 = v461()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Change", 4)
            task.wait(1)
            if v227() ~= "Ghoul" and (v906 >= 100) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "BuyCheck", 4)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Change", 4)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 4)
                task.wait(1)
            end
            if v227() ~= "Ghoul" then
                v146("Get race Ghoul...")
                v606()
                return
            end
        end
        local v907 = tonumber(v218("getRaceLevel", 10)) or 1
        if v907 == 1 then
            v146("Ghoul | V2")
            _G.FarmV2 = true
            v720()
        end
        if v907 == 2 then
            local v908 = v218("Wenlocktoad", 10, "1")
            if v908 == 0 then
                v146("Ghoul V3 | Get quest")
                v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                getgenv().KilledPlayers = {}
            elseif v908 == 1 then
                local v909 = v580()
                v146("Ghoul V3 | Kill Players (" .. v909 .. "/5)")
                if v909 >= 5 then
                    v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                    if tonumber(v104.Remotes.CommF_:InvokeServer("getRaceLevel")) >= 3 then
                        return
                    end
                    getgenv().KilledPlayers = {}
                    v909 = 0
                    v146("Ghoul V3 | Server chưa công nhận đủ kill, tiếp tục")
                end
                local v910 = {}
                for v911, v912 in pairs(v462()) do
                    if v899(v912) and ((v819.SkipUntil[v912.UserId] or 0) <= tick()) then
                        table.insert(v910, v912)
                    end
                end
                table.sort(v910, function(p913, p914)
                    local v915 = v521(p913.Name) and 0 or 1
                    local v916 = v521(p914.Name) and 0 or 1
                    if v915 ~= v916 then
                        return v915 < v916
                    end
                    local v917 = v109.Character and v109.Character:FindFirstChild("HumanoidRootPart")
                    if v917 then
                        local v918 = (p913.Character.HumanoidRootPart.Position - v917.Position).Magnitude
                        local v919 = (p914.Character.HumanoidRootPart.Position - v917.Position).Magnitude
                        if math.abs(v918 - v919) > 50 then
                            return v918 < v919
                        end
                    end
                    return p913.Character:FindFirstChildOfClass("Humanoid").Health < p914.Character:FindFirstChildOfClass("Humanoid").Health
                end)
                if #v910 > 0 then
                    v819.NoTargetSince = nil
                    local v920 = v910[1]
                    local v921 = v920.Character
                    local v922 = v921:FindFirstChild("Humanoid")
                    local v923 = v921:FindFirstChild("HumanoidRootPart")
                    local v924 = v922.Health
                    local v925 = tick()
                    local v926 = {}
                    for v927, v928 in pairs(v817) do
                        if type(v928) == "table" and v928.Enable then
                            for v929, v930 in pairs(v928) do
                                if type(v930) == "table" and v930.Enable and v930.Priority then
                                    table.insert(v926, { Type = v927, Key = v929, Data = v930 })
                                end
                            end
                        end
                    end
                    table.sort(v926, function(p931, p932)
                        return p931.Data.Priority < p932.Data.Priority
                    end)
                    local v933 = 0
                    local v934 = tick()
                    local v935 = v109.Character
                    local function v936()
                        if getgenv().Get6V3Coop and not getgenv().Get6V3Coop.AllowedTarget(v920.Name) then
                            return false
                        end
                        local v937 = v109.Character
                        local v938 = v937 and v937:FindFirstChild("HumanoidRootPart")
                        local v939 = v937 and v937:FindFirstChildOfClass("Humanoid")
                        return not v818.StopV3 and v2() and (v937 == v935) and v938 and v939 and (v939.Health > 0) and v920.Parent and (v920.Character == v921) and v921.Parent and v923.Parent and (v922.Health > 0)
                    end
                    local function v940()
                        if not v936() then
                            return false
                        end
                        return (v109.Character.HumanoidRootPart.Position - v923.Position).Magnitude <= v827 and not v897(v920)
                    end
                    v819.Active = true
                    v819.Target = v920.Name
                    v818.Get6V3PvPActive = true
                    _G.FastAttack = 0
                    local v950, v951 = pcall(function()
                        while v936() and (tick() - v934 < 120) do
                            v128.Heartbeat:Wait()
                            if not v936() or v897(v920) then
                                break
                            end
                            local v941 = v109.Character.HumanoidRootPart
                            local v942 = v109.Character:FindFirstChildOfClass("Humanoid")
                            v819.Aim = v840(v920)
                            local v943 = (v923.CFrame * CFrame.new(0, 7, 2)).Position
                            v491(CFrame.lookAt(v943, v923.Position), v826, v827)
                            local v944 = (v941.Position - v923.Position).Magnitude
                            _G.Get6V3PlayerApproaching = v944 > v827
                            v819.Distance = v944
                            v146("Ghoul V3 | " .. v920.Name .. " | " .. math.floor(v944) .. " studs | HP " .. math.floor(v922.Health))
                            if v944 <= v827 then
                                if v944 <= 12 then
                                    v191()
                                end
                                local v945 = v933
                                for v946 = 1, #v926 do
                                    local v947 = (v945 + v946 - 1) % #v926 + 1
                                    local v948 = v926[v947]
                                    local v949 = v846(v948.Type)
                                    if v949 then
                                        if v949.Parent ~= v109.Character then
                                            v942:EquipTool(v949)
                                            task.wait(0.15)
                                        end
                                        if not v940() then
                                            break
                                        end
                                        v933 = v947
                                        if v949.Parent == v109.Character and v853(v949, v948.Key) then
                                            v819.Aim = v840(v920)
                                            v819.Skill = v949.Name .. " / " .. v948.Key
                                            v866(v948.Key, v948.Data.HoldTime, v940)
                                            task.wait(0.15)
                                            break
                                        end
                                    end
                                end
                            end
                            if v944 > v827 or v922.Health < v924 then
                                v925 = tick()
                            elseif tick() - v925 > 15 then
                                v820(v920, "No damage / possible PvP protection", 180)
                                v146("Ghoul V3 | Không mất máu: blacklist 180s, đổi mục tiêu")
                                break
                            end
                            v924 = v922.Health
                        end
                    end)
                    v819.Active = false
                    v819.Aim = nil
                    v819.Target = nil
                    v818.Get6V3PvPActive = false
                    v488()
                    if not v950 then
                        v819.Errors = v819.Errors + 1
                        v819.LastError = tostring(v951)
                    end
                    v819.LastTarget = v920.Name
                    if v922 and (v922.Health <= 0) then
                        getgenv().KilledPlayers = getgenv().KilledPlayers or {}
                        getgenv().KilledPlayers[v920.UserId] = true
                        v820(v920, "Killed; move to another player", 300)
                        v146("Ghoul V3 | Đã hạ " .. v920.Name .. " → tìm player khác")
                    else
                        v819.SkipUntil[v920.UserId] = math.max(v819.SkipUntil[v920.UserId] or 0, tick() + 60)
                        v146("Ghoul V3 | Đổi mục tiêu sau " .. v920.Name)
                    end
                else
                    for v952, v953 in ipairs(v462()) do
                        if v899(v953) and ((v819.SkipUntil[v953.UserId] or 0) > tick()) then
                            v146("Ghoul V3 | Waiting before retrying target")
                            task.wait(1)
                            return
                        end
                    end
                    local v954 = v818.Get6V3Coop
                    if v954 and v954.enabled then
                        v954.Poll(false)
                        v146("Ghoul V3 | Đợi helper sẵn sàng trong nhóm")
                        task.wait(1)
                        return
                    end
                    v819.NoTargetSince = v819.NoTargetSince or tick()
                    if tick() - v819.NoTargetSince < 60 or tick() < (v819.NextHop or 0) then
                        v146("Ghoul V3 | Đợi player hồi sinh / ra khỏi safe zone")
                        task.wait(1)
                        return
                    end
                    v819.NextHop = tick() + 90
                    local v955 = v536()
                    if v955 and (v955 ~= game.JobId) then
                        v146("Ghoul V3 | Join server helper")
                        v545(v955)
                    elseif #v462() == 0 then
                        v146("Ghoul V3 | Không có player, tìm server khác")
                        v430()
                    else
                        v146("Ghoul V3 | Đợi mục tiêu có thể đánh trong server")
                    end
                    task.wait(1)
                end
            elseif v908 == 2 then
                v146("Ghoul V3 | Submit quest")
                v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                getgenv().KilledPlayers = {}
            elseif v908 == -2 then
                v146("Ghoul V3 DONE!")
                getgenv().KilledPlayers = {}
            end
        end
    end,
    Cyborg = function()
        if v227() ~= "Cyborg" then
            if not v735() then
                v146(" Chưa unlock Cyborg → Đang lấy...")
                v736()
                return
            end
        end
        local v956 = v104.Remotes.CommF_:InvokeServer("getRaceLevel")
        if v956 == 1 then
            v146("Cyborg | V2")
            _G.FarmV2 = true
            v720()
        end
        if v956 == 2 then
            local v957 = v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
            if v957 == 0 then
                v146("Cyborg V3 | Get quest")
                v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                return
            elseif v957 == 1 then
                v146("Cyborg V3 | Nộp trái")
                if not CheckFruitplr() then
                    if TakeFruitInventory(true) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", TakeFruitInventory(true))
                    end
                else
                    v146("Cyborg V3 | Nộp trái trên tay: " .. fruitOnHand.Name)
                    if v109.Character and v109.Character:FindFirstChildOfClass("Humanoid") then
                        v109.Character:FindFirstChildOfClass("Humanoid"):EquipTool(fruitOnHand)
                    end
                    task.wait(0.5)
                    v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                    task.wait(1.5)
                    v571()
                end
            elseif v957 == 2 then
                v146("Cyborg V3 | Nộp quest")
                v104.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                task.wait(1)
                v571()
            elseif v957 == -2 then
                v146(" Cyborg V3 DONE!")
                v571()
            end
        end
    end
}
v392()
local v958 = type(getgenv().Kurinian) == "table" and type(getgenv().Kurinian.RaceList) == "table" and getgenv().Kurinian.RaceList or {}
local v959 = v227()
local v960 = {}
local v961 = v959 and (table.find(v958, v959) ~= nil)
local function v962()
    v146("Angel Help mode | Race: " .. tostring(v470(v109) or "?"))
    if v470(v109) ~= "Skypiea" then
        v146("WARN: Help khong phai Angel - killer Skypiea se bo qua!")
    end
    local v963 = v528()
    while true do
        task.wait(5)
        pcall(function()
            if type(isaccmain) == "table" then
                isaccmain[v109.Name] = nil
                isaccmain[string.lower(tostring(v109.Name))] = nil
            end
            if v97[game.PlaceId] ~= "World2" then
                v146("Angel Help | Ve Sea 2...")
                v104.Remotes.CommF_:InvokeServer("TravelDressrosa")
                task.wait(10)
            else
                v532()
                local v964 = v109.Character
                local v965 = v964 and v964:FindFirstChild("HumanoidRootPart")
                local v966 = v964 and v964:FindFirstChildOfClass("Humanoid")
                if v965 and v966 and (v966.Health > 0) then
                    if (v965.Position - v963.Position).Magnitude > 25 then
                        TweenTo(v963)
                    end
                end
            end
        end)
    end
end
do
    local v967 = v517()
    print("[AngelHelp] build=20240920 HopAccountHelp=" .. tostring(v967.HopAccountHelp) .. " list=" .. table.concat(v518(), ",") .. " me=" .. tostring(v109 and v109.Name) .. " isHelp=" .. tostring(v521()))
end
getgenv().Get6V3Coop.Wait()
if not getgenv().Get6V3Coop.enabled and v521() then
    v962()
    return
end
if v961 then
    table.insert(v960, v959)
end
for v968, v969 in ipairs(v958) do
    if v969 ~= v959 or not v961 then
        table.insert(v960, v969)
    end
end
v146(table.concat(v958, ", "))
local v970 = v97[v96]
if v970 == "World1" or v970 == "World3" then
    v104.Remotes.CommF_:InvokeServer("TravelDressrosa")
elseif v970 == "World2" then
    v98 = true
end
local function v971(p972)
    local v973 = getgenv().V3Farms[p972]
    if v973 then
        local v977 = task.spawn(function()
            while not getgenv().StopV3 and v2() do
                getgenv().Get6V3Coop.Wait()
                if not getgenv().Get6V3Coop.enabled and v521() then
                    break
                end
                if HasRaceV3(p972) then
                    break
                end
                local v974 = v227()
                if v974 ~= p972 and (p972 ~= "Cyborg") and (p972 ~= "Ghoul") then
                    v146(" Race đổi → " .. p972)
                    v754(p972)
                end
                local v975, v976 = pcall(v973)
                if not v975 then
                    getgenv().Get6V3LastFarmError = tostring(v976)
                    getgenv().Get6V3PvPActive = false
                    if getgenv().__Get6V3GhoulCombat then
                        getgenv().__Get6V3GhoulCombat.Active = false
                    end
                    v488()
                    warn("[Get6V3 Farm] " .. tostring(v976))
                end
                task.wait(0.5)
            end
        end)
        while not getgenv().StopV3 and v2() do
            task.wait(2)
            if not getgenv().Get6V3Coop.enabled and v521() then
                break
            end
            if HasRaceV3(p972) then
                v146(" " .. p972 .. " V3 DONE!")
                pcall(task.cancel, v977)
                v488()
                getgenv().AimPos = nil
                getgenv().LatestPredictedPos = nil
                task.wait(1)
                getgenv().Get6V3Coop.Poll(true)
                getgenv().Get6V3Coop.Wait()
                break
            end
        end
    end
end
spawn(function()
    while task.wait(5) do
        pcall(RefreshInventory)
    end
end)
for v978, v979 in ipairs(v960) do
    getgenv().Get6V3Coop.Poll(true)
    getgenv().Get6V3Coop.Wait()
    if not getgenv().Get6V3Coop.enabled and v521() then
        v962()
        return
    end
    if getgenv().StopV3 then
        v146(" Stop ")
        break
    end
    if v386(v979) then
        v146("[" .. v978 .. "/" .. #v960 .. "]  " .. v979 .. " → Skip (da V3)")
        continue
    end
    v146("[" .. v978 .. "/" .. #v960 .. "] " .. v979)
    task.wait(1)
    local v980 = v754(v979)
    if v980 == false then
        v146(" Not change " .. v979)
        continue
    end
    if type(v980) == "string" and (v980 ~= v979) then
        v146(" Farm truoc: " .. tostring(v980))
        v971(v980)
        if getgenv().StopV3 then
            break
        end
        if v227() ~= v979 then
            local v981 = v754(v979)
            if v981 == false then
                v146(" Not change " .. v979)
                continue
            end
            if type(v981) == "string" then
                v146(" Van o " .. tostring(v981) .. ", bo qua " .. v979)
                continue
            end
        end
    end
    v971(v979)
    task.wait(3)
end
v146(" Done All Race in list")
while getgenv().Get6V3Coop.enabled and (not getgenv().StopV3 and v2()) do
    getgenv().Get6V3Coop.Poll(false)
    getgenv().Get6V3Coop.Wait()
    task.wait(1)
end
getgenv().StopV3 = false
