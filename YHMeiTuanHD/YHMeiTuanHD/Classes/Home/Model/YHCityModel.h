//
//  YHCityModel.h
//  YHMeiTuanHD
//
//  Created by 杨应海 on 2016/10/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHCityModel : NSObject

/** 名字*/
@property (nonatomic, copy) NSString *name;

/** 拼音全称*/
@property (nonatomic, copy) NSString *pinYin;

/** 拼音缩写*/
@property (nonatomic, copy) NSString *pinYinHead;

/** 子数据(区县街道)--> districts 对应的也是数据模型*/
@property (nonatomic, strong) NSArray *districts;

@end
