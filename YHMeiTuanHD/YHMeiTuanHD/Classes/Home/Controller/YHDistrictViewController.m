//
//  YHDistrictViewController.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 2016/10/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHDistrictViewController.h"
#import "YHDropdownView.h"


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


@end
