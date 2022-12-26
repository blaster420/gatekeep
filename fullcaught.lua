--tec9 & caught

--Aim Viewer
--------------------------------------------------
loadstring(game:HttpGet('https://raw.githubusercontent.com/blaster420/source/main/sourceveiwer.lua'))()
--Main
--------------------------------------------------
local l1 = false --keep this as false.
local l2 = "z" -- set a variable for Keybind (Must be lowercase)
local l3 = game:GetService("Players").LocalPlayer:GetMouse(); -- Get the mouse for better toggle detection (instant)
getgenv().ANTI = true 
getgenv().ANTIAMOUNT = 1000
function StartAntiLocking()
    game:GetService("RunService").heartbeat:Connect(function()
        if getgenv().ANTI ~= false then 
        local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,      getgenv().ANTIAMOUNT,0) 
        game:GetService("RunService").RenderStepped:Wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
        end 
    end)
end

--Notify Function
--------------------------------------------------
function sendnotifi(message)


    game.StarterGui:SetCore("SendNotification", {
        Title = 'CAUGHT GGS';
        Text = message;
        Duration = "1";
    })
    end

--Notify On/Off
-------------------------------------------------
    l3.KeyDown:Connect(function(z)
        if z == l2 then
            if l1 == false then
                sendnotifi("ANTI OFF")
            elseif l1 == true then
                sendnotifi("ANTI ON")
            end
        end
    end)
    
--Anti On/Off
-------------------------------------------------
l3.KeyDown:Connect(function(l6)
    if l6 == l2 then
        if l1 then
            l1 = false
                getgenv().ANTI = false
        else
            l1 = true
             getgenv().ANTI = true
            while l1 and wait() do
                StartAntiLocking()
            end
        end
    end
end)
--------------------------------------------------