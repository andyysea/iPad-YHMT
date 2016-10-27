//
//  YHHomeViewController.m
//  YHMeiTuanHD
//
//  Created by 杨应海 on 16/10/24.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHHomeViewController.h"

/** 可重用标示符 */
static NSString *collectionCellID = @"collectionCellID";

@interface YHHomeViewController () <UICollectionViewDataSource>

@end

@implementation YHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    [self setupRightNavItems];
}

#pragma mark - 设置右侧导航栏
- (void)setupRightNavItems {
    /**地图按钮 */
    UIBarButtonItem *mapItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(mapItemClick) icon:@"icon_map" highLightedIcon:@"icon_map_highlighted"];
    
    /**搜索按钮 */
    UIBarButtonItem *searchItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(searchItemClick) icon:@"icon_search" highLightedIcon:@"icon_search_highlighted"];
    
    self.navigationItem.rightBarButtonItems = @[mapItem,searchItem];
}
#pragma mark - 导航栏按钮的监听方法
/** 
    搜索按钮的监听方法
 */
- (void)searchItemClick {
    
}

/**
 *  地图按钮的监听方法
 */
- (void)mapItemClick {
    
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
