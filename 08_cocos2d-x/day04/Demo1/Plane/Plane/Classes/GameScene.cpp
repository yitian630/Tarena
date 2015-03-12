//
//  GameScene.cpp
//  Plane
//
//  Created by tarena on 14-6-10.
//
//

#include "GameScene.h"
#include "MapLayer.h"
#include "SpriteLayer.h"

GameScene* GameScene::createGameScene(int level) {
    GameScene *scene = new GameScene();
    
    if (scene && scene->initGameScene(level)) {
        scene->autorelease();
        return scene;
    }
    CC_SAFE_DELETE(scene);
    return NULL;
}
bool GameScene::initGameScene(int level) {
    if (!CCScene::init()) return false;
    
    //添加 背景层
    MapLayer *mapLayer = MapLayer::createMapLayer(level);
    this->addChild(mapLayer);
    
    //创建精灵层
    Spritelayer *spriteLayer = Spritelayer::create();
    this->addChild(spriteLayer);
    
    
    return true;
}





