#include <iostream>
#include "MyArray.h"
using namespace std;

template<typename T = int>
class Buffer{
    T buf[100];
    int size;
public:
    Buffer(): size(){
        
    }
    void push(T d) {
        buf[size] = d;
        size ++;
    }
    T get(int position) {
        return buf[position];
    }
};


template<typename K, typename V>
class Dictionary{
    K keys[100];
    V values[100];
    int size;
public:
    Dictionary() : size() {
        
    }
    void addObjectForKey(const K& key, const V& value) {
        keys[size] = key;
        values[size] = value;
        size++;
    }
    
    V objectForKey(const K& key) {
        for (int i = 0; i < size; i++) {
            if (keys[i] == key) {
                return values[i];
            }
        }
        return NULL;
    }
};




//编译器帮我们生成的类
class Buffer_Int{
    int buf[100];
    int size;
public:
    Buffer_Int(): size(){
        
    }
    void push(int d) {
        buf[size] = d;
        size ++;
    }
    int get(int position) {
        return buf[position];
    }
};

//编译器帮我们生成的类
class Buffer_String{
    string buf[100];
    int size;
public:
    Buffer_String(): size(){
        
    }
    void push(string d) {
        buf[size] = d;
        size ++;
    }
    string get(int position) {
        return buf[position];
    }
};


class NSObject {
    string name;
public:
    NSObject(string name) : name(name) {
        
    }
    
    string getName() {
        return name;
    }
};

class NSString : public NSObject {
public:
    NSString(string name) : NSObject(name) {
    }
};

class NSButton : public NSObject {
public:
    NSButton(string name) : NSObject(name) {
    }
    
    void touch() {
        cout << "touch" << endl;
    }
};


int main() {
    Buffer<> buf;
    buf.push(123);
    buf.push(3);
    buf.push(1323);
    
    Buffer<string> buf2;
    buf2.push("abd");
    buf2.push("cde");
    
    Buffer<int> buf3;
    buf.push(23);
    
    //处理 int
//    MyArray<> arry;
    
    //处理 string
    
    MyArray<int> array;
    array.push_back(123);
    array.push_back(44);
    cout << array << endl;
    
    MyArray<string> array2;
    array2.push_back("adf");
    array2.push_back("qwer");
    cout << array2 << endl;
    
    MyArray<int> array8;
    array8 = array;
    cout << array8 << endl;
    cout << array8.getSize() << endl;
    
    //作业：只要是 NSObject 的子类 都可以放在 数组中进行操作
    
    
    NSString *str = new NSString("NSString");
    NSButton *but = new NSButton("NSButton");
    MyArray<NSObject*> array3;
    array3.push_back(str);
    array3.push_back(but);
    cout << array3 << endl;
    for (int i = 0; i < array3.getSize(); i++) {
        cout << array3[i]->getName() << endl;
    }
    
    ((NSButton*)array3[1])->touch();
    
    
    
    
    Dictionary<string, int> dic;
    dic.addObjectForKey("key1", 123);
    dic.addObjectForKey("key2", 345);
    cout << dic.objectForKey("key1") << endl;
    
    Dictionary<int, string> dic2;
    dic2.addObjectForKey(123, "abc");
    dic2.addObjectForKey(234, "dce");
    cout << dic2.objectForKey(123) << endl;
    

    
//    dic3.addObjectForKey("NSString", NSString*);
//    dic3.addObjectForKey("NSButton", NSButton*);
    return 0;
}







