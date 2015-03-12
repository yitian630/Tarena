//
//  E_mm.h
//  XiaoQianRun
//
//  Created by tarena on 14-6-23.
//
//

#ifndef __XiaoQianRun__E_mm__
#define __XiaoQianRun__E_mm__

#include <iostream>
#include "cocos2d.h"
#include "Enemy.h"
USING_NS_CC;

class E_mm : public Enemy{
public:
    CREATE_FUNC(E_mm);
    bool init();
};

#endif /* defined(__XiaoQianRun__E_mm__) */
