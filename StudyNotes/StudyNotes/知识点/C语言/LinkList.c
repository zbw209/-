//
//  LinkList.c
//  StudyNotes
//
//  Created by zhoubiwen on 2018/4/25.
//  Copyright © 2018年 zhou. All rights reserved.
//

#include "LinkList.h"
#include <stdlib.h>

struct ListEle {
    char *str;
    void *next;
};

// 单链表整体删除(表内元素free)
void deleteList(void *p,void *q) {

    //拿到第一个元素
    struct ListEle liste;
    
    p = q;
    q = liste.next;
    free(p);
    
    
    
}
