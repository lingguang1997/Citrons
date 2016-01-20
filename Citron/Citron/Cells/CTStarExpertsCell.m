//
//  CTStarExpertsCell.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTCollectionViewStarExpertsController.h"
#import "CTStartExpertCell.h"
#import "CTStarExpertsCell.h"
#import "CTStarExpertsModule.h"

@interface CTStarExpertsCell ()

@property (nonatomic, nonnull) CTCollectionViewStarExpertsController *collectionViewController;

@end

@implementation CTStarExpertsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _collectionViewController = [CTCollectionViewStarExpertsController new];
        [self.contentView addSubview:_collectionViewController.collectionView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _collectionViewController.collectionView.frame = self.contentView.bounds;
}

- (void)updateWithItem:(nonnull CTStarExpertsModule *)module {
    _collectionViewController.data = module.data;
    [_collectionViewController.collectionView reloadData];
    [self setNeedsDisplay];
}

+ (CGFloat)heightForItem:(nonnull CTStarExpertsModule *)module fixedWidth:(CGFloat)fixedWidth {
    return [CTStartExpertCell heightForItem:[module.data firstObject] fixedWidth:fixedWidth];
}

+ (CGFloat)heightForItem:(id)item fixedWidth:(CGFloat)fixedWidth groupStyle:(AKTableViewCellGroupStyle)groupStyle groupBorderWidth:(CGFloat)groupBorderWidth isSeperatorEnabled:(BOOL)seperatorEnabled seperatorHeight:(CGFloat)seperatorHeight {
    return 0;
}

@end
