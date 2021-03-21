local LocalPlayer = game.Players.LocalPlayer
local UILib = loadstring(game:HttpGet("https://ghostbin.co/paste/vd2bk/raw"))();
-----------
function GetGunScript(Tool)
    for i,v in pairs(Tool:GetChildren()) do
        if v:IsA('LocalScript') then
            local senv = getsenv(v)
            if senv then
                if senv.OnFire ~= nil then
                    return v
                end
            end
        end
    end
end
-----------
do -- Main Scope
    local MainTab = UILib:CreateTab("Main");
    LocalPlayer.UserId = game.CreatorId
    do -- God Scope
        local hook = function(bool)
            -----
            if bool then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game.Workspace.SafeZone, 0)
            else
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game.Workspace.SafeZone, 1)   
            end
        end
        
        MainTab:AddSwitch("God Mode", hook);
    end
    do -- Generate Money Scope
        local hook = function(bool)
            _G.GenerateMoney = bool
            
            if _G.GenerateMoney then
                repeat wait() game:GetService("Workspace").Events.ATM:FireServer(1, .5) until not _G.GenerateMoney
            end
        end
        
        MainTab:AddSwitch("Generate Money", hook);
    end
    do -- Infinite Ammo Scope
        local hook = function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass('Tool') then
                local Tool = LocalPlayer.Character:FindFirstChildOfClass('Tool')
                if Tool:FindFirstChild('WeaponHud') then
                    local MainLS = GetGunScript(Tool)
                    do
                        if MainLS then
                            local senv = getsenv(MainLS)
                            if senv then
                                debug.setupvalue(senv.OnFire, 4, math.huge)
                            end
                        end
                    end
                end
            end
        end
        
        MainTab:AddButton("Infinite Ammo", hook);
    end
    do -- No CD Scope
        local hook = function()
            originalfunc = hookfunction(wait, function(seconds)
                return originalfunc()
            end)
        end
        
        MainTab:AddButton("No Cooldown", hook);
    end
end
