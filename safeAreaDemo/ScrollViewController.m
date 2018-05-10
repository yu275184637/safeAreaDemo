//
//  ScrollViewController.m
//  safeAreaDemo
//
//  Created by yuze on 2018/5/9.
//  Copyright © 2018年 chehejia. All rights reserved.
//

#import "ScrollViewController.h"
#import "TitleCustomScrollView.h"

@interface ScrollViewController ()

@property (nonatomic, strong) TitleCustomScrollView *topScrollView;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"内容页2";
    self.view.backgroundColor = [UIColor grayColor];
    /********
    *** 1. UIScrollViewContentInsetAdjustmentNever 不做处理，UIScrollViewContentInsetAdjustmentAutomatic自动调节
    *** 2. 演示ScrollView距离顶部0 和 距离顶部64，观察自动调节的作用
    *** 3. 通过adjustedContentInsetDidChange观察各种状态下 adjustedContentInset = safeAreaInset + contentInset的关系
    ********/
    
    if(@available(iOS 11.0, *)) {
        // ios11新增
        self.topScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    else {
        // ios11废弃
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

    [self addTopScroll];
}

- (void)viewSafeAreaInsetsDidChange
{
    [super viewSafeAreaInsetsDidChange];
    
    NSLog(@"内容页2: ViewController change safeAreaInsets: %@", NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"内容页2: _topScrollView contentInset: %@", NSStringFromUIEdgeInsets(_topScrollView.contentInset));
    NSLog(@"内容页2: _topScrollView contentOffset: %@", NSStringFromCGPoint(_topScrollView.contentOffset));
    
//    if (@available(iOS 11.0, *)) {
//
//        NSLog(@"内容页2: window-safeAreaInsets:  %@", NSStringFromUIEdgeInsets(UIApplication.sharedApplication.delegate.window.safeAreaInsets));
//        NSLog(@"内容页2: additionalSafeAreaInsets：%@", NSStringFromUIEdgeInsets(self.additionalSafeAreaInsets));
//        NSLog(@"内容页2: SafeAreaInsets: %@", NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
//    }
}

- (void)addTopScroll
{
    [self.view addSubview:self.topScrollView];
    [self.topScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(@0);
        make.height.equalTo(@192);
    }];
}

- (TitleCustomScrollView *)topScrollView
{
    if (!_topScrollView) {
        _topScrollView = [[TitleCustomScrollView alloc] init];
        _topScrollView.backgroundColor = [UIColor purpleColor];
        _topScrollView.showsVerticalScrollIndicator = NO;
        _topScrollView.showsHorizontalScrollIndicator = NO;
    }
    
    return _topScrollView;
}

@end
