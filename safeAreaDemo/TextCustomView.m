//
//  TextCustomView.m
//  safeAreaDemo
//
//  Created by yuze on 2018/5/9.
//  Copyright © 2018年 chehejia. All rights reserved.
//

#import "TextCustomView.h"

@interface TextCustomView ()


@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation TextCustomView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor orangeColor];
        [self setupUI];
    }
    
    return self;
}

- (void)safeAreaInsetsDidChange
{
    [super safeAreaInsetsDidChange];
    
    NSLog(@"====== safeAreaInsetsDidChange =====");
    
    NSLog(@"TextCustomView change safeAreaInsets: %@", NSStringFromUIEdgeInsets(self.safeAreaInsets));
//    NSLog(@"TextCustomView change safeAreaLayoutGuide: %@",NSStringFromCGRect(self.safeAreaLayoutGuide.layoutFrame));
    
//    [self updateTextLabelConstraint];
}

- (void)setupUI
{
    self.textLabel.text = @"发顺丰是打飞机撒打发扣水电费健康拉速度快解放军开始懂了房间看电视空间裂缝圣诞节快乐弗兰克建设大街克劳福德撒家乐福 是的房间里卡三等奖发送到积分卡士大夫开讲啦圣诞节放假阿萨德积分拉斯加咖啡进口量撒旦教风刀霜剑法律手段奖发了卡萨帝机房都是解放路看电视剧法兰克解放军发圣诞节疯狂了解到撒离开房间啊是大佬防静电撒酒疯拉看手机打扫房间蓝卡队设计费大街上空间裂缝";
    [self addSubview:self.textLabel];
    WS(ws);
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.height.equalTo(@160);
        
//        make.bottom.equalTo(@0);
        
        if(@available(iOS 11.0, *)) {
            make.bottom.equalTo(ws.mas_safeAreaLayoutGuideBottom);
        }
        else {
            make.bottom.equalTo(@0);
        }
        
    }];
    
}

- (void)updateTextLabelConstraint
{
    WS(ws);
    [self.textLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        if(@available(iOS 11.0, *)) {
            make.bottom.equalTo(@(-ws.safeAreaInsets.bottom));
//            make.bottom.equalTo(@(ws.safeAreaLayoutGuide.layoutFrame.size.height - ws.frame.size.height));
        }
        else {
            make.bottom.equalTo(@0);
        }
    }];
}

#pragma mark - getter setter

- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [UILabel new];
        _textLabel.textAlignment = NSTextAlignmentLeft;
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.numberOfLines = 0;
    }
    
    return _textLabel;
}


@end
