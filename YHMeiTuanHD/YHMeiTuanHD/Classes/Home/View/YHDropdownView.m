//
//  YHDropdownView.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 16/10/28.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHDropdownView.h"

@implementation YHDropdownView


+ (instancetype)dropdownView {
    
    UINib *nib = [UINib nibWithNibName:@"YHDropdownView" bundle:nil];
    YHDropdownView *dropdownView = [nib instantiateWithOwner:nil options:nil].lastObject;
    return dropdownView;
}

@end
