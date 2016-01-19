//
//  CTHeaderCell.h
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKTableViewCell.h>

@interface CTHeaderCell :AKTableViewCell

@property (nonatomic, getter=isDismissable) BOOL dismissable;

@end
