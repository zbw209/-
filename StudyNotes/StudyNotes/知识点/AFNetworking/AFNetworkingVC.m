//
//  AFNetworkingVC.m
//  StudyNotes
//
//  Created by 周必稳 on 2017/4/18.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AFNetworkingVC.h"
#import "AFNetworking.h"
#import "UIProgressView+AFNetworking.h"

@interface AFNetworkingVC ()

@property (nonatomic, strong) UIProgressView *proView;
@end

@implementation AFNetworkingVC

- (void)viewDidLoad {
    [super viewDidLoad];

    _proView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 5)];
    _proView.tintColor = [UIColor redColor];
    _proView.progress = 0.0;
    [self.view addSubview:_proView];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (IBAction)test1:(id)sender {
    
    [self test3];
 
}

- (void)test2 {
    //    [_proView setProgress:1.0 animated:YES];
    //       AFHTTPRequestOperation *operation = [[AFHTTPRequestOperationManager manager]GET:@"" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
    //
    //        } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
    //
    //        }];
    //
    //   NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession]dataTaskWithURL:[NSURL URLWithString:@""] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    //
    //    }];
    //
    //    [dataTask resume];
    //
    //    [_proView setProgressWithUploadProgressOfOperation:operation animated:YES];

}

- (void)test3 {
    NSBlockOperation *blockOp = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"i = %d",i);
        }
    }];
    
//    NSOperationQueue
    // 当操作加入到操作队列中时，系统会自动的调用start方法
    [blockOp start]; // 会在当前线程调用
}

@end
