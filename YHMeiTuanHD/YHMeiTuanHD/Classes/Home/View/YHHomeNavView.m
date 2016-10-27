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
//    return [[UINib nibWithNibName:@"YHHomeNavView" bundle:nil] instantiateWithOwner:nil options:nil].lastObject;
    return [[NSBundle mainBundle] loadNibNamed:@"YHHomeNavView" owner:nil options:nil].lastObject;
}



@end




