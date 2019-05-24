//
//  GCDController.h
//  StudyNotes
//
//  Created by zhoubiwen on 2019/2/25.
//  Copyright © 2019 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GCDControllerDelegate <NSObject>

- (void)haha;

@end

@interface GCDController : UIViewController

@property (nonatomic, assign) id<GCDControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
