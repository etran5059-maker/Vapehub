Config = (type(Config) == "table" and Config) or (getgenv and type(getgenv().Config) == "table" and getgenv().Config) or {}
local v1 = Config
getgenv().FTP_Stop = true
getgenv().FTP_Done = true
task.wait(2)
getgenv().FTP_RunId = (tonumber(getgenv().FTP_RunId) or 0) + 1
local v2 = getgenv().FTP_RunId
local function v3()
    return v2 == tonumber(getgenv().FTP_RunId)
end
getgenv().FTP_Done = false
getgenv().FTP_Stop = false
getgenv().FTP_KilledBosses = getgenv().FTP_KilledBosses or {}
local v4 = game:GetService("Players")
local v5 = game:GetService("ReplicatedStorage")
local v6 = game:GetService("TweenService")
local v7 = game:GetService("VirtualInputManager")
local v8 = game:GetService("HttpService")
local v9 = game:GetService("TeleportService")
local v10 = game:GetService("RunService")
local v11 = game:GetService("CollectionService")
local v12 = v4.LocalPlayer
local v13 = v5:WaitForChild("Remotes"):WaitForChild("CommF_")
repeat
    wait()
until game:FindFirstChild("CoreGui")
repeat
    wait()
until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen")
repeat
    wait()
until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
FireButton = function(p14)
    p14.Selectable = true
    game:GetService("GuiService").SelectedObject = p14
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "Return", false, p14)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "Return", false, p14)
    p14.Activated:Connect(function()
        game:GetService("GuiService").SelectedObject = nil
    end)
end
repeat
    wait()
until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)") or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main")
local v15 = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)") or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main")
repeat
    wait()
until v15:FindFirstChild("ChooseTeam")
repeat
    task.wait()
    pcall(function()
        FireButton(game:GetService("Players").LocalPlayer.PlayerGui["Main (minimal)"].ChooseTeam.Container.Marines.Frame.TextButton)
        wait(3)
        if not game.Players.LocalPlayer.Team then
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("SetTeam", "Pirates")
        end
    end)
until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)") and game:GetService("Players").LocalPlayer.PlayerGui["Main (minimal)"]:FindFirstChild("ChooseTeam") and not game:GetService("Players").LocalPlayer.PlayerGui["Main (minimal)"]:WaitForChild("ChooseTeam").Visible or (game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main") and game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") and not game:GetService("Players").LocalPlayer.PlayerGui.Main:WaitForChild("ChooseTeam").Visible)
game:GetService("GuiService").SelectedObject = nil
repeat
    wait()
until game:IsLoaded() and game.Players.LocalPlayer
repeat
    wait()
until game:FindFirstChild("CoreGui")
local function v16(...)
    local v17 = { ... }
    local v18, v19 = pcall(function()
        return v13:InvokeServer(unpack(v17))
    end)
    if v18 then
        return v19
    end
    return nil
end
local v20 = nil
pcall(function()
    local v21 = v12:WaitForChild("PlayerGui")
    local v22, v23 = pcall(function()
        return gethui()
    end)
    if v22 and v23 then
        v21 = v23
    end
    if v21:FindFirstChild("FTP_StatusUI") then
        v21.FTP_StatusUI:Destroy()
    end
    local v24 = Instance.new("ScreenGui")
    v24.Name = "FTP_StatusUI"
    v24.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    v24.Parent = v21
    local v25 = Instance.new("Frame")
    v25.Size = UDim2.new(0, 420, 0, 44)
    v25.Position = UDim2.new(0.5, -210, 0, 18)
    v25.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    v25.BackgroundTransparency = 0.15
    Instance.new("UICorner", v25).CornerRadius = UDim.new(1, 0)
    v25.Parent = v24
    v20 = Instance.new("TextLabel", v25)
    v20.Size = UDim2.new(1, -30, 1, 0)
    v20.Position = UDim2.new(0, 15, 0, 0)
    v20.BackgroundTransparency = 1
    v20.Text = "FTP Loading..."
    v20.TextColor3 = Color3.fromRGB(240, 240, 245)
    v20.Font = Enum.Font.Code
    v20.TextSize = 15
    v20.TextXAlignment = Enum.TextXAlignment.Left
    v20.Parent = v25
end)
status = function(p26)
    getgenv().FTP_Status = tostring(p26 or "idle")
    if v20 then
        pcall(function()
            v20.Text = tostring(p26 or "idle")
        end)
    end
end
SetText = function(p27)
    status(p27)
end
task.spawn(function()
    while task.wait(10) do
        pcall(function()
            if not v12.Character:FindFirstChild("HasBuso") then
                v13:InvokeServer("Buso")
            end
        end)
    end
end)
ConvertTo = function(p28, p29)
    return p28.new(p29.X, p29.Y, p29.Z)
end
CaculateDistance = function(p30, p31)
    if not p30 then
        return 0
    end
    p31 = p31 or (v12.Character and v12.Character:FindFirstChild("HumanoidRootPart") and v12.Character.HumanoidRootPart.CFrame) or CFrame.new()
    local function v32(p33)
        if typeof(p33) == "Vector3" then
            return p33
        elseif typeof(p33) == "CFrame" then
            return p33.Position
        end
        return Vector3.zero
    end
    return (v32(p30) - v32(p31)).Magnitude
end
getdis = function(p34, p35)
    p35 = p35 or v12.Character.HumanoidRootPart.CFrame
    return (p34.Position - p35.Position).Magnitude
end
TweenInstance, TweenTarget, TweenChar = nil, nil, nil
local v36 = v10
local v37 = { LastTP = 0, LastCF = nil, ActiveConnection = nil }
local v38, v39, v40 = 120, 40, 18
local v41, v42 = 2.5, 120
local function v43()
    local v44 = getgenv().CharSpeed
    if not v44 then
        v44 = { cap = 1000, nextRaise = 0 }
        getgenv().CharSpeed = v44
    end
    return v44
end
local function v45(p46)
    if p46 and not p46:FindFirstChild("FloatForce") then
        local v47 = Instance.new("BodyVelocity")
        v47.Name = "FloatForce"
        v47.Velocity = Vector3.zero
        v47.MaxForce = Vector3.new(100000, 100000, 100000)
        v47.P = 10000
        v47.Parent = p46
    end
end
TweenTo = function(p48)
    if not p48 then
        return
    end
    local v49 = typeof(p48) ~= "CFrame" and ConvertTo(CFrame, p48) or p48
    local v50 = v12.Character
    local v51 = v50 and v50:FindFirstChild("HumanoidRootPart")
    if tick() - v37.LastTP < 1 and (v37.LastCF == v49) then
        return
    end
    if TweenInstance then
        pcall(function()
            TweenInstance:Cancel()
        end)
    end
    if v37.ActiveConnection and (coroutine.status(v37.ActiveConnection) == "suspended") then
        pcall(coroutine.close, v37.ActiveConnection)
    end
    if v12:GetAttribute("ExactLocation") and (v12:GetAttribute("ExactLocation") == "Submerged Island") then
        pcall(function()
            v13:InvokeServer("TeleportToSpawn")
        end)
        task.wait(6)
        v50 = v12.Character
        v51 = v50 and v50:FindFirstChild("HumanoidRootPart")
    end
    if not v50 or not v51 then
        return
    end
    local v52 = v50:FindFirstChildOfClass("Humanoid")
    if not v52 or v52.Health <= 0 then
        return
    end
    for v53, v54 in v50:GetDescendants() do
        if v54:IsA("BasePart") then
            v54.CanCollide = false
        end
    end
    local v55 = v50:FindFirstChildOfClass("Humanoid")
    if v55 and (v55.FloorMaterial ~= Enum.Material.Air) then
        v55:ChangeState(Enum.HumanoidStateType.Jumping)
    end
    v45(v51)
    getgenv().noclip = true
    v37.LastTP = tick()
    v37.LastCF = v49
    TweenTarget, TweenChar = v49.Position, v50
    local v56 = tonumber(v1.TweenSpeed) or 200
    local v57 = false
    local v58 = {}
    v58.PlaybackState = Enum.PlaybackState.Playing
    local v59 = nil
    local function v60()
        if v37.ActiveConnection == v59 then
            v37.ActiveConnection = nil
        end
        if TweenInstance == v58 then
            TweenInstance = nil
            TweenTarget, TweenChar = nil, nil
        end
        if getgenv().Tween == v58 then
            getgenv().Tween = nil
        end
    end
    v58.Cancel = function()
        if v58.PlaybackState == Enum.PlaybackState.Playing then
            v58.PlaybackState = Enum.PlaybackState.Cancelled
        end
        v57 = true
        if v59 and (coroutine.status(v59) == "suspended") then
            pcall(coroutine.close, v59)
        end
        v60()
    end
    v59 = coroutine.create(function()
        local v61 = v49.Position
        local v62 = v43()
        local v63 = tick()
        local v64 = v51.Position
        local v65 = (v61 - v64).Magnitude
        local v66, v67 = tick(), true
        local v68, v69 = nil, nil
        while not v57 do
            local v70 = v12.Character
            if v70 ~= v50 then
                break
            end
            local v71 = v70:FindFirstChild("HumanoidRootPart")
            local v72 = v70:FindFirstChildOfClass("Humanoid")
            if not v71 or not v72 or v72.Health <= 0 or v71.Anchored then
                break
            end
            if tick() - v63 > v42 then
                break
            end
            local v73 = math.min(v36.Heartbeat:Wait(), 0.1)
            local v74 = v71.Position
            local v75 = (v61 - v74).Magnitude
            if v75 <= v41 then
                break
            end
            if v75 < v65 - 5 then
                v65, v66 = v75, tick()
            elseif tick() - v66 > 2.5 then
                v67 = false
            end
            if v67 and v68 and v69 and (v75 > v69 + v39) then
                v62.cap = math.max(v62.cap * 0.7, v38)
                v62.nextRaise = tick() + 3
                v68 = v74
            elseif v67 and v68 and ((v74 - v68).Magnitude > v39) then
                v68 = v74
            elseif not v68 then
                v68 = v74
            end
            local v76 = v61 - v64
            local v77 = v76.Magnitude
            local v78 = math.min(math.min(v56, v62.cap) * v73, v40)
            if v77 > v78 and (tick() >= v62.nextRaise) then
                v62.cap = math.min(v62.cap * 1.08, v56)
                v62.nextRaise = tick() + 1.5
            end
            if v77 <= v78 or v77 <= 0.05 then
                v64 = v61
            else
                v64 = v64 + (v76 / v77 * v78)
            end
            v71.CFrame = CFrame.new(v64)
            v71.AssemblyLinearVelocity = Vector3.zero
            v71.AssemblyAngularVelocity = Vector3.zero
            if v71.CanCollide then
                v71.CanCollide = false
            end
            getgenv().noclip = true
            v68, v69 = v64, v75
        end
        if not v57 then
            local v79 = v12.Character
            local v80 = v79 and v79:FindFirstChild("HumanoidRootPart")
            if v79 == v50 and v80 and ((v49.Position - v80.Position).Magnitude <= v41) then
                v80.CFrame = v49
                v80.AssemblyLinearVelocity = Vector3.zero
                v80.AssemblyAngularVelocity = Vector3.zero
                v58.PlaybackState = Enum.PlaybackState.Completed
            else
                if v58.PlaybackState == Enum.PlaybackState.Playing then
                    v58.PlaybackState = Enum.PlaybackState.Cancelled
                end
            end
        end
        v60()
    end)
    v37.ActiveConnection = v59
    TweenInstance = v58
    getgenv().Tween = v58
    TweenTarget, TweenChar = v49.Position, v50
    if not coroutine.resume(v59) then
        v58:Cancel()
        return
    end
    return v58
end
task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            local v81 = v12.Character
            local v82 = v81 and v81:FindFirstChild("HumanoidRootPart")
            if v82 then
                for v83, v84 in ipairs(v81:GetDescendants()) do
                    if v84:IsA("BasePart") then
                        v84.CanCollide = false
                    end
                end
            end
        end)
    end
end)
local v85 = "        local env=getgenv()\n        local token={}\n        env.VapeLegacyAttackWorker=token\n        local player=game:GetService(\"Players\").LocalPlayer\n        local net=game:GetService(\"ReplicatedStorage\"):WaitForChild(\"Modules\"):WaitForChild(\"Net\")\n        local attack=net:WaitForChild(\"RE/RegisterAttack\")\n        local hit=net:WaitForChild(\"RE/RegisterHit\")\n        local pulseUntil=0\n        env.Attack=function()\n            if env.VapeLegacyAttackWorker==token then pulseUntil=os.clock()+0.35 end\n        end\n        task.spawn(function()\n            while env.VapeLegacyAttackWorker==token do\n                task.wait(0.15)\n                local ok,err=pcall(function()\n                    if os.clock()>pulseUntil or env.Get6V3PvPActive then return end\n                    -- A shared lease prevents attack workers from different hubs firing together.\n                    local now=os.clock()\n                    if now<(env.VapeNextAttackPacket or 0) then return end\n                    local char=player.Character\n                    local root=char and char:FindFirstChild(\"HumanoidRootPart\")\n                    local health=char and char:FindFirstChildOfClass(\"Humanoid\")\n                    if not root or not health or health.Health<=0 or not char:FindFirstChildOfClass(\"Tool\") then return end\n                    local list={}\n                    for _,folderName in ipairs({\"Enemies\", \"Characters\"}) do\n                        local folder=workspace:FindFirstChild(folderName)\n                        if folder then\n                            for _,model in ipairs(folder:GetChildren()) do\n                                local hum=model:FindFirstChildOfClass(\"Humanoid\")\n                                local part=model:FindFirstChild(\"HumanoidRootPart\")\n                                if model~=char and hum and hum.Health>0 and part and (part.Position-root.Position).Magnitude<=65 then\n                                    list[#list+1]={model,part}\n                                    if #list>=3 then break end\n                                end\n                            end\n                        end\n                        if #list>=3 then break end\n                    end\n                    if #list==0 then return end\n                    env.VapeNextAttackPacket=now+0.15\n                    attack:FireServer(0)\n                    hit:FireServer(list[1][1]:FindFirstChild(\"Head\") or list[1][2],list,nil,\"078da341\")\n                end)\n                if not ok then token.Error=tostring(err) end\n            end\n        end)\n    "
pcall(function()
    local v86 = loadstring(v85)
    if type(v86) == "function" then
        v86()
    end
end)
task.spawn(function()
    while v3() and not getgenv().FTP_Stop and not getgenv().FTP_Done do
        task.wait(0.2)
        if not v3() or getgenv().FTP_Stop or getgenv().FTP_Done then
            break
        end
        if type(getgenv().Attack) == "function" then
            pcall(getgenv().Attack)
        end
    end
end)
local function v87(p88)
    return (v12.Backpack:FindFirstChild(p88) or (v12.Character and v12.Character:FindFirstChild(p88))) and true or false
end
local function v89(p90)
    if not v12.Character then
        return
    end
    local v91 = v12.Character:FindFirstChildOfClass("Tool")
    if v91 and (v91.ToolTip == p90) then
        return v91
    end
    for v92, v93 in pairs(v12.Backpack:GetChildren()) do
        if v93:IsA("Tool") and (v93.ToolTip == p90) then
            v12.Character:FindFirstChildOfClass("Humanoid"):EquipTool(v93)
            return v93
        end
    end
    return nil
end
local function v94(p95)
    return v89(p95)
end
local function v96(p97)
    v7:SendKeyEvent(true, p97, false, game)
    task.wait(0.05)
    v7:SendKeyEvent(false, p97, false, game)
    task.wait(0.3)
end
GetConnectionEnemies = function(p98)
    for v99, v100 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if v100:IsA("Model") and (typeof(p98) == "table" and table.find(p98, v100.Name) or v100.Name == p98) and v100:FindFirstChild("Humanoid") and (v100.Humanoid.Health > 0) then
            return v100
        end
    end
    for v101, v102 in pairs(workspace.Enemies:GetChildren()) do
        if v102:IsA("Model") and (typeof(p98) == "table" and table.find(p98, v102.Name) or v102.Name == p98) and v102:FindFirstChild("Humanoid") and (v102.Humanoid.Health > 0) then
            return v102
        end
    end
    return nil
end
local function v103(p104)
    pcall(function()
        sethiddenproperty(v12, "SimulationRadius", math.huge)
    end)
    if not v12.Character or not v12.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    local v105 = v12.Character.HumanoidRootPart.Position
    for v106, v107 in pairs(workspace.Enemies:GetChildren()) do
        if (not p104 or v107.Name == p104) and v107:FindFirstChild("Humanoid") and v107:FindFirstChild("HumanoidRootPart") and (v107.Humanoid.Health > 0) then
            local v108 = (v107.HumanoidRootPart.Position - v105).Magnitude
            if v108 <= 300 then
                v107.HumanoidRootPart.CFrame = CFrame.new(v105 + Vector3.new(0, 0, 5))
                v107.HumanoidRootPart.CanCollide = false
                v107.Humanoid.WalkSpeed = 0
                v107.Humanoid.JumpPower = 0
            end
        end
    end
end
KillMonster = function(p109)
    xpcall(function()
        local v110 = nil
        if typeof(p109) == "Instance" and p109:IsA("Model") then
            local v111 = p109:FindFirstChildWhichIsA("Humanoid")
            if v111 and (v111.Health > 0) and p109:FindFirstChild("HumanoidRootPart") then
                v110 = p109
            end
        end
        local function v112(p113)
            if typeof(p109) == "table" then
                return table.find(p109, p113.Name) ~= nil
            end
            return p113.Name == p109
        end
        if not v110 and (typeof(p109) == "string" or typeof(p109) == "table") then
            local v114 = { workspace:FindFirstChild("Enemies") }
            local v115 = workspace:FindFirstChild("_WorldOrigin")
            if v115 and v115:FindFirstChild("Enemies") then
                table.insert(v114, v115.Enemies)
            end
            for v116, v117 in ipairs(v114) do
                if v117 then
                    for v118, v119 in ipairs(v117:GetChildren()) do
                        local v120 = v119:IsA("Model") and v119:FindFirstChildWhichIsA("Humanoid")
                        local v121 = v119:IsA("Model") and v119:FindFirstChild("HumanoidRootPart")
                        if v120 and v121 and (v120.Health > 0) and v112(v119) then
                            v110 = v119
                            break
                        end
                    end
                end
                if v110 then
                    break
                end
            end
        end
        if not v110 then
            return
        end
        if not (v12.Character and v12.Character:FindFirstChild("HumanoidRootPart")) then
            return
        end
        local v122 = v110:FindFirstChild("HumanoidRootPart")
        if not v122 then
            return
        end
        TweenTo(v122.CFrame * CFrame.new(0, 18, 0))
        v89("Melee")
        if typeof(p109) == "table" then
            v103()
        else
            v103(v110.Name)
        end
    end, function(p123)
        warn("KillMonster ERROR: " .. tostring(p123))
    end)
end
local v124, v125, v126, v127
local function v128()
    if v125 and v126 and v127 then
        return true
    end
    pcall(function()
        v124 = v124 or v5:WaitForChild("ItemReplicationService", 10)
        v125 = v125 or (v124 and require(v124))
        v126 = v126 or (v124 and require(v124.KEYS))
        v127 = v127 or require(v5:WaitForChild("ItemConfig", 10))
    end)
    return v125 ~= nil and (v126 ~= nil) and (v127 ~= nil)
end
local function v129()
    local v130 = {}
    if not v128() then
        return v130
    end
    local v131 = tick() + 5
    while v125.IsInitialized ~= true and (tick() < v131) do
        task.wait()
    end
    local v132, v133 = pcall(function()
        return v125:GetItems(v126.QUANTITY)
    end)
    if v132 and v133 then
        for v134, v135 in pairs(v133) do
            if v135.Value and (v135.Value > 0) then
                local v136, v137 = pcall(function()
                    return v127.match(v135.ItemId):unwrap().Index.DebugLabel
                end)
                if v136 and v137 then
                    local v138 = v137:gsub("%s*%[.-%]%s*$", "")
                    table.insert(v130, { Name = v138, Count = v135.Value, ItemId = v135.ItemId })
                end
            end
        end
    end
    return v130
end
TDT = { Backpack = {} }
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local v139 = {}
            for v140, v141 in ipairs(v129()) do
                v139[v141.Name] = v141
            end
            if next(v139) ~= nil then
                TDT.Backpack = v139
            end
        end)
    end
end)
local function v142(p143)
    local v144 = TDT.Backpack
    if v144 and (next(v144) ~= nil) then
        return v144[p143] ~= nil
    end
    local v145 = false
    pcall(function()
        for v146, v147 in pairs(v129()) do
            if v147.Name == p143 then
                v145 = true
                break
            end
        end
    end)
    return v145
end
Hop = {}
Hop.A = function(p148)
    p148 = p148 or 8
    local v149, v150 = pcall(function()
        return v8:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
    end)
    if not v149 or not v150 then
        return
    end
    for v151, v152 in pairs(v150) do
        if v152.playing < p148 and (v152.id ~= game.JobId) then
            pcall(function()
                v5:WaitForChild("__ServerBrowser"):InvokeServer("teleport", v152.id)
            end)
            break
        end
    end
end
getgenv().ServerHistory = getgenv().ServerHistory or {}
getgenv().FailedJobIds = getgenv().FailedJobIds or {}
local v153 = game:GetService("HttpService")
local v154 = game:GetService("Players")
local v155 = game:GetService("TeleportService")
local v156 = getgenv and getgenv() or _G
v156.FailedJobIds = v156.FailedJobIds or {}
local v157 = v156.FailedJobIds
local v158 = {}
local v159 = false
local v160 = 3 * 60
Hop.BaseUrl = v156.HopApiBaseUrl or "https://memaybeo.kurinian-hub.xyz"
local function v161()
    local v162 = game:GetService("HttpService")
    local v163 = getgenv and getgenv() or _G
    local v164 = {}
    v164.Request = function(p165, p166, p167, p168)
        if type(p165) ~= "string" or not p165:match("^https://") then
            return nil, "HTTPS API URL required"
        end
        local v169 = "92b62b279e2d9869c739467fcfb54d01e5f35253c3f8e659cc4eaead65cf46de"
        if type(v169) ~= "string" or #v169 < 32 then
            return nil, "Set HopApiKey first"
        end
        local v170 = syn and syn.request or http_request or request or (http and http.request)
        if type(v170) ~= "function" then
            return nil, "HTTP request unavailable"
        end
        local v171 = {
            Url = p165:gsub("/+$", "") .. p167,
            Method = p166,
            Headers = { ["Content-Type"] = "application/json", Authorization = "Bearer " .. v169 }
        }
        if p168 then
            v171.Body = v162:JSONEncode(p168)
        end
        local v172, v173 = pcall(v170, v171)
        if not v172 or type(v173) ~= "table" then
            return nil, "API request failed"
        end
        if tonumber(v173.StatusCode) ~= 200 then
            return nil, "API HTTP " .. tostring(v173.StatusCode)
        end
        local v174, v175 = pcall(v162.JSONDecode, v162, v173.Body)
        if not v174 or type(v175) ~= "table" then
            return nil, "Invalid API response"
        end
        return v175
    end
    v164.Decode = function(p176, p177)
        if type(p177) ~= "string" or #p177 > 512 or not p177:match("^JID1%.[%w_-]+$") then
            return nil, "Invalid encoded Job ID"
        end
        local v178, v179 = v164.Request(p176, "POST", "/api/job-id/decode", { token = p177 })
        if not v178 then
            return nil, v179
        end
        local v180 = v178.jobId
        if type(v180) ~= "string" or #v180 ~= 36 or not v180:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
            return nil, "Invalid decoded Job ID"
        end
        return v180
    end
    v164.Encode = function(p181, p182)
        local v183, v184 = v164.Request(p181, "POST", "/api/job-id/encode", { jobId = p182 })
        if not v183 then
            return nil, v184
        end
        return v183.token
    end
    v163.JobIdCodec = v164
    return v164
end
local v185 = v156.JobIdCodec or v161()
Hop.DecodeJobId = function(p186)
    return v185.Decode(Hop.BaseUrl, p186)
end
local v187 = game:GetService("Players")
local v188 = game:GetService("TeleportService")
local function v189(p190)
    return string.lower((tostring(p190):gsub("%s+", "")))
end
local function v191(p192)
    if type(p192) == "number" then
        return p192
    end
    return tonumber(tostring(p192 or ""):match("(%d+)")) or 99
end
local function v193(p194)
    local v195 = {}
    for v196 in tostring(p194 or ""):gmatch("(%d+)") do
        v195[#v195 + 1] = tonumber(v196)
    end
    if #v195 >= 3 then
        return v195[#v195 - 2] * 3600 + (v195[#v195 - 1] * 60) + v195[#v195]
    elseif #v195 == 2 then
        return v195[1] * 60 + v195[2]
    end
    return v195[1] or 0
end
local function v197(p198)
    if type(p198) ~= "table" then
        return nil
    end
    local v199 = p198.jobId or p198.jobid or p198.joinId
    if type(v199) ~= "string" or v199 == "" then
        return nil
    end
    local v200 = p198.sea
    if v200 ~= nil then
        v200 = tonumber(tostring(v200):match("(%d+)"))
    end
    return {
        token = v199,
        placeId = tonumber(p198.placeId or p198.placeid) or game.PlaceId,
        players = v191(p198.players),
        ageSeconds = v193(p198.age),
        sea = v200,
        moon = p198.moon
    }
end
local function v201(p202)
    local v203, v204 = v185.Request(Hop.BaseUrl, "GET", "/api/bloxfruit/" .. p202)
    if type(v203) ~= "table" then
        return nil, v204
    end
    local v205 = v203.data or v203.servers
    if type(v205) ~= "table" then
        return nil, "Invalid server list"
    end
    return v205
end
local function v206(p207)
    if p207.jobId == game.JobId or v157[p207.jobId] then
        return false
    end
    local v208 = false
    local v213, v214 = pcall(function()
        return v188.TeleportInitFailed:Connect(function(p209, p210, p211, p212)
            if p209 ~= v187.LocalPlayer then
                return
            end
            if p212 and (tonumber(p212) ~= tonumber(game.PlaceId)) then
                return
            end
            v208 = true
            v157[p207.jobId] = tick()
            if p210 == Enum.TeleportResult.GameFull then
                warn("[Hop] Server full")
            end
        end)
    end)
    if not v213 or not v214 then
        return false
    end
    local function v215(p216)
        local v217 = tick() + p216
        repeat
            task.wait(0.25)
        until v208 or tick() >= v217
        return not v208
    end
    local v219, v220 = pcall(function()
        local v218 = game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser", 5)
        assert(v218, "Server browser unavailable")
        return v218:InvokeServer("teleport", p207.jobId)
    end)
    local v221 = false
    if v219 and (v220 ~= false) then
        v221 = v215(8)
    else
        v208 = false
        local v222 = pcall(function()
            v188:TeleportToPlaceInstance(game.PlaceId, p207.jobId, v187.LocalPlayer)
        end)
        if v222 then
            v221 = v215(3)
        end
    end
    v214:Disconnect()
    if not v221 then
        v157[p207.jobId] = tick()
    end
    return v221
end
Hop.API = function(p223, p224, p225)
    if v159 then
        return false
    end
    v159 = true
    p224 = tonumber(p224) or 12
    p225 = tonumber(p225) or 25
    local v248, v249 = pcall(function()
        local v226 = v189(p223)
        v158[v226] = v158[v226] or {}
        local v227 = v158[v226]
        local v228 = math.max(1, math.floor(p225 / 5))
        for v229 = 1, v228 do
            local v230, v231 = v201(v226)
            if v230 then
                local v232 = tonumber(tostring(workspace:GetAttribute("MAP") or ""):match("(%d+)"))
                local v233, v234, v235 = {}, {}, {}
                for v236, v237 in ipairs(v230) do
                    local v238 = v197(v237)
                    if v238 and (v238.placeId == tonumber(game.PlaceId)) and (not v232 or not v238.sea or v238.sea == v232) and (v238.ageSeconds < v160) and (v238.players > 2) and (v238.players < p224) then
                        local v239 = Hop.DecodeJobId(v238.token)
                        if v239 and not v233[v239] then
                            v233[v239] = true
                            v238.jobId = v239
                            if v239 ~= game.JobId and not v157[v239] then
                                local v240 = v227[v239] and v235 or v234
                                v240[#v240 + 1] = v238
                            end
                            v227[v239] = true
                        end
                    end
                end
                local function v241(p242, p243)
                    return p242.ageSeconds < p243.ageSeconds
                end
                table.sort(v234, v241)
                table.sort(v235, v241)
                for v244, v245 in ipairs({ v234, v235 }) do
                    for v246, v247 in ipairs(v245) do
                        if v206(v247) then
                            return true
                        end
                    end
                end
            elseif v231 then
                warn("[Hop] " .. tostring(v231))
            end
            if v229 < v228 then
                task.wait(5)
            end
        end
        return false
    end)
    v159 = false
    if not v248 then
        warn("[Hop] " .. tostring(v249))
    end
    return v248 and (v249 == true)
end
HopServer = function(p250)
    Hop.A(p250)
end
local function v251()
    local v252 = 0
    pcall(function()
        v252 = tonumber(v12.Data.Fragments.Value) or 0
    end)
    return v252
end
local function v253()
    return math.max(1, tonumber(v1.MaxFrag) or 5000)
end
local function v254()
    if workspace:GetAttribute("MAP") and (workspace:GetAttribute("MAP") ~= "Sea3") then
        status("Ve Sea 3 farm Tyrant...")
        pcall(function()
            v13:InvokeServer("TravelZou")
        end)
        task.wait(8)
        return false
    end
    return true
end
local v255 = {
    ["Isle Outlaw"] = true,
    ["Island Boy"] = true,
    ["Sun-kissed Warrior"] = true,
    ["Isle Champion"] = true,
    ["Serpent Hunter"] = true,
    ["Skull Slayer"] = true
}
local v256 = CFrame.new(-16490.9727, 98.1144867, 1245.58984, -0.034969449, 0, 0.999388516, 0, 1, 0, -0.999388516, 0, -0.034969449)
local v257 = Vector3.new(-16275.984642, 157.838229, 1390.372659)
local v258 = {
    {
        Name = "Vase01",
        CFrame = CFrame.new(-16332.5264, 158.071655, 1440.32507, 0.999388874, 0, 0.0349550731, 0, 1, 0, -0.0349550731, 0, 0.999388874)
    },
    {
        Name = "Vase02",
        CFrame = CFrame.new(-16335.1641, 158.166733, 1465.64404, 0.999388874, 0, 0.0349550731, 0, 1, 0, -0.0349550731, 0, 0.999388874)
    },
    {
        Name = "Vase03",
        CFrame = CFrame.new(-16288.6094, 158.166733, 1470.36816, 0.999388874, 0, 0.0349550731, 0, 1, 0, -0.0349550731, 0, 0.999388874)
    },
    {
        Name = "Vase04",
        CFrame = CFrame.new(-16258.001, 156.760635, 1461.40356, 0.999388874, 0, 0.0349550731, 0, 1, 0, -0.0349550731, 0, 0.999388874)
    },
    {
        Name = "Vase05",
        CFrame = CFrame.new(-16245.4121, 158.437012, 1463.36597, -0.993159413, 0, 0.116766132, 0, 1, 0, -0.116766132, 0, -0.993159413)
    },
    {
        Name = "Vase06",
        CFrame = CFrame.new(-16212.4688, 158.166733, 1466.34387, 0.999388874, 0, 0.0349550731, 0, 1, 0, -0.0349550731, 0, 0.999388874)
    },
    {
        Name = "Vase07",
        CFrame = CFrame.new(-16211.9463, 158.071655, 1322.39807, -0.466439605, 0, -0.884553134, 0, 1, 0, 0.884553134, 0, -0.466439605)
    },
    {
        Name = "Vase08",
        CFrame = CFrame.new(-16250.2354, 158.166733, 1313.01941, 0.999388874, 0, 0.0349550731, 0, 1, 0, -0.0349550731, 0, 0.999388874)
    },
    {
        Name = "Vase09",
        CFrame = CFrame.new(-16260.2803, 158.166733, 1320.45532, 0.999388874, 0, 0.0349550731, 0, 1, 0, -0.0349550731, 0, 0.999388874)
    },
    {
        Name = "Vase10",
        CFrame = CFrame.new(-16296.1162, 157.767914, 1315.79407, -0.463313937, 0, 0.886194229, 0, 1, 0, -0.886194229, 0, -0.463313937)
    },
    {
        Name = "Vase11",
        CFrame = CFrame.new(-16286.0586, 155.949478, 1323.83765, 0.999388874, 0, 0.0349550731, 0, 1, 0, -0.0349550731, 0, 0.999388874)
    },
    {
        Name = "Vase12",
        CFrame = CFrame.new(-16334.9971, 158.166733, 1321.51672, 0.999388874, 0, 0.0349550731, 0, 1, 0, -0.0349550731, 0, 0.999388874)
    }
}
local v259 = { "Z", "X", "C" }
local v260 = { Z = 0.035, X = 0.12, C = 0.05 }
local v261 = { Z = 0.65, X = 0.5, C = 1.45 }
local v262 = { Z = 6, X = 8, C = 12 }
local v263 = 0.75
local v264 = nil
local v265 = {}
local function v266()
    local v267 = { workspace:FindFirstChild("Enemies") }
    local v268 = workspace:FindFirstChild("_WorldOrigin")
    if v268 and v268:FindFirstChild("Enemies") then
        v267[#v267 + 1] = v268.Enemies
    end
    v267[#v267 + 1] = v5
    for v269, v270 in ipairs(v267) do
        if v270 then
            for v271, v272 in ipairs(v270:GetChildren()) do
                if v272:IsA("Model") and (string.find(string.lower(v272.Name), "tyrant", 1, true) ~= nil) and v272:FindFirstChildOfClass("Humanoid") and v272:FindFirstChild("HumanoidRootPart") and (v272.Humanoid.Health > 0) then
                    return v272
                end
            end
        end
    end
    return nil
end
local v273 = {
    Eye1 = Vector3.new(-16186.759766, 196.228531, 1440.732788),
    Eye2 = Vector3.new(-16192.060547, 196.052032, 1440.720825)
}
local function v274()
    local v275 = workspace:FindFirstChild("Map")
    local v276 = v275 and v275:FindFirstChild("TikiOutpost")
    local v277 = v276 and v276:FindFirstChild("IslandModel")
    local v278 = v277 and v277:FindFirstChild("IslandChunks")
    local v279 = v278 and v278:FindFirstChild("E")
    return v277, v278, v279
end
local function v280(p281, p282)
    if not p281 or not p281:IsA("BasePart") or p281.Name ~= p282 or not p281:IsDescendantOf(workspace) then
        return false
    end
    local v283, v284, v285 = v274()
    if p282 == "Eye1" or p282 == "Eye2" then
        if p281.Parent ~= v283 then
            return false
        end
        local v286 = v273[p282]
        return v286 == nil or (p281.Position - v286).Magnitude <= 8
    end
    return v285 ~= nil and (p281.Parent == v285)
end
local function v287(p288, p289)
    if not v280(p288, p289) then
        return false
    end
    local v290 = p288.Color
    return math.abs(v290.R - 1) <= 10 / 255 and (math.abs(v290.G - (57 / 255)) <= 10 / 255) and (math.abs(v290.B - (57 / 255)) <= 10 / 255) and (p288.Transparency <= 0.1)
end
local function v291()
    local v292, v293, v294 = v274()
    if not v292 or not v294 then
        v264 = nil
        return 0
    end
    local v295 = (v287(v292:FindFirstChild("Eye1"), "Eye1") and 1 or 0) + (v287(v292:FindFirstChild("Eye2"), "Eye2") and 1 or 0) + (v287(v294:FindFirstChild("Eye3"), "Eye3") and 1 or 0) + (v287(v294:FindFirstChild("Eye4"), "Eye4") and 1 or 0)
    if v295 == 4 then
        v264 = v264 or tick()
    else
        v264 = nil
    end
    return v295
end
local function v296()
    return v291() == 4 and (v264 ~= nil) and (tick() - v264 >= v263)
end
getgenv().FTP_AimTarget = nil
local function v297()
    if getgenv().FTP_AimHookInstalled then
        return true
    end
    if type(getrawmetatable) ~= "function" or type(setreadonly) ~= "function" or type(newcclosure) ~= "function" or type(getnamecallmethod) ~= "function" or type(checkcaller) ~= "function" then
        warn("[FTP] Executor khong ho tro hook - skill vase co the lech")
        return false
    end
    local v305, v306 = pcall(function()
        local v298 = getrawmetatable(game)
        local v299 = v298.__namecall
        setreadonly(v298, false)
        v298.__namecall = newcclosure(function(p300, ...)
            local v301 = getnamecallmethod()
            local v302 = getgenv().FTP_AimTarget
            if not checkcaller() and v302 and (v301 == "FireServer" or v301 == "InvokeServer") then
                local v303 = { ... }
                for v304 = 1, #v303 do
                    if typeof(v303[v304]) == "Vector3" then
                        v303[v304] = v302
                    end
                end
                return v299(p300, unpack(v303))
            end
            return v299(p300, ...)
        end)
        setreadonly(v298, true)
    end)
    if v305 then
        getgenv().FTP_AimHookInstalled = true
    else
        warn("[FTP] Aim hook fail: " .. tostring(v306))
    end
    return v305
end
local function v307()
    local v308 = v12.Character
    local v309 = v308 and v308:FindFirstChildOfClass("Humanoid")
    if not v309 then
        return nil
    end
    local v310 = v89("Melee")
    if v310 then
        return v310
    end
    return v308:FindFirstChildWhichIsA("Tool")
end
local function v311(p312, p313)
    local v314 = v12.PlayerGui and v12.PlayerGui:FindFirstChild("Main")
    local v315 = v314 and v314:FindFirstChild("Skills")
    if not v315 or not p312 then
        return nil
    end
    local v316 = v315:FindFirstChild(p312.Name)
    return v316 and v316:FindFirstChild(p313) or nil
end
local function v317(p318, p319)
    if tick() < (v265[p319] or 0) then
        return false
    end
    local v320 = v311(p318, p319)
    if not v320 then
        return true
    end
    local v321 = v320:FindFirstChild("Cooldown")
    if v321 and v321:IsA("GuiObject") then
        return v321.Size.X.Scale <= 0.015 and (v321.Size.X.Offset <= 2)
    end
    return true
end
local function v322(p323, p324)
    local v325 = tick()
    while not getgenv().FTP_Stop and not v266() and v296() do
        local v326 = v307()
        if v326 then
            p323 = string.upper(tostring(p323 or ""))
            if p323 ~= "" and v317(v326, p323) then
                return p323
            end
            for v327, v328 in ipairs(v259) do
                if v317(v326, v328) then
                    return v328
                end
            end
        end
        if p324 and (tick() - v325 >= p324) then
            return nil
        end
        task.wait(0.1)
    end
    return nil
end
local function v329(p330, p331)
    p331 = string.upper(tostring(p331 or ""))
    if p331 ~= "Z" and (p331 ~= "X") and (p331 ~= "C") then
        return false
    end
    local v332 = v307()
    local v333 = v12.Character
    local v334 = v333 and v333:FindFirstChildOfClass("Humanoid")
    local v335 = v333 and v333:FindFirstChild("HumanoidRootPart")
    if not v332 or v332.Parent ~= v333 or not v334 or v334.Health <= 0 or not v335 then
        return false
    end
    if not v317(v332, p331) then
        return false
    end
    v297()
    getgenv().FTP_AimTarget = p330
    local v337 = pcall(function()
        v334.Sit = false
        v335.AssemblyLinearVelocity = Vector3.zero
        v335.AssemblyAngularVelocity = Vector3.zero
        local v336 = Vector3.new(p330.X, v335.Position.Y, p330.Z)
        if (v336 - v335.Position).Magnitude > 0.1 then
            v335.CFrame = CFrame.lookAt(v335.Position, v336)
        end
        task.wait(0.08)
        v7:SendKeyEvent(true, p331, false, game)
        task.wait(v260[p331] or 0.1)
        v7:SendKeyEvent(false, p331, false, game)
        v265[p331] = tick() + (v262[p331] or 7)
        task.wait(v261[p331] or 0.6)
    end)
    getgenv().FTP_AimTarget = nil
    if v337 then
        task.wait(0.18)
    end
    return v337
end
local function v338(p339)
    return p339.CFrame.Position + Vector3.new(0, 0.75, 0)
end
local function v340(p341, p342)
    local v343 = p341.CFrame.Position
    local v344 = Vector3.new(v257.X - v343.X, 0, v257.Z - v343.Z)
    v344 = v344.Magnitude < 0.1 and Vector3.new(0, 0, -1) or v344.Unit
    local v345
    if p342 == "Z" then
        v345 = v343 + (v344 * 92) + Vector3.new(0, 3, 0)
    elseif p342 == "C" then
        v345 = v343 + Vector3.new(0, 3.2, 0)
    else
        v345 = v343 + (v344 * 14) + Vector3.new(0, 3, 0)
    end
    if p342 == "C" then
        return CFrame.lookAt(v345, v345 + (v344 * 8))
    end
    return CFrame.lookAt(v345, v338(p341))
end
local function v346(p347, p348)
    if typeof(p347) ~= "CFrame" then
        return false
    end
    local v349 = v12.Character and v12.Character:FindFirstChild("HumanoidRootPart")
    if not v349 then
        return false
    end
    TweenTo(p347)
    p348 = p348 or math.max(3, (v349.Position - p347.Position).Magnitude / 200 + 2)
    local v350 = tick()
    repeat
        task.wait(0.05)
        local v351 = v12.Character and v12.Character:FindFirstChild("HumanoidRootPart")
        if not v351 then
            return false
        end
        if (v351.Position - p347.Position).Magnitude <= 8 then
            v351.CFrame = p347
            return true
        end
    until tick() - v350 >= p348
    local v352 = v12.Character and v12.Character:FindFirstChild("HumanoidRootPart")
    if v352 and ((v352.Position - p347.Position).Magnitude <= 15) then
        v352.CFrame = p347
        return true
    end
    return false
end
local function v353(p354, p355)
    if not p354 or getgenv().FTP_Stop or v266() or not v296() then
        return false
    end
    local v356 = v322(p355, 15)
    if not v356 then
        return false
    end
    local v357 = v338(p354)
    local v358 = v340(p354, v356)
    status(string.format("Tyrant vase %s | %s", p354.Name, v356))
    v346(v358, 45)
    local v359 = v12.Character and v12.Character:FindFirstChild("HumanoidRootPart")
    if not v359 then
        return false
    end
    v359.CFrame = v358
    v359.AssemblyLinearVelocity = Vector3.zero
    v359.AssemblyAngularVelocity = Vector3.zero
    task.wait(0.1)
    return v329(v357, v356)
end
local function v360()
    status("Tyrant: 4/4 mat do - pha 12 vase (Z/X/C)")
    task.wait(0.25)
    local v361 = 0
    while not getgenv().FTP_Stop and v296() and not v266() do
        v361 = v361 + 1
        for v362, v363 in ipairs(v258) do
            if getgenv().FTP_Stop or v266() or not v296() then
                return
            end
            local v364 = v259[(v362 + v361 - 2) % #v259 + 1]
            v353(v363, v364)
            task.wait(0.08)
        end
        status("Tyrant: quet xong 12 vase, vong " .. tostring(v361))
        task.wait(0.35)
    end
end
local function v365(p366)
    local v367 = tostring(p366 or "")
    v367 = v367:gsub("%s*%[Lv%.%s*%d+%]", ""):gsub("%s*%[Lv%s*%d+%]", ""):gsub("%s*%[Boss%]", ""):gsub("%s*%[Raid Boss%]", "")
    return v367:gsub("%s+$", "")
end
local function v368()
    local v369 = {}
    if workspace:FindFirstChild("Enemies") then
        v369[#v369 + 1] = workspace.Enemies
    end
    local v370 = workspace:FindFirstChild("_WorldOrigin")
    if v370 and v370:FindFirstChild("Enemies") then
        v369[#v369 + 1] = v370.Enemies
    end
    return v369
end
local function v371()
    local v372 = v12.Character and v12.Character:FindFirstChild("HumanoidRootPart")
    if not v372 then
        return nil
    end
    local v373, v374 = nil, math.huge
    for v375, v376 in ipairs(v368()) do
        for v377, v378 in ipairs(v376:GetChildren()) do
            local v379 = v378:FindFirstChildOfClass("Humanoid")
            local v380 = v378:FindFirstChild("HumanoidRootPart")
            if v379 and v380 and (v379.Health > 0) and v255[v365(v378.Name)] then
                local v381 = (v372.Position - v380.Position).Magnitude
                if v381 < v374 then
                    v373, v374 = v378, v381
                end
            end
        end
    end
    return v373
end
local v382, v383 = 14, 10
local v384, v385 = 7, 5
local v386 = 0.7
local v387 = 190
local function v388()
    local v389, v390 = v251(), v253()
    local v391 = v12.Character and v12.Character:FindFirstChildOfClass("Humanoid")
    if not v391 or v391.Health <= 0 then
        status("Tyrant : doi hoi sinh...")
        task.wait(1)
        return
    end
    local v392 = v266()
    if v392 then
        local v393 = v392:FindFirstChildOfClass("Humanoid")
        cframemobss = v392:FindFirstChildOfClass("HumanoidRootPart")
        status("Frag " .. v389 .. "/" .. v390 .. " | Danh Tyrant " .. math.floor(v393.Health / v393.MaxHealth * 100) .. "%")
        v89("Melee")
        TweenTo(v392.HumanoidRootPart.CFrame * CFrame.new(0, 18, 0))
    else
        Hop.API("tyrantoftheskies")
    end
end
local function v394()
    local v395, v396 = v251(), v253()
    local v397 = v12.Character and v12.Character:FindFirstChildOfClass("Humanoid")
    if not v397 or v397.Health <= 0 then
        status("Kata : doi hoi sinh...")
        task.wait(1)
        return
    end
    local v398 = GetConnectionEnemies("Cake Prince")
    if v398 then
        local v399 = v398:FindFirstChildOfClass("Humanoid")
        cframemobss = v398:FindFirstChildOfClass("HumanoidRootPart")
        status("Frag " .. v395 .. "/" .. v396 .. " | Danh Kata " .. math.floor(v399.Health / v399.MaxHealth * 100) .. "%")
        v89("Melee")
        TweenTo(v398.HumanoidRootPart.CFrame * CFrame.new(0, 18, 0))
    else
        Hop.API("CakePrince")
    end
end
local function v400()
    local v401, v402 = pcall(function()
        return v12.Data.Race.Value
    end)
    return v401 and v402 or nil
end
local function v403()
    local v404, v405 = pcall(function()
        return v13:InvokeServer("CheckTempleDoor")
    end)
    if v404 and v405 then
        return true
    end
    local v406, v407 = pcall(function()
        return v13:InvokeServer("getRaceLevel")
    end)
    if v406 and tonumber(v407) and (tonumber(v407) >= 3) then
        return true
    end
    return false
end
local function v408()
    if workspace:GetAttribute("MAP") ~= "Sea2" then
        status("V3 can Sea 2 - dang xuong...")
        pcall(function()
            v13:InvokeServer("TravelDressrosa")
        end)
        task.wait(10)
        return false
    end
    return true
end
local function v409(p410)
    for v411, v412 in pairs(workspace.Enemies:GetChildren()) do
        if v412:IsA("Model") and (v412.Name == p410) and v412:FindFirstChild("Humanoid") and (v412.Humanoid.Health > 0) and v412:FindFirstChild("HumanoidRootPart") then
            return v412
        end
    end
    for v413, v414 in pairs(v5:GetChildren()) do
        if v414:IsA("Model") and (v414.Name == p410) and v414:FindFirstChild("Humanoid") and (v414.Humanoid.Health > 0) and v414:FindFirstChild("HumanoidRootPart") then
            return v414
        end
    end
    return nil
end
local function v415()
    while task.wait(0.5) do
        if getgenv().FTP_Stop then
            break
        end
        v408()
        local v416 = v16("Alchemist", "1")
        if v416 == 0 then
            status("V2 | Get quest")
            v16("Alchemist", "2")
        elseif v416 == 1 then
            local function v417(p418)
                return v12.Backpack:FindFirstChild(p418) or (v12.Character and v12.Character:FindFirstChild(p418))
            end
            if not v417("Flower 1") then
                status("V2 | Flower 1")
                TweenTo(workspace.Flower1.CFrame)
            elseif not v417("Flower 2") then
                status("V2 | Flower 2")
                TweenTo(workspace.Flower2.CFrame)
            elseif not v417("Flower 3") then
                status("V2 | Kill Swan Pirate")
                local v419 = v409("Swan Pirate")
                if v419 then
                    v103("Swan Pirate")
                    KillMonster("Swan Pirate")
                else
                    TweenTo(CFrame.new(980.099, 121.331, 1287.209))
                end
            end
        elseif v416 == 2 then
            status("V2 | Nop quest")
            v16("Alchemist", "3")
            task.wait(1)
        elseif v416 == -2 then
            status("V2 Done!")
            break
        end
    end
end
local function v420()
    local v421 = v12.Character and v12.Character:FindFirstChild("HumanoidRootPart")
    if not v421 then
        return
    end
    local v422, v423 = nil, math.huge
    for v424, v425 in next, v11:GetTagged("_ChestTagged") do
        if v425 and v425:IsA("BasePart") and v425.CanTouch and v425.Name:find("Chest") then
            local v426 = (v425.Position - v421.Position).Magnitude
            if v426 < v423 then
                v422, v423 = v425, v426
            end
        end
    end
    if v422 then
        status("Mink V3 | Farm Chest")
        TweenTo(v422.CFrame + Vector3.new(0, 3, 0))
    else
        status("Mink V3 | Het chest - doi respawn")
        task.wait(5)
    end
end
local function v427()
    if not workspace:FindFirstChild("SeaBeasts") then
        return nil
    end
    for v428, v429 in pairs(workspace.SeaBeasts:GetChildren()) do
        if v429:FindFirstChild("HumanoidRootPart") and v429:FindFirstChild("Health") and (v429.Health.Value > 0) then
            return v429
        end
    end
    return nil
end
local function v430()
    local v431 = v427()
    if v431 then
        if v12.Character.Humanoid.Sit then
            v12.Character.Humanoid.Sit = false
            task.wait(1)
        end
        repeat
            task.wait(0.3)
            if getgenv().FTP_Stop then
                break
            end
            if not v431 or not v431.Parent then
                break
            end
            if not v431:FindFirstChild("Health") or v431.Health.Value <= 0 then
                break
            end
            if not v431:FindFirstChild("HumanoidRootPart") then
                break
            end
            if not v12.Character or not v12.Character:FindFirstChild("HumanoidRootPart") then
                break
            end
            local v432 = v431.HumanoidRootPart.Position
            local v433 = workspace.Map:FindFirstChild("WaterBase-Plane")
            local v434 = v433 and v433.Position.Y + 200 or 200
            TweenTo(CFrame.new(v432.X, v434, v432.Z))
            status("Fishman V3 | Sea Beast HP: " .. math.floor(v431.Health.Value))
            v94("Blox Fruit")
            v96("Z")
            v96("X")
            v96("C")
            v94("Melee")
            v96("Z")
            v96("X")
            v96("C")
        until not v431 or not v431.Parent or v431.Health.Value <= 0 or getgenv().FTP_Stop
        return
    end
    local v435 = nil
    for v436, v437 in pairs(workspace.Boats:GetChildren()) do
        if v437:FindFirstChild("Owner") and (tostring(v437.Owner.Value) == v12.Name) then
            v435 = v437
            break
        end
    end
    if not v435 then
        status("Fishman V3 | Mua thuyen")
        TweenTo(CFrame.new(-110.271713, 9.76438141, 2956.36841))
        task.wait(2)
        if v12.Character and ((CFrame.new(-110.271713, 9.76438141, 2956.36841).Position - v12.Character.HumanoidRootPart.Position).Magnitude <= 15) then
            v16("BuyBoat", "MarineBrigade")
            task.wait(2)
        end
        return
    end
    if not v12.Character.Humanoid.Sit then
        status("Fishman V3 | Len thuyen")
        TweenTo(v435.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
        task.wait(2)
        return
    end
    local v438 = v427()
    if v438 then
        v12.Character.Humanoid.Sit = false
        task.wait(1)
    else
        status("Fishman V3 | Lai thuyen tim Sea Beast")
        TweenTo(CFrame.new(-10000000, 31, 37016.25) * CFrame.new(0, 50, 0))
    end
end
local function v439()
    local v440 = nil
    for v441, v442 in pairs(v187:GetPlayers()) do
        if v442 ~= v12 and v442.Character and v442.Character:FindFirstChild("HumanoidRootPart") and v442.Character:FindFirstChild("Humanoid") and (v442.Character.Humanoid.Health > 0) then
            local v443, v444 = pcall(function()
                return v442.Data.Race.Value
            end)
            local v445, v446 = pcall(function()
                return v442.Data.Level.Value
            end)
            if v443 and (v444 == "Skypiea") and v445 and (math.abs((v12.Data.Level.Value or 0) - v446) <= 200) then
                v440 = v442
                break
            end
        end
    end
    if not v440 then
        status("Skypiea V3 | Khong thay target -> Hop")
        Hop.A(10)
        return
    end
    pcall(function()
        if v12.PlayerGui.Main.PvpDisabled.Visible then
            v16("EnablePvp")
        end
    end)
    local v447, v448 = v440.Character, v440.Character:FindFirstChild("Humanoid")
    status("Skypiea V3 | Attack: " .. v440.Name)
    repeat
        task.wait(0.1)
        if getgenv().FTP_Stop then
            break
        end
        if not v440.Character or not v448 or v448.Health <= 0 then
            break
        end
        local v449 = v440.Character:FindFirstChild("HumanoidRootPart")
        if not v449 then
            break
        end
        TweenTo(v449.CFrame * CFrame.new(0, 5, 2))
        local v450 = v12.Character and v12.Character:FindFirstChild("HumanoidRootPart") and (v12.Character.HumanoidRootPart.Position - v449.Position).Magnitude or 999
        if v450 < 40 then
            v94("Melee")
            v96("Z")
            v96("X")
            v96("C")
        end
    until not v448 or v448.Health <= 0 or getgenv().FTP_Stop
end
local function v451()
    local v452 = v400()
    if not v452 then
        status("Khong lay duoc race")
        return
    end
    if v403() then
        status("Da co V3 (" .. v452 .. ")")
        return
    end
    status("Up V3 cho: " .. v452)
    local v453 = v16("getRaceLevel")
    if v453 == 1 then
        status(v452 .. " | Up V2 truoc...")
        v415()
        task.wait(2)
        v453 = v16("getRaceLevel")
    end
    if v453 ~= 2 then
        return
    end
    while not v403() do
        if getgenv().FTP_Stop then
            break
        end
        v408()
        local v454 = v16("Wenlocktoad", "1")
        if v454 == 0 then
            status(v452 .. " V3 | Nhan quest")
            v16("Wenlocktoad", "2")
        elseif v454 == 1 then
            if v452 == "Human" then
                local v455 = {
                    { name = "Diamond", pos = CFrame.new(-1576, 198, 13) },
                    { name = "Jeremy", pos = CFrame.new(2099.88, 448.93, 648.99) },
                    { name = "Orbitus", pos = CFrame.new(-2172, 103, -4015) }
                }
                local v456 = false
                for v457, v458 in ipairs(v455) do
                    if getgenv().FTP_Stop then
                        break
                    end
                    if getgenv().FTP_KilledBosses[v458.name] then
                        continue
                    end
                    local v459 = GetConnectionEnemies(v458.name)
                    if v459 then
                        v456 = true
                        local v460 = v459:FindFirstChild("HumanoidRootPart")
                        if v460 then
                            TweenTo(v460.CFrame * CFrame.new(0, 25, 0))
                        end
                        repeat
                            task.wait(0.3)
                            if getgenv().FTP_Stop then
                                break
                            end
                            status("Human V3 | " .. v458.name .. " " .. math.floor(v459.Humanoid.Health / v459.Humanoid.MaxHealth * 100) .. "%")
                            v89("Melee")
                            v460 = v459:FindFirstChild("HumanoidRootPart")
                            if not v460 then
                                break
                            end
                            if (v12.Character.HumanoidRootPart.Position - v460.Position).Magnitude > 80 then
                                TweenTo(v460.CFrame * CFrame.new(0, 25, 0))
                            end
                        until not v459.Parent or v459.Humanoid.Health <= 0 or getgenv().FTP_Stop
                        getgenv().FTP_KilledBosses[v458.name] = true
                        break
                    else
                        Hop.A(10)
                    end
                end
                if not v456 then
                    for v461, v462 in ipairs(v455) do
                        if not getgenv().FTP_KilledBosses[v462.name] then
                            status("Human V3 | Cho " .. v462.name)
                            TweenTo(v462.pos)
                            break
                        end
                    end
                end
            elseif v452 == "Mink" then
                v420()
            elseif v452 == "Fishman" then
                v430()
            elseif v452 == "Skypiea" then
                v439()
            else
                status(v452 .. " V3 | Quest dang lam (ws=1)...")
                task.wait(3)
            end
        elseif v454 == 2 then
            status(v452 .. " V3 | Nop quest")
            v16("Wenlocktoad", "3")
            getgenv().FTP_KilledBosses = {}
            task.wait(1)
        elseif v454 == -2 then
            status(v452 .. " V3 DONE!")
            getgenv().FTP_KilledBosses = {}
            break
        end
        task.wait(1)
    end
end
getBlueGear = function()
    local v463 = workspace:FindFirstChild("Map")
    local v464 = v463 and v463:FindFirstChild("MysticIsland")
    if not v464 then
        return nil
    end
    for v465, v466 in v464:GetDescendants() do
        if v466:IsA("MeshPart") and (v466.MeshId == "rbxassetid://10153114969") and (v466.Transparency ~= 1) then
            return v466.CFrame
        end
    end
    return nil
end
local function v467(p468)
    local v469, v470 = pcall(function()
        return p468:GetPivot()
    end)
    if v469 and v470 then
        return v470
    end
    return p468:GetModelCFrame()
end
status("FTP start | Frag target: " .. v253())
while task.wait(1) do
    if not v3() then
        break
    end
    if getgenv().FTP_Stop or getgenv().FTP_Done then
        break
    end
    local v471, v472 = pcall(function()
        if v251() < v253() then
            if Config.Select == "Tyrant" then
                v388()
                return
            elseif Config.Select == "Kata" then
                v394()
                return
            end
        end
    end)
    if not v471 then
        warn("[FTP] " .. tostring(v472))
    end
end
status("FTP DONE")
