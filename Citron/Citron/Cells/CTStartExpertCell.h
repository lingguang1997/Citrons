//
//  CTStartExpertCell.h
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AppKit/AKCell.h>

@interface CTStartExpertCell : UICollectionViewCell <AKCell>

@property (nonatomic, readonly, nonnull) UIImageView *imageView;
@property (nonatomic, readonly, nonnull) UILabel *nameLabel;
@property (nonatomic, readonly, nonnull) UILabel *titleLabel;

@end