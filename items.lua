local lastItemId = ""

--renders the item
function events.item_render(item)
	if lastItemId ~= item:getName() then
		lastItemId = item:getName()
		pings.modelReturn(item.id, item:getName())
	end
	return models.items.Item
end

--function to check the items name
function categoryCheck(item)
	local itemIdText = string.sub(item, 11)
	local quickArray = models.items.Item:getChildren()
	for i = 1, #quickArray do
		if itemIdText == quickArray[i]:getName() then
			return i
		end
	end
end

--function to check for the name of the item in said category
function nameCheck(categoryIndex, name)
	local quickArray = models.items.Item:getChildren()
	local categoryArray = quickArray[categoryIndex]:getChildren()
	for i = 1, #categoryArray do
		if name == categoryArray[i]:getName() then
			return categoryArray[i]
		end
	end
end

--function that seperates the name and category check so the actual model can be called upon
function pings.modelReturn(item, name)
	local quickArray = models.items.Item:getChildren()
	
	for i = 1, #quickArray do
        local categoryArray = quickArray[i]:getChildren()
        for j = 1, #categoryArray do
            categoryArray[j]:setVisible(false)
        end
    end	
	if string.sub(item, 1, 4) == "mine" then	
	local categoryIndex = categoryCheck(item)
	if categoryIndex == nil then
	return
	end
	local model = nameCheck(categoryIndex, name)
	if model == nil then
	return
	end
	model:setVisible(true)
	end
end