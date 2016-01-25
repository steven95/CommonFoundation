//
//  DiscoverController.m
//  通用框架
//
//  Created by Jusive on 16/1/11.
//  Copyright © 2016年 Jusive. All rights reserved.
//

#import "DiscoverController.h"
#import "DiscoverContViewCell.h"
@interface DiscoverController ()

@end

@implementation DiscoverController

static NSString * const reuseIdentifierCell = @"reuseIdentifierCell";


-(instancetype)init{
    //设置流水布局
    UICollectionViewFlowLayout *flowlayout = [UICollectionViewFlowLayout new];
    //设置每行的大小
    flowlayout.itemSize = [UIScreen mainScreen].bounds.size;
    flowlayout.minimumLineSpacing = 0;
    flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:flowlayout];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifierCell];
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self viewAppear];
    // Do any additional setup after loading the view.
}
-(void)viewAppear{
    UIBarButtonItem *LeftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"xingxing"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButton)];
    self.navigationItem.leftBarButtonItem = LeftBarButtonItem;
}
-(void)leftBarButton{
    [self popoverPresentationController];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DiscoverContViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierCell forIndexPath:indexPath];
    
    // Configure the cell
    cell.contentView.backgroundColor = indexPath.row % 2 ?[UIColor greenColor] :[UIColor cyanColor];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
