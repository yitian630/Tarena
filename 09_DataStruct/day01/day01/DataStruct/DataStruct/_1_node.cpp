//
//  main.cpp
//  DataStruct
//
//  Created by tarena on 14-6-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#include <iostream>

typedef int T;
struct Node{
    T data;
    Node *next;
    Node(const T& d) : data(d), next(NULL){}
};

void print(Node *&head) {
    Node *node = head;
    while (node) {
        std::cout << node->data << ' ';
        node = node->next;
    }
    std::cout <<  std::endl;
}

int main()
{
    
    Node n1(100), n2(200), n3(300), n4(400);
    n1.next = &n2;
    n2.next = &n3;
    n3.next = &n4;
 
    Node *head = &n1;
    print(head);
      std::cout << "===================" << std::endl;
    //插入一个元素 n5
    Node n5(500);
    n3.next = &n5;
    n5.next = &n4;
    print(head);
    std::cout << "===================" << std::endl;
    //删除 n2元素
    n1.next = n2.next;
    print(head);
  std::cout << "===================" << std::endl;
    //删除 n3 后面的元素
    Node *& pd = n3.next;
    pd = pd->next;
    print(head);
  std::cout << "===================" << std::endl;
    
    head = &n2;
    print(head);

    return 0;
}








