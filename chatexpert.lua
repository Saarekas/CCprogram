local cbox = peripheral.wrap("right")
local monitor = peripheral.wrap("left")
local imanager = peripheral.wrap("back")
local w, h = monitor.getSize()
local t = {'minecraft:cobblestone', 'minecraft:stone', 'minecraft:dirt', 'minecraft:gravel', 'minecraft:sand', 'minecraft:netherrack'}
local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
 
    return false
end
local function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end
if cbox == nil then error("Missing Chat Box") end
while true do
    event, username, message = os.pullEvent("chat") -- Will be fired when someone sends a chat message
    monitor.write(username.. ": ".. message) -- Prints "*User* just wrote: *Message*"
    local x, y = monitor.getCursorPos()
    if y == h then monitor.scroll(1) end
    if message == "quit smoking" then error("Too hard to quit") end
    if message == "clear monitor" then monitor.clear() monitor.setCursorPos(1, 1)  end
    if message == "FOOD" and username == imanager.getOwner() then cbox.sendMessage("Transfering some food to ".. username)
        imanager.addItemToPlayer("UP", 8)
    end
    if message == "PICKAXE" and username == imanager.getOwner() then cbox.sendMessage("Transfering a pickaxe to ".. username)
        imanager.addItemToPlayer("EAST", 1)
    end
    if message == "REMOVE TRASH" and username == imanager.getOwner()  then cbox.sendMessage("Removing trash from ".. username)
    imanager.removeItemFromPlayer("WEST", 128, "minecraft:cobblestone")
    imanager.removeItemFromPlayer("WEST", 128, "minecraft:dirt")
    imanager.removeItemFromPlayer("WEST", 128, "minecraft:sand")
    imanager.removeItemFromPlayer("WEST", 128, "minecraft:gravel")
    imanager.removeItemFromPlayer("WEST", 128, "minecraft:granite")
    imanager.removeItemFromPlayer("WEST", 128, "minecraft:andesite")
    imanager.removeItemFromPlayer("WEST", 128, "minecraft:diorite")
        
    end
    local x, y = monitor.getCursorPos()
    if y ~= h then monitor.setCursorPos(1, y+1) end
    if y == h then monitor.setCursorPos(1, y) end
end
