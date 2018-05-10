//
//  MainViewController.m
//  safeAreaDemo
//
//  Created by yuze on 2018/4/26.
//  Copyright © 2018年 chehejia. All rights reserved.
//

#import "MainViewController.h"
#import "TableViewController.h"
#import "ViewController.h"
#import "ScrollViewController.h"


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"iOS11 & iPhone X";
    
    [self setUI];
}


- (void)setUI
{
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn setTitle:@"View" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    WS(ws);
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.view.mas_centerX).offset(-10);
        make.top.equalTo(@100);
        make.width.equalTo(@160);
        make.height.equalTo(@40);
    }];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setBackgroundColor:[UIColor orangeColor]];
    [btn1 setTitle:@"ScrollView" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(btnClicked1:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.view.mas_centerX).offset(-10);
        make.top.equalTo(@160);
        make.width.equalTo(@160);
        make.height.equalTo(@40);
    }];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setBackgroundColor:[UIColor orangeColor]];
    [btn2 setTitle:@"TableView" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(btnClicked2:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view.mas_centerX).offset(10);
        make.top.equalTo(btn1);
        make.width.height.equalTo(btn1);
    }];
    
}

- (void)btnClicked:(UIButton *)btn
{
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}


- (void)btnClicked1:(UIButton *)btn
{

    [self.navigationController pushViewController:[ScrollViewController new] animated:YES];
}

- (void)btnClicked2:(UIButton *)btn
{

    [self.navigationController pushViewController:[TableViewController new] animated:YES];
}

@end
