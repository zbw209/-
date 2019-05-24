//
//  AsyncView.m
//  StudyNotes
//
//  Created by zhoubiwen on 2019/3/27.
//  Copyright © 2019 zhou. All rights reserved.
//

#import "AsyncView.h"
#import <YYAsyncLayer/YYAsyncLayer.h>

@implementation AsyncView

+ (Class)layerClass {
    return [YYAsyncLayer class];
}

- (void)setText:(NSString *)text {
    _text = text.copy;
    
    [[YYTransaction transactionWithTarget:self selector:@selector(contentNeedUpdated)] commit];
}

- (void)contentNeedUpdated {
    [self.layer setNeedsDisplay];
}

- (YYAsyncLayerDisplayTask *)newAsyncDisplayTask {
    
    
    
    YYAsyncLayerDisplayTask *task = [YYAsyncLayerDisplayTask new];
    
    task.willDisplay = ^(CALayer * _Nonnull layer) {
       
        layer.backgroundColor = [UIColor cyanColor].CGColor;
    };
    
    
    task.display = ^(CGContextRef  _Nonnull context, CGSize size, BOOL (^ _Nonnull isCancelled)(void)) {
       
        
    };
    
    task.didDisplay = ^(CALayer * _Nonnull layer, BOOL finished) {
      
        
    };
    
    
    return task;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
