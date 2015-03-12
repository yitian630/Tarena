//
//  MenuLayer.h
//  Plane
//
//  Created by tarena on 14-6-10.
//
//

#ifndef __Plane__MenuLayer__
#define __Plane__MenuLayer__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class MenuLayer : public CCLayerColor {
public:
    static CCScene* scene();
    CREATE_FUNC(MenuLayer);
    virtual bool init();
private:
    void showBG();
    void showLogo();
    void showMenu();
    void goGameScene();
};

#endif /* defined(__Plane__MenuLayer__) */










