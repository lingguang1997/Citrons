//
//  CTLinkView.h
//  Citron
//
//  Created by Zijiao Liu on 3/2/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDynamicHeightView.h>

@class CTLink;

@interface CTLinkView : UIView <AKDynamicHeightView>

@property (nonatomic, nonnull) IBOutlet UIButton *button;

- (void)updateWithLink:(nonnull CTLink *)link;

@end
