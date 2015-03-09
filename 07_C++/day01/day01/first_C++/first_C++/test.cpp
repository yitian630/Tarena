#include <iostream>
using namespace std;

namespace myshow {
    void desplay(const char *ch){
        cout << *ch << "出现了" << endl;
    }
}

namespace hero {
    const char *name = "英雄";
    void show(){
        cout << "英雄出现" << endl;
    }
    
    void test() {
        myshow::desplay(name);
    }
}

int main () {
 

    return 0;
}
