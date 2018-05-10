//
//  TitleCustomScrollView.m
//  safeAreaDemo
//
//  Created by yuze on 2018/5/9.
//  Copyright © 2018年 chehejia. All rights reserved.
//

#import "TitleCustomScrollView.h"

@implementation TitleCustomScrollView

 - (instancetype)init
{
    if (self = [super init]) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)adjustedContentInsetDidChange
{
    [super adjustedContentInsetDidChange];
    
    NSLog(@"====== adjustedContentInsetDidChange =====");
    
    NSLog(@"TitleCustomScrollView change adjustedContentInset: %@", NSStringFromUIEdgeInsets(self.adjustedContentInset));
    NSLog(@"TitleCustomScrollView change contentInset：%@", NSStringFromUIEdgeInsets(self.contentInset));
    NSLog(@"TitleCustomScrollView change SafeAreaInsets: %@", NSStringFromUIEdgeInsets(self.safeAreaInsets));
}

- (void)setupUI
{
    NSArray *array = @[@"标题1", @"标题2", @"标题3", @"标题4", @"标题5", @"标题6", @"标题7", @"标题8", @"标题9",];
    
    for (NSUInteger i = 0; i < array.count; i++) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = array[i];
        titleLabel.backgroundColor = [UIColor whiteColor];
        titleLabel.layer.borderWidth = 2.0;
        titleLabel.layer.borderColor = [self randomColor].CGColor;
        titleLabel.frame = CGRectMake(i * 70, 0, 70, 64);
        [self addSubview:titleLabel];
    }
    
    self.contentSize = CGSizeMake(array.count * 70, 64);
}

- (UIColor *)randomColor {
    
    CGFloat hue = arc4random() % 100 / 100.0; //色调：0.0 ~ 1.0
    CGFloat saturation = (arc4random() % 50 / 100) + 0.5; //饱和度：0.5 ~ 1.0
    CGFloat brightness = (arc4random() % 50 / 100) + 0.5; //亮度：0.5 ~ 1.0
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


@end
