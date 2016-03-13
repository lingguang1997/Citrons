//
//  CTProfileQuestionStatusCell.h
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <AppKit/AKTableViewCell.h>
#import "CTCustomer.h"

@interface CTProfileQuestionStatusCell : AKTableViewCell
- (void)updateWithCustomer:(nonnull CTCustomer *)customer;
@end

@interface CTIconButton : UIButton
- (nonnull instancetype)initWithTitle:(nonnull NSString *)title icon:(nonnull UIImage *)icon;

- (void)updateNumber:(NSInteger)number;
@end