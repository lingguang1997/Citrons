//
//  CTRecommendedExpertSectionController.m
//  Citron
//
//  Created by Zijiao Liu on 1/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTExpert.h"
#import "CTHeaderCellAdapter.h"
#import "CTRecommendedExpertCellAdapter.h"
#import "CTRecommendedExpertSectionController.h"

@implementation CTRecommendedExpertSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.grouped = YES;
        [self registerAdapter:[CTRecommendedExpertCellAdapter new] forItemClass:[CTExpert class]];
        [self registerAdapter:[CTHeaderCellAdapter new] forItemClass:[NSString class]];
    }
    return self;
}

@end
