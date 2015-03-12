//
//  SelectRoleLayer.h
//  XiaoQianRun
//
//  Created by BFM on 13-12-9.
//
//

#ifndef __XiaoQianRun__SelectRoleLayer__
#define __XiaoQianRun__SelectRoleLayer__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class SelectRoleLayer : public CCLayer {
public:
    static CCScene* scene(int mapLevel, int Level);
    static SelectRoleLayer* createSelectRoleLayer(int mapLevel, int Level);
    bool initSelectSelectSelectRoleLayer(int mapLevel, int Level);
private:
    void goSelectLevelLayer();
    int m_mapLevel;
    int m_level;

};
#endif /* defined(__XiaoQianRun__SelectRoleLayer__) */
