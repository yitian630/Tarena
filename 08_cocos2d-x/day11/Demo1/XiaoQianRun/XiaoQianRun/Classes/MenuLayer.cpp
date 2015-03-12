//
//  MenuLayer.cpp
//  XiaoQianRun
//
//  Created by tarena on 14-6-19.
//
//

#include "MenuLayer.h"
#include "MenuLayerLoader.h"
CCScene *MenuLayer::scene() {
    CCScene *scene = CCScene::create();
    //负责 CCLayerLoader对象 和  cocosBuilder中的layer 进行绑定的对象
    CCNodeLoaderLibrary *library = CCNodeLoaderLibrary::newDefaultCCNodeLoaderLibrary();
    //把 CocosBuilder中"Menu"对应的Layer 和 MenuLayerLoader 中 MenuLayer 对象进行绑定
    library->registerCCNodeLoader("Menu", MenuLayerLoader::loader());
    //通过 带参数(library)的构造  创建一个 读取节点的对象
    CCBReader *bReader = new CCBReader(library);
    //bReader 通过 ccbi文件 读取出一个CCNode
    MenuLayer *menuLayer = (MenuLayer*)bReader->readNodeGraphFromFile("ccbi/menu.ccbi");
    
    scene->addChild(menuLayer);
   
    return scene;
}

bool MenuLayer::init() {
    return true;
}

SEL_MenuHandler MenuLayer::onResolveCCBCCMenuItemSelector(CCObject * pTarget, const char* pSelectorName) {
    CCB_SELECTORRESOLVER_CCMENUITEM_GLUE(this, "onStartGame", MenuLayer::onStartGame);
    return NULL;
}
SEL_CCControlHandler MenuLayer::onResolveCCBCCControlSelector(CCObject * pTarget, const char* pSelectorName) {
    return NULL;
}


void MenuLayer::onStartGame() {
    CCLog("开始游戏");
}






