//
//  LoadingScene.h
//  Loading
//
//  Created by tarena on 14-6-25.
//
//

#ifndef __Loading__LoadingScene__
#define __Loading__LoadingScene__

#include <iostream>
#include "cocos2d.h"
USING_NS_CC;

class LoadingScene : public CCLayer {
public:
    static CCScene* scene();
    CREATE_FUNC(LoadingScene);
    bool init();
    
    void resources();
    
    void loadCallBack();
    
    int count;
};
#endif /* defined(__Loading__LoadingScene__) */
