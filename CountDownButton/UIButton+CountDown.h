//
//  UIButton+CountDown.h
//  CocoapodDemo
//
//  Created by IncredibleEyes on 16/1/11.
//  Copyright © 2016年 爱丽丝的梦境. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)

/**
 *  倒计时按钮
 *
 *  @param timeLine 倒计时总长
 *  @param title    还没开始倒计时时的标题
 *  @param subTitle 倒计时过程中的子名字
 *  @param mColor   还没倒计时时的颜色
 *  @param color    倒计时时的颜色
 */
- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;
@end
