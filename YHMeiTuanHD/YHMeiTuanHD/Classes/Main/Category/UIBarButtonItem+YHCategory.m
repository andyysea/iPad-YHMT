//
//  UIBarButtonItem+YHCategory.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 16/10/25.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "UIBarButtonItem+YHCategory.h"

@implementation UIBarButtonItem (YHCategory)

+ (instancetype)barButtonItemWithTarget:(id)target action:(SEL)action icon:(NSString *)icon highLightedIcon:(NSString *)highLightedIcon {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highLightedIcon] forState:UIControlStateHighlighted];
    
    /** 控件的属性是结构体的时候不能直接修改，但是Swift中可以直接修改 */
    CGRect rect = button.frame;
    rect.size = button.currentImage.size;
    button.frame = rect;
//    button.size = button.currentImage.size; // 这个是对的，因为添加了视图的分类，可以替代上面三居代码
//    button.frame.size = button.currentImage.size;//这个是错误的，因为结构体不能直接修改
    
    // 按钮添加监听方法，要有监听者，以及监听者调用的监听方法
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
