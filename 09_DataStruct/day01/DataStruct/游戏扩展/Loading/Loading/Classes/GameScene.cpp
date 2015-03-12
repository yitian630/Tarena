//
//  GameScene.cpp
//  Loading
//
//  Created by tarena on 14-6-25.
//
//

#include "GameScene.h"
CCScene* GameScene::scene() {
    CCScene *scene = CCScene::create();
    GameScene *layer = GameScene::create();
    scene->addChild(layer);
    return scene;
}

bool GameScene::init() {
    if(!CCLayer::init()) return false;
    
    for (int i = 0; i < 7; i++) {
        for (int j = 0; j < 3; j++) {
            CCSprite *sprite = CCSprite::create(CCString::createWithFormat("map/map%d_%d.png", i + 1, j + 1)->getCString());
            this->addChild(sprite);
        }
    }
    return true;
}





