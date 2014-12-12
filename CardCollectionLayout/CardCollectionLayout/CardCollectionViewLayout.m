//
//  CardCollectionViewLayout.m
//  CardCollectionLayout
//
//  Created by MoLice on 14/12/12.
//  Copyright (c) 2014年 MoLice. All rights reserved.
//

#import "CardCollectionViewLayout.h"

@interface CardCollectionViewLayout ()

@property(nonatomic,assign) NSInteger itemCount;
@property(nonatomic,strong) NSMutableArray *layoutAttributes;
@end

@implementation CardCollectionViewLayout

- (CGSize)collectionViewContentSize {
    return self.collectionView.bounds.size;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    self.itemCount = [self.collectionView.dataSource collectionView:self.collectionView numberOfItemsInSection:0];
    
    // create layoutAttributes for all items
    self.layoutAttributes = [[NSMutableArray alloc] init];
    CGPoint center = self.collectionView.center;
    CGPoint perCardOffset = CGPointMake(14, -14);
    for (NSInteger i = 0; i < self.itemCount; i++) {
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        
        attributes.size = CGSizeMake(100, 100);
        attributes.center = CGPointMake(center.x + perCardOffset.x * i, center.y + perCardOffset.y * i);
        attributes.zIndex = i;
        [self.layoutAttributes addObject:attributes];
    }
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.layoutAttributes objectAtIndex:indexPath.item];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *resultAttributes = [[NSMutableArray alloc] init];
    for (UICollectionViewLayoutAttributes *attr in self.layoutAttributes) {
        if (CGRectIntersectsRect(rect, attr.frame)) {
            [resultAttributes addObject:attr];
        }
    }
    return resultAttributes;
}

@end
