//
//  GameScene.cpp
//  BombHero
//
//  Created by tarena on 14-6-13.
//
//

#include "GameScene.h"
#include "RockerButton.h"
#include "Rocker.h"
#include "SpriteLayer.h"
#include "MapLayer.h"
#include "SelectLevelLayer.h"
#include "SimpleAudioEngine.h"
#include "BombData.h"
using namespace CocosDenshion;
GameScene* GameScene::createGameScene(int Level) {
    GameScene *scene = new GameScene();
    if (scene && scene->initGameScene(Level)) {
        scene->autorelease();
        return scene;
    }
    CC_SAFE_DELETE(scene);
    return NULL;
}
bool GameScene::initGameScene(int Level){
    if (!CCScene::init()) return false;
    m_level = Level;
    
    SimpleAudioEngine::sharedEngine()->playBackgroundMusic("snd/fenchang2.mp3", true);
    SimpleAudioEngine::sharedEngine()->setBackgroundMusicVolume(0.6);
    //地图层
    MapLayer *mapLayer = MapLayer::createMapLayer(m_level);
    this->addChild(mapLayer);
    
    //精灵层
    SpriteLayer *spriteLayer = SpriteLayer::create();
    mapLayer->addChild(spriteLayer);
    //初始化 精灵层的 角色
    spriteLayer->initRole();
    
    
    //摇杆层
    CCLayer *rockerLayer = CCLayer::create();
    
    //创建摇杆对象
    m_rocker = Rocker::createRocker("rocker.png", "rockerBG.png", ccp(100, 100));
    rockerLayer->addChild(m_rocker);
    m_rocker->startRocker();
    m_rocker->setDelegate(spriteLayer);
    
    //创建摇杆按键
    m_button = RockerButton::creatButton("rocker.png", ccp(700, 100),spriteLayer, function_selector(SpriteLayer::shootBomb));
    m_button->startButton();
    rockerLayer->addChild(m_button);
    this->addChild(rockerLayer);
    

    return true;
}

void GameScene::GameWin() {
    
    this->stopRocker();
    
    CCLayerColor *layer = CCLayerColor::create(ccc4(0, 0, 0, 125));
    CCMenuItemImage *itemImage = CCMenuItemImage::create("gameWin.png", NULL, this , menu_selector(GameScene::goSelectLevelScene));
    CCMenu *menu = CCMenu::create();
    menu->addChild(itemImage);
    layer->addChild(menu);
    this->addChild(layer);
    
    //当前进行 关卡  是  解锁的最后一个关卡  过关 解锁下一关并保存 到 外部文件中
    if (m_level == BombData::shardBombHeroData()->getLevle()) {
        m_level ++;
        BombData::shardBombHeroData()->setLevle(m_level);
        BombData::shardBombHeroData()->flush();
    }
    
    
}
void GameScene::GameLose() {
    CCLayerColor *layer = CCLayerColor::create(ccc4(0, 0, 0, 125));
    CCMenuItemImage *itemImage = CCMenuItemImage::create("gameLose.png", NULL, this , menu_selector(GameScene::goSelectLevelScene));
    CCMenu *menu = CCMenu::create();
    menu->addChild(itemImage);
    layer->addChild(menu);
    this->addChild(layer);
}

void GameScene::goSelectLevelScene() {
    CCDirector::sharedDirector()->replaceScene(CCTransitionFade::create(1, SelectLevelLayer::scene()));
}

void GameScene::stopRocker() {
    m_button->stopButton();
    m_rocker->stopRocker();
}

/*通过 递归 遍历 所有节点*/
//void GameScene::pause(CCNode *node) {
//    CCObject *object = NULL;
//    CCArray *array = node->getChildren();
//    CCARRAY_FOREACH(array, object) {
//        CCNode *_node = (CCNode*)object;
//        this->pause(_node);
//    }
//    node->pauseSchedulerAndActions();
//}
