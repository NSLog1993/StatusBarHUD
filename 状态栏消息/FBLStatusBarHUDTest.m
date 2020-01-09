//
//  FBLStatusBarHUDTest.m
//  包罗万象
//
//  Created by fanbaili on 2018/10/15.
//  Copyright © 2018年 RaySharp. All rights reserved.
//

#import "FBLStatusBarHUDTest.h"
#import "FBLStatusBarHUD.h"

@interface FBLStatusBarHUDTest ()

@end

@implementation FBLStatusBarHUDTest

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sucessClick:(id)sender {
     [FBLStatusBarHUD showSucces:@"加载成功！" ];
}
- (IBAction)errorClick:(id)sender {
     [FBLStatusBarHUD showError:@"加载失败！" ];
}
- (IBAction)loadClick:(id)sender {
    [FBLStatusBarHUD showLoading:@"正在加载中....."];
}
- (IBAction)hideClick:(id)sender {
     [FBLStatusBarHUD hide];
}

- (IBAction)messageClick:(id)sender {
    [FBLStatusBarHUD showMessage:@"普通消息！！" image:[UIImage imageNamed:@"loading"] ];
}

@end
