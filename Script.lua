-- Script
-- EMOTE/DANCE GUI SYSTEM
-- Letakkan script ini di StarterGui sebagai LocalScript

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- DATA EMOTE/DANCE
local EmoteData = {
    Emotes = {
        ["Laba Laba Palembang"] = "rbxassetid://140296101132217",
        ["Kejang"] = "rbxassetid://98719422024341",
        ["Asian Squat"] = "rbxassetid://75040559357535",
        ["Swinging"] = "rbxassetid://78512680384025",
        ["Trendy Nicki Leg"] = "rbxassetid://140708130041039",
        ["Cute Hips"] = "rbxassetid://117181705578424",
        ["Cute Bossy Girl"] = "rbxassetid://115257437995638",
        ["Cute Head Tilt"] = "rbxassetid://101992567202472",
        ["Making face"] = "rbxassetid://89535391366809",
        ["Wall Aura Farm"] = "rbxassetid://97751249599208",
        ["Nonchalant Sit"] = "rbxassetid://126899447275562",
        ["Cute Feet Kicking"] = "rbxassetid://124287251935400",
        ["Sweet Hug V1"] = "rbxassetid://105797917228398",
        ["Sweet Hug V2"] = "rbxassetid://118264035209903",
        ["Side Hug"] = "rbxassetid://89930880557935",
        ["Hugging a Plushie"] = "rbxassetid://71421245788594",
        ["Sit 1"] = "rbxassetid://126725335305495",
        ["Sit 2"] = "rbxassetid://90840348750437",
        ["Sit 3"] = "rbxassetid://117639474362201",
        ["Sit 4"] = "rbxassetid://101327705629630",
        ["Sit 5"] = "rbxassetid://140296034263665",
        ["Thank You Bow"] = "rbxassetid://116243979368109",
        ["Courtly Bow"] = "rbxassetid://117913449580238",
    },
    Dances = {
        ["Mosh"] = "rbxassetid://96147994216119",
        ["KedatKedut"] = "rbxassetid://124487025832160",
        ["GetSturdy"] = "rbxassetid://122884053950359",
        ["RatDance"] = "rbxassetid://96490284184113",
        ["GangnamStyle"] = "rbxassetid://131104967711844",
        ["Popular"] = "rbxassetid://93062298566806",
        ["Sturdy Dance"] = "rbxassetid://85608190427964",
        ["daja boys 2!"] = "rbxassetid://127988412161324",
        ["Baddie Hips"] = "rbxassetid://90802740360125",
        ["Caramelldansen"] = "rbxassetid://73785690856046",
        ["I'll dance with my hands"] = "rbxassetid://76057035366582",
        ["Louisiana Jigg"] = "rbxassetid://126597745883758",
        ["Default Dance"] = "rbxassetid://101011728520473",
        ["Spongebob Shuffle"] = "rbxassetid://136292253730425",
        ["Lady Gaga"] = "rbxassetid://126216621030394",
        ["Rambunctious"] = "rbxassetid://98593519635326",
        ["daja boys 1"] = "rbxassetid://139110277540140",
        ["populer"] = "rbxassetid://86129126182531",
        ["(Everybody Loves Me)"] = "rbxassetid://93650537970037",
        ["Garry Dance"] = "rbxassetid://124896171012585",
        ["Sturdy Dance - Ice Spice"] = "rbxassetid://99558490932154",
        ["NYC Sturdy Dance"] = "rbxassetid://130746977164633",
        ["PhutHon"] = "rbxassetid://88038962894440",
        ["Jojo Torture Dance"] = "rbxassetid://100784037937970",
        ["Rampage (Lonely Lonely)"] = "rbxassetid://114499509000839",
        ["Rampage (Lonely Lonely 2)"] = "rbxassetid://79405597471549",
        ["Gap x Katseye - Better Than yours"] = "rbxassetid://107553826038610",
        ["TWICE - The Feels"] = "rbxassetid://103694443166209",
        ["Katseye - Gnarly Pop"] = "rbxassetid://93413174711404",
        ["Katseye - Gnarly Pop 2"] = "rbxassetid://98056495356917",
        ["rollie"] = "rbxassetid://138097548542741",
        ["Electro Shuffle"] = "rbxassetid://103948800984170",
        ["Electro Swing"] = "rbxassetid://138785676658772",
        ["xaviersobased"] = "rbxassetid://84572090574108",
        ["watch it move!"] = "rbxassetid://78333606097155",
        ["GRIMES - Oblivion"] = "rbxassetid://117081427175655",
        ["C Walk"] = "rbxassetid://131775634784551",
        ["C Walk 2"] = "rbxassetid://102888591476512",
        ["P.B.J.T."] = "rbxassetid://108848553639889",
        ["Silly Cat AI Dance"] = "rbxassetid://137982048325793",
        ["KATSEYE - Gnarly"] = "rbxassetid://98056495356917",
        ["KATSEYE - Gabriela"] = "rbxassetid://136643585043675",
        ["Goat-Dance"] = "rbxassetid://71320743507209",
        ["Ashi ashi dance"] = "rbxassetid://91762541141326",
        ["Terminal Dance"] = "rbxassetid://93765829517890",
        ["Robot Dance"] = "rbxassetid://96973812082139",
        ["goyang inul"] = "rbxassetid://76500920391780",
        ["Macarena Dance"] = "rbxassetid://106534063593882",
        ["Hellfire Dance"] = "rbxassetid://107313690769829",
        ["BrooklynBloodPop Dance"] = "rbxassetid://81561018781530",
        ["Single Ladies Dance"] = "rbxassetid://76755277656449",
        ["Druski Dance"] = "rbxassetid://93236786723507",
        ["Dance Fever"] = "rbxassetid://106075698225441",
        ["Concert dance"] = "rbxassetid://119159857703733",
        ["kawaii hop dance"] = "rbxassetid://123540582980014",
        ["Merengue Dominican Dance"] = "rbxassetid://79852594163312",
        ["GloRilla -  Dance"] = "rbxassetid://106767161005528",
        ["Rah Tah Tah"] = "rbxassetid://106936760817825",
        ["Poke Dance"] = "rbxassetid://102446884665047",
        ["Criss-Cross Dance"] = "rbxassetid://81733449586987",
        ["Lunar Party Dance"] = "rbxassetid://80021606349551",
        ["paradisio bailando lucky star"] = "rbxassetid://131304643912471",
        ["Too Litty Dance"] = "rbxassetid://125626767111842",
        ["Druski Shuffle Dance"] = "rbxassetid://72133410231288",
        ["Dabi Dance"] = "rbxassetid://77941099891112",
        ["Dance HoodTrap"] = "rbxassetid://76736051844030",
        ["Pop It Fa Blitz Dance"] = "rbxassetid://98127320069294",
        ["Festa No Brasil"] = "rbxassetid://82516443009513",
        ["Rakai"] = "rbxassetid://88182429670590",
        ["Confess Your Love"] = "rbxassetid://108873777157620",
        ["Jamal Dance"] = "rbxassetid://114463328960354",
        ["Brazilian Funk"] = "rbxassetid://140219184038687",
        ["Hand Pull Shake"] = "rbxassetid://102845316684543",
        ["Jabba Switchway"] = "rbxassetid://116714406076290",
        ["Street Glide"] = "rbxassetid://82378883639086",
        ["Money Hop Spin"] = "rbxassetid://75672330899301",
        ["Coffin Dance"] = "rbxassetid://126771729094882",
        ["Chanel"] = "rbxassetid://119696276842469",
        ["Spide Jersey"] = "rbxassetid://72972341979988"
    }
}

local favorites = {}
local currentTab = "Emotes"
local currentSpeed = 1
local currentAnim = nil
local searchText = ""

-- BUAT GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EmoteGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player.PlayerGui

-- MAIN FRAME
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 320, 0, 450)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = false
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- TOMBOL TOGGLE (BUKA/TUTUP) - ATAS KANAN
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "ToggleButton"
toggleBtn.Size = UDim2.new(0, 60, 0, 60)
toggleBtn.Position = UDim2.new(1, -150, 0, 10)
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
toggleBtn.Text = "🎭"
toggleBtn.TextSize = 28
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Parent = screenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(1, 0)
toggleCorner.Parent = toggleBtn

toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- HEADER
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.6, -20, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "EMOTES & DANCES"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(0.4, -10, 1, 0)
creditLabel.Position = UDim2.new(0.6, 0, 0, 0)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "byXuanVoid"
creditLabel.TextColor3 = Color3.fromRGB(150, 150, 160)
creditLabel.TextSize = 12
creditLabel.Font = Enum.Font.GothamSemibold
creditLabel.TextXAlignment = Enum.TextXAlignment.Right
creditLabel.Parent = header

-- TABS
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(1, -20, 0, 40)
tabFrame.Position = UDim2.new(0, 10, 0, 60)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = mainFrame

local emotesTab = Instance.new("TextButton")
emotesTab.Size = UDim2.new(0.3, -5, 1, 0)
emotesTab.Position = UDim2.new(0, 0, 0, 0)
emotesTab.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
emotesTab.Text = "EMOTES"
emotesTab.TextColor3 = Color3.fromRGB(255, 255, 255)
emotesTab.TextSize = 14
emotesTab.Font = Enum.Font.GothamBold
emotesTab.Parent = tabFrame

local dancesTab = Instance.new("TextButton")
dancesTab.Size = UDim2.new(0.3, -5, 1, 0)
dancesTab.Position = UDim2.new(0.33, 0, 0, 0)
dancesTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
dancesTab.Text = "DANCES"
dancesTab.TextColor3 = Color3.fromRGB(255, 255, 255)
dancesTab.TextSize = 14
dancesTab.Font = Enum.Font.GothamBold
dancesTab.Parent = tabFrame

local favTab = Instance.new("TextButton")
favTab.Size = UDim2.new(0.3, -5, 1, 0)
favTab.Position = UDim2.new(0.66, 0, 0, 0)
favTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
favTab.Text = "⭐ FAV"
favTab.TextColor3 = Color3.fromRGB(255, 255, 255)
favTab.TextSize = 14
favTab.Font = Enum.Font.GothamBold
favTab.Parent = tabFrame

for _, tab in pairs({emotesTab, dancesTab, favTab}) do
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 8)
    tabCorner.Parent = tab
end

-- SEARCH BAR
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -20, 0, 35)
searchBox.Position = UDim2.new(0, 10, 0, 110)
searchBox.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
searchBox.PlaceholderText = "Search..."
searchBox.Text = ""
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
searchBox.TextSize = 14
searchBox.Font = Enum.Font.Gotham
searchBox.ClearTextOnFocus = false
searchBox.Parent = mainFrame

local searchCorner = Instance.new("UICorner")
searchCorner.CornerRadius = UDim.new(0, 8)
searchCorner.Parent = searchBox

-- SCROLL FRAME
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -20, 0, 240)
scrollFrame.Position = UDim2.new(0, 10, 0, 155)
scrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 6
scrollFrame.Parent = mainFrame

local scrollCorner = Instance.new("UICorner")
scrollCorner.CornerRadius = UDim.new(0, 8)
scrollCorner.Parent = scrollFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 5)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = scrollFrame

-- SPEED CONTROL
local speedFrame = Instance.new("Frame")
speedFrame.Size = UDim2.new(1, -20, 0, 40)
speedFrame.Position = UDim2.new(0, 10, 1, -50)
speedFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
speedFrame.BorderSizePixel = 0
speedFrame.Parent = mainFrame

local speedCorner = Instance.new("UICorner")
speedCorner.CornerRadius = UDim.new(0, 8)
speedCorner.Parent = speedFrame

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 80, 1, 0)
speedLabel.Position = UDim2.new(0, 10, 0, 0)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed: 1x"
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.TextSize = 14
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = speedFrame

-- TOMBOL SPEED (GANTI SLIDER JADI TOMBOL + - )
local speedBtnFrame = Instance.new("Frame")
speedBtnFrame.Size = UDim2.new(0, 120, 0, 30)
speedBtnFrame.Position = UDim2.new(1, -130, 0.5, -15)
speedBtnFrame.BackgroundTransparency = 1
speedBtnFrame.Parent = speedFrame

local minusBtn = Instance.new("TextButton")
minusBtn.Size = UDim2.new(0, 35, 1, 0)
minusBtn.Position = UDim2.new(0, 0, 0, 0)
minusBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
minusBtn.Text = "-"
minusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minusBtn.TextSize = 20
minusBtn.Font = Enum.Font.GothamBold
minusBtn.Parent = speedBtnFrame

local minusCorner = Instance.new("UICorner")
minusCorner.CornerRadius = UDim.new(0, 6)
minusCorner.Parent = minusBtn

local speedValueLabel = Instance.new("TextLabel")
speedValueLabel.Size = UDim2.new(0, 40, 1, 0)
speedValueLabel.Position = UDim2.new(0, 40, 0, 0)
speedValueLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
speedValueLabel.Text = "1.0x"
speedValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedValueLabel.TextSize = 13
speedValueLabel.Font = Enum.Font.GothamBold
speedValueLabel.Parent = speedBtnFrame

local speedValueCorner = Instance.new("UICorner")
speedValueCorner.CornerRadius = UDim.new(0, 6)
speedValueCorner.Parent = speedValueLabel

local plusBtn = Instance.new("TextButton")
plusBtn.Size = UDim2.new(0, 35, 1, 0)
plusBtn.Position = UDim2.new(0, 85, 0, 0)
plusBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
plusBtn.Text = "+"
plusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
plusBtn.TextSize = 20
plusBtn.Font = Enum.Font.GothamBold
plusBtn.Parent = speedBtnFrame

local plusCorner = Instance.new("UICorner")
plusCorner.CornerRadius = UDim.new(0, 6)
plusCorner.Parent = plusBtn

-- FUNGSI UPDATE SPEED
local function updateSpeed(newSpeed)
    currentSpeed = math.clamp(newSpeed, 0.25, 2)
    speedLabel.Text = "Speed: " .. string.format("%.1f", currentSpeed) .. "x"
    speedValueLabel.Text = string.format("%.1f", currentSpeed) .. "x"
    
    if currentAnim then
        currentAnim:AdjustSpeed(currentSpeed)
    end
end

-- TOMBOL SPEED + -
minusBtn.MouseButton1Click:Connect(function()
    updateSpeed(currentSpeed - 0.25)
end)

plusBtn.MouseButton1Click:Connect(function()
    updateSpeed(currentSpeed + 0.25)
end)

-- FUNGSI MAIN EMOTE/DANCE
local function playEmote(animId)
    if currentAnim then
        currentAnim:Stop()
    end
    
    local anim = Instance.new("Animation")
    anim.AnimationId = animId
    
    currentAnim = humanoid:LoadAnimation(anim)
    currentAnim:Play()
    currentAnim:AdjustSpeed(currentSpeed)
end

-- FUNGSI UPDATE LIST
local function updateList()
    for _, child in pairs(scrollFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    local data = {}
    if currentTab == "Favorites" then
        for name, id in pairs(favorites) do
            data[name] = id
        end
    elseif currentTab == "Emotes" then
        data = EmoteData.Emotes
    else
        data = EmoteData.Dances
    end
    
    local yPos = 0
    for name, id in pairs(data) do
        if searchText == "" or string.find(string.lower(name), string.lower(searchText)) then
            local itemFrame = Instance.new("Frame")
            itemFrame.Size = UDim2.new(1, -10, 0, 40)
            itemFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            itemFrame.BorderSizePixel = 0
            itemFrame.Parent = scrollFrame
            
            local itemCorner = Instance.new("UICorner")
            itemCorner.CornerRadius = UDim.new(0, 6)
            itemCorner.Parent = itemFrame
            
            local nameBtn = Instance.new("TextButton")
            nameBtn.Size = UDim2.new(1, -50, 1, 0)
            nameBtn.Position = UDim2.new(0, 10, 0, 0)
            nameBtn.BackgroundTransparency = 1
            nameBtn.Text = name
            nameBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            nameBtn.TextSize = 13
            nameBtn.Font = Enum.Font.Gotham
            nameBtn.TextXAlignment = Enum.TextXAlignment.Left
            nameBtn.Parent = itemFrame
            
            nameBtn.MouseButton1Click:Connect(function()
                playEmote(id)
            end)
            
            local favBtn = Instance.new("TextButton")
            favBtn.Size = UDim2.new(0, 35, 0, 35)
            favBtn.Position = UDim2.new(1, -40, 0.5, -17.5)
            favBtn.BackgroundTransparency = 1
            favBtn.Text = favorites[name] and "⭐" or "☆"
            favBtn.TextColor3 = Color3.fromRGB(255, 200, 0)
            favBtn.TextSize = 20
            favBtn.Parent = itemFrame
            
            favBtn.MouseButton1Click:Connect(function()
                if favorites[name] then
                    favorites[name] = nil
                    favBtn.Text = "☆"
                else
                    favorites[name] = id
                    favBtn.Text = "⭐"
                end
            end)
            
            yPos = yPos + 45
        end
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos)
end

-- TAB SWITCHING
emotesTab.MouseButton1Click:Connect(function()
    currentTab = "Emotes"
    emotesTab.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
    dancesTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    favTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    updateList()
end)

dancesTab.MouseButton1Click:Connect(function()
    currentTab = "Dances"
    emotesTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    dancesTab.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
    favTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    updateList()
end)

favTab.MouseButton1Click:Connect(function()
    currentTab = "Favorites"
    emotesTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    dancesTab.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    favTab.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
    updateList()
end)

-- SEARCH
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    searchText = searchBox.Text
    updateList()
end)

-- INIT
updateList()