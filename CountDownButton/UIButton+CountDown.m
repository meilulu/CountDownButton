//
//  UIButton+CountDown.m
//  CocoapodDemo
//
//  Created by IncredibleEyes on 16/1/11.
//  Copyright © 2016年 爱丽丝的梦境. All rights reserved.
//

#import "UIButton+CountDown.h"

@implementation UIButton (CountDown)

- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color {
    
    //倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        //倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = mColor;
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = color;
                [self setTitle:[NSString stringWithFormat:@"%ld%@",timeOut,subTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                [self beginFontAnimation:self.titleLabel];
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}

- (void)beginFontAnimation:(UILabel *)textLabel{
    
    //第一种动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.keyTimes = @[@0,@0.5,@1];
    animation.values = @[@1,@1.5,@2];
    //如果这里不设置持续时间，则会使用下面AnimaitonGroup的时间。
    animation.duration = 1.0f;
    
    //第二种动画
    CAKeyframeAnimation *animationOpa = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    animationOpa.keyTimes = @[@0,@0.5,@1];
    animationOpa.values = @[@1,@0.5,@0];
    //    animationOpa.duration = 1.0f;
    
    //组合成动画
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[animation,animationOpa];
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animationGroup.repeatCount = NO;
    animationGroup.removedOnCompletion = NO;
    animationGroup.duration = 1.0f;
    animationGroup.beginTime = CACurrentMediaTime();
    [textLabel.layer addAnimation:animationGroup forKey:@"animation"];
}


@end
