//
//  CloudPool.cpp
//  Plane
//
//  Created by tarena on 14-6-11.
//
//

#include "CloudPool.h"
#include "Cloud.h"
#include "Tools.h"

CloudPool::~CloudPool() {
    CC_SAFE_RELEASE(m_clouds);
}
bool CloudPool::init() {
    m_clouds = CCArray::create();
    CC_SAFE_RETAIN(m_clouds);
    
    this->addCloud(10);
    
    //随机 算子
    srand((unsigned int)time(NULL));
    
    return true;
}

void CloudPool::addCloud(int num){
    for (int i = 0; i < num; i++) {
        Cloud *cloud = Cloud::create();
        m_clouds->addObject(cloud);
    }
}

Cloud* CloudPool::getCloud() {
    for (int i = 0; i < m_clouds->count(); i++) {
        Cloud *cloud = (Cloud*)m_clouds->objectAtIndex(i);
        if (cloud->getShow()) {
            continue;
        } else {
            float speed = 0;
            float scale = 0;
            //CCRANDOM_0_1  0-1的随机数
            int z = (int)(CCRANDOM_0_1() * 100) % 2 == 0 ? 1 : -1;
            switch (z) {
                case 1: //上面
                    scale = 1.2;
                    speed = 6;
                    break;
                case -1: //下面
                    scale = 0.7;
                    speed = 3;
                    break;
            }
            
            cloud->setPosition(ccp(CCRANDOM_0_1() * SCREEN.width, SCREEN.height + cloud->getContentSize().height * 0.5));
            cloud->setScale(scale);
            cloud->setSpeed(speed);
            cloud->setZOrder(z);
            cloud->show();
            return cloud;
        }
    }
    return NULL;
}

void CloudPool::showCloud(CCNode *parent) {
    Cloud *cloud = this->getCloud();
    if (cloud) {
        parent->addChild(cloud);
    }
}




