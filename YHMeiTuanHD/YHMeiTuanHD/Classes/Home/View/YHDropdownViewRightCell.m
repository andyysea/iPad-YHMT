//
//  YHDropdownViewRightCell.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 2016/10/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHDropdownViewRightCell.h"

@implementation YHDropdownViewRightCell

+ (instancetype)dropdownViewRightCellWithTableView:(UITableView *)tableView {
    
    static NSString *rightCellId = @"rightCellId";
    YHDropdownViewRightCell *cell = [tableView dequeueReusableCellWithIdentifier:rightCellId];
    if (cell == nil) {
        cell = [[YHDropdownViewRightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rightCellId];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_rightpart"]];
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_right_selected"]];
    }
    return cell;
}
@end
