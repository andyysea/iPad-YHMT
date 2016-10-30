//
//  YHCityViewController.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 2016/10/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHCityViewController.h"
#import "YHCityGroupModel.h"

@interface YHCityViewController () <UITableViewDataSource>

/** cityGroupPlist的模型数据 */
@property (nonatomic, strong) NSArray *cityGroupArray;

@end

@implementation YHCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    [self loadCityGroupData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cityGroupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    YHCityGroupModel *cityGroupModel = self.cityGroupArray[section];
    return cityGroupModel.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    YHCityGroupModel *cityGroupModel = self.cityGroupArray[indexPath.section];
    cell.textLabel.text = cityGroupModel.cities[indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    YHCityGroupModel *cityGroupModel = self.cityGroupArray[section];
    return cityGroupModel.title;
}


#pragma mark - 加载数据
- (void)loadCityGroupData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cityGroups.plist" ofType:nil];
    NSArray *cityGroupsPlist = [NSArray arrayWithContentsOfFile:path];
    // 转模型
    self.cityGroupArray = [NSArray yy_modelArrayWithClass:[YHCityGroupModel class] json:cityGroupsPlist];
}


#pragma mark - 设置导航栏
- (void)setupNav {
    self.title = @"城市选择";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(backButtonClick) icon:@"btn_navigation_close" highLightedIcon:@"btn_navigation_close_hl"];
}

- (void)backButtonClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
