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
//    self.view.backgroundColor = YHColor(230, 230, 230, 1.0);
    
    [self setupUI];
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
