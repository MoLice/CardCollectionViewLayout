//
//  CardCollectionViewCell.m
//  CardCollectionLayout
//
//  Created by MoLice on 14/12/12.
//  Copyright (c) 2014年 MoLice. All rights reserved.
//

#import "CardCollectionViewCell.h"

@implementation CardCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.textLabel = [[UILabel alloc] init];
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.textLabel];
        
        self.contentView.backgroundColor = [UIColor orangeColor];
        self.layer.borderWidth = 2;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.textLabel sizeToFit];
    self.textLabel.frame = CGRectMake(4, 2, CGRectGetWidth(self.textLabel.frame), CGRectGetHeight(self.textLabel.frame));
}

@end
