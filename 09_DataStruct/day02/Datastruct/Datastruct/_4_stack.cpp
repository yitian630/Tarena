#include <iostream>
using namespace std;


template <typename T, int n = 10>
class Stack {
    T data[n];
    int size; //处了记录大小  还可以记录栈顶位置
public:
    Stack():size(){}
    
    void push(const T& d) {
        data[size++] = d;
    }
    
    void pop() {
        size--;
    }
    
    T top() {
        return data[size - 1];
    }
    
    bool empty() {
        return size == 0;
    }
    
    int getSize() {
        return size;
    }
};

bool prior(char op1, char op2) {
    return (op1 == '*' || op1 == '/') && (op2 == '+' || op2 == '-');
}

int main() {
    string expr = "1+2*3/(4-1)";
    Stack<char> res;//结果栈
    Stack<char> oper;//运算符栈
    
    for (int i = 0; i < expr.length(); i++) {
        char ch = expr[i];
        //isdigit 就是判断 字符是否是一个 数字
        if (isdigit(ch)) {
            //如果是一个数字放到结果站立
            res.push(ch);
        } else if(ch == '('){
            oper.push(ch);
        }else if(ch == ')') {
            //‘（’符号前的  运算符 全部从 运算符栈中弹出  弹到 结果栈
            while (oper.top() != '(') {
                res.push(oper.top());
                oper.pop();
            }
            oper.pop();
        }else {
            while(!oper.empty() && oper.top() != '(' && !prior(ch, oper.top())) {
                res.push(oper.top());
                oper.pop();
            }
            oper.push(ch);
        }
    }
    
    //把运算符栈剩余的运算符放在结果栈里
    while (!oper.empty()) {
        res.push(oper.top());
        oper.pop();
    }
    
    while (!res.empty()) {
        oper.push(res.top());
        res.pop();
    }
    
    
    
    while (!oper.empty()) {
        cout << oper.top() << ' ';
        oper.pop();
    }
    cout << endl;
}






