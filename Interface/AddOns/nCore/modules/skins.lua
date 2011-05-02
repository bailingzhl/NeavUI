
local f = CreateFrame('Frame')
f:RegisterEvent('PLAYER_LOGIN')
f:SetScript('OnEvent', function(_, event, ...)
    if (event == 'PLAYER_LOGIN') then
        SetCVar('ScreenshotQuality', 10)
    end

	if (event == 'ACTIVE_TALENT_GROUP_CHANGED') then
		LoadAddOn('Blizzard_GlyphUI')
	end
end)

SlashCmdList['FRAMENAME'] = function()
    local name = GetMouseFocus():GetName()
    
    if (name) then
        DEFAULT_CHAT_FRAME:AddMessage('|cff00FF00   '..name)
    else
        DEFAULT_CHAT_FRAME:AddMessage('|cff00FF00This frame has no name!')
    end
end
SLASH_FRAMENAME1 = '/frame'

SlashCmdList['RELOADUI'] = function()
    ReloadUI()
end
SLASH_RELOADUI1 = '/rl'

--[[
function UnitAura() 
    return 'TestAura', nil, 'Interface\\Icons\\Spell_Nature_RavenForm', 9, nil, 120, 120, 1, 0 
end
--]]

local f = CreateFrame('Frame')
f:RegisterEvent('VARIABLES_LOADED')
f:RegisterEvent('ADDON_LOADED')
f:RegisterEvent('PLAYER_ENTERING_WORLD')

f:SetScript('OnEvent', function(self)
    if (IsAddOnLoaded('Omen')) then
        if (not OmenBarList.Done) then
            OmenBarList:CreateBorder(11)
            OmenBarList:SetBorderPadding(3)
            OmenBarList.Done = true
        end
    end
    
        -- a example for addons like pitbull
    
    --[[ 
    if (IsAddOnLoaded('PitBull4')) then
        f:SetScript('OnUpdate', function(self)
                
                -- works fine because beautycase will not create multiple textures/borders
                
            for _, pitframe in pairs({
                PitBull4_Frames_player,
                PitBull4_Frames_target,
                PitBull4_Frames_targettarget,
            }) do
                if (pitframe:IsShown()) then
                    pitframe:CreateBorder(11)
                    pitframe:SetBorderPadding(2)
                end
            end
        end)
    end
    --]]

    if (IsAddOnLoaded("DBM-Core")) then
        hooksecurefunc(DBT, "CreateBar", function(self)
            for bar in self:GetBarIterator() do
                local frame = bar.frame
                local tbar = _G[frame:GetName().."Bar"]
                local spark = _G[frame:GetName().."BarSpark"]
                local texture = _G[frame:GetName().."BarTexture"]
                local icon1 = _G[frame:GetName().."BarIcon1"]
                local icon2 = _G[frame:GetName().."BarIcon2"]
                local name = _G[frame:GetName().."BarName"]
                local timer = _G[frame:GetName().."BarTimer"]
                
                spark:SetTexture(nil)
                
                name:ClearAllPoints()
                name:SetPoint('LEFT', tbar, 4, 0)
                name:SetFont('Fonts\\ARIALN.ttf', 15)
                
                timer:ClearAllPoints()
                timer:SetPoint('RIGHT', tbar, 'RIGHT', -4, 0)
                timer:SetFont('Fonts\\ARIALN.ttf', 22)
                timer:SetJustifyH('RIGHT')
                
                tbar:SetHeight(24)
                tbar:CreateBorder(10)
                tbar:SetBorderPadding(tbar:GetHeight() + 3, 2, 2, 2, tbar:GetHeight() + 3, 2, 2, 2)
                tbar:SetBackdrop({bgFile = 'Interface\\Buttons\\WHITE8x8'})
                tbar:SetBackdropColor(0, 0, 0, 0.5)
                
                icon1:SetTexCoord(0.07, 0.93, 0.07, 0.93)
                icon1:SetSize(tbar:GetHeight(), tbar:GetHeight() - 1)
                
                icon2:SetTexCoord(0.07, 0.93, 0.07, 0.93)
                icon2:SetSize(tbar:GetHeight(), tbar:GetHeight() - 1)
            end
        end)

        DBM.RangeCheck:Show()
        DBM.RangeCheck:Hide()
        DBMRangeCheck:HookScript("OnShow",function(self)
            self:Hide()
            self.Show = function() end
        end)
    end

    if (IsAddOnLoaded('Recount')) then
        if (not RecountMainWindowDone) then
            Recount.MainWindow:CreateBorder(11)
            Recount.MainWindow:SetBorderPadding(2, -10, 2, -10, 2, 2, 2, 2)
            Recount.MainWindow:SetBackdrop({
                bgFile = 'Interface\\Buttons\\WHITE8x8',
                insets = { left = 0, right = 0, top = 10, bottom = 0 },
            })
            Recount.MainWindow:SetBackdropColor(0, 0, 0, 0.5)
            RecountMainWindowDone = true
        end
    end
end)
