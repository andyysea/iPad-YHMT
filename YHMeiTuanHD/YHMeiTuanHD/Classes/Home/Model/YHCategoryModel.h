//
//  YHCategoryModel.h
//  YHMeiTuanHD
//
//  Created by 杨应海 on 16/10/29.
//  Copyright © 2016年 YYH. All rights reserved.
//

/**
 *  分类模型
 */
#import <Foundation/Foundation.h>

@interface YHCategoryModel : NSObject

/** 名称 */
@property (nonatomic, copy) NSString *name;
/** 图标 */
@property (nonatomic, copy) NSString *icon;
/** 高亮图标 */
@property (nonatomic, copy) NSString *highlighted_icon;
/** 小图标 */
@property (nonatomic, copy) NSString *small_icon;
/** 高亮小图标 */
@property (nonatomic, copy) NSString *small_highlighted_icon;
/** 地图图标 */
@property (nonatomic, copy) NSString *map_icon;
/** 子分类数据 */
@property (nonatomic, strong) NSArray *subcategories;

@end
