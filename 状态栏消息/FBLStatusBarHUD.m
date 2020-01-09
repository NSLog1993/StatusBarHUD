//
//  FBLStatusBarHUD.m
//  包罗万象
//
//  Created by fanbaili on 2018/10/15.
//  Copyright © 2018年 RaySharp. All rights reserved.
//

#import "FBLStatusBarHUD.h"

//消息停留时间
static CGFloat const xmgduration  = 2.0;
//消息动画时间
static CGFloat const xmgAnimationDuration  = 0.25;

@interface FBLStatusBarHUD ()

@end

@implementation FBLStatusBarHUD
//全局的窗口
static UIWindow *window_;
//定时器
static NSTimer *time_;

//创建初始化窗口
+(void)setupWindow{
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
    
    window_ = [[UIWindow alloc]init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:xmgAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

//显示普通信息
+(void)showMessage:(NSString*)msg image:(UIImage *)image{
    //停止计时器
    [time_ invalidate];
    
    [self setupWindow];
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    
    if (image) {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [button setImage:image forState:UIControlStateNormal];
    }
    
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    //定时消失
    time_ = [NSTimer scheduledTimerWithTimeInterval:xmgduration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}
+(void)showMessage:(NSString *)msg{
    [self showMessage:msg image:nil];
}

//显示成功信息
+(void)showSucces:(NSString*)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"check"] ];
}

//显示失败信息
+(void)showError:(NSString*)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"error"]];
}

//显示正在处理信息
+(void)showLoading:(NSString*)msg{
    
    [time_ invalidate];
    time_ = nil;
    
    [self setupWindow];
    
    //添加按钮
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:14];
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    UIActivityIndicatorView *loadView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadView startAnimating];
    
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}].width;
    CGFloat centerX =(window_.frame.size.width - msgW) *0.5 - 20;
    CGFloat centerY = window_.frame.size.height *0.5;
    loadView.center =  CGPointMake(centerX, centerY);
    
    [window_ addSubview:loadView];
    [window_ addSubview:label];
}

//隐藏处理信息
+(void)hide{
    [UIView animateWithDuration:xmgAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = -frame.size.height;
        window_.frame = frame;
        
    } completion:^(BOOL finished) {
        window_ = nil;
        time_ = nil;
    }];
}

@end
