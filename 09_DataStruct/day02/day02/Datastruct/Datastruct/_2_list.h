//
//  _2_list.h
//  Datastruct
//
//  Created by tarena on 14-6-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#ifndef Datastruct__2_list_h
#define Datastruct__2_list_h

using namespace std;

template <typename T>
class List {
    //数据元素
    struct Node{
        T data;
        Node *next;
        List<int> *parent;
        Node(const T& d) : data(d), next(NULL) {}
    };
    //头指针
    Node *head;
    int size;
    
    
public:
    List() : head(), size() {}
    ~List() {
        clear();
    }
    //找到指定位置 元素地址
    Node* &getptr(int pos) {
        Node *p = head;
        if (p == 0) {
            return head;
        }
        for(int i = 0; i < pos - 1;i++) {
            p = p->next;
        }
        return p->next;
    }
    
    
    
    //尾部 插入
    void insert(const T& d) {
        insert(size, d);
    }
    //指定位置 插入元素
    bool insert(int position, const T& d) {
        if (position < 0 || position > size) {
            return false;
        }
        //创建 节点
        Node *node = new Node(d);
        if (position == 0) {
            node->next = head;
            head = node;
            size++;
            return true;
        }
        
        Node *&r = getptr(position);
        node->next = r;
        r = node;
        size++;
        return true;
    }
    
    //删除指定位置元素
    bool erase(int pos) {
        if (pos < 0 || pos >= size) {
            return false;
        }
        Node *p = head;
        if (pos == 0) {
            head = head->next;
            delete p;
            p = NULL;
            size--;
            return true;
        }
        Node *q = getptr(pos);
        p->next = q->next;
        delete q;
        q = NULL;
        size--;
        return true;
    }
    
    //修改指定位置 元素
    bool set(int pos, const T& d) {
        if (pos < 0 || pos >= size) {
            return false;
        }
        Node *p = head;
        for (int i = 0; i < pos; i++) {
            p = p->next;
        }
        p->data = d;
        return true;
    }
    
    //清理 链表
    void clear() {
        while (head) {
            Node *p = head->next;
            delete head;
            head = p;
        }
        size = 0;
    }
    
    
    //打印
    void travel() {
        Node *p = head;
        while (p) {
            cout << p->data << ' ';
            p = p->next;
        }
        cout << endl;
    }
    
    int getSize() {
        return size;
    }
    
    Node* getHead() {
        return head;
    }
    
    //头部插入元素
    void push_front(const T& d) {
        insert(0, d);
    }
    //头部插入元素
    void push_back(const T& d) {
        insert(d);
    }
    //删除头部元素
    void pop_front() {
        erase(0);
    }
    
    //返回头部元素
    T& front() {
        return getHead()->data;
    }
    
    //返回头部元素
    T& back() {
        return getptr(size - 1)->data;
    }
    
};


#endif
