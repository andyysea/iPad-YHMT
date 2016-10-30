//
//  YHCityViewController.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 2016/10/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHCityViewController.h"

@interface YHCityViewController ()

@end

@implementation YHCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
}

#pragma mark - 设置导航栏
- (void)setupNav {
    self.title = @"城市选择";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(backButtonClick) icon:@"btn_navigation_close" highLightedIcon:@"btn_navigation_close_hl"];
}

- (void)backButtonClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
