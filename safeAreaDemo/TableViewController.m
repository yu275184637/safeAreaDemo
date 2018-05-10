//
//  ContentViewController.m
//  safeAreaDemo
//
//  Created by yuze on 2018/4/26.
//  Copyright © 2018年 chehejia. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

/********
 *** 1. 预估行高不设为0时，cell会发生异常偏移，比如设置滑动到底部时
 *** 2. 可演示ScrollView演示过的场景在TableView是否一致，包含顶部和底部
 ********/

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"内容页3";
    
    [self.view addSubview:self.tableView];
//    if(@available(iOS 11.0, *)) {
//
//        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    }
//    else {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 设置滑动到底部
    [self.tableView setContentOffset:CGPointMake(0, CGFLOAT_MAX)];
}


#pragma mark - UITableViewDelegate UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 36;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseStr = @"ContentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseStr];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseStr];
    }
    
    cell.textLabel.text = @"嘻嘻嘻哈哈哈";
    cell.detailTextLabel.text = @"我是子标题，子标题";
    cell.contentView.backgroundColor = [UIColor brownColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (@available(iOS 11.0, *)) {

//        NSLog(@"window-topLayoutGuide:  %@", NSStringFromUIEdgeInsets(UIApplication.sharedApplication.delegate.window.safeAreaInsets));
//        NSLog(@"additionalSafeAreaInsets：%@", NSStringFromUIEdgeInsets(self.additionalSafeAreaInsets));
//        NSLog(@"SafeAreaInsets: %@", NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
        NSLog(@"========= tableView ===========");
        NSLog(@"tableView-adjustedContentInset: %@", NSStringFromUIEdgeInsets(self.tableView.adjustedContentInset));
        NSLog(@"tableView-contentInset: %@", NSStringFromUIEdgeInsets(self.tableView.contentInset));
        NSLog(@"tableView-safeAreaInsets: %@", NSStringFromUIEdgeInsets(self.tableView.safeAreaInsets));
    }
}

#pragma mark - getter setter

- (UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor orangeColor];
        
        /// 禁用预估行高
        _tableView.estimatedRowHeight = 0.0;
        _tableView.estimatedSectionHeaderHeight = 0.0;
        _tableView.estimatedSectionFooterHeight = 0.0;
    }
    
    return _tableView;
}


@end
