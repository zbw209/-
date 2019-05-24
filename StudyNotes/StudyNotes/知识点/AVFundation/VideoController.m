//
//  VideoController.m
//  StudyNotes
//
//  Created by zhoubiwen on 2019/4/11.
//  Copyright © 2019 zhou. All rights reserved.
//

#import "VideoController.h"
#import <AVFoundation/AVFoundation.h>

@interface VideoController ()

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *item;


@end

@implementation VideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self videoPlay];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 200, 80, 80);
    button.backgroundColor = [UIColor cyanColor];
    [button addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)videoPlay {
    NSString *str = @"https://video.makezixun.com/fashion/video/hd/20190411/2f/2fc3524a-7f6b-4c1e-92ad-386f75dc6232.mp4";
    
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:str]];
    self.item = item;
    

    
//    self.player = [[AVPlayer alloc] initWithPlayerItem:item];
//
//    AVPlayerLayer *layer = [[AVPlayerLayer alloc] init];
//    layer.player = self.player;
//
//    layer.backgroundColor = [UIColor cyanColor].CGColor;
//    layer.frame = CGRectMake(50, 100, 200, 150);
//
////    [layer displayIfNeeded];
//    [self.view.layer addSublayer:layer];
//
//
//    [self.player play];
}

- (void)play {
    _player=[[AVPlayer alloc]initWithPlayerItem:self.item];
    AVPlayerLayer *layer = [[AVPlayerLayer alloc]init];
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.frame = CGRectMake(0, 0, 200, 150); //self.view.bounds;
    layer.player = _player;
    [layer displayIfNeeded];
    [self.view.layer insertSublayer:layer atIndex:0];
    layer.videoGravity = AVLayerVideoGravityResizeAspect;
    
    //    [self addNotificatonForPlayer];
    [_player play];

}

@end
