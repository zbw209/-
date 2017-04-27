//
//  PullDownView.m
//  文件编译
//
//  Created by 周必稳 on 2017/4/25.
//  Copyright © 2017年 demo. All rights reserved.
//

#import "PullDownView.h"

#define kTriangleWidth 20
#define kTriangleHeight 10

#define kShowAnimationDuration 0.5
#define kHideAnimationDuration 0.35

#define kAlpha 0.55

@interface PullDownView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *tableViewBackgroundView;
@property (nonatomic, strong) UIView *topTriangleView;

@property (nonatomic, assign) CGRect tableViewFrame;
@property (nonatomic, assign) CGRect tableViewOriginFrame;
@property (nonatomic, assign) CGPoint tableViewOriginCenter;

@property (nonatomic, assign) CGFloat ScaleRate; // tableView
@property (nonatomic, assign) CGFloat trianglePostionRate;

@property (nonatomic, assign) CGFloat triangleWidth;
@property (nonatomic, assign) CGFloat triangleHeight;

@property (nonatomic, assign) id<PullDownViewDelegate> pullDownViewDelegate;

@end

@implementation PullDownView

+ (instancetype)pullDownViewWithFrame:(CGRect)frame {
    PullDownView *view = [[PullDownView alloc]initWithFrame:CGRectZero tableViewFrame:frame];
    return view;
}

#pragma mark - InitMethods
- (instancetype)initWithFrame:(CGRect)frame tableViewFrame:(CGRect)tableFrame {
    if (self = [super initWithFrame:frame]) {
        [self initDataWithTableViewFrame:tableFrame];
        [self initSubViews];
    }
    return self;
}

- (void)initDataWithTableViewFrame:(CGRect)tableViewFrame {
    _ScaleRate = 10;
    _enableBounces = YES;
    _trianglePostionRate = 0.5;
    self.tableViewFrame = tableViewFrame;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.frame = CGRectMake(0, 0, width, height);
}

- (void)initSubViews {
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    
    _tableViewBackgroundView = [[UIView alloc]init];
    _topTriangleView = [[UIView alloc]init];
    
    [self addSubview:_tableViewBackgroundView];
    [self addSubview:_topTriangleView];
    [self addSubview:_tableView];
    
    [self setupSubViewsFrameWithTableViewFrame:_tableViewFrame];
    [self setupSubViews];
}

- (void)setupSubViewsFrameWithTableViewFrame:(CGRect)tableViewFrame {
    CGFloat tableViewX = tableViewFrame.origin.x + tableViewFrame.size.width / 2 - 10;
    _tableView.frame = CGRectMake( tableViewX, tableViewFrame.origin.y, tableViewFrame.size.width / _ScaleRate, tableViewFrame.size.height / _ScaleRate);
    _tableViewBackgroundView.frame = _tableView.frame;
    _tableViewOriginFrame = _tableViewBackgroundView.frame;
    
    _topTriangleView.frame = CGRectMake(0 , tableViewFrame.origin.y - kTriangleHeight, kTriangleWidth, kTriangleHeight);
    [self setupTrianglePosition];
}

- (void)setupTrianglePosition {
    CGFloat centerX = _tableViewFrame.origin.x + _tableViewFrame.size.width  * _trianglePostionRate;
    _topTriangleView.center = CGPointMake(centerX, _topTriangleView.center.y);
    _tableViewOriginCenter = CGPointMake(centerX, _tableView.center.y);
}

- (void)setupSubViews {
    _tableViewBackgroundView.backgroundColor = [UIColor blackColor];
    _tableViewBackgroundView.layer.cornerRadius = 5;
    _tableViewBackgroundView.alpha = 0.0;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, kTriangleHeight)];
    [path addLineToPoint:CGPointMake(kTriangleWidth / 2, 0)];
    [path addLineToPoint:CGPointMake(kTriangleWidth, kTriangleHeight)];

    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor blackColor].CGColor;
    layer.frame = _topTriangleView.bounds;
    layer.path = path.CGPath;
    [_topTriangleView.layer addSublayer:layer];
    _topTriangleView.alpha = 0.0;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.layer.cornerRadius = 5;
    
    UIView *view = [[UIView alloc]initWithFrame:self.bounds];
    [self insertSubview:view atIndex:0];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction)];
    [view addGestureRecognizer:tap];
}

#pragma mark - SetMethods
- (void)setCenter:(CGPoint)center {
    _tableViewFrame.origin.x = center.x - _tableViewFrame.size.width / 2;
    _tableViewFrame.origin.y = center.y - _tableViewFrame.size.height / 2;
    [self setupSubViewsFrameWithTableViewFrame:_tableViewFrame];
}

- (void)setTableViewFrame:(CGRect)tableViewFrame {
    _tableViewFrame = tableViewFrame;
    _tableViewFrame.origin.y += kTriangleHeight;
}

- (void)setTriangleDirection:(PullDownViewTriangleViewDirection)direction {
    switch (direction) {
        case TriangleViewLeftTop:
            _trianglePostionRate = 0.25;
            break;
        case TriangleViewCenterTop:
            _trianglePostionRate = 0.5;
            break;
        case TriangleViewRightTop:
            _trianglePostionRate = 0.75;
            break;

        default:
            break;
    }
    [self setupTrianglePosition];
}

- (void)setPullDownViewDelegate:(id<PullDownViewDelegate>)delegate {
    self.pullDownViewDelegate = delegate;
}

#pragma mark - Actions
- (void)tapGestureAction {
    [self hideAnimation];
}

- (void)showAnimation {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    
    _tableViewBackgroundView.frame = _tableView.frame = _tableViewFrame;
    _tableViewBackgroundView.center = _tableView.center = _tableViewOriginCenter;
    _tableViewBackgroundView.layer.affineTransform = _tableView.layer.affineTransform = CGAffineTransformMakeScale(0.1, 0.1);
    
    CGFloat damping = _enableBounces ? 0.5 : 1.0;
    [UIView animateWithDuration:kShowAnimationDuration delay:0.0 usingSpringWithDamping:damping initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        CGPoint center = CGPointMake(_tableViewFrame.origin.x + _tableViewFrame.size.width / 2, _tableViewFrame.origin.y + _tableViewFrame.size.height / 2);
        _tableViewBackgroundView.center = _tableView.center = center;
        _tableViewBackgroundView.layer.affineTransform = _tableView.layer.affineTransform = CGAffineTransformMakeScale(1.0, 1.0);
        _topTriangleView.alpha = kAlpha;
        _tableViewBackgroundView.alpha = kAlpha;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hideAnimation {
    [UIView animateWithDuration:kHideAnimationDuration animations:^{
        _tableViewBackgroundView.center = _tableView.center = _tableViewOriginCenter;
        _tableViewBackgroundView.layer.affineTransform = _tableView.layer.affineTransform = CGAffineTransformMakeScale(0.1, 0.1);
        _topTriangleView.alpha = 0.0;
        _tableViewBackgroundView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
 
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = cell.backgroundColor = [UIColor clearColor];
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.text = [NSString stringWithFormat:@"indexPath.row = %ld",indexPath.row];
    [label sizeToFit];
    label.center = CGPointMake(cell.frame.size.width / 2, cell.frame.size.height / 2);
    [cell.contentView addSubview:label];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.pullDownViewDelegate && [self.pullDownViewDelegate respondsToSelector:@selector(cellDidSelectAtIndexPath:)]) {
        [self.pullDownViewDelegate cellDidSelectAtIndexPath:indexPath];
    }
}

@end
