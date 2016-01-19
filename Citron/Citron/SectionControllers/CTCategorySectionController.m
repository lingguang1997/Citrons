//
//  CTCategorySectionController.m
//  Citron
//
//  Created by Zijiao Liu on 1/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDataViewController.h>
#import "CTCategoryCell.h"
#import "CTCategoryCellAdapter.h"
#import "CTCategoryModule.h"
#import "CTCategorySectionController.h"

@implementation CTCategorySectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self registerAdapter:[CTCategoryCellAdapter new] forItemClass:[NSString class]];
    }
    return self;
}

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(CTCategoryModule *)module heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CTCategoryCell heightForItem:[module.data firstObject] fixedWidth:CGRectGetWidth(dataViewController.view.frame)];
}

@end
