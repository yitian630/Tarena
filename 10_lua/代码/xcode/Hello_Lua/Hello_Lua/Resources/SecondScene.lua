
local scene = CCScene:create()


function scene:init()
	local winSize = CCDirector:sharedDirector():getWinSize()

	local layer = CCLayer:create()
	scene:addChild(layer)

	local bg = CCSprite:create("menu_bg.jpg")
	bg:setAnchorPoint(CCPointMake(0, 0))
	layer:addChild(bg)
end

scene:init()

return scene