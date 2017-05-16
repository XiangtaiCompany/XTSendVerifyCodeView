//
//  YZSendVerifyCodeView.h
//  YiZhongShop
//
//  Created by 何凯楠 on 2016/10/12.
//  Copyright © 2016年 HeXiaoBa. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SendVerifyButtonClickBlock)(UIButton *button);

@interface XTSendVerifyCodeView : UIView
/**
 send button origin title, default "发送验证码"
 */
@property (nonatomic, nullable, copy) NSString *sendButtonOriginTitle;
/**
 send button changing(timer changing) title, default "59s, 58s ..."
 */
@property (nonatomic, nullable, copy) NSString *sendButtonChangingTitle;
/**
 send button origin title, default "重新发送"
 */
@property (nonatomic, nullable, copy) NSString *sendButtonResetTitle;
/**
 send button background normal color, as origin color, default red color
 */
@property (nonatomic, nullable, strong) UIColor *sendButtonBgNormalColor;
/**
 send button background disable color, as button clicked and timer changing, default light gray color
 */
@property (nonatomic, nullable, strong) UIColor *sendButtonBgDisableColor;
/**
 send button title normal color, default white color
 */
@property (nonatomic, nullable, strong) UIColor *sendButtonTitleNormalColor;
/**
 send button title disable color, default white color
 */
@property (nonatomic, nullable, strong) UIColor *sendButtonTitleDisableColor;
/**
 button click block, maybe need do something, such as regex phone number

 @param sendButtonClickBlock block
 */
- (void)setSendButtonClickBlock:(SendVerifyButtonClickBlock)sendButtonClickBlock;
/**
  timer changing, button changed disable state
 */
- (void)startSendVerifyCode;

@end
NS_ASSUME_NONNULL_END
