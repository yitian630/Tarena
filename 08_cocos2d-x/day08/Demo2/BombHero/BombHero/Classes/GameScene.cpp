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
    
    //地图层
    MapLayer *mapLayer = MapLayer::createMapLayer(5);
    this->addChild(mapLayer);
    
    //精灵层
    SpriteLayer *spriteLayer = SpriteLayer::create();
    mapLayer->addChild(spriteLayer);
    //初始化 精灵层的 角色
    spriteLayer->initRole();
    
    
    //摇杆层
    CCLayer *rockerLayer = CCLayer::create();
    
    //创建摇杆对象
    Rocker *rocker = Rocker::createRocker("rocker.png", "rockerBG.png", ccp(100, 100));
    rockerLayer->addChild(rocker);
    rocker->startRocker();
    rocker->setDelegate(spriteLayer);
    
    //创建摇杆按键
    RockerButton *button = RockerButton::creatButton("rocker.png", ccp(700, 100),this, function_selector(GameScene::downButton1));
    button->startButton();
    rockerLayer->addChild(button);
    this->addChild(rockerLayer);
    

    return true;
}

void GameScene::downButton(CCObject *sender) {
    CCLog("按键被按下");
}

void GameScene::downButton1() {
    
        CCLog("按键被按下");
}


