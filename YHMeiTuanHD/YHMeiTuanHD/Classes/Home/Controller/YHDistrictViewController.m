//
//  YHDistrictViewController.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 2016/10/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHDistrictViewController.h"
#import "YHDropdownView.h"
#import "YHCityViewController.h"
#import "YHNavgationController.h"

@interface YHDistrictViewController ()

@end

@implementation YHDistrictViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YHDropdownView *dropdownView = [YHDropdownView dropdownView];
    dropdownView.y = self.view.subviews[0].height;
    [self.view addSubview:dropdownView];
    
    CGFloat width = dropdownView.width;
    CGFloat height = CGRectGetMaxY(dropdownView.frame);
    
    self.preferredContentSize = CGSizeMake(width, height);
}


- (IBAction)SwitchSelectCityClick:(id)sender {
    
    // 1> 因为本身自己就是被展现出来的，所以要用根控制器 展现其他控制器
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // 2> 设置带导航栏的城市控制器
    YHCityViewController *cityVC = [[YHCityViewController alloc] init];
    YHNavgationController *nav = [[YHNavgationController alloc] initWithRootViewController:cityVC];
    
    nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    
    // 3> 用根控制器展现
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:YES completion:nil];
}



@end
