//
//  CTStarExpertsCell.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTStartExpertCell.h"
#import "CTStarExpertsCell.h"
#import "CTStarExpertsModule.h"
#import <AppKit/AKCollectionViewLineLayoutController.h>

@interface CTStarExpertsCell ()

@property (nonatomic, nonnull) AKCollectionViewLineLayoutController *collectionViewController;

@end

@implementation CTStarExpertsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _collectionViewController = [AKCollectionViewLineLayoutController new];
        [self.contentView addSubview:_collectionViewController.collectionView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _collectionViewController.collectionView.frame = self.contentView.bounds;
}

- (void)updateWithItem:(nonnull CTStarExpertsModule *)module {
    _collectionViewController.data = module.experts;
    [_collectionViewController.collectionView reloadData];
    [self setNeedsDisplay];
}

+ (CGFloat)heightForItem:(nonnull CTStarExpertsModule *)module fixedWidth:(CGFloat)fixedWidth {
    return [CTStartExpertCell heightForItem:[module.experts firstObject] fixedWidth:fixedWidth];
}

@end
