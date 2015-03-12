//
//  SunWuKongLoader.h
//  SWK
//
//  Created by tarena on 14-6-24.
//
//

#ifndef __SWK__SunWuKongLoader__
#define __SWK__SunWuKongLoader__

#include <iostream>
#include "cocos2d.h"
#include "cocos-ext.h"
#include "SunWuKong.h"
USING_NS_CC;
USING_NS_CC_EXT;

class SunWuKongLoader : public CCNodeLoader {
public:
    CCB_STATIC_NEW_AUTORELEASE_OBJECT_METHOD(SunWuKongLoader, loader);
private:
    CCB_VIRTUAL_NEW_AUTORELEASE_CREATECCNODE_METHOD(SunWuKong);
};

#endif /* defined(__SWK__SunWuKongLoader__) */






