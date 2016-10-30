//
//  YHCitySearchResultVC.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 2016/10/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHCitySearchResultVC.h"
#import "YHCityModel.h"

@interface YHCitySearchResultVC ()

/** 城市模型数组 */
@property (nonatomic, strong) NSArray *cityArray;

/** 城市搜索结果数句 */
@property (nonatomic, strong) NSMutableArray *searchResultArray;

@end

@implementation YHCitySearchResultVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *cityPlist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil]];
    self.cityArray = [NSArray yy_modelArrayWithClass:[YHCityModel class] json:cityPlist];
}

#pragma mark - 重写setter 方法，保存搜索结果
- (void)setSearchText:(NSString *)searchText {
    _searchText = searchText;
    
    // 转换小写
    _searchText = _searchText.lowercaseString;
    // 清空小写
    [self.searchResultArray removeAllObjects];
    
    for (YHCityModel *cityModel in self.cityArray) {
        if ([cityModel.pinYin containsString:_searchText] | [cityModel.name containsString:_searchText] | [cityModel.pinYinHead containsString:_searchText]) {
            
            // 保存结果, 但是每次保存数据之前数组一定是空的
            [self.searchResultArray addObject:cityModel.name];
        }
    }
    
    // 刷新数据
    [self.tableView reloadData];
}



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return  self.searchResultArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = self.searchResultArray[indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"一共搜索到%zd个结果", self.searchResultArray.count];
}

#pragma mark - 懒加载
- (NSMutableArray *)searchResultArray {
    if (_searchResultArray == nil) {
        _searchResultArray = [NSMutableArray array];
    }
    return _searchResultArray;
}

@end
