//
//  QueueVC.m
//  StudyNotes
//
//  Created by zhoubiwen on 2018/8/13.
//  Copyright © 2018年 zhou. All rights reserved.
//

#import "QueueVC.h"

@interface QueueVC ()

@end

@implementation QueueVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/*
 队列：从一头插入（队尾），另一头删除（队首），先进先出（FIFO）
 
 队列会维护两个下标，一个表示队首，一个表示队尾。
 需要删除数据是就移动队首下标进行操作
 需要插入数据是就移动队尾下标进行操作
 
 */

struct Queue {
    int arr[100];
    int head;
    int foot;
    int *p;
};

// 队列简单操作
void queueOpreation() {
    
    // 初始化一个队列结构体指针
//    struct Queue *que;
    
    // 初始化一个队列结构体
    struct Queue queue;
    int i = 0;
    queue.head = 0;
    queue.foot = 9;

    while (i < 10) {
        queue.arr[i] = i;
        i++;
    }
    
    // 算法逻辑
    while (queue.head < queue.foot) {
        
        // 将第一个数据从队列中移除
        queue.head++;
        
        // 将第二个数移到队尾
         int var = queue.arr[queue.head];
        
        queue.foot++;
        queue.arr[queue.foot] = var;
        
        // 将第二个数从队列中移除
        queue.head++;
    }
}

// 栈与队列同为线性表结构
struct Stack {
    int arr[10];
    int head;
    int count;
};

// 数组表示链表结构
struct List {
    int data[10];
    int right[10];
};

void enumFunc() {
    
    int m = 30;
    
    int arr[10] = {6,2,5,5,4,5,6,3,7,6};
//    int count[10] = {1,2,3,4,5,6,7,8,9};
    

    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            for (int q = 0; q < 10; q++) {
                if (arr[i] + arr[j] + arr[q] == m && i + j == q) {
                    printf("%d + %d = %d\n",i,j,q);
                    
                }
            }
        }
    }
}

// 通过队列实现广度优先搜素算法(查找到达某个位置的最短路径)
// 将起点下一步能够到达的点入列，再寻找入列的这些点下一步能够到达的点。直到出现目标点为止。

void findTheWay() {
    
    // 定义坐标结构体
    struct Point {
        int x;
        int y;
        int s;
    };
    
    // 初始化队列
    struct Point point[2501];
    
    int map[50][50];
    
    int head = 1,foot = 1;
    int m = 50,n = 50;
    
    // 目标点坐标
    int p  = 5,q = 6;
    
    // 四个方向坐标
    int road[4][4] = {{1,0},{0,1},{-1,0},{0,-1}};
    
    // 记录是否入列
    int book[51][51];
    
    // 用来标记是否到达目标点
    int flag = 0;
    
    // 将起点入列
    point[foot].x = 1;
    point[foot].y = 1;
    point[foot].s = 0;
    book[foot][foot] = 1;
    foot++;
    
    
    while (head < foot) {
        
        // 顺时针向周围四个方向前进
        for (int i = 0; i < 4; i++) {
            int tx,ty;
            
            // 记录前进后点的坐标
            tx = point[foot].x + road[i][0];
            ty = point[foot].y + road[i][1];

            // 判断是否越界
            if (tx > 0 && tx < m && ty > 0 && ty < n) {
                
                // 判断当前坐标可以前进,且没有入列
                if (map[tx][ty] == 0 && book[tx][ty] == 0) {
                    
                    // 将当前坐标入列 列的数据操作规则是从队尾入列 队首出列
                    
                    point[foot].x = tx;
                    point[foot].y = ty;
                    point[foot].s = point[head].s + 1;
                    foot++;
                    
                    book[tx][ty] = 1;
                }
                
                // 已到目标位置
                if (tx == p && ty == q) {
                    flag = 1;
                    
                    break;
                }
            }
        }
        
        if (flag == 1) break;
        head++;
        
    }
}

void whereAreYou(int x ,int y) {
    
    int map[50][50];
    int book[50][50];
    
    int area[50][50];
    
    int road[4][4];
    
    int head = 1,tail = 1;
    
    while (head < tail) {
        
    }
    
    
    
}

struct Pipe {
    int type;
    int direction;
    
//    int head;
//    int tail;
    
};


void flowthePipe(struct Pipe *pipe) {
    
    switch (pipe->type) {
        case 1:
            
            break;
            
        default:
            break;
    }
    
    
    
}



















// 鹊桥佳期近 情思托物陈 若得佳人笑 美酒赠倾城



@end
