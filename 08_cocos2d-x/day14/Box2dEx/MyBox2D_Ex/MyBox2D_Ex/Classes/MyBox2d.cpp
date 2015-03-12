//
//  MyBox2d.cpp
//  MyBox2D_Ex
//
//  Created by apple on 13-12-28.
//
//

#include "MyBox2d.h"
#include "SimpleAudioEngine.h"
using namespace CocosDenshion;
#define PTM_RATIO 32
enum {
    kBatchNodeTag = 1
};
CCScene* MyBox2D::scene(){
    CCScene* scene = CCScene::create();
    MyBox2D* myBox2D = MyBox2D::create();
    scene->addChild(myBox2D);
    return scene;
}

bool MyBox2D::init() {
    if(!CCLayer::init()) return false;
    
    _size = CCDirector::sharedDirector()->getWinSize();

    //创建屏幕边框
    this->initScreenFrame();

    //创建精灵批量节点
    CCSpriteBatchNode *parent = CCSpriteBatchNode::create("blocks.png", 100);
    this->addChild(parent, 0, kBatchNodeTag);
    //得到纹理对象
    _spriteTexture = parent->getTexture();
    
    //开启触摸
    this->setTouchEnabled(true);
    

    //让世界 运行起来
    this->scheduleUpdate();
    

    
    this->addSomeJonintBodies(ccp(_size.width * 0.5, _size.height * 0.5));
    
    //重力感应   加速计
    this->setAccelerometerEnabled(true);
    
    _world->SetContactListener(this);

    return true;
}

void MyBox2D::initScreenFrame() {
    
    
    /********* 创建世界 *********/
    //世界的重力方向
    b2Vec2 gravity(0, -10);
    //创建世界
    _world = new b2World(gravity);
    //允许世界中得物体睡眠
    _world->SetAllowSleeping(true);
    //设置是否使用连续物理模拟
    _world->SetContinuousPhysics(true);
    /**************************/
    
    
    
    /********* 屏幕框 *********/
    //创建物体定义
    b2BodyDef groundBodyDef;
    //设置物体位置
    groundBodyDef.position.Set(0, 0);
    //创建物体  刚体   (通过世界创建)
    b2Body* groundBody = _world->CreateBody(&groundBodyDef);
    //创建形状
    b2EdgeShape groundBox;
    //创建一条线  屏幕下边的一条线
    groundBox.Set(b2Vec2(0, 0), b2Vec2(_size.width / PTM_RATIO, 0));
    //创建夹具  将刚体和形状 绑定
    groundBody->CreateFixture(&groundBox, 0);  //下边框
    
    
    /////刚体可以绑定多个形状
    groundBox.Set(b2Vec2(0, _size.height/PTM_RATIO), b2Vec2(_size.width/PTM_RATIO, _size.height/PTM_RATIO));//上边框
    groundBody->CreateFixture(&groundBox, 0);
    
    
    groundBox.Set(b2Vec2(0, 0), b2Vec2(0, _size.height/PTM_RATIO));//左边框
    groundBody->CreateFixture(&groundBox, 0);
    
    
    groundBox.Set(b2Vec2(_size.width/PTM_RATIO, 0), b2Vec2(_size.width/PTM_RATIO, _size.height/PTM_RATIO));//右边框
    groundBody->CreateFixture(&groundBox, 0);
}

//添加一个精灵
void MyBox2D::addNewSpriteAtPosition(CCPoint pos) {
    
    int idx = (CCRANDOM_0_1() > 0.5 ? 0:1);
    int idy = (CCRANDOM_0_1() > 0.5 ? 0:1);
    float w = _spriteTexture->getContentSize().width * 0.5;
    float h = _spriteTexture->getContentSize().height * 0.5;
    CCSprite *sprite = CCSprite::createWithTexture(_spriteTexture, CCRectMake(idx * w, idy * h, w, h));
    //得到批量精灵节点
    CCNode *parent = this->getChildByTag(kBatchNodeTag);
    parent->addChild(sprite);
    sprite->setPosition(pos);
    
    
    //创建物体, 用来控制精灵
    //物体定义
    b2BodyDef bodyDef;
    //物体类型为  一个 动态的物体
    bodyDef.type = b2_dynamicBody;
    //设置物体位置
    bodyDef.position.Set(pos.x/PTM_RATIO, pos.y/PTM_RATIO);
    //创建物体  刚体
    b2Body *body = _world->CreateBody(&bodyDef);
    //创建形状
    b2PolygonShape dynamicBox;
    float hx = w * 0.5;
    float hy = h * 0.5;
    //引擎提供了直接创建盒子形状的方法
    dynamicBox.SetAsBox(hx / PTM_RATIO, hy / PTM_RATIO);
    //创建夹具
    b2FixtureDef fixture;
    //形状
    fixture.shape = &dynamicBox;
    //密度
    fixture.density = 10.0f;
    //摩擦力
    fixture.friction = 0.3f;
    //恢复力
    fixture.restitution = 0.8;
    //将刚体和形状绑定
    body->CreateFixture(&fixture);

    //将 刚体 和 精灵绑定
    body->SetUserData(sprite);
}

void MyBox2D::update(float dt) {
    //让世界进行模拟
    //参数:  时间步   速度迭代次数   位置迭代
    //速度迭代次数控制了约束求解器会遍历多少次世界中的接触以及关节, 推荐8次，超过10次的基本看不出效果的提升
    //位置迭代控制了每个时间步进行多少次位置改变   这里用1就可以
    _world->Step(dt, 8, 1);
   
    //_world->GetBodyList() 返回物体链表的第一个元素
    for (b2Body *b = _world->GetBodyList(); b; b = b->GetNext()) {
  
        CCSprite *sprite = (CCSprite*)b->GetUserData();
        if(sprite) {
            sprite->setPosition(ccp(b->GetPosition().x * PTM_RATIO, b->GetPosition().y * PTM_RATIO));
        }
    }
}


void MyBox2D::ccTouchesEnded(cocos2d::CCSet* touches, cocos2d::CCEvent* event) {
    for (CCSetIterator it = touches->begin(); it != touches->end(); it++) {
        CCTouch* touch = (CCTouch*)(*it);
        if (touch) {
            CCPoint locatoin = touch->getLocation();
            this->addNewSpriteAtPosition(locatoin);
        }
    }
}

//添加关节
void MyBox2D::addSomeJonintBodies(CCPoint pos) {
    //刚体定义
    b2BodyDef bodyDef;
    bodyDef.type = b2_dynamicBody;
    bodyDef.position = b2Vec2(pos.x / PTM_RATIO, pos.y / PTM_RATIO);
    //创建刚体  A
    b2Body* bodyA = _world->CreateBody(&bodyDef);
    //形状
    b2PolygonShape dynamicBox;
    dynamicBox.SetAsBox(0.5f, 0.5f);
    //创建夹具
    b2FixtureDef fixtureDef;
    fixtureDef.shape = &dynamicBox;
    fixtureDef.density = 1.0f;
    fixtureDef.friction = 0.3f;
    bodyA->CreateFixture(&fixtureDef);
    
    //创建一个精灵
    CCSprite *sprite = CCSprite::create();
    int idx = (CCRANDOM_0_1() > 0.5 ? 0:1);
    int idy = (CCRANDOM_0_1() > 0.5 ? 0:1);
    sprite->initWithTexture(_spriteTexture, CCRectMake(idx*32, idy*32, 32, 32));
    CCNode* parent = getChildByTag(kBatchNodeTag);
    parent->addChild(sprite);
    //讲精灵绑定刚体
    bodyA->SetUserData(sprite);
    
    
    //修改物体定义中得  位置
    bodyDef.position = bodyDef.position + b2Vec2(0, -2);
    //创建刚体  B
    b2Body* bodyB= _world->CreateBody(&bodyDef);
    bodyB->CreateFixture(&fixtureDef);
    //创建一个精灵
    CCSprite *sprite1 = CCSprite::create();
    int idx1 = (CCRANDOM_0_1() > 0.5 ? 0:1);
    int idy1 = (CCRANDOM_0_1() > 0.5 ? 0:1);
    sprite1->initWithTexture(_spriteTexture, CCRectMake(idx1*32, idy1*32, 32, 32));
    parent->addChild(sprite1);
    //讲精灵绑定刚体
    bodyB->SetUserData(sprite1);
    
    
    //刚体定义
    bodyDef.position = bodyDef.position + b2Vec2(0, -2);
    //创建刚体  C
    b2Body* bodyC = _world->CreateBody(&bodyDef);
    bodyC->CreateFixture(&fixtureDef);
    //创建一个精灵
    CCSprite *sprite2 = CCSprite::create();
    int idx2 = (CCRANDOM_0_1() > 0.5 ? 0:1);
    int idy2 = (CCRANDOM_0_1() > 0.5 ? 0:1);
    sprite2->initWithTexture(_spriteTexture, CCRectMake(idx2*32, idy2*32, 32, 32));
    parent->addChild(sprite2);
    //讲精灵绑定刚体
    bodyC->SetUserData(sprite2);
    
    
    
    //创建关节
    b2RevoluteJointDef jointDef;
    //参数  物体1  物体2  物体2的中心点(绑定位置)
    jointDef.Initialize(bodyA, bodyB, bodyB->GetWorldCenter());
    //在物体中心 创建一个关节
    bodyA->GetWorld()->CreateJoint(&jointDef);

    
    jointDef.Initialize(bodyB, bodyC, bodyC->GetWorldCenter());
    bodyB->GetWorld()->CreateJoint(&jointDef);

    //将之前创建个关节加到一个 静态的物体上
    bodyDef.type = b2_staticBody;
    bodyDef.position = b2Vec2(pos.x/PTM_RATIO, pos.y/PTM_RATIO);
    b2Body* staticBody = _world->CreateBody(&bodyDef);
    
    jointDef.Initialize(staticBody, bodyA, bodyA->GetWorldCenter());
    _world->CreateJoint(&jointDef);
    
}


//加速计  重力感应
void MyBox2D::didAccelerate(cocos2d::CCAcceleration* pAccelerationValue) {
    //重新设置世界的重力
    b2Vec2 g(pAccelerationValue->x * 50, pAccelerationValue->y * 50);
    _world->SetGravity(g);
}

void MyBox2D::BeginContact(b2Contact* contact) {
    b2Fixture *fixtureA = contact->GetFixtureA();
    b2Fixture *fixtureB = contact->GetFixtureB();
    b2Body *bodyA = fixtureA->GetBody();
    b2Body *bodyB = fixtureB->GetBody();
    CCSprite *spriteA = (CCSprite*)bodyA->GetUserData();
    CCSprite *spriteB = (CCSprite*)bodyB->GetUserData();
    if (spriteA && spriteB) {
        spriteA->setColor(ccRED);
        SimpleAudioEngine::sharedEngine()->playEffect("scoreMusic.wav");
    }
}

/// Called when two fixtures cease to touch.
void MyBox2D::EndContact(b2Contact* contact) {
    b2Fixture *fixtureA = contact->GetFixtureA();
    b2Fixture *fixtureB = contact->GetFixtureB();
    b2Body *bodyA = fixtureA->GetBody();
    b2Body *bodyB = fixtureB->GetBody();
    CCSprite *spriteA = (CCSprite*)bodyA->GetUserData();
    CCSprite *spriteB = (CCSprite*)bodyB->GetUserData();
    if (spriteA && spriteB) {
        spriteA->setColor(ccWHITE);
    }
}