//
//  YHHomeNavView.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 16/10/27.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHHomeNavView.h"

@implementation YHHomeNavView

+ (instancetype)homeNavView {
    return [[NSBundle mainBundle] loadNibNamed:@"YHHomeNavView" owner:nil options:nil].lastObject;
}


// category 导航栏分类item按钮的点击方法
- (IBAction)buttonClick:(id)sender {
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}


- (void)awakeFromNib {
    // 加上这个代码是为了防止导航栏的items 随着旋转发生变化
    self.autoresizingMask = UIViewAutoresizingNone;
}

@end




