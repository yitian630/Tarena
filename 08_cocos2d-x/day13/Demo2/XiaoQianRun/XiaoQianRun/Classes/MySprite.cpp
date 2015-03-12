//
//  MySprite.cpp
//  XiaoQianRun
//
//  Created by BFM on 13-12-2.
//
//

#include "MySprite.h"
MySprite::MySprite() {
    this->m_sprite = NULL;
}
MySprite::~MySprite() {
    
}
//获取精灵
CCSprite* MySprite::getSprite() {
    return this->m_sprite;
}
//绑定精灵
void MySprite::bindSprite(CCSprite *sprite) {
    this->m_sprite = sprite;
    this->addChild(m_sprite);
  
}

//切换精灵
void MySprite::replaceSprite(CCSprite *sprite) {
    if (this->m_sprite == sprite) return;
    
    if (this->m_sprite) {
        this->removeChild(this->m_sprite);
    }
    this->m_sprite = sprite;
    this->addChild(m_sprite);
}






