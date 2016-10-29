//
//  YHDropdownView.h
//  YHMeiTuanHD
//
//  Created by 杨应海 on 16/10/28.
//  Copyright © 2016年 YYH. All rights reserved.
//

/** 
    这里把下拉菜单的两个表格抽出来是为了其他下拉控制器的复用，可以直接添加这个视图就可以
 */
#import <UIKit/UIKit.h>

@interface YHDropdownView : UIView

/** 分类数据数组 */
@property (nonatomic, strong) NSArray *categoryArray;


+ (instancetype)dropdownView;

@end
