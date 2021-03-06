//
//  YHCategoryViewController.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 16/10/28.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHCategoryViewController.h"
#import "YHDropdownView.h"
#import "YHCategoryModel.h"

@interface YHCategoryViewController ()

@end

@implementation YHCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1> 创建下拉菜单
    YHDropdownView *dropView = [YHDropdownView dropdownView];
    // 2> 添加到根视图
    [self.view addSubview:dropView];
    // 3> 让控制器被展现出来的大小跟dropView加载的xib中大小一致
    self.preferredContentSize = dropView.size;
    // 4> 创建模型，给分类下拉菜单传递模型数据数组
    NSArray *categoryPlist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"categories.plist" ofType:nil]];
    dropView.categoryArray = [NSArray yy_modelArrayWithClass:[YHCategoryModel class] json:categoryPlist];
}





@end




