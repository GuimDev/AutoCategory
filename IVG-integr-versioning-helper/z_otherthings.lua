--Integration with Inventory Grid View

-----------copied from original file------------

--[[adapter.lua]]

-------------------------------------------------------------

--[[util.lua]]

---------------------------------------------------------------------------
local integrated = false
function IntegrateInventoryGridView() 
    if integrated == false and InventoryGridView ~= nil then        
        d("integrated with igv")
        IGV = InventoryGridView
        util = IGV.util
        settings = IGV.settings
        adapter = IGV.adapter
        --integrate
        InventoryGridView.adapter.ScrollController = adapter_ScrollController
        
        InventoryGridView.adapter.ToggleGrid = adapter_ToggleGrid
        
        InventoryGridView.util.ReshapeSlots = util_ReshapeSlots 
        integrated = true
    end
end 

EVENT_MANAGER:RegisterForEvent(AutoCategory.name, EVENT_PLAYER_ACTIVATED, IntegrateInventoryGridView)
------------------------modified end--------------------------