local arena_profile = "party";
local bg_profile = "main";
local brawl_profile = "main";
local party_profile = "party";
local raid_profile = "main";

function switchProfile()
    inInstance, instanceType = IsInInstance()
	if C_PvP.IsArena() or instanceType == "arena" then
		if GetActiveRaidProfile() ~= arena_profile then
			CompactUnitFrameProfiles_ActivateRaidProfile(arena_profile);
			print("Activated profile: "..arena_profile)
		end
	elseif C_PvP.IsBattleground() or instanceType == "pvp" then
		if GetActiveRaidProfile() ~= bg_profile then
			CompactUnitFrameProfiles_ActivateRaidProfile(bg_profile);
			print("Activated profile: "..bg_profile)
		end
	elseif C_PvP.IsInBrawl() then
		if GetActiveRaidProfile() ~= brawl_profile then
			CompactUnitFrameProfiles_ActivateRaidProfile(brawl_profile);
			print("Activated profile: "..brawl_profile)
		end
	elseif GetNumGroupMembers(LE_PARTY_CATEGORY_INSTANCE) >= 1 then
	    if GetNumGroupMembers(LE_PARTY_CATEGORY_INSTANCE) > 5 then
                if GetActiveRaidProfile() ~= raid_profile then
	        	CompactUnitFrameProfiles_ActivateRaidProfile(raid_profile);
			print("Activated profile: "..raid_profile)
            end
	    else
	        if GetActiveRaidProfile() ~= party_profile then
                	CompactUnitFrameProfiles_ActivateRaidProfile(party_profile);
	        	print("Activated profile: "..party_profile)
            	end
        end
	elseif GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) >= 1 then
		if GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) > 5 then
			if GetActiveRaidProfile() ~= raid_profile then
				CompactUnitFrameProfiles_ActivateRaidProfile(raid_profile);
				print("Activated profile: "..raid_profile)
            	end
	    	else
	        if GetActiveRaidProfile() ~= party_profile then
				CompactUnitFrameProfiles_ActivateRaidProfile(party_profile);
				print("Activated profile: "..party_profile)
			end
		end
	end
end

local f = CreateFrame("Frame")
f:RegisterEvent("GROUP_ROSTER_UPDATE")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", switchProfile);
