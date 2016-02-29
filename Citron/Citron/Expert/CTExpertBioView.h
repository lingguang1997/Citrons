//
//  CTExpertBioView.h
//  Citron
//
//  Created by Zijiao Liu on 2/23/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTSectionView.h"

@class CTExpert;

@interface CTExpertBioView : CTSectionView

- (void)updateWithExpert:(nonnull CTExpert *)expert;

@end
