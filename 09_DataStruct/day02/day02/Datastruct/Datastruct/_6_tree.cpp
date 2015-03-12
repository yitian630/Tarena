#include <iostream>
#include <iomanip>
using namespace std;

template <typename T>
class myTree {
    
public:
    struct Node{
        T data;
        Node *left;
        Node *right;
        Node(const T& d) : data(d), left(), right() {}
    };
private:
    //树根
    Node *root;
    //树里有多少个成员
    int size;
    
    typedef Node* Tree;
    
    //讲一个节点插入到一个树中
    void insert(Tree &tree, Node* pn) {
        if (pn == NULL) return;
        //树为空
        if (tree == NULL) {tree = pn; return;}
        //树不为空
        if (pn->data > tree->data) {
            insert(tree->right, pn);
        }else {
            insert(tree->left, pn);
        }
    }
    
    //打印一颗树 （中序）
    void travel(Tree & tree) {
        if (tree == NULL) return;
        travel(tree->left);
        cout << tree->data << ' ';
        travel(tree->right);
    }
    
    //前序 遍历
    void travel2(Tree &tree) {
        if (tree == NULL) return;
        cout << tree->data << endl;
        travel(tree->left);
        travel(tree->right);
    }
    //清楚一颗树
    void clear(Tree &tree) {
        if (tree == NULL) return;
        clear(tree->left);
        clear(tree->right);
        delete tree;
        tree = NULL;
    }
    
    void print(Tree &tree, int de, char ch) {
        if (tree == NULL) return;
      
         print(tree->right, de+3,  '/');
        cout << setw(de) << ' '  << ch << tree->data << endl;
         print(tree->left, de+3,  '\\');
    }
    
    //查找一个树
    Tree find(Tree &tree, const T& d){
        if (tree == NULL) return NULL;
        if (tree->data == d) {
            return tree;
        }
        if (d > tree->data) {
            return find(tree->right, d);
        }
        return find(tree->left, d);
    }
    
public:
    myTree() : root(), size() {}
    ~myTree() {
        clear();
    }
    //向树中插入 元素
    void insert(const T& d) {
        Node *node = new Node(d);
        insert(root, node);
        size++;
    }
    //清空 树
    void clear() {
        clear(root);
        size = 0;
    }
    //中序
    void travel() {
        travel(root);
        cout << endl;
    }
    
    //前序
    void travel2() {
        travel2();
        cout << endl;

    }
    
    void print() {
        print(root, 0, '*');
    }
    
    void find(const T& d) {
        Tree tree = find(root, d);
        travel(tree);
    }
};


int main() {
    
    myTree<int> tree;
    tree.insert(50);
    tree.insert(80);
    tree.insert(10);
    tree.insert(20);
    tree.insert(40);
    tree.insert(70);
    tree.insert(60);
    tree.insert(200);
    tree.insert(30);
    tree.travel();
    tree.print();
    cout << "=============" << endl;
    tree.find(80);
    
    return 0;
}











