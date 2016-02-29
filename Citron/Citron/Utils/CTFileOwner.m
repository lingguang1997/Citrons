//
//  CTFileOwner.m
//  Citron
//
//  Created by Zijiao Liu on 2/25/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTFileOwner.h"

@implementation CTFileOwner

+ (id)viewFromNibNamed:(NSString *)nibName {
    CTFileOwner *owner = [self new];
    [[NSBundle mainBundle] loadNibNamed:nibName owner:owner options:nil];
    return owner.view;
}

@end
