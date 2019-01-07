--[[
Integration with Inventory Grid View

UPDATED & Improved By : Provision (watch the update : https://github.com/GuimDev/AutoCategory/commits/master/AutoCategory_Integrations_Inventory_Grid_View.lua )

FOR UPDATE THIS FILE, HELP YOU OF WITH : IGV diff changes on github (GuimDev/IVG-versioning).

--------

Changelog for util.lua & adapter.lua with date : https://github.com/GuimDev/IVG-versioning/wiki

CHANGE v7 :
 - v7 : Update modif with IGV 2.0.9 files (2.0.5 -> 2.0.9) :
    - Fix traitInfo (2.0.9)
    - icon position (2.0.6&2.0.9)
    - prefere "disable status' mouse" fix (2.0.6) of the upstream (IGV)
    - forgotten declaration `ANIMATE_INSTANTLY` (in v1)
 - v6 : Fix last line (remove : "1 -" udapter.lua#215)
 - v5 : Add settings
 - v4 : Comment StatValue (2.0.8)
 - v3 : Improve IntegrateInventoryGridView Controller
 - v2: Add util.lua
 - v1: First version


CHANGE DETAILS :
 - b7 : https://github.com/GuimDev/AutoCategory/commits/UpdateIVGwithHelper/IVG-integr-versioning-helper
 - v1-6 : https://github.com/GuimDev/AutoCategory/commits/IVGintVersHelper/IVG-integr-versioning-helper

------------------

This file is copied from original file with some changes :
 - adapter.lua
 - util.lua

>> START : adapter.lua
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
]]

--[[adapter.lua]]

--[[
<< END : adapter.lua
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


>> START : util.lua
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
]]

--[[util.lua]]

--[[
<< END : util.lua
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
]]

---------------------------------------------------------------------------
local integrated = false
function IntegrateInventoryGridView() 
    zo_callLater(function() 
        if integrated == false and InventoryGridView ~= nil then        
            IGV = InventoryGridView
            util = IGV.util
            settings = IGV.settings
            adapter = IGV.adapter
            --integrate
            InventoryGridView.adapter.ScrollController = adapter_ScrollController
            
            InventoryGridView.adapter.ToggleGrid = adapter_ToggleGrid
            
            InventoryGridView.util.ReshapeSlots = util_ReshapeSlots 
             
            integrated = true
            
            --fix prehook   
            ZO_PreHook("ZO_ScrollList_UpdateScroll", adapter_ScrollController)
        end
    end, 10) 
end 

EVENT_MANAGER:RegisterForEvent(AutoCategory.name, EVENT_PLAYER_ACTIVATED, IntegrateInventoryGridView)
------------------------modified end--------------------------