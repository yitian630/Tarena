#include <iostream>
using namespace std;

//void fa(char ch){ cout << "fa(char ch)" << endl;}
//void fa(short ch){ cout << "fa(short ch)" << endl;}
void fa(int ch){ cout << "fa(int ch)" << endl;}
void fa(long ch){ cout << "fa(long ch)" << endl;}
void fa(float ch){ cout << "fa(float ch)" << endl;}
void fa(double ch){ cout << "fa(double ch)" << endl;}

int main () {
    char c;
    short s;
    int i;
    long l;
    float f;
    double d;
    
    fa(c); //  fa(int ch)
    fa(s); //  fa(int ch)
    fa(i); //  fa(int ch)
    fa(l); //  fa(long ch)
    fa(f); //  fa(float ch)
    fa(d); //  fa(double ch)
}


