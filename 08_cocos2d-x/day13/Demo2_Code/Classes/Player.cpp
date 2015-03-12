//
//  Player.cpp
//  XiaoQianRun
//
//  Created by BFM on 13-12-2.
//
//

#include "Player.h"
#include "SpriteLayer.h"
#include "Defines.h"

Player::~Player() {
    CC_SAFE_RELEASE(m_dicAnimate);
}

Player* Player::createPlayer(int roleIndex) {
    Player *player = new Player();
    if (player && player->initPlayer(roleIndex)) {
        player->autorelease();
        return player;
    }
    CC_SAFE_DELETE(player);
    return NULL;
}
bool Player::initPlayer(int roleIndex) {
    if (!MySprite::init()) return false;
    
    m_isSecondaryJump = false;
    
    m_isWillDieOrWin = false;
    
    xSpeed = ConstX_Speed;
    
    
    ySpeed = ConstY_Speed;
    
    
    this->bindSprite(CCSprite::create());
    
    
    m_dicAnimate = CCDictionary::create();
    CC_SAFE_RETAIN(m_dicAnimate);
    
    
    this->initAllAnimate(roleIndex);
    
    this->setCurrentPlayerState(MOVE);
    
    this->schedule(schedule_selector(Player::player_update), 0.016);
    
    
    return true;
}


//添加动画到字典中
void Player::addAnimateToDic(PlayerState state, CCAnimate* animate) {
    m_dicAnimate->setObject(animate, state);
}


//从字典中取出动画
CCAnimate* Player::getAnimateFromDic(PlayerState state) {
    return (CCAnimate*)m_dicAnimate->objectForKey(state);
}

//创建移动动画
void Player::createMove_Animate(CCTexture2D* texture, int row, int col) {
    float w = texture->getContentSize().width / col;
    float h = texture->getContentSize().height / row;
    
    CCArray *spriteFrames = CCArray::create();
    for (int i = 0; i < row * col; i ++) {
        CCSpriteFrame *frame = CCSpriteFrame::createWithTexture(texture, CCRectMake(w * (i % col), h * (i / col), w, h));
        spriteFrames->addObject(frame);
    }
    CCAnimation *animation = CCAnimation::createWithSpriteFrames(spriteFrames);
    animation->setDelayPerUnit(0.15);
    animation->setLoops(-1);
    CCAnimate *animate = CCAnimate::create(animation);
    this->addAnimateToDic(MOVE, animate);
}

//创建跳跃和降落的动画
void Player::createJumpAndDescend_Animate(CCTexture2D* texture, int row, int col) {
    float w = texture->getContentSize().width / col;
    float h = texture->getContentSize().height / row;
    CCArray *spriteFrames = CCArray::create();
    CCSpriteFrame *frame = CCSpriteFrame::createWithTexture(texture,  CCRectMake(w * (2 % col), h * (0 / col), w, h));
    spriteFrames->addObject(frame);
    CCAnimation *animation = CCAnimation::createWithSpriteFrames(spriteFrames);
    animation->setDelayPerUnit(0.05);
    animation->setLoops(-1);
    CCAnimate *animate = CCAnimate::create(animation);
    this->addAnimateToDic(JUMP_UP, animate);
}

//创建角色所有动画
void Player::initAllAnimate(int roleIndex) {
    //根据不同的角色 索引 使用不同的图片
    int row = 0;
    int col = 0;
    switch (roleIndex) {
        case NingCaiCheng:
            row = 3;
            col = 6;
            break;
        case NieXiaoQian:
            row = 3;
            col = 6;
            break;
        case NieXiaoQian_MeiMei:
            row = 1;
            col = 6;
            break;
        case YanChiXia:
            row = 1;
            col = 6;
            break;
    }
    CCTexture2D *texture = CCTextureCache::sharedTextureCache()->addImage(CCString::createWithFormat("person/%d.png", roleIndex)->getCString());
    //创建跑步动画
    this->createMove_Animate(texture, row, col);
    //创建跳起和下落的动画
    this->createJumpAndDescend_Animate(texture, row, col);
    
}



void Player::setCurrentPlayerState(PlayerState state) {
    this->getSprite()->stopAllActions();
    switch ((int)state) {
        case START:
        case MOVE:
            this->getSprite()->runAction(this->getAnimateFromDic(MOVE));
            break;
        case JUMP_UP:
        case JUMP_DOWN:
        case WILL_DIE:
            this->getSprite()->runAction(this->getAnimateFromDic(JUMP_UP));
            break;
    }
    currentPlayerState = state;
}

PlayerState Player::getCurrentPlayerState() {
    return currentPlayerState;
}


//更新函数
void Player::player_update(float dt) {
    this->playerLogic();
}

//玩家的逻辑
void Player::playerLogic() {
    switch (this->getCurrentPlayerState()) {
        case START:
            
            break;
        case MOVE:
            this->runLogic();
            break;
        case JUMP_UP:
            this->jumpUpLogic();
            break;
        case JUMP_DOWN:
            this->jumpDownLogic();
            break;
        case WILL_DIE:
            this->willDieLogic();
            break;
        case GAME_WIN:
            this->gameWinLogic();
            break;
            
    }
}

//跑动逻辑
void Player::runLogic() {
    this->setPosition(ccpAdd(this->getPosition(), ccp(xSpeed, 0)));
}


//跳起逻辑
void Player::jumpUpLogic() {
    if (ySpeed <= 0) {
        ySpeed = 0;
    }
    if (ySpeed == 0) {
        this->setCurrentPlayerState(JUMP_DOWN);
    }
    
    this->setPosition(ccpAdd(this->getPosition(), ccp(xSpeed, ySpeed)));
    
    ySpeed -= Acceslate;
}

//将要死亡
void Player::willDieLogic() {
    if (!m_isWillDieOrWin) {
        m_isWillDieOrWin = true;
        CCDelayTime *delayTime = CCDelayTime::create(0.4);
        CCRotateBy *rotate = CCRotateBy::create(1, 1800);
    
        CCMoveBy *moveBy = CCMoveBy::create(0.4, ccp(0, 350));
        CCMoveTo *moveTo = CCMoveTo::create(0.6, ccp(this->getPositionX(), -100));
        CCSequence *sequence = CCSequence::create(moveBy, moveTo, NULL);
        
        CCSpawn *spawn = CCSpawn::create(rotate, sequence, NULL);
        CCCallFunc *callFunc = CCCallFunc::create(this, callfunc_selector(Player::didDieLogic));
        CCSequence *sequence1 = CCSequence::create(delayTime, spawn, callFunc, NULL);
        this->runAction(sequence1);
    }
}

//已经死亡
void Player::didDieLogic() {
    
}

//降落逻辑
void Player::jumpDownLogic() {
    int tempConstY = ConstY_Speed;
    if (ySpeed >= tempConstY) {
        ySpeed = tempConstY;
    }
    this->setPosition(ccpAdd(this->getPosition(), ccp(xSpeed, -ySpeed)));
    ySpeed += Acceslate;
}

//跑完当前关卡地图
void Player::gameWinLogic() {
}


//玩家是否一个区域碰撞 （地图 或 金币）
bool Player::isCollisionWithCollArea(COLLISION_DIRECTION dirction, CCRect box) {
    bool bFlag = false;
    switch ((int)dirction) {
        case COLLISION_TOP:
            bFlag = this->isCollisionWithTop(box);
            break;
        case COLLISION_BOTTOM:
            bFlag = this->isCollisionWithBottom(box);
            break;
        case COLLISION_LEFT:
            bFlag = this->isCollisionWithLeft(box);
            break;
        case COLLISION_RIGHT:
            bFlag = this->isCollisionWithRight(box);
            break;
    }
    return bFlag;
}

//判断与个方向碰撞检测
bool Player::isCollisionWithTop(CCRect box) {
    CCRect playerBox = this->getCollisionArea();
    CCRect collBox = CCRectMake(playerBox.getMinX(), playerBox.getMaxY() - 1, playerBox.size.width, 1);
    return box.intersectsRect(collBox);
}
//判断与个方向碰撞检测
bool Player::isCollisionWithBottom(CCRect box) {
    CCRect playerBox = this->getCollisionArea();
    CCRect collBox = CCRectMake(playerBox.getMinX(), playerBox.getMinY(), playerBox.size.width, 1);
    return box.intersectsRect(collBox);
}
//判断与个方向碰撞检测
bool Player::isCollisionWithLeft(CCRect box) {
    CCRect playerBox = this->getCollisionArea();
    CCRect collBox = CCRectMake(playerBox.getMinX(), playerBox.getMidY() - 5, 1, 10);
    return box.intersectsRect(collBox);
}
//判断与个方向碰撞检测
bool Player::isCollisionWithRight(CCRect box) {
    CCRect playerBox = this->getCollisionArea();
    CCRect collBox = CCRectMake(playerBox.getMaxX() - 1, playerBox.getMidY() - 5, 1, 10);
    return box.intersectsRect(collBox);
}

//得到角色的碰撞区域
CCRect Player::getCollisionArea() {
    CCRect spriteCollArea = this->getSprite()->boundingBox();
    return CCRectMake(spriteCollArea.getMinX() + this->getPositionX(), spriteCollArea.getMinY() + this->getPositionY(), spriteCollArea.size.width, spriteCollArea.size.height);
}



