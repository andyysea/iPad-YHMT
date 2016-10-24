//
//  YHNavgationController.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 16/10/24.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHNavgationController.h"

@interface YHNavgationController ()

@end

@implementation YHNavgationController

+ (void)initialize {
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    
        /** 图片要设置拉伸，即切片效果 */
    [navBar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"] forBarMetrics:UIBarMetricsDefault];
}


@end
