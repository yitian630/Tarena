//
//  CloudPool.h
//  Plane
//
//  Created by tarena on 14-6-11.
//
//

#ifndef __Plane__CloudPool__
#define __Plane__CloudPool__

#include <iostream>
#include "cocos2d.h"
#include "Cloud.h"
USING_NS_CC;
class CloudPool : public CCObject {
public:
    ~CloudPool();
    CREATE_FUNC(CloudPool);
    bool init();
    void showCloud(CCNode *parent);
private:
    CCArray *m_clouds;
    void addCloud(int num);
    Cloud* getCloud();
};

#endif /* defined(__Plane__CloudPool__) */






