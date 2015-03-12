//
//  SelectLevelLayer.h
//  XiaoQianRun
//
//  Created by BFM on 13-12-9.
//
//

#ifndef __XiaoQianRun__SelectLevelLayer__
#define __XiaoQianRun__SelectLevelLayer__

#include <iostream>
#include "cocos2d.h"
#include "SelectMapLayer.h"
USING_NS_CC;

class SelectLevelLayer : public CCLayer {
public:
    static CCScene* scene(int mapLevel);
    static SelectLevelLayer* createSelectLevelLayer(int mapLevel);
    bool initSelectSelectLevelLayer(int mapLevel);
private:
    void goSelectMapLayer();
};

#endif /* defined(__XiaoQianRun__SelectLevelLayer__) */
