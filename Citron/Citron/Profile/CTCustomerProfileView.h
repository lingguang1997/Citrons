//
//  CTProfileCoverView.h
//  Citron
//
//  Created by Shuo Zhang on 16/3/9.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <AppKit/AKDynamicHeightView.h>

@class CTCustomer;

@interface CTCustomerProfileView : UIView

- (void)updateWithCustomer:(CTCustomer *)customer;

@end
