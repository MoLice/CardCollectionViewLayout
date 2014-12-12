//
//  ViewController.m
//  CardCollectionLayout
//
//  Created by MoLice on 14/12/12.
//  Copyright (c) 2014年 MoLice. All rights reserved.
//

#import "ViewController.h"
#import "CardCollectionViewCell.h"

@interface ViewController ()

@property(nonatomic,strong) NSMutableArray *data;
@end

@implementation ViewController

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithCollectionViewLayout:layout]) {
        self.data = [[NSMutableArray alloc] init];
        [self.data addObjectsFromArray:@[@"0",
                                         @"1",
                                         @"2",
                                         @"3",
                                         @"4",
                                         @"5",
                                         @"6",]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[CardCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureRecognizer:)];
    [self.collectionView addGestureRecognizer:tapGestureRecognizer];
}

#pragma mark - <UICollectionViewDelegate, UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CardCollectionViewCell *cell = (CardCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = (NSString *)[self.data objectAtIndex:indexPath.item];
    return cell;
}

#pragma mark - TapGestureRecognizer
- (void)handleTapGestureRecognizer:(UITapGestureRecognizer *)gestureRecognizer {
    [self.collectionView performBatchUpdates:^{
        NSIndexPath *fromIndexPath = [NSIndexPath indexPathForItem:self.data.count - 1 inSection:0];
        NSIndexPath *toIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        
        [self.collectionView deleteItemsAtIndexPaths:@[fromIndexPath]];
        
        NSString *movingString = (NSString *)[self.data objectAtIndex:fromIndexPath.item];
        [self.data removeObjectAtIndex:fromIndexPath.item];
        [self.data insertObject:movingString atIndex:toIndexPath.item];
        
        [self.collectionView insertItemsAtIndexPaths:@[toIndexPath]];
    } completion:NULL];
}

@end
