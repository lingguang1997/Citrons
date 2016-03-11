//
//  CTProfileCoverSectionController.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/9.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <AppKit/AKDataViewController.h>

#import "CTProfileSectionController.h"
#import "CTProfileCoverCellAdapter.h"
#import "CTTextCellAdapter.h"
#import "CTProfileQuestionStatusCellAdapter.h"
#import "CTProfileModule.h"
#import "CTProfileCoverCell.h"
#import "CTCustomer.h"
#import "CTButtonIconCellAdapter.h"

@implementation CTProfileSectionController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self registerAdapter:[CTProfileCoverCellAdapter new] forItemClass:[CTCustomer class]];
        [self registerAdapter:[CTTextCellAdapter new] forItemClass:[NSDictionary class]];
        [self registerAdapter:[CTButtonIconCellAdapter new] forItemClass:[NSArray class]];
    }
    return self;
}

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)module heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [super dataViewController:dataViewController item:module heightForRowAtIndexPath:indexPath];
}

- (AKTableViewCell *)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   return [super dataViewController:dataViewController item:item cellForRowAtIndexPath:indexPath];
}

@end
