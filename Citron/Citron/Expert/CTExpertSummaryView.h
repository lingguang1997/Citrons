//
//  CTExpertSummaryView.h
//  Citron
//
//  Created by Zijiao Liu on 2/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDynamicHeightView.h>

@class CTExpert;

@interface CTExpertSummaryView : UIView <AKDynamicHeightView>

- (void)updateWithExpert:(CTExpert *)expert;

@end
