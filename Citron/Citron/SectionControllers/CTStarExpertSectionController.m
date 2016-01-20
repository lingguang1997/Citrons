//
//  CTStarExpertSectionController.m
//  Citron
//
//  Created by Zijiao Liu on 1/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDataViewController.h>
#import "CTStarExpertsCell.h"
#import "CTStarExpertsModule.h"
#import "CTStarExpertSectionController.h"
#import "CTStarExpertsCellAdapter.h"

@implementation CTStarExpertSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self registerAdapter:[CTStarExpertsCellAdapter new] forItemClass:[CTStarExpertsModule class]];
    }
    return self;
}

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(CTStarExpertsModule *)module heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CTStarExpertsCell heightForItem:module groupStyle:AKTableViewCellGroupStyleNone seperatorEnabled:NO fixedWidth:CGRectGetWidth(dataViewController.view.frame)];
}

- (UITableViewCell *)dataViewController:(AKDataViewController *)dataViewController item:(CTStarExpertsModule *)module cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTStarExpertsCell *cell = [[CTStarExpertsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CTStarExpertsCell"];
    return cell;
}

- (NSInteger)dataViewController:(AKDataViewController *)dataViewController item:(CTStarExpertsModule *)module numberOfRowsInSection:(NSInteger)section {
    return 1;
}

@end
