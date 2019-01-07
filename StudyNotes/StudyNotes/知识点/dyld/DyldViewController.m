//
//  DyldViewController.m
//  StudyNotes
//
//  Created by zhoubiwen on 2019/1/3.
//  Copyright © 2019 zhou. All rights reserved.
//

#import "DyldViewController.h"


#include <mach-o/dyld.h>

@interface DyldViewController ()

@end

@implementation DyldViewController

+ (void)load {
    [super load];
}

void callbackFunc(const struct mach_header *header, intptr_t pt) {
    
    
    
}


__attribute__((constructor))
void addCallbackForImage () {
    _dyld_register_func_for_add_image(callbackFunc);
}

- (void)viewDidLoad {
    [super viewDidLoad];


}


@end
