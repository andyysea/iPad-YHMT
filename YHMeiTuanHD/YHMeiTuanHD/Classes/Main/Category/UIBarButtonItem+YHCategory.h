//
//  UIBarButtonItem+YHCategory.h
//  YHMeiTuanHD
//
//  Created by 杨应海 on 16/10/25.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YHCategory)

/** 自定义UIBarButtonItem,带高亮效果的item */

+ (instancetype)barButtonItemWithTarget:(id)target action:(SEL)action icon:(NSString *)icon highLightedIcon:(NSString *)highLightedIcon;

@end


