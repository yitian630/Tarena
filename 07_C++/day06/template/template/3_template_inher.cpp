#include <iostream>
using namespace std;

class Parent1{};

template <typename T>
class Parent{};

class Child1 : public Parent<int> {};

template <typename T>
class Child2 : public Parent1{
};

template <typename T>
class Child3 : public Parent<int> {};

template <typename T>
class Child4 : public Parent<T> {};

int main() {
    Child4<string> child;
}



