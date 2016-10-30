//
//  YHHomeViewController.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 16/10/24.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHHomeViewController.h"
#import "YHHomeNavView.h"
#import "YHCategoryViewController.h"
#import "YHDistrictViewController.h"

/** 可重用标示符 */
static NSString *collectionCellID = @"collectionCellID";

@interface YHHomeViewController () <UICollectionViewDataSource>

@end

@implementation YHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    [self setupLeftNavItems];
    [self setupRightNavItems];
}
#pragma mark - 设置左侧导航栏监听方法
- (void)setupLeftNavItems {
    // 1. logo
    UIBarButtonItem *logoItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icon_meituan_logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:nil action:nil];
    logoItem.enabled = NO;
    
    // 2. 分类
    YHHomeNavView *categoryNavView = [YHHomeNavView homeNavView];
    UIBarButtonItem *categoryItem = [[UIBarButtonItem alloc] initWithCustomView:categoryNavView];
    
    // 自定义控件监听方法
    [categoryNavView addTarget:self action:@selector(categoryClick) forControlEvents:UIControlEventValueChanged];
    
    // 3. 区域
    YHHomeNavView *districtNavView = [YHHomeNavView homeNavView];
    UIBarButtonItem *districtItem = [[UIBarButtonItem alloc] initWithCustomView:districtNavView];
    
    [districtNavView.button addTarget:self action:@selector(districtClick) forControlEvents:UIControlEventTouchUpInside];
    // 4. 排序
    YHHomeNavView *sortNavView = [YHHomeNavView homeNavView];
    UIBarButtonItem *sortItem = [[UIBarButtonItem alloc] initWithCustomView:sortNavView];
    
    self.navigationItem.leftBarButtonItems = @[logoItem, categoryItem,districtItem,sortItem];
}

#pragma mark - 设置右侧导航栏
- (void)setupRightNavItems {
    // 1. 地图按钮
    UIBarButtonItem *mapItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(mapItemClick) icon:@"icon_map" highLightedIcon:@"icon_map_highlighted"];
    // 设置导航栏item之间的间距
    mapItem.customView.width = 60;
    
    // 2. 搜索按钮
    UIBarButtonItem *searchItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(searchItemClick) icon:@"icon_search" highLightedIcon:@"icon_search_highlighted"];
    searchItem.customView.width = 60;
    
    self.navigationItem.rightBarButtonItems = @[mapItem,searchItem];
}

#pragma mark - 导航栏按钮的监听方法
/** 
    分类按钮的点击方法
 */
- (void)categoryClick {
    YHCategoryViewController *categoryVC = [[YHCategoryViewController alloc] init];
    // 1> 设置呈现样式
    categoryVC.modalPresentationStyle = UIModalPresentationPopover;
    // 2> 取出popover视图
    UIPopoverPresentationController *categoryPopover = categoryVC.popoverPresentationController;
    // 3> 设置指向的 item
    categoryPopover.barButtonItem = self.navigationItem.leftBarButtonItems[1];
    // 4> 展现分类控制器
    [self presentViewController:categoryVC animated:YES completion:nil];
}

/**
    区域点击按钮的分类方法
 */
- (void)districtClick {
    YHDistrictViewController *districtVC = [[YHDistrictViewController alloc] init];
    // 1> 设置呈现样式
    districtVC.modalPresentationStyle = UIModalPresentationPopover;
    // 2> 取出popover视图
    UIPopoverPresentationController *districtPopover = districtVC.popoverPresentationController;
    // 3> 设置指向的 item
    districtPopover.barButtonItem = self.navigationItem.leftBarButtonItems[2];
    // 4> 展现分类控制器
    [self presentViewController:districtVC animated:YES completion:nil];
    
}


/** 
    搜索按钮的监听方法
 */
- (void)searchItemClick {
    NSLog(@"searchItemClick");
}

/**
 *  地图按钮的监听方法
 */
- (void)mapItemClick {
    NSLog(@"mapItemClick");
}

                                
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    
    
    return cell;
}
#pragma mark - 设置界面
- (void)setupUI {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = YHColor(230, 230, 230, 1.0);
    [self.view addSubview:collectionView];
    
    collectionView.dataSource = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectionCellID];
}

@end
