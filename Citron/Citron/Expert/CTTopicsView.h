//
//  CTTopicsView.h
//  Citron
//
//  Created by Zijiao Liu on 2/26/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTSectionView.h"

@class CTExpert;

@interface CTTopicsView : CTSectionView

- (void)updateWithExpert:(nonnull CTExpert *)expert;
+ (CGFloat)heightWithItem:(nonnull CTExpert *)expert canvasWidth:(CGFloat)canvasWidth;

@end
