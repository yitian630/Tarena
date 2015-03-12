//
//  GameScene.cpp
//  BombHero
//
//  Created by tarena on 14-6-13.
//
//

#include "GameScene.h"
#include "RockerButton.h"
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

    //精灵层
    
    //摇杆层
    CCLayer *rockerLayer = CCLayer::create();
    RockerButton *button = RockerButton::creatButton("rocker.png", ccp(700, 100),this, function_selector(GameScene::downButton1));
    button->startButton();
    rockerLayer->addChild(button);
    this->addChild(rockerLayer);
    
    
    RockerButton *button1 = RockerButton::creatButtonWithChangeImage("main_button1_1.png", "main_button1_2.png", ccp(400, 300), this, function_selector(GameScene::downButton));
    button1->startButton();
    rockerLayer->addChild(button1);
    return true;
}

void GameScene::downButton(CCObject *sender) {
    CCLog("按键被按下");
}

void GameScene::downButton1() {
    
        CCLog("按键被按下");
}




