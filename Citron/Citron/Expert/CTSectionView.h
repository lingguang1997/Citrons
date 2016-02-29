//
//  CTSectionView1.h
//  Citron
//
//  Created by Zijiao Liu on 2/25/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDynamicHeightView.h>

@interface CTSectionView : UIView <AKDynamicHeightView>

@property (nonatomic, nonnull) UILabel *titleLabel;

- (void)commonInit;

@end
