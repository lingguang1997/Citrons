//
//  CTProfileCoverCell.h
//  Citron
//
//  Created by Shuo Zhang on 16/3/9.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <AppKit/AKTableViewCell.h>
#import "CTCustomerProfileView.h"

@interface CTProfileCoverCell : AKTableViewCell

@property (nonatomic, readonly, nonnull) CTCustomerProfileView *coverView;

@end
