//
//  YHDropdownView.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 16/10/28.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHDropdownView.h"
#import "YHCategoryModel.h"
#import "YHDropdownViewLeftCell.h"
#import "YHDropdownViewRightCell.h"

@interface YHDropdownView () <UITableViewDataSource,UITableViewDelegate>
/** 左边表格视图 */
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
/** 右边表格视图 */
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;
/** 左边表格视图选中的cell对应的模型数据 */
@property (nonatomic, strong) YHCategoryModel *categorySelectLeftModel;

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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.leftTableView) {
        return self.categoryArray.count;
    }
    // 如果是第二个表格，那数据来源是选中的左边表格，所以要在选中左边的表格的Cell的代理方法中记录一下对应的‘选中的模型’
    
    return self.categorySelectLeftModel.subcategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (tableView == self.leftTableView) {
        YHDropdownViewLeftCell *leftCell = [YHDropdownViewLeftCell dropdownViewLeftCellWithTableView:tableView];
        
        // 1> 获取模型数据
        YHCategoryModel *categoryModel = self.categoryArray[indexPath.row];
        // 2> 传递模型数据
        leftCell.categoryModel = categoryModel;
        
        return leftCell;
        
    } else {
        YHDropdownViewRightCell *rightCell = [YHDropdownViewRightCell dropdownViewRightCellWithTableView:tableView];
        rightCell.textLabel.text = self.categorySelectLeftModel.subcategories[indexPath.row];
        return rightCell;
    }
    
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftTableView) {
        //1> 记录一下选中的模型
        self.categorySelectLeftModel = self.categoryArray[indexPath.row];
        //2> 右边的表格要刷新数据
        [self.rightTableView reloadData];
    }
}



@end
