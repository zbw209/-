//
//  RuntimeVC.m
//  StudyNotes
//
//  Created by 周必稳 on 2017/2/6.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "RuntimeVC.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface RuntimeVC ()

@property (nonatomic, strong) NSString *name;
@end

@implementation RuntimeVC

/*
 运行时机制
 1.一套纯C语言的接口，OC的底层实现。
 2.OC能够实现的功能都能实现，还能实现OC实现不了的功能。
 3.可以在程序运行期间动态的修改对象的属性和方法。
 4.可以进行方法交换，给类增加方法，增加属性。
 5.对系统提供的类以及静态库进行动态修改。
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    [self property];
}

/*
 可以获取到类所有的属性，利用KVC机制实现对属性的读写操作。
 只能获取到本类的属性，无法获取到父类的。
 适用于对对象的归档和反归档操作。
 */
- (void)property {
    unsigned int count = 0;
//    objc_property_t *propertylist = class_copyPropertyList([self class], &count);
//    NSLog(@"%s,%d self.name = %@",__FUNCTION__,__LINE__,self.name);
//    for (int i = 0; i < count; i++) {
//        const char *pro = property_getName(propertylist[i]);
//        NSLog(@"%s,%d pro = %@",__FUNCTION__,__LINE__,[NSString stringWithUTF8String:pro]);
//        [self setValue:@"789" forKey:[NSString stringWithUTF8String:pro]];
//    }
//    NSLog(@"%s,%d self.name = %@",__FUNCTION__,__LINE__,self.name);
    
    Method *meth = class_copyMethodList([self class], &count);
    for (int i = 0; i < count; i++) {
        NSString *methodName = NSStringFromSelector(method_getName(*(meth + i)));
        NSLog(@"%s,%d  methodName = %@",__FUNCTION__,__LINE__,methodName);
        if ([methodName isEqualToString:@"test1"]) {
            objc_msgSend(self, method_getName(*(meth + i)));
        }
    }
}

/*
 方法交换
 可以在程序运行时，动态的替换方法的实现。将指向方法实现的指针重指向。
 */
- (void)methodSwizzling {

    Method m1 = class_getInstanceMethod([self class], @selector(test1));
    Method m2 = class_getInstanceMethod([self class], @selector(test2));
    
    // 为类增加方法，这个方法必须是该类没有实现的方法。
//  bool res =  class_addMethod([self class], @selector(test1), method_getImplementation(m2), method_getTypeEncoding(m2));
    
    
//    class_replaceMethod([self class], @selector(test2), method_getImplementation(m1), method_getTypeEncoding(m1));
    
    [self test1];
    
    method_exchangeImplementations(m1, m2);
    [self test1];
}

- (void)test1 {
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
}

- (void)test2 {
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
}

@end
