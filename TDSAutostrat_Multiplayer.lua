repeat
    wait()
until game:IsLoaded()
wait()
local a = {}
if not getgenv().ExecutedAlr then
    if not getexecutorname then
        function getexecutorname()
            return "Other"
        end
    elseif not string.find(getexecutorname(), "ScriptWare") then
        function getexecutorname()
            return "Other"
        end
    end
    fileprefix = "TDS_AutoStrat/"
    if syn and not getgenv().IsMultiStrat and not getgenv().ExecDis and not getgenv().Multiplayer then
        syn.queue_on_teleport('loadstring(readfile("TDS_AutoStrat/LastStrat.txt"))()')
    elseif not getgenv().IsMultiStrat and not getgenv().ExecDis and not getgenv().Multiplayer then
        queue_on_teleport('loadstring(readfile("TDS_AutoStrat/LastStrat.txt"))()')
    end
    getgenv().ExecutedAlr = true
    getgenv().MapUsed = false
    loadstring(
        game:HttpGet(
            "https://raw.githubusercontent.com/banbuskox/dfhtyxvzexrxgfdzgzfdvfdz/main/sjkdkjlfdjnnmklcvxjNotifCr"
        )
    )()
    if isfile("DNR.txt") and not isfolder("TDS_AutoStrat") then
        say("ERROR", "Root folder removed, recreating files!", 5)
        makefolder("TDS_AutoStrat")
        writefile(fileprefix .. "Webhook (Logs).txt", "WEBHOOK HERE")
        writefile(fileprefix .. "LastLog.txt", "")
        writefile(fileprefix .. "LastPrintLog.txt", "")
        writefile(fileprefix .. "LastStrat.txt", "")
        writefile(fileprefix .. "PrivateServer.txt", "PRIVATE SERVER LINK HERE")
        writefile(fileprefix .. "UseCount.txt", readfile("DNR.txt"))
        wait(0.5)
        say("SUCCESS", "Files recreated! Don't remove this folder again!", 5)
    end
    if not isfolder("TDS_AutoStrat") then
        makefolder("TDS_AutoStrat")
    end
    if not isfile("DNR.txt") then
        writefile("DNR.txt", "1")
    end
    if not isfile(fileprefix .. "UseCount.txt") then
        writefile(fileprefix .. "UseCount.txt", "1")
    end
    loadstring(
        game:HttpGet("https://raw.githubusercontent.com/banbuskox/dfhtyxvzexrxgfdzgzfdvfdz/main/ikcxujvkdsStrat")
    )()
    loadstring(game:HttpGet("https://banbusscripts.netlify.app/Scripts/IsAutoStratMain"))()
    if getgenv().StratMaintance == true then
        repeat
            wait()
            loadstring(game:HttpGet("https://banbusscripts.netlify.app/Scripts/IsAutoStratMain"))()
            getgenv().status = "Script in maintenance, waiting..."
            wait(1)
        until getgenv().StratMaintance == false or getgenv().SkipStratMaintance == true
    end
    getgenv().status = "Loading"
    getgenv().count = 0
    if game.PlaceId == 5591597781 then
        game:GetService("Workspace").Towers.ChildAdded:Connect(
            function(b)
                getgenv().count = getgenv().count + 1
            end
        )
    end
    local c = readfile(fileprefix .. "UseCount.txt")
    c = tonumber(c) + 1
    writefile(fileprefix .. "UseCount.txt", tostring(c))
    writefile("DNR.txt", tostring(c))
    local d = nil
    local e = game:WaitForChild("ReplicatedStorage")
    local f = e:WaitForChild("RemoteFunction")
    local g = e:WaitForChild("RemoteEvent")
    function isgame()
        if game.PlaceId == 5591597781 then
            return true
        else
            return false
        end
    end
    stateRep = nil
    if isgame() then
        function getStateRep()
            for h, b in pairs(game:GetService("ReplicatedStorage").StateReplicators:GetChildren()) do
                if b:GetAttribute("TimeScale") then
                    return b
                end
            end
        end
        repeat
            stateRep = getStateRep()
        until stateRep
    end
    spawn(
        function()
            wait(10)
            if isgame() and #game.Players:GetChildren() > 1 and getgenv().Multiplayer == false then
                game:GetService("TeleportService"):Teleport(3260590327, game:GetService("Players").LocalPlayer)
            else
                if
                    isgame() and getgenv().Multiplayer and #game.Players:GetChildren() > getgenv().PlayerNumber and
                        getgenv().PlayerType == "Host"
                 then
                    local i = math.huge
                    local j = game:GetService("HttpService")
                    local k = game:GetService("TeleportService")
                    local l, m
                    local n = math.huge
                    local o = 0
                    repeat
                        local p =
                            "https://games.roblox.com/v1/games/" ..
                            game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
                        if l then
                            p = p .. "&cursor=" .. l
                        end
                        local q = j:JSONDecode(game:HttpGet(p))
                        if q then
                            l = q.nextPageCursor or nil
                            o = o + 1
                            for r, b in pairs(q.data) do
                                b.playing = b.playing or math.huge
                                b.id = b.id or ""
                                if b.id ~= game.JobId and b.playing <= n then
                                    n = b.playing
                                    m = b.id
                                end
                            end
                        end
                    until not l or o >= i
                    if m then
                        getgenv().Connection:Send('{"client":"Host","action":"Teleport","jobid":"' .. m .. '"}')
                        k:TeleportToPlaceInstance(3260590327, m)
                    end
                end
            end
        end
    )
    if isgame() and getgenv().PotatoPC then
        spawn(
            function()
                wait(3)
                for h, b in pairs(game.Workspace.Map:GetChildren()) do
                    if b.Name ~= "Paths" then
                        b:Remove()
                    end
                end
                local s = game.Workspace.Terrain
                s.Transparency = 0
                s.WaterReflectance = 0
                s.WaterTransparency = 0
                s.WaterWaveSize = 0
                s.WaterWaveSpeed = 0
            end
        )
    end
    if isgame() then
        spawn(
            function()
                wait(3)
                for h, b in pairs(game:GetService("Lighting"):GetChildren()) do
                    if b.Name ~= "Sky" then
                        b:Remove()
                    end
                end
                game.Lighting.FogStart = 10000000
                game.Lighting.FogEnd = 10000000
                game.Lighting.Brightness = 1
                local t
                if getgenv().CameraSys == true then
                    t = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0)
                else
                    t = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 20, 0)
                end
                local u = Instance.new("Part")
                u.Transparency = 1
                u.Anchored = true
                u.CanCollide = true
                u.Parent = game.Workspace
                u.CFrame = t
                if getgenv().CameraSys == true then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 55, 0)
                else
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 25, 0)
                end
                if game.CoreGui:FindFirstChild("AutoStratsLogger") then
                    game.CoreGui:FindFirstChild("AutoStratsLogger"):Remove()
                end
                local v = Instance.new("ScreenGui")
                local w = Instance.new("Frame")
                local x = Instance.new("ImageLabel")
                local y = Instance.new("Frame")
                local z = Instance.new("TextLabel")
                local A = Instance.new("ScrollingFrame")
                v.Name = "AutoStratsLogger"
                v.Parent = game:WaitForChild("CoreGui")
                v.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                w.Name = "Main"
                w.Parent = v
                w.BackgroundColor3 = Color3.fromRGB(23, 21, 30)
                w.BorderSizePixel = 0
                w.Position = UDim2.new(0.544935644, 0, 0.355803162, 0)
                w.Size = UDim2.new(0, 500, 0, 400)
                x.Name = "Glow"
                x.Parent = w
                x.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                x.BackgroundTransparency = 1.000
                x.BorderSizePixel = 0
                x.Position = UDim2.new(0, -15, 0, -15)
                x.Size = UDim2.new(1, 30, 1, 30)
                x.ZIndex = 0
                x.Image = "rbxassetid://4996891970"
                x.ImageColor3 = Color3.fromRGB(15, 15, 15)
                x.ScaleType = Enum.ScaleType.Slice
                x.SliceCenter = Rect.new(20, 20, 280, 280)
                y.Name = "Top_Container"
                y.Parent = w
                y.AnchorPoint = Vector2.new(0.5, 0)
                y.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                y.BackgroundTransparency = 1.000
                y.Position = UDim2.new(0.5, 0, 0, 18)
                y.Size = UDim2.new(1, -40, 0, 20)
                z.Name = "Title"
                z.Parent = y
                z.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                z.BackgroundTransparency = 1.000
                z.Position = UDim2.new(0.00764120743, 0, -0.400000006, 0)
                z.Size = UDim2.new(0.981785059, 0, 1.45000005, 0)
                z.Font = Enum.Font.GothamBlack
                z.Text = "AUTOSTRATS LOGGER"
                z.TextColor3 = Color3.fromRGB(255, 255, 255)
                z.TextSize = 30.000
                z.TextXAlignment = Enum.TextXAlignment.Left
                A.Name = "Scroll"
                A.Parent = w
                A.Active = true
                A.AnchorPoint = Vector2.new(0.5, 0)
                A.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                A.BackgroundTransparency = 1.000
                A.BorderSizePixel = 0
                A.Position = UDim2.new(0.5, 4, 0, 59)
                A.Size = UDim2.new(1, -20, 1, -67)
                A.BottomImage = "rbxassetid://5234388158"
                A.CanvasSize = UDim2.new(200, 0, 100, 0)
                A.MidImage = "rbxassetid://5234388158"
                A.ScrollBarThickness = 8
                A.TopImage = "rbxassetid://5234388158"
                A.VerticalScrollBarInset = Enum.ScrollBarInset.Always
                A.ChildAdded:Connect(
                    function()
                        if #A:GetChildren() > 16 then
                            A.CanvasPosition = Vector2.new(0, A.CanvasPosition.Y + 20)
                        end
                    end
                )
                local function B()
                    local C = Instance.new("LocalScript", w)
                    C.Name = "Dragify"
                    local D = game:GetService("UserInputService")
                    function dragify(E)
                        dragToggle = nil
                        dragInput = nil
                        dragStart = nil
                        local F = nil
                        function updateInput(G)
                            local H = G.Position - dragStart
                            local I =
                                UDim2.new(
                                startPos.X.Scale,
                                startPos.X.Offset + H.X,
                                startPos.Y.Scale,
                                startPos.Y.Offset + H.Y
                            )
                            game:GetService("TweenService"):Create(E, TweenInfo.new(0.1), {Position = I}):Play()
                        end
                        E.InputBegan:Connect(
                            function(G)
                                if
                                    (G.UserInputType == Enum.UserInputType.MouseButton1 or
                                        G.UserInputType == Enum.UserInputType.Touch) and
                                        D:GetFocusedTextBox() == nil
                                 then
                                    dragToggle = true
                                    dragStart = G.Position
                                    startPos = E.Position
                                    G.Changed:Connect(
                                        function()
                                            if G.UserInputState == Enum.UserInputState.End then
                                                dragToggle = false
                                            end
                                        end
                                    )
                                end
                            end
                        )
                        E.InputChanged:Connect(
                            function(G)
                                if
                                    G.UserInputType == Enum.UserInputType.MouseMovement or
                                        G.UserInputType == Enum.UserInputType.Touch
                                 then
                                    dragInput = G
                                end
                            end
                        )
                        game:GetService("UserInputService").InputChanged:Connect(
                            function(G)
                                if G == dragInput and dragToggle then
                                    updateInput(G)
                                end
                            end
                        )
                    end
                    dragify(C.Parent)
                end
                B()
                local function J()
                    local C = Instance.new("LocalScript", w)
                    C.Name = "Positioning"
                    C.Parent:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), "Out", "Quad", 1)
                    C.Parent.Draggable = true
                end
                J()
                local K = -0.0073
                writefile(fileprefix .. "LastLog.txt", "--[START OF LOG]--")
                function TimeConverter(b)
                    if b <= 9 then
                        local conv = "0" .. b
                        return conv
                    else
                        return b
                    end
                end
                getgenv().output = function(L)
                    local M = os.date("*t")["hour"]
                    local N = os.date("*t")["min"]
                    local O = os.date("*t")["sec"]
                    local P = Color3.fromRGB(255, 255, 255)
                    local Q = Instance.new("TextLabel", A)
                    Q.Text = "[" .. TimeConverter(M) .. ":" .. TimeConverter(N) .. ":" .. TimeConverter(O) .. "] " .. L
                    appendfile(
                        fileprefix .. "LastLog.txt",
                        "\n[" .. TimeConverter(M) .. ":" .. TimeConverter(N) .. ":" .. TimeConverter(O) .. "] " .. L
                    )
                    Q.Size = UDim2.new(0.005, 0, 0.001, 0)
                    Q.Position = UDim2.new(0, 0, .007 + K, 0)
                    Q.Font = Enum.Font.SourceSansSemibold
                    Q.TextColor3 = P
                    Q.TextStrokeTransparency = 0
                    Q.BackgroundTransparency = 1
                    Q.BackgroundColor3 = Color3.new(0, 0, 0)
                    Q.BorderSizePixel = 0
                    Q.BorderColor3 = Color3.new(0, 0, 0)
                    Q.FontSize = "Size14"
                    Q.TextXAlignment = Enum.TextXAlignment.Left
                    Q.ClipsDescendants = true
                    K = K + 0.0005
                end
                spawn(
                    function()
                        local R = false
                        R = not R
                        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
                        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                        SprintKey = Enum.KeyCode.LeftShift
                        localPlayer = game.Players.LocalPlayer
                        Camera = game.Workspace.CurrentCamera
                        Mouse = localPlayer:GetMouse()
                        UserInputService = game:GetService("UserInputService")
                        movePosition = Vector2.new(0, 0)
                        moveDirection = Vector3.new(0, 0, 0)
                        targetMovePosition = movePosition
                        lastRightButtonDown = Vector2.new(0, 0)
                        rightMouseButtonDown = false
                        targetFOV = 70
                        sprinting = false
                        sprintingSpeed = 3
                        keysDown = {}
                        moveKeys = {
                            [Enum.KeyCode.D] = Vector3.new(1, 0, 0),
                            [Enum.KeyCode.A] = Vector3.new(-1, 0, 0),
                            [Enum.KeyCode.S] = Vector3.new(0, 0, 1),
                            [Enum.KeyCode.W] = Vector3.new(0, 0, -1),
                            [Enum.KeyCode.E] = Vector3.new(0, 1, 0),
                            [Enum.KeyCode.Q] = Vector3.new(0, -1, 0)
                        }
                        Tween = function(S, T, U)
                            if U == 1 then
                                return T
                            else
                                if tonumber(S) then
                                    return S * (1 - U) + T * U
                                else
                                    return S:Lerp(T, U)
                                end
                            end
                        end
                        ClampVector3 = function(V, W, X)
                            return Vector3.new(
                                math.clamp(V.X, W.X, X.X),
                                math.clamp(V.Y, W.Y, X.Y),
                                math.clamp(V.Z, W.Z, X.Z)
                            )
                        end
                        UserInputService.InputChanged:connect(
                            function(Y)
                                if Y.UserInputType == Enum.UserInputType.MouseMovement then
                                    movePosition = movePosition + Vector2.new(Y.Delta.x, Y.Delta.y)
                                end
                            end
                        )
                        CalculateMovement = function()
                            local Z = Vector3.new(0, 0, 0)
                            for h, b in pairs(keysDown) do
                                Z = Z + (moveKeys[h] or Vector3.new(0, 0, 0))
                            end
                            return Z
                        end
                        Round = function(_, a0)
                            return math.floor(_ / a0 + .5) * a0
                        end
                        Input = function(G, a1)
                            if moveKeys[G.KeyCode] then
                                if G.UserInputState == Enum.UserInputState.Begin then
                                    keysDown[G.KeyCode] = true
                                elseif G.UserInputState == Enum.UserInputState.End then
                                    keysDown[G.KeyCode] = nil
                                end
                            else
                                if G.UserInputState == Enum.UserInputState.Begin then
                                    if G.UserInputType == Enum.UserInputType.MouseButton2 and R == true then
                                        rightMouseButtonDown = true
                                        lastRightButtonDown = Vector2.new(Mouse.X, Mouse.Y)
                                        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
                                    elseif G.KeyCode == Enum.KeyCode.Z then
                                        targetFOV = 20
                                    elseif G.KeyCode == SprintKey then
                                        sprinting = true
                                    end
                                else
                                    if G.UserInputType == Enum.UserInputType.MouseButton2 then
                                        rightMouseButtonDown = false
                                        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
                                    elseif G.KeyCode == Enum.KeyCode.Z then
                                        targetFOV = 70
                                    elseif G.KeyCode == SprintKey then
                                        sprinting = false
                                    end
                                end
                            end
                        end
                        Mouse.WheelForward:connect(
                            function()
                                Camera.CoordinateFrame = Camera.CoordinateFrame * CFrame.new(0, 0, -5)
                            end
                        )
                        Mouse.WheelBackward:connect(
                            function()
                                Camera.CoordinateFrame = Camera.CoordinateFrame * CFrame.new(-0, 0, 5)
                            end
                        )
                        UserInputService.InputBegan:connect(Input)
                        UserInputService.InputEnded:connect(Input)
                        game:GetService("RunService").RenderStepped:Connect(
                            function()
                                if R then
                                    local a2 = Mouse.Hit
                                    targetMovePosition = movePosition
                                    Camera.CoordinateFrame =
                                        CFrame.new(Camera.CoordinateFrame.p) *
                                        CFrame.fromEulerAnglesYXZ(
                                            -targetMovePosition.Y / 300,
                                            -targetMovePosition.X / 300,
                                            0
                                        ) *
                                        CFrame.new(CalculateMovement() * (({[true] = sprintingSpeed})[sprinting] or .5))
                                    Camera.FieldOfView = Tween(Camera.FieldOfView, targetFOV, .5)
                                    if rightMouseButtonDown then
                                        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
                                        movePosition =
                                            movePosition - (lastRightButtonDown - Vector2.new(Mouse.X, Mouse.Y))
                                        lastRightButtonDown = Vector2.new(Mouse.X, Mouse.Y)
                                    end
                                end
                            end
                        )
                        local a3 = 2
                        if getgenv().DefaultCam ~= nil then
                            a3 = getgenv().DefaultCam
                        end
                        local a4 =
                            loadstring(
                            game:HttpGet(
                                "https://raw.githubusercontent.com/banbuskox/dfhtyxvzexrxgfdzgzfdvfdz/main/jsdnfjdsfdjnsmvkjhlkslzLIB",
                                true
                            )
                        )()
                        local a5 = a4:CreateWindow("Camera")
                        a5:Button(
                            "Normal",
                            function()
                                game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                                game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                                game.Workspace.CurrentCamera.CameraType = "Follow"
                                a3 = 1
                            end
                        )
                        a5:Button(
                            "Follow Enemies (Default)",
                            function()
                                game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                                game.Workspace.CurrentCamera.CameraType = "Follow"
                                a3 = 2
                            end
                        )
                        a5:Button(
                            "Free Cam",
                            function()
                                a3 = 3
                                Camera.CameraType = Enum.CameraType.Scriptable
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                                game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
                            end
                        )
                        while wait() do
                            if a3 == 1 then
                                R = false
                            elseif a3 == 2 then
                                pcall(
                                    function()
                                        R = false
                                        local a6 = game:GetService("Workspace").NPCs:GetChildren()
                                        if #a6 ~= 0 then
                                            for h, b in pairs(game.Workspace.NPCs:GetChildren()) do
                                                if b:WaitForChild("HumanoidRootPart").CFrame.Y > -5 then
                                                    game.Workspace.Camera.CameraSubject = b.HumanoidRootPart
                                                    wait()
                                                    break
                                                else
                                                    game.Workspace.Camera.CameraSubject =
                                                        game:GetService("Workspace").Map.Paths["1"]["1"]
                                                    break
                                                end
                                            end
                                        else
                                            game.Workspace.Camera.CameraSubject =
                                                game:GetService("Workspace").Map.Paths["1"]["1"]
                                        end
                                    end
                                )
                            elseif a3 == 3 then
                                R = true
                            end
                        end
                    end
                )
            end
        )
    end
    spawn(
        function()
            if isgame() and getgenv().Debug then
                game.Workspace.Towers.ChildAdded:Connect(
                    function(b)
                        wait(1)
                        repeat
                            wait()
                        until tonumber(b.Name)
                        local a7 = Instance.new("BillboardGui")
                        a7.Parent = b:WaitForChild("HumanoidRootPart")
                        a7.Adornee = b:WaitForChild("HumanoidRootPart")
                        a7.StudsOffsetWorldSpace = Vector3.new(0, 2, 0)
                        a7.Size = UDim2.new(0, 250, 0, 50)
                        a7.AlwaysOnTop = true
                        local a8 = Instance.new("TextLabel")
                        a8.Parent = a7
                        a8.BackgroundTransparency = 1
                        a8.Text = b.Name
                        a8.Font = "Legacy"
                        a8.Size = UDim2.new(1, 0, 0, 70)
                        a8.TextSize = 52
                        a8.TextScaled = fals
                        a8.TextColor3 = Color3.new(0, 0, 0)
                        a8.TextStrokeColor3 = Color3.new(0, 0, 0)
                        a8.TextStrokeTransparency = 0.5
                        local a8 = Instance.new("TextLabel")
                        a8.Parent = a7
                        a8.BackgroundTransparency = 1
                        a8.Text = b.Name
                        a8.Font = "Legacy"
                        a8.Size = UDim2.new(1, 0, 0, 70)
                        a8.TextSize = 50
                        a8.TextScaled = false
                        a8.TextColor3 = Color3.new(1, 0, 0)
                        a8.TextStrokeColor3 = Color3.new(0, 0, 0)
                        a8.TextStrokeTransparency = 0.5
                    end
                )
            end
        end
    )
    if not isgame() then
        f:InvokeServer("Login", "Claim")
        f:InvokeServer("Session", "Search", "Login")
        if getgenv().AutoBuy then
            getgenv().status = "Buying crates..."
            local a9 = require(game:GetService("ReplicatedStorage").Assets.Crates[getgenv().Crate].Data)
            local aa, ab = a9.Price.Type, a9.Price.Value
            if aa == "Coins" then
                ltimes = math.floor(game.Players.LocalPlayer.Coins.Value / ab)
                if ltimes ~= 0 then
                    for c = 1, ltimes do
                        f:InvokeServer("Shop", "Purchase", {["Name"] = getgenv().Crate, ["Type"] = "Crate"})
                        print("Bought " .. getgenv().Crate .. " Crate")
                        wait(1)
                        table1 = {}
                        for ac, ad in next, game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(
                            "Inventory",
                            "Execute",
                            "Crates",
                            "Open",
                            {["Name"] = getgenv().Crate}
                        ) do
                            table.insert(table1, ad)
                        end
                        if readfile(fileprefix .. "Webhook (Logs).txt") ~= "WEBHOOK HERE" then
                            url = readfile(fileprefix .. "Webhook (Logs).txt")
                            local a9 = {
                                ["username"] = "TDS AutoStrat LOGGER",
                                ["embeds"] = {
                                    {
                                        ["title"] = "**LOG (" ..
                                            TimeConverter(os.date("*t").year) ..
                                                "-" ..
                                                    TimeConverter(os.date("*t").month) ..
                                                        "-" ..
                                                            TimeConverter(os.date("*t").day) ..
                                                                " " ..
                                                                    TimeConverter(os.date("*t").hour) ..
                                                                        ":" ..
                                                                            TimeConverter(os.date("*t").min) ..
                                                                                ":" ..
                                                                                    TimeConverter(os.date("*t").sec) ..
                                                                                        ")**",
                                        ["description"] = "**		------------ OPENED CRATE ------------**\n**Troop : **" ..
                                            table1[2] ..
                                                "\n**Skin : **" ..
                                                    table1[4] ..
                                                        "\n**Skin Rarity : **" ..
                                                            table1[3] .. "\n**Skin Price : **" .. tostring(table1[1]),
                                        ["type"] = "rich",
                                        ["color"] = tonumber(16744448)
                                    }
                                }
                            }
                            local ae = game:GetService("HttpService"):JSONEncode(a9)
                            local af = {["content-type"] = "application/json"}
                            request = http_request or request or HttpPost or syn.request
                            local ag = {Url = url, Body = ae, Method = "POST", Headers = af}
                            request(ag)
                            print("Webhook sent")
                        end
                    end
                end
            else
                warn(getgenv().Crate .. " Crate is for robux!")
            end
        end
    end
    function sell(ah)
        if isgame() then
            repeat
                wait()
            until game.Workspace.Towers:FindFirstChild(tostring(ah))
            f:InvokeServer("Troops", "Sell", {["Troop"] = game.Workspace.Towers[tostring(ah)]})
        end
    end
    function getTroopTypeCheck(ah)
        return ah.Replicator:GetAttribute("Type")
    end
    function getTroopType(ai)
        local a6 = getTroopTypeCheck(ai)
        if a6 then
            return a6
        else
            return "Unable to GET"
        end
    end
    function EquipTroop(ah)
        if not ah or ah == "Nil" then
            ah = "nil"
        end
        if tostring(ah) ~= "nil" and table.find(getgenv().troops5, tostring(ah)) == nil then
            game.Players.LocalPlayer:Kick(
                "\n\n---------- AUTO STRAT ----------\n\nError 2:\nYou don't own " ..
                    tostring(ah) .. " troop.\n\n---------- AUTO STRAT ----------\n"
            )
            wait(0.5)
            while true do
            end
        end
        g:FireServer("Inventory", "Execute", "Troops", "Add", {["Name"] = ah})
        if not getgenv().GoldenPerks then
            getgenv().GoldenPerks = {}
        end
        if table.find(getgenv().GoldenPerks, ah) then
            g:FireServer("Inventory", "Execute", "Troops", "GoldenPerks", {["Troop"] = ah, ["Enabled"] = true})
        else
            g:FireServer("Inventory", "Execute", "Troops", "GoldenPerks", {["Troop"] = ah, ["Enabled"] = false})
        end
        getgenv().status = "Equipped " .. ah
    end
    function CheckTroop(ah)
        if not ah or ah == "Nil" then
            ah = "nil"
        end
        if tostring(ah) ~= "nil" and table.find(getgenv().troops5, tostring(ah)) == nil then
            game.Players.LocalPlayer:Kick(
                "\n\n---------- AUTO STRAT ----------\n\nError 2:\nYou don't own " ..
                    tostring(ah) .. " troop.\n\n---------- AUTO STRAT ----------\n"
            )
            wait(0.5)
            while true do
            end
        end
    end
    function skip()
        if isgame() then
            f:InvokeServer("Waves", "Skip")
            getgenv().output("Skipped Wave")
        end
    end
    function conv(aj, ak)
        local al = aj
        local am = ak * 60
        local al = al + am
        return al
    end
    writefile(fileprefix .. "LastPrintLog.txt", "")
    function prints(an)
        appendfile(fileprefix .. "LastPrintLog.txt", tostring(an) .. "\n")
        print(tostring(an))
    end
    function ability(ah, ao)
        if isgame() then
            repeat
                wait()
            until game.Workspace.Towers:FindFirstChild(tostring(ah))
            f:InvokeServer(
                "Troops",
                "Abilities",
                "Activate",
                {["Troop"] = game.Workspace.Towers[tostring(ah)], ["Name"] = ao}
            )
            getgenv().output(
                "Used Ability (Troop " ..
                    getTroopType(game.Workspace.Towers[tostring(ah)]) ..
                        " With Number " .. tostring(ah) .. " Ability " .. ao .. ")"
            )
        end
    end
    writefile(fileprefix .. "LastStrat.txt", "")
    if getgenv().PotatoPC then
        appendfile(fileprefix .. "LastStrat.txt", "getgenv().PotatoPC = true\n")
    end
    if getgenv().Debug then
        appendfile(fileprefix .. "LastStrat.txt", "getgenv().Debug = true\n")
    end
    if getgenv().GoldenPerks then
        generateline = "getgenv().GoldenPerks = {"
        for c = 1, #getgenv().GoldenPerks do
            generateline = generateline .. '"' .. getgenv().GoldenPerks[c] .. '",'
        end
        generateline = generateline .. "}\n"
        appendfile(fileprefix .. "LastStrat.txt", generateline)
    end
    appendfile(
        fileprefix .. "LastStrat.txt",
        'local TDS = loadstring(game:HttpGet("https://raw.githubusercontent.com/banbuskox/dfhtyxvzexrxgfdzgzfdvfdz/main/ckmhjvskfkmsStratFun2", true))()\n'
    )
    function a:Map(ap, aq, ar)
        appendfile(fileprefix .. "LastStrat.txt", "TDS:Map('" .. ap .. "', '" .. tostring(aq) .. "', '" .. ar .. "')\n")
        getgenv().mapc = ap
        if not getgenv().Multiplayer or getgenv().Multiplayer and getgenv().PlayerType == "Host" then
            if ar == "Hardcore" and game:GetService("Players").LocalPlayer.Level.Value < 50 then
                game.Players.LocalPlayer:Kick(
                    "\n\n---------- AUTO STRAT ----------\n\nError 4:\nYou are not level 50!\nYou can't use Hardcore Mode strats!\n\n---------- AUTO STRAT ----------\n"
                )
                wait(0.5)
                while true do
                end
            end
            local as = 1
            if getgenv().Multiplayer and getgenv().PlayerType == "Host" then
                as = getgenv().PlayerNumber
                repeat
                    getgenv().status = "Waiting for plrs..."
                    wait()
                until getgenv().FindMap
            else
                if getgenv().Multiplayer and getgenv().PlayerType == "Player" then
                    getgenv().status = "Host control mode..."
                end
                spawn(
                    function()
                        if not isgame() and not getgenv().IsMultiStrat then
                            spawn(
                                function()
                                    getgenv().timer = 0
                                    while wait(1) do
                                        getgenv().timer = getgenv().timer + 1
                                    end
                                end
                            )
                            getgenv().repeating = true
                            while wait(1) do
                                if getgenv().repeating then
                                    getgenv().repeating = false
                                    local at = 0
                                    for r, au in pairs(game:GetService("Workspace").Elevators:GetChildren()) do
                                        local av = au.State.Map.Title
                                        local aw = require(au.Settings).Type
                                        local ax = au.State.Players
                                        if ar == nil then
                                            ar = "Survival"
                                        end
                                        if av.Value == ap and aw == ar then
                                            if ax.Value <= 0 then
                                                at = at + 1
                                                prints("Join attempt...")
                                                getgenv().status = "Joining..."
                                                f:InvokeServer("Elevators", "Enter", au)
                                                prints("Joined elavator...")
                                                getgenv().status = "Joined"
                                                if getgenv().Multiplayer and getgenv().Connection then
                                                    getgenv().Connection:Send(
                                                        '{"client":"Host","action":"Elevator","number":' ..
                                                            tostring(r) .. "}"
                                                    )
                                                end
                                                while wait() do
                                                    getgenv().status = "Joined (" .. au.State.Timer.Value .. "s)"
                                                        if au.State.Timer.Value == 0 and ay then
                                                            getgenv().status = "Teleporting..."
                                                            wait(60)
                                                            getgenv().status = "Teleport failed!"
                                                            f:InvokeServer("Elevators", "Leave")
                                                            if getgenv().Multiplayer and getgenv().Connection then
                                                                getgenv().Connection:Send(
                                                                    '{"client":"Host","action":"LElevator"}'
                                                                )
                                                            end
                                                        else
                                                            if getgenv().Multiplayer and getgenv().Connection then
                                                                getgenv().Connection:Send(
                                                                    '{"client":"Host","action":"LElevator"}'
                                                                )
                                                            end
                                                            getgenv().status = "Teleport failed! (Timer)"
                                                            f:InvokeServer("Elevators", "Leave")
                                                            getgenv().repeating = true
                                                        end
                                                    end
                                                    if av.Value == ap then
                                                        if aq then
                                                            if ax.Value > as then
                                                                --if getgenv().Multiplayer and getgenv().Connection then
                                                                    
                                                                --end
                                                               -- f:InvokeServer("Elevators", "Leave")
                                                                --prints("Someone joined, leaving elevator...")
                                                                --getgenv().status = "Someone joined..."
                                                                --getgenv().repeating = true
                                                                --break
                                                            elseif ax.Value == 0 then
                                                                wait(1)
                                                                if ax.Value == 0 then
                                                                    wait(1)
                                                                    if ax.Value == 0 then
                                                                        wait(1)
                                                                        if ax.Value == 0 then
                                                                            wait(1)
                                                                            if ax.Value == 0 then
                                                                                if
                                                                                    getgenv().Multiplayer and
                                                                                        getgenv().Connection
                                                                                 then
                                                                                    getgenv().Connection:Send(
                                                                                        '{"client":"Host","action":"LElevator"}'
                                                                                    )
                                                                                end
                                                                                prints("Error")
                                                                                getgenv().status =
                                                                                    "Error occured, check dev con"
                                                                                prints(
                                                                                    "Error occured, please open ticket on Money Maker Development discord server!"
                                                                                )
                                                                                f:InvokeServer("Elevators", "Leave")
                                                                                getgenv().repeating = true
                                                                                break
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    else
                                                        f:InvokeServer("Elevators", "Leave")
                                                        prints("Map changed while joining, leaving...")
                                                        if getgenv().Multiplayer and getgenv().Connection then
                                                            getgenv().Connection:Send(
                                                                '{"client":"Host","action":"LElevator"}'
                                                            )
                                                        end
                                                        getgenv().status = "Map changed..."
                                                        getgenv().repeating = true
                                                        break
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    if at == 0 then
                                        getgenv().repeating = true
                                        prints("Waiting for map...")
                                        getgenv().status = "Waiting for map..."
                                        if getgenv().timer >= 15 then
                                            getgenv().status = "Force changing maps..."
                                            getgenv().timer = 0
                                            for h, b in pairs(game:GetService("Workspace").Elevators:GetChildren()) do
                                                local aw = require(b.Settings).Type
                                                local ax = b.State.Players
                                                if aw == ar and ax.Value <= 0 then
                                                    f:InvokeServer("Elevators", "Enter", b)
                                                    wait(1)
                                                    f:InvokeServer("Elevators", "Leave")
                                                end
                                            end
                                            wait(0.6)
                                            f:InvokeServer("Elevators", "Leave")
                                            if getgenv().Multiplayer and getgenv().Connection then
                                                getgenv().Connection:Send('{"client":"Host","action":"LElevator"}')
                                            end
                                            wait(1)
                                        end
                                    end
                                end
                            end
                        end
                    end
                )
            end
        end
    end
    if not isfolder("TDS_AutoStrat") and not isfile(fileprefix .. "Webhook (Logs).txt") then
        makefolder("TDS_AutoStrat")
        writefile(fileprefix .. "Webhook (Logs).txt", "WEBHOOK HERE")
    end
    writefile("ulszcszu.txt", "KxjhVghCJH")
    function a:Mode(az)
        appendfile(fileprefix .. "LastStrat.txt", "TDS:Mode('" .. az .. "')\n")
        if isgame() then
            spawn(
                function()
                    local aA = nil
                    repeat
                        aA = f:InvokeServer("Difficulty", "Vote", az)
                        wait()
                    until aA
                    getgenv().output("Selected Mode (Mode " .. az .. ")")
                end
            )
        end
    end
    function a:Loadout(aB, aC, aD, aE, aF)
        getgenv().MapUsed = true
        if aB == nil then
            aB = "nil"
        end
        if aC == nil then
            aC = "nil"
        end
        if aD == nil then
            aD = "nil"
        end
        if aE == nil then
            aE = "nil"
        end
        if aF == nil then
            aF = "nil"
        end
        appendfile(
            fileprefix .. "LastStrat.txt",
            "TDS:Loadout('" .. aB .. "', '" .. aC .. "', '" .. aD .. "', '" .. aE .. "', '" .. aF .. "')\n"
        )
        getgenv().status = "Equipping Loadout..."
        getgenv().TroopNameNEW = aB
        getgenv().TroopName2NEW = aC
        getgenv().TroopName3NEW = aD
        getgenv().TroopName4NEW = aE
        getgenv().TroopName5NEW = aF
        getgenv().troops5 = {}
        for h, b in next, game.ReplicatedStorage.RemoteFunction:InvokeServer("Session", "Search", "Inventory.Troops") do
            table.insert(getgenv().troops5, h)
        end
        CheckTroop(aB)
        CheckTroop(aC)
        CheckTroop(aD)
        CheckTroop(aE)
        CheckTroop(aF)
        if not isgame() and not getgenv().IsMultiStrat then
            for ac, ad in next, game.ReplicatedStorage.RemoteFunction:InvokeServer(
                "Session",
                "Search",
                "Inventory.Troops"
            ) do
                if ad.Equipped then
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(
                        "Inventory",
                        "Execute",
                        "Troops",
                        "Remove",
                        {["Name"] = ac}
                    )
                    getgenv().status = "Removed " .. ac
                end
            end
            EquipTroop(aB)
            EquipTroop(aC)
            EquipTroop(aD)
            EquipTroop(aE)
            EquipTroop(aF)
            getgenv().status = "Loadout Equipped"
        end
    end
    getgenv().Placing = false
    getgenv().Upgrading = false
    local aG = {}
    function a:Place(ah, aH, aI, aJ, aK, ak, aj, aL, aM, aN, aO, aP)
        spawn(
            function()
                if not aL then
                    aL = false
                end
                if aL then
                    appendfile(
                        fileprefix .. "LastStrat.txt",
                        "TDS:Place('" ..
                            ah ..
                                "', " ..
                                    aH ..
                                        ", " ..
                                            aI ..
                                                ", " ..
                                                    aJ ..
                                                        ", " ..
                                                            aK ..
                                                                ", " ..
                                                                    ak ..
                                                                        ", " ..
                                                                            aj ..
                                                                                ", " ..
                                                                                    tostring(aL) ..
                                                                                        ", " ..
                                                                                            aM ..
                                                                                                ", " ..
                                                                                                    aN ..
                                                                                                        ", " ..
                                                                                                            aO .. ")\n"
                    )
                else
                    appendfile(
                        fileprefix .. "LastStrat.txt",
                        "TDS:Place('" ..
                            ah ..
                                "', " ..
                                    aH .. ", " .. aI .. ", " .. aJ .. ", " .. aK .. ", " .. ak .. ", " .. aj .. ")\n"
                    )
                end
                if isgame() then
                    repeat
                        wait()
                    until tonumber(stateRep:GetAttribute("Wave")) == aK and e.State.Timer.Time.Value == conv(aj, ak) or
                        tonumber(stateRep:GetAttribute("Wave")) == aK and e.State.Timer.Time.Value + 1 == conv(aj, ak)
                    table.insert(aG, ah)
                    table.insert(aG, aH)
                    table.insert(aG, aI)
                    table.insert(aG, aJ)
                    repeat
                        wait()
                    until getgenv().Placing == false
                    getgenv().Placing = true
                    local aQ = nil
                    local aR = 0
                    getgenv().PassPlace = false
                    repeat
                        if aL then
                            aQ =
                                f:InvokeServer(
                                "Troops",
                                "Place",
                                ah,
                                {["Rotation"] = CFrame.new(aM, aN, aO), ["Position"] = Vector3.new(aH, aI, aJ)}
                            )
                        elseif not aL then
                            aQ =
                                f:InvokeServer(
                                "Troops",
                                "Place",
                                ah,
                                {
                                    ["Rotation"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                                    ["Position"] = Vector3.new(aH, aI, aJ)
                                }
                            )
                        end
                    until aQ or getgenv().PassPlace == true
                    getgenv().Placing = false
                    getgenv().output("Placed " .. ah)
                    getgenv().PassPlace = false
                end
            end
        )
    end
    function a:Upgrade(aS, aK, ak, aj, aP)
        spawn(
            function()
                appendfile(
                    fileprefix .. "LastStrat.txt",
                    "TDS:Upgrade(" .. aS .. ", " .. aK .. ", " .. ak .. ", " .. aj .. ")\n"
                )
                if isgame() then
                    local ah = aS
                    repeat
                        wait()
                    until tonumber(stateRep:GetAttribute("Wave")) == aK and e.State.Timer.Time.Value == conv(aj, ak) and
                        game.Workspace.Towers:FindFirstChild(tostring(ah)) or
                        tonumber(stateRep:GetAttribute("Wave")) == aK and e.State.Timer.Time.Value + 1 == conv(aj, ak) and
                            game.Workspace.Towers:FindFirstChild(tostring(ah))
                    repeat
                        wait()
                    until getgenv().Upgrading == false
                    getgenv().Upgrading = true
                    if not game.Workspace.Towers:FindFirstChild(tostring(ah)) then
                        getgenv().output("Warning! Troop with id " .. ah .. " has not been placed!")
                        local aQ = nil
                        local aR = 0
                        repeat
                            aQ =
                                f:InvokeServer(
                                "Troops",
                                "Place",
                                aG[aS],
                                {
                                    ["Rotation"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                                    ["Position"] = Vector3.new(aG[aS + 1], aG[aS + 2], aG[aS + 3])
                                }
                            )
                        until aQ
                        getgenv().output("Placed " .. aG[aS])
                    end
                    local aT = nil
                    repeat
                        aT =
                            f:InvokeServer(
                            "Troops",
                            "Upgrade",
                            "Set",
                            {["Troop"] = game.Workspace.Towers:WaitForChild(tostring(ah))}
                        )
                        wait()
                    until aT
                    getgenv().Upgrading = false
                    getgenv().output(
                        "Upgraded (Troop " ..
                            getTroopType(game.Workspace.Towers[tostring(aS)]) .. " With Number " .. tostring(ah) .. ")"
                    )
                end
            end
        )
    end
    function a:Sell(aS, aK, ak, aj, aP)
        spawn(
            function()
                appendfile(
                    fileprefix .. "LastStrat.txt",
                    "TDS:Sell(" .. aS .. ", " .. aK .. ", " .. ak .. ", " .. aj .. ")\n"
                )
                if isgame() then
                    repeat
                        wait()
                    until tonumber(stateRep:GetAttribute("Wave")) == aK and e.State.Timer.Time.Value == conv(aj, ak) or
                        tonumber(stateRep:GetAttribute("Wave")) == aK and e.State.Timer.Time.Value + 1 == conv(aj, ak)
                    getgenv().output(
                        "Sold (Troop " ..
                            getTroopType(game.Workspace.Towers[tostring(aS)]) .. " With Number " .. tostring(aS) .. ")"
                    )
                    sell(aS)
                end
            end
        )
    end
    function a:Skip(aK, ak, aj)
        spawn(
            function()
                appendfile(fileprefix .. "LastStrat.txt", "TDS:Skip(" .. aK .. ", " .. ak .. ", " .. aj .. ")\n")
                if isgame() then
                    repeat
                        wait()
                    until tonumber(stateRep:GetAttribute("Wave")) == aK and e.State.Timer.Time.Value == conv(aj, ak) or
                        tonumber(stateRep:GetAttribute("Wave")) == aK and e.State.Timer.Time.Value + 1 == conv(aj, ak)
                    skip()
                end
            end
        )
    end
    function a:Ability(aS, ao, aK, ak, aj)
        spawn(
            function()
                appendfile(
                    fileprefix .. "LastStrat.txt",
                    "TDS:Ability(" .. aS .. ', "' .. ao .. '", ' .. aK .. ", " .. ak .. ", " .. aj .. ")\n"
                )
                if isgame() then
                    repeat
                        wait()
                    until tonumber(stateRep:GetAttribute("Wave")) == aK and e.State.Timer.Time.Value == conv(aj, ak) or
                        tonumber(stateRep:GetAttribute("Wave")) == aK and e.State.Timer.Time.Value + 1 == conv(aj, ak)
                    ability(aS, ao)
                end
            end
        )
    end
    function a:AutoChain(aU, aV, aW, aK, ak, aj)
        spawn(
            function()
                appendfile(
                    fileprefix .. "LastStrat.txt",
                    "TDS:AutoChain(" ..
                        aU .. ", " .. aV .. ", " .. aW .. ", " .. aK .. ", " .. ak .. ", " .. aj .. ")\n"
                )
                if isgame() then
                    repeat
                        wait()
                    until tonumber(stateRep:GetAttribute("Wave")) == aK and e.State.Timer.Time.Value == conv(aj, ak) or
                        tonumber(stateRep:GetAttribute("Wave")) == aK and e.State.Timer.Time.Value + 1 == conv(aj, ak)
                    repeat
                        wait()
                    until game:GetService("Workspace").Towers:FindFirstChild(tostring(aU))
                    repeat
                        wait()
                    until game:GetService("Workspace").Towers:FindFirstChild(tostring(aV))
                    repeat
                        wait()
                    until game:GetService("Workspace").Towers:FindFirstChild(tostring(aW))
                    if getTroopType(game.Workspace.Towers[tostring(aU)]) ~= "Commander" then
                        getgenv().output("Error, troop with id " .. aU .. " is not Commander!")
                    end
                    if getTroopType(game.Workspace.Towers[tostring(aV)]) ~= "Commander" then
                        getgenv().output("Error, troop with id " .. aV .. " is not Commander!")
                    end
                    if getTroopType(game.Workspace.Towers[tostring(aW)]) ~= "Commander" then
                        getgenv().output("Error, troop with id " .. aW .. " is not Commander!")
                    end
                    function Act(aX)
                        if game:GetService("Workspace").Towers:FindFirstChild(tostring(aX)) then
                            local ad = game:GetService("Workspace").Towers:FindFirstChild(tostring(aX))
                            if
                                not ad.Replicator.Stuns:GetAttribute("1") and not ad.Replicator.Stuns:GetAttribute("2") and
                                    not ad.Replicator.Stuns:GetAttribute("3")
                             then
                                game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(
                                    "Troops",
                                    "Abilities",
                                    "Activate",
                                    {
                                        ["Troop"] = game:GetService("Workspace").Towers:FindFirstChild(tostring(aX)),
                                        ["Name"] = "Call Of Arms"
                                    }
                                )
                            else
                                getgenv().output("Detected stun on commander " .. tostring(aX) .. ", waiting...")
                                repeat
                                    wait()
                                until not ad.Replicator.Stuns:GetAttribute("1") and
                                    not ad.Replicator.Stuns:GetAttribute("2") and
                                    not ad.Replicator.Stuns:GetAttribute("3")
                                game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(
                                    "Troops",
                                    "Abilities",
                                    "Activate",
                                    {
                                        ["Troop"] = game:GetService("Workspace").Towers:FindFirstChild(tostring(aX)),
                                        ["Name"] = "Call Of Arms"
                                    }
                                )
                            end
                        else
                            getgenv().output("Commander " .. tostring(aX) .. " removed, aborting AutoChain...")
                            getgenv().breaks = true
                        end
                    end
                    getgenv().output(
                        "Activated AutoChain (Troops " ..
                            tostring(aU) .. ", " .. tostring(aV) .. ", " .. tostring(aW) .. ")"
                    )
                    while wait() do
                        if getgenv().breaks then
                            break
                        end
                        Act(aU)
                        wait(10.01)
                        Act(aV)
                        wait(10.01)
                        Act(aW)
                        wait(10.01)
                    end
                    getgenv().breaks = false
                end
            end
        )
    end
    function a:Target(aS, aK, ak, aj)
        spawn(
            function()
                appendfile(
                    fileprefix .. "LastStrat.txt",
                    "TDS:Target(" .. aS .. ", " .. aK .. ", " .. ak .. ", " .. aj .. ")\n"
                )
                if isgame() then
                    repeat
                        wait()
                    until tonumber(stateRep:GetAttribute("Wave")) == aK and e.State.Timer.Time.Value == conv(aj, ak) or
                        tonumber(stateRep:GetAttribute("Wave")) == aK and e.State.Timer.Time.Value + 1 == conv(aj, ak)
                    repeat
                        wait()
                    until game.Workspace.Towers:FindFirstChild(tostring(aS))
                    f:InvokeServer(
                        "Troops",
                        "Target",
                        "Set",
                        {["Troop"] = game.Workspace.Towers:WaitForChild(tostring(aS))}
                    )
                    getgenv().output(
                        "Changed Target (Troop " ..
                            getTroopType(game.Workspace.Towers[tostring(aS)]) .. " With Number " .. tostring(aS) .. ")"
                    )
                end
            end
        )
    end
    if isgame() then
        did = false
        while wait() do
            for h, b in pairs(game.CoreGui:GetDescendants()) do
                if b:IsA("TextLabel") and b.Text == "Camera" then
                    b.Parent.Position = UDim2.new(0, 220, 0, 0)
                    did = true
                    break
                end
            end
            if did then
                break
            end
        end
    end
    spawn(
        function()
            if not game.Players.LocalPlayer:IsInGroup(4914494) then
                setclipboard("https://www.roblox.com/groups/4914494/Paradoxum-Games")
                game.Players.LocalPlayer:Kick(
                    "\n\n---------- AUTO STRAT ----------\n\nError 5:\nYou need to joing Paradoxum Games group in order to use autostrats (link copied to clipboard)\n\n---------- AUTO STRAT ----------\n"
                )
                wait(0.5)
                while true do
                end
            end
            while wait(1) do
                for h, b in pairs(game.CoreGui:GetDescendants()) do
                    if
                        b:IsA("TextButton") and string.find(string.lower(b.Text), "afk") or
                            b:IsA("TextLabel") and string.find(string.lower(b.Text), "afk") and
                                b.Parent.Parent.Parent.Parent.Name ~= "ChatChannelParentFrame" and
                                b.Name ~= "PlayerName" and
                                b.Parent.Parent.Parent.Name ~= "BubbleChatList"
                     then
                        game.Players.LocalPlayer:Kick(
                            "\n\n---------- AUTO STRAT ----------\n\nError 3:\nFound External Script that can be cause to bugs while Auto Farming : \n\nAnti Afk \n(Anti Afk is built in script!)\n\n---------- AUTO STRAT ----------\n"
                        )
                        getgenv().ReportError(
                            "3",
                            "Found External Script in " .. b:GetFullName() .. " , Text was : " .. b.Text
                        )
                        wait(0.5)
                        while true do
                        end
                    end
                end
                for h, b in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                    if
                        b:IsA("TextButton") and string.find(string.lower(b.Text), "afk") or
                            b:IsA("TextLabel") and string.find(string.lower(b.Text), "afk") and
                                b.Parent.Parent.Parent.Parent.Name ~= "ChatChannelParentFrame" and
                                b.Parent.Parent.Parent.Parent.Parent.Name ~= "ChatChannelParentFrame" and
                                b.Name ~= "PlayerName" and
                                b.Parent.Parent.Parent.Name ~= "BubbleChatList"
                     then
                        game.Players.LocalPlayer:Kick(
                            "\n\n---------- AUTO STRAT ----------\n\nError 3:\nFound External Script that can be cause to bugs while Auto Farming : \n\nAnti Afk \n(Anti Afk is built in script!)\n\n---------- AUTO STRAT ----------\n"
                        )
                        getgenv().ReportError(
                            "3",
                            "Found External Script in " .. b:GetFullName() .. " , Text was : " .. b.Text
                        )
                        wait(0.5)
                        while true do
                        end
                    end
                end
            end
        end
    )
end
return a
