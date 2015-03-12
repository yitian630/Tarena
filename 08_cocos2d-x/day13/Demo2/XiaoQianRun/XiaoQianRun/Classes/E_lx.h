//
//  E_lx.h
//  XiaoQianRun
//
//  Created by tarena on 14-6-23.
//
//

#ifndef __XiaoQianRun__E_lx__
#define __XiaoQianRun__E_lx__

#include <iostream>
#include "cocos2d.h"
#include "Enemy.h"
USING_NS_CC;

class E_lx : public Enemy{
public:
    CREATE_FUNC(E_lx);
    bool init();
};

#endif /* defined(__XiaoQianRun__E_lx__) */
