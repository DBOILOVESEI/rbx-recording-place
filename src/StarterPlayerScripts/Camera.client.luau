local RunService = game:GetService("RunService")
local CameraPosition = workspace:WaitForChild("CameraPosition")
local Camera = workspace.CurrentCamera

RunService.RenderStepped:Connect(function(deltaTime)
    if CameraPosition:GetAttribute("Enabled") == false then
        Camera.CameraType = Enum.CameraType.Custom
        return
    end

    Camera.CameraType = Enum.CameraType.Scriptable
    Camera.CFrame = CameraPosition.CFrame
end)