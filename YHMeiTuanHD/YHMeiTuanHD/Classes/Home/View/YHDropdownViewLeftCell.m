//
//  YHDropdownViewLeftCell.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 2016/10/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHDropdownViewLeftCell.h"
#import "YHCategoryModel.h"

@implementation YHDropdownViewLeftCell

+ (instancetype)dropdownViewLeftCellWithTableView:(UITableView *)tableView {
    static NSString *leftCellId = @"leftCellId";
    YHDropdownViewLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:leftCellId];
    if (cell == nil) {
        cell = [[YHDropdownViewLeftCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:leftCellId];
        // 设置cell颜色和选中颜色, 要在创建cell的时候就设置好
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_leftpart"]];
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_left_selected"]];
    }
    return cell;
}


/** 
    重写模型数据的setter方法
 */
- (void)setCategoryModel:(YHCategoryModel *)categoryModel {
    _categoryModel = categoryModel;
    
    // 2> 设置标题
    self.textLabel.text = categoryModel.name;
    // 3> 设置图像
    self.imageView.image = [UIImage imageNamed:categoryModel.icon];
    // 4> 设置高亮图像
    self.imageView.highlightedImage = [UIImage imageNamed:categoryModel.highlighted_icon];
    // 5> 设置指示箭头
    if (categoryModel.subcategories) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        self.accessoryType = UITableViewCellAccessoryNone;  // 这句话是为了没有箭头的时候重新设回去
    }
}


@end



