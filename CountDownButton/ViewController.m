//
//  ViewController.m
//  CountDownButton
//
//  Created by IncredibleEyes on 16/1/11.
//  Copyright © 2016年 爱丽丝的梦境. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+CountDown.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *countDownButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    countDownButton.backgroundColor = [UIColor colorWithRed:0/255.0 green:204/255.0 blue:255/255.0 alpha:1];
    [countDownButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    countDownButton.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    [countDownButton setTitle:@"倒计时" forState:UIControlStateNormal];
    countDownButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [countDownButton addTarget:self action:@selector(doCountDownAction:) forControlEvents:UIControlEventTouchUpInside];
    countDownButton.layer.masksToBounds = YES;
    countDownButton.layer.cornerRadius = 8.0f;
    
    [self.view addSubview:countDownButton];

}

- (void)doCountDownAction:(UIButton *)sender{
    [sender startWithTime:10 title:@"开始倒计时" countDownTitle:@"秒" mainColor:[UIColor colorWithRed:0/255.0 green:204/255.0 blue:255/255.0 alpha:1] countColor:[UIColor grayColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
