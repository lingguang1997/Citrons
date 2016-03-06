//
//  CTExpertLinksView.h
//  Citron
//
//  Created by Zijiao Liu on 2/23/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDynamicHeightView.h>
#import "CTSectionView.h"

@class CTLink;

@interface CTExpertLinksView : CTSectionView <AKDynamicHeightView>

@property (nonatomic, nonnull) UIView *borderView;

@property (nonatomic, nonnull) NSArray<CTLink *> *links;

@end
