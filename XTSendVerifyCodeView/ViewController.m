//
//  ViewController.m
//  XTSendVerifyCodeView
//
//  Created by 何凯楠 on 2017/5/15.
//  Copyright © 2017年 HeXiaoBa. All rights reserved.
//

#import "ViewController.h"
#import "XTSendVerifyCodeView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];


    CGRect frame = CGRectMake(100, 100, 100, 40);
    XTSendVerifyCodeView *view = [[XTSendVerifyCodeView alloc] init];
    view.frame = frame;
    view.sendButtonOriginTitle = @"send verify code";
    view.sendButtonChangingTitle = @"remaining";
    view.sendButtonResetTitle = @"reset";
    view.sendButtonBgNormalColor = [UIColor orangeColor];
    view.sendButtonBgDisableColor = [UIColor blueColor];
    view.sendButtonTitleNormalColor = [UIColor blackColor];
    view.sendButtonTitleDisableColor = [UIColor yellowColor];
    [self.view addSubview:view];
    __weak typeof(view) weakView = view;
    [view setSendButtonClickBlock:^(UIButton *button) {
        [weakView startSendVerifyCode];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
