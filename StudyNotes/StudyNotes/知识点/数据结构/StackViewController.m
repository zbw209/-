//
//  StackViewController.m
//  StudyNotes
//
//  Created by zhoubiwen on 2018/4/27.
//  Copyright © 2018年 zhou. All rights reserved.
//

#import "StackViewController.h"

@interface StackViewController ()

@end

// 一个对象观察其他对象属性的变化
@implementation StackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self treeStructTest];
}

#pragma mark - 栈

/*
 栈是一种特殊的线性表，在栈顶表尾进行插入和删除操作。
 线性表是每个元素都有且仅有一个直接前继和直接后继的数据结构。
 栈内存为一个动态内存区域，存储函数内部的局部变量、参数、方法调用。栈用于维护函数调用上下文环境。
 
 */

// 查看数据中元素的存储结构
- (void)structInArray {

//    NSArray *arr = @[@"1",@"2",@"3"];
//    for (NSString *str in arr) {
//         NSLog(@"%s %d\n -- %p",__func__,__LINE__,str);
//    }
    
    
    // 可变数组为链表结构， 对指针的操作。创建的数组就是个存储指针的数据，即指针变量数组。
    NSMutableArray *arr1 = [NSMutableArray new];
    [arr1 addObject:@"1"];
    [arr1 addObject:@"2"];
    [arr1 addObject:@"3"];

//    for (NSString *str in arr1) {
//        NSLog(@"%s %d\nstr = %@ -- %p",__func__,__LINE__,str,str);
//    }

    NSString *num = @"100";
     NSLog(@"%s %d\nnum = %@ -- %p",__func__,__LINE__,num,num);
    [arr1 insertObject:@"10" atIndex:1];
    [arr1 addObject:num];
    
    // @“10” 存储在常量区，外界通过指针变量访问该数据。 数组会对加入的对象引用计数加1.
    for (NSString *str in arr1) {
        NSLog(@"%s %d\nstr = %@ -- %p",__func__,__LINE__,str,str);
    }

}

- (void)stackRecursion {
    
    // 使用栈 实现四则运算。 逆波兰后缀表达法
    
    // 数字先进栈，遇到运算符取出栈顶两个数字，将运算结果入栈
    
    int a = (50 * 3 + 6 - 5 ) / 2 - 8;
    // 逆波兰表达式 ： 50 3 * 6 + 5 - 2 / 8 -
    
    a = 78 / 5 + (53 - 9) / 6 - 33 * 2;
    //78 5 / 53 9 - 6 / + 33 2 * -
    
    /*
     中缀表达式转化为后缀表达式（自然语言转化为计算机语言）
     1.遍历中缀表达式
     2.输出数字元素
     3.运算符用栈存储，若当前符号比栈顶符号优先级高，将当前符号入栈，若当前符号优先级不高于栈顶符号，栈顶符号出栈并输出，然后与新的栈顶符号比较。栈顶无符号时，将当前符号入栈。
     */
}

/*
 KMP字符匹配算法
 斐波那契数列 递归思想
 高斯递加  算法的重要性
 */

#pragma mark - 树
/*
 树的结点大于0时，只会存在一个根结点。
 树的子树个数大于0时，任意两个子树都不能存在交集，不然就不能称之为树结构。
 结点拥有的子树数称之为度。度为0的结点是叶子结点或终端结点。度不为0的为分支结点或非终端结点。
 除根结点外分支结点也被称为内部结点。
 树的度是树内各结点度的最大值。
 
 结点struct：
 data域
 parent域（指向该结点的双亲结点，若没有则为-1）
 左结点域（指向孩子左结点，若没有则为-1）
 右结点域（指向兄弟右结点，若没有则为-1）
 
 控制器的关系、图层的关系 都可以用树的结构来表示
 根控制器、
 

 前序遍历：先遍历左子树、后遍历右子树
 
 */

typedef struct Node {
    int code;
    int data;
    int parent;
    struct Node *brother;
    struct Node *left;
    struct Node *right;
} Node;

//void selectNode(int code);

// 树结构测试方法
- (void)treeStructTest {
    
    // 创建根结点
    
    Node root = {
        .parent = -1,
        .code = 1,
        .data = 30,
    };
    
    // 创建子结点
    Node *left = (&root)->left;
    int i = 0;
    while (i < 3) {
        if (!left) {
            left = &root;
        }
        createNode(left, 100);
        left = left->left;
        i++;
    }
    
//     (void)(*abc)(int code){
//
//     };
    
//    orderFirst(&root, selectNode(&root, 50));
}

struct tree {
    Node list[20];
    int length;
};

void createTree() {
    
    
}

// 创建左右结点
void createNode(Node *node , int data) {
    if (node == NULL) {
        return;
    }

    // 创建两个子结点
    for (int i = 0; i < 2; i++) {
        Node *subNode =  malloc(sizeof(Node));
        subNode->left = NULL;
        subNode->right = NULL;
        subNode->brother = NULL;
        
        subNode->parent = node->code;
        subNode->data = data;
        
        // 找到子结点最右边的结点
        Node *left = node->left ? : node;
        while (left->brother != nil) {
            left = left->brother;
        }
        int code = left->code;
        subNode->code = ++code;
        if (!i) {
            node->left = subNode;
        }else {
            node->right = subNode;
            left->brother = node->right;
        }
    }
}

void selectNode(Node *node , int code) {
    
    
}

// 先序遍历
void orderFirst (Node *node,void(*select)(int)) {
    if (node == NULL) {
        return;
    }
    
    Node *left = node->left;
    Node *right = node->right;
    
    printf("先序遍历:code = %d\n",node->code);
    
    select(left->code);
    select(right->code);

    orderFirst(left,select);
    orderFirst(right,select);
}

// 层叠遍历
void orderTraverse (Node *tree) {

    if (!tree) {
        return;
    }
    
    NSLog(@"%s %d\ncode = %d",__func__,__LINE__,tree->code);
    
    Node *left = tree->left;
    NSLog(@"%s %d\ncode = %d",__func__,__LINE__,left->code);

    
    Node *right = tree->right;
    NSLog(@"%s %d\ncode = %d",__func__,__LINE__,right->code);

    orderTraverse(left);
    orderTraverse(right);
    
}


@end
