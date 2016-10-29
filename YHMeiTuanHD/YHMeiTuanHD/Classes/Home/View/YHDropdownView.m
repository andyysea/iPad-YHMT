//
//  YHDropdownView.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 16/10/28.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHDropdownView.h"

@interface YHDropdownView () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation YHDropdownView

/** 加载本视图的类方法 */
+ (instancetype)dropdownView {
    UINib *nib = [UINib nibWithNibName:@"YHDropdownView" bundle:nil];
    YHDropdownView *dropdownView = [nib instantiateWithOwner:nil options:nil].lastObject;
    return dropdownView;
}

/**
 iPad的控制器的视图很大, 但是popover的大小很小. 所有默认UIView会有autoresizingMask属性, 会导致视图被拉伸/缩小. 为了保持视图的原样, 需要取消autoresizingMask属性
 设置了之后，大小就是 Xib 大小，本 xib视图也不会随着父视图的bounds调整自己在父视图中的大小和位置了，本Xib视图不变了，他内部的两个 tableView子视图也不会变化了。
 */
- (void)awakeFromNib {
    self.autoresizingMask = UIViewAutoresizingNone;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    return cell;
}


@end
