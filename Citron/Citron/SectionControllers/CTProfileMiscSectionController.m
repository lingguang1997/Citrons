//
//  CTProfileMiscSectionController.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTProfileMiscSectionController.h"
#import "CTIconCellAdapter.h"
#import "CTCustomer.h"

@implementation CTProfileMiscSectionController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self registerAdapter:[CTIconCellAdapter new] forItemClass:[NSDictionary class]];
    }
    return self;
}

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)module heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [super dataViewController:dataViewController item:module heightForRowAtIndexPath:indexPath];
}

- (AKTableViewCell *)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [super dataViewController:dataViewController item:item cellForRowAtIndexPath:indexPath];
}

- (void)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
