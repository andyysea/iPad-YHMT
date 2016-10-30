//
//  YHCityGroupModel.h
//  YHMeiTuanHD
//
//  Created by 杨应海 on 2016/10/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHCityGroupModel : NSObject

/** 组头标题 */
@property (nonatomic, copy) NSString *title;
/** 城市数组 */
@property (nonatomic, strong) NSArray *cities;

@end
