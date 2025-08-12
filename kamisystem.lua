-- 卡密系统
local correctKey = "ayu"
local isVerified = false

local gui = Instance.new("ScreenGui")
gui.Name = "KeySystem"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Text = "请输入卡密"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255,255,255)

local input = Instance.new("TextBox", frame)
input.PlaceholderText = "输入卡密..."
input.Size = UDim2.new(0.8, 0, 0, 35)
input.Position = UDim2.new(0.1, 0, 0.45, 0)
input.Text = ""
input.Font = Enum.Font.SourceSans
input.TextSize = 20
input.TextColor3 = Color3.fromRGB(0,0,0)
input.BackgroundColor3 = Color3.fromRGB(255,255,255)
input.BorderSizePixel = 0

local tips = Instance.new("TextLabel", frame)
tips.Text = ""
tips.Font = Enum.Font.SourceSansItalic
tips.TextSize = 18
tips.Size = UDim2.new(1, 0, 0, 20)
tips.Position = UDim2.new(0, 0, 0.8, 0)
tips.BackgroundTransparency = 1
tips.TextColor3 = Color3.fromRGB(255, 50, 50)

local enter = Instance.new("TextButton", frame)
enter.Text = "验证"
enter.Size = UDim2.new(0.8, 0, 0, 35)
enter.Position = UDim2.new(0.1, 0, 0.7, 0)
enter.Font = Enum.Font.SourceSansBold
enter.TextSize = 20
enter.TextColor3 = Color3.fromRGB(255,255,255)
enter.BackgroundColor3 = Color3.fromRGB(60, 180, 75)
enter.BorderSizePixel = 0

enter.MouseButton1Click:Connect(function()
    if input.Text == correctKey then
        tips.Text = "验证成功！"
        isVerified = true
        wait(1)
        gui:Destroy()
    else
        tips.Text = "卡密错误！"
        wait(1)
        tips.Text = ""
    end
end)

-- 阻止未验证前执行主功能
while not isVerified do
    wait(0.1)
end

-- ↓↓↓ 验证通过后，主UI及功能按钮注册 ↓↓↓

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "(啊鱼脚本中心)",
    Icon = "rbxassetid://106566300216007",
    IconThemed = true,
    Author = "(谢谢支持)",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(480, 380),
    Transparent = true,
    Theme = "Dark",
    User = {
        Enabled = true,
        Callback = function() end,
        Anonymous = true
    },
    SideBarWidth = 200,
    ScrollBarEnabled = true,
})

local Tab = Window:Tab({
    Title = "功能",
    Icon = "house",
    Locked = false,
})

Tab:Button({
    Title = "恐鬼症付费版",
    Callback = function()
        local ok, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/longchneg/GAl/refs/heads/Dragon/%E5%8D%A1%E5%AF%86%E7%B3%BB%E7%BB%9F"))()
        end)
        if not ok then
            WindUI:Notify({
                Title = "加载失败",
                Description = tostring(err),
                Duration = 3
            })
        end
    end
})

Tab:Button({
    Title = "doors",
    Callback = function()
        local ok, err = pcall(function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()            
-- ↑↑↑ 以上内容全部放在卡密验证通过后执行 ↑↑↑
