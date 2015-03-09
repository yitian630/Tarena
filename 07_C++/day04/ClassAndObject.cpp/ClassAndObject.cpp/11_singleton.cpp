#include <iostream>
using namespace std;

class CCDirector {
    //为了不让用户 随意 new 对象，所以把构造函数私有
    CCDirector(){
    }
    static CCDirector* dir;
public:
    static CCDirector* sharedDircetor() {
        if (dir == NULL) {
            dir = new CCDirector();
        }
        return dir;
    }
};
//给静态 变量 分配内存空间
CCDirector* CCDirector::dir = NULL;

int main() {
//    CCDirector *dir = new CCDirector();
//    CCDirector *dir1 = new CCDirector();
    
    
    CCDirector *dir = CCDirector::sharedDircetor();
    CCDirector *dir1 = CCDirector::sharedDircetor();
    CCDirector *dir2 = CCDirector::sharedDircetor();
    cout << dir << ' ' << dir1 << endl;
    CCDirector *dir3 = dir2;
    cout << dir2 << ' ' << dir3 << endl;
    return 0;
}