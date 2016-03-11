//
//  CTProfileCoverSectionController.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/9.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTProfileSectionController.h"
#import "CTProfileCoverCellAdapter.h"
#import "CTHeaderCellAdapter.h"
#import "CTExpert.h"

@implementation CTProfileCoverSectionController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self registerAdapter:[CTProfileCoverCellAdapter new] forItemClass:[CTExpert class]];
        [self registerAdapter:[CTHeaderCellAdapter new] forItemClass:[NSString class]];
        [self registerAdapter:<#(nonnull AKTableViewCellAdapter *)#> forItemClass:<#(nonnull id)#>]
    }
    return self;
}



@end
