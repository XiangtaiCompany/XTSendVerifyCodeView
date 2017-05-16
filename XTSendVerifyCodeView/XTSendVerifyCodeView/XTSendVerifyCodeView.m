//
//  YZSendVerifyCodeView.m
//  YiZhongShop
//
//  Created by 何凯楠 on 2016/10/12.
//  Copyright © 2016年 HeXiaoBa. All rights reserved.
//

#import "XTSendVerifyCodeView.h"

@interface XTSendVerifyCodeView()
@property (nonatomic, nullable, strong) UIButton *sendButton;
@property (nonatomic , weak) NSTimer *timer;
@property (nonatomic , assign) int second;
@property (nonatomic, nullable, copy) SendVerifyButtonClickBlock sendButtonClickBlock;

@end

@implementation XTSendVerifyCodeView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.second = 59;
    self.sendButtonBgNormalColor = [UIColor redColor];
    self.sendButtonBgDisableColor = [UIColor lightGrayColor];
    self.sendButtonTitleNormalColor = [UIColor whiteColor];
    self.sendButtonTitleDisableColor = [UIColor whiteColor];
    self.sendButtonOriginTitle = @"发送验证码";
    self.sendButtonChangingTitle = @"";
    self.sendButtonResetTitle = @"重新发送";
    [self addSubview:self.sendButton];
}

- (void)setSendButtonTitleNormalColor:(UIColor *)sendButtonTitleNormalColor {
    _sendButtonTitleNormalColor = sendButtonTitleNormalColor;
    [self.sendButton setTitleColor:_sendButtonTitleNormalColor forState:UIControlStateNormal];
}

- (void)setSendButtonBgNormalColor:(UIColor *)sendButtonBgNormalColor {
    _sendButtonBgNormalColor = sendButtonBgNormalColor;
    self.sendButton.backgroundColor = sendButtonBgNormalColor;
}

- (void)setSendButtonOriginTitle:(NSString *)sendButtonOriginTitle {
    _sendButtonOriginTitle = sendButtonOriginTitle;
    [self.sendButton setTitle:_sendButtonOriginTitle forState:UIControlStateNormal];
}

- (void)startSendVerifyCode {
    if ([self.sendButton.currentTitle isEqualToString:self.sendButtonOriginTitle] || [self.sendButton.currentTitle isEqualToString:self.sendButtonResetTitle]) {
        [self createTimer];
        self.sendButton.userInteractionEnabled = NO;
    }
}

- (void)sendButtonClick:(UIButton *)button {
    
    self.sendButtonClickBlock ? self.sendButtonClickBlock(button) : nil;
}

- (void)createTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)destoryTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)timeChange: (NSTimer *)timer {
    if (self.second == 0) {
        self.sendButton.userInteractionEnabled = YES;
        [self.sendButton setTitle:self.sendButtonResetTitle forState:UIControlStateNormal];
        self.sendButton.backgroundColor = self.sendButtonBgNormalColor;
        [self.sendButton setTitleColor:self.sendButtonTitleNormalColor forState:UIControlStateNormal];
        self.second = 59;
        [self destoryTimer];
        return;
    } else {
        NSString *title = [NSString stringWithFormat:@"%@%ds", self.sendButtonChangingTitle, self.second--];
        [self.sendButton setTitle:title forState:UIControlStateNormal];
        self.sendButton.backgroundColor = self.sendButtonBgDisableColor;
        [self.sendButton setTitleColor:self.sendButtonTitleDisableColor forState:UIControlStateNormal];
        self.sendButton.userInteractionEnabled = NO;
    }
}

- (UIButton *)sendButton
{
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton.frame = self.bounds;
        [_sendButton setTitle:self.sendButtonOriginTitle forState:UIControlStateNormal];
        [_sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _sendButton.backgroundColor = self.sendButtonBgNormalColor;
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:13.f];
        [_sendButton addTarget:self action:@selector(sendButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.sendButton.frame = self.bounds;
}

- (void)dealloc {
    [self destoryTimer];
}

@end
