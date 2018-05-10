//
//  ViewController.m
//  safeAreaDemo
//
//  Created by yuze on 2018/5/9.
//  Copyright © 2018年 chehejia. All rights reserved.
//

#import "ViewController.h"
#import "TextCustomView.h"

@interface ViewController ()

@end

/********
 *** 0. 使用宏判断处理不适合多机型适配，不适合app横屏处理
 *** 1. 观察viewSafeAreaInsetsDidChange调用时机
 *** 2. 观察10、11系统及 iPhone X和iPhone 8样式的差别
 *** 3. View适配，View内部处理和VC里边处理
 *** 4. masonry适配安全域
 ********/

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"内容页1";
    self.view.backgroundColor = [UIColor grayColor];
    
    [self addTopLabel];
    [self addBottomView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"====== viewWillAppear =====");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"====== viewDidAppear =====");
    
    if (@available(iOS 11.0, *)) {
        
        NSLog(@"内容页1: window-safeAreaInsets:  %@", NSStringFromUIEdgeInsets(UIApplication.sharedApplication.delegate.window.safeAreaInsets));
        NSLog(@"内容页1: additionalSafeAreaInsets：%@", NSStringFromUIEdgeInsets(self.additionalSafeAreaInsets));
        NSLog(@"内容页1: SafeAreaInsets: %@", NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
    }
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"====== viewWillLayoutSubviews =====");
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"====== viewDidLayoutSubviews =====");
}

- (void)viewSafeAreaInsetsDidChange
{
    [super viewSafeAreaInsetsDidChange];
    
    NSLog(@"====== viewSafeAreaInsetsDidChange =====");
    
    NSLog(@"内容页1: ViewController change safeAreaInsets: %@", NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
}

- (void)addTopLabel
{
    UILabel *topLabel = [UILabel new];
    topLabel.textAlignment = NSTextAlignmentLeft;
    topLabel.backgroundColor = [UIColor orangeColor];
    topLabel.numberOfLines = 0;
    topLabel.text = @"呵呵哒合肥市地方核发的回复发哈水电费号，发的说法开始打开，范德萨范德萨，大的史蒂芬安抚史蒂芬Safe是方法但是范德萨发士大夫士大夫士大夫士大夫所发生的发斯蒂芬第三方第三方撒地方撒旦法发士大夫撒地方撒士大夫撒旦法师法士大夫第三方撒地方是发达发打发的沙发斯蒂芬发大水发大水阿法士大夫打算撒地方安抚爱迪生发的发送到发";
    [self.view addSubview:topLabel];
    WS(ws);
    
#if 0
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.height.equalTo(@160);
        
        make.top.equalTo(@64);
        
//        if(@available(iOS 11.0, *)) {
//            make.top.equalTo(ws.view.mas_safeAreaLayoutGuideTop);
//        }
//        else {
//            make.top.equalTo(@64);
//        }
//
    }];
    
#else
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.height.equalTo(@160);
        
        make.top.equalTo(@(SANavigationOffsetY));
    }];
#endif
}


- (void)addBottomView
{
    TextCustomView *bottomView = [[TextCustomView alloc] init];
    [self.view addSubview:bottomView];
    WS(ws);

#if 1
    // 适配iOS11：1.改变View约束 2.改变View内容约束
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.height.equalTo(@200);
        
        make.bottom.equalTo(@0);
        
//        if(@available(iOS 11.0, *)) {
////            make.bottom.equalTo(@(-UIApplication.sharedApplication.delegate.window.safeAreaInsets.bottom));
//            make.bottom.equalTo(ws.view.mas_safeAreaLayoutGuideBottom);
//        }
//        else {
//            make.bottom.equalTo(@0);
//        }
    }];
#else
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.height.equalTo(@200);
        
        make.bottom.equalTo(@(-SATabbarSpaceHeight));
    }];
#endif
}

@end
