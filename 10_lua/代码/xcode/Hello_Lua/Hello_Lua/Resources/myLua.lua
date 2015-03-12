function __G__TRACKBACK__(msg)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(msg) .. "\n")
    print(debug.traceback())
    print("----------------------------------------")
end

local scene = CCScene:create()


local function menuCallBack( )
	local _scene = require("SecondScene")
	CCDirector:sharedDirector():replaceScene(_scene)
	print ("跳转场景")
end

function scene:init()
	local winSize = CCDirector:sharedDirector():getWinSize()

	local layer = CCLayer:create()
	scene:addChild(layer)

	local bg = CCSprite:create("menu_bg.jpg")
	bg:setAnchorPoint(CCPointMake(0, 0))
	layer:addChild(bg)

	local logo = CCSprite:create("logo.png")
	logo:setAnchorPoint(CCPointMake(0, 1))
	logo:setPosition(CCPointMake(0, winSize.height))
	layer:addChild(logo)


	local label = CCLabelBMFont:create("StartGame", "Font.fnt")
	local menuItem = CCMenuItemLabel:create(label);
	menuItem:registerScriptTapHandler(menuCallBack)
	local menu = CCMenu:createWithItem(menuItem)
	layer:addChild(menu)

end


local  function main( )
	scene:init()
	CCDirector:sharedDirector():runWithScene(scene)
end

main()






