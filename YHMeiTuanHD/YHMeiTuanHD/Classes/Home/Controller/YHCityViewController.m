//
//  YHCityViewController.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 2016/10/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHCityViewController.h"
#import "YHCityGroupModel.h"
#import "YHCitySearchResultVC.h"

@interface YHCityViewController () <UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 遮盖按钮 */
@property (weak, nonatomic) IBOutlet UIButton *coverButton;
/** 搜索结果控制器 */
@property (nonatomic, weak) YHCitySearchResultVC *searchResultVC;

/** cityGroupPlist的模型数据 */
@property (nonatomic, strong) NSArray *cityGroupArray;

@end

@implementation YHCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    [self loadCityGroupData];
    
    // 设置表格右侧索引标题颜色 下面两种方法均可
//    self.tableView.tintColor = YHColor(21, 188, 173, 1.0);
    self.tableView.sectionIndexColor = YHColor(21, 188, 173, 1.0);
}

#pragma mark - UISearchBarDelegate
/** 
    开始编辑
 */
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    // 1> 隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
    // 2> 修改搜索框颜色
    searchBar.backgroundImage = [UIImage imageNamed:@"bg_login_textfield_hl"];
    // 3> 取消按钮
    [searchBar setShowsCancelButton:YES animated:YES];
    
    for (UIView *subView in searchBar.subviews[0].subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)subView;
            [button setTitle:@"取消" forState:UIControlStateNormal];
            searchBar.tintColor = YHColor(21, 188, 173, 1.0);
        }
    }

    // 4> 遮盖按钮
    self.coverButton.alpha = 0.3;
}

/** 
    结束编辑
 */
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
    // 1> 隐藏导航栏
    self.navigationController.navigationBarHidden = NO;
    // 2> 修改搜索框颜色
    searchBar.backgroundImage = [UIImage imageNamed:@"bg_login_textfield"];
    // 3> 取消按钮
    [searchBar setShowsCancelButton:NO animated:YES];
    // 4> 遮盖按钮
    self.coverButton.alpha = 0;

    // 5> 清空搜索内容
    searchBar.text = @"";
    // 6> 搜索控制器隐藏
    self.searchResultVC.view.hidden = YES;
}

/** 
    搜索框内容变化
 */
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length > 0) {
        self.searchResultVC.view.hidden = NO;
        // 传递搜索的text
        self.searchResultVC.searchText = searchText;
    } else {
        self.searchResultVC.view.hidden = YES;
        NSLog(@"2 ");
    }
}

/** 
    点击搜索框取消按钮
 */
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

#pragma mark 遮盖按钮点击方法
- (IBAction)coverButtonClick:(id)sender {
    [self.view endEditing:YES];
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

/**
    设置分组索引
 */
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [self.cityGroupArray valueForKey:@"title"];
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

#pragma mark - 懒加载搜索结果控制器
- (YHCitySearchResultVC *)searchResultVC {
    if (_searchResultVC == nil) {
        // 1> 创建控制器
        YHCitySearchResultVC *searchResultVC = [YHCitySearchResultVC new];
        // 2> 添加控制器
        [self addChildViewController:searchResultVC];
        // 3> 添加控制器的视图
        [self.view addSubview:searchResultVC.view];
        // 4> 添加约束
        [searchResultVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.coverButton);
        }];
        // 5> 记录
        _searchResultVC = searchResultVC;
    }
    // 6> 返回
    return _searchResultVC;
}

@end
