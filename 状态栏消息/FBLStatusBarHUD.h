//
//  FBLStatusBarHUD.h
//  包罗万象
//
//  Created by fanbaili on 2018/10/15.
//  Copyright © 2018年 RaySharp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBLStatusBarHUD : NSObject

//显示普通信息
+(void)showMessage:(NSString*)msg image:(UIImage*)image;
+(void)showMessage:(NSString*)msg;

//显示成功信息
+(void)showSucces:(NSString*)msg;

//显示失败信息
+(void)showError:(NSString*)msg;

//显示正在处理信息
+(void)showLoading:(NSString*)msg;

//隐藏处理信息
+(void)hide;

@end
