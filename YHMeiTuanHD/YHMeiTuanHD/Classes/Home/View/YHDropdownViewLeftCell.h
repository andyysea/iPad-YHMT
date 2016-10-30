//
//  YHDropdownViewLeftCell.h
//  YHMeiTuanHD
//
//  Created by 杨应海 on 2016/10/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHCategoryModel;

@interface YHDropdownViewLeftCell : UITableViewCell

/** 模型数据 */
@property (nonatomic, strong) YHCategoryModel *categoryModel;

+ (instancetype)dropdownViewLeftCellWithTableView:(UITableView *)tableView;


@end
