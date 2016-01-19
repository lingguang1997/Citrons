//
//  CTRecommendedExpertCell.h
//  Citron
//
//  Created by Zijiao Liu on 1/19/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKTableViewCell.h>

@interface CTRecommendedExpertCell : AKTableViewCell

@property (nonatomic, readonly, nonnull) UIImageView *profileImageView;
@property (nonatomic, readonly, nonnull) UILabel *nameLabel;
@property (nonatomic, readonly, nonnull) UILabel *titleLabel;
@property (nonatomic, readonly, nonnull) UILabel *schoolLabel;
@property (nonatomic, readonly, nonnull) NSArray *tagLabels;
@property (nonatomic, readonly, nonnull) UIImageView *creditImageView;
@property (nonatomic, readonly, nonnull) UILabel *creditLabel;

@end
