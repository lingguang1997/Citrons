//
//  CTProfileMiscModule.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTProfileMiscModule.h"
#import "CTIconCell.h"

@implementation CTProfileMiscModule

- (nonnull instancetype)initWithJSONDictionary:(nonnull NSDictionary *)jsonDict {
    self = [super init];
    if (self) {
    }
    return self;
}

- (nonnull instancetype)initWithCustomer:(CTCustomer *)customer {
    self = [super init];
    if (self) {
        _customer = customer;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return nil;
}

- (NSString *)identifier {
    return @"profile";
}

- (NSArray *)data {
    return @[@{},//placeholder
             @{kCTIconCellTitleKey: @"我悬赏的问题",
               kCTIconCellIconKey: @"ProfileMiscIcon",
               kCTIconCellDataKey: _customer.onGoingTopicRequests},
             @{kCTIconCellTitleKey: @"我关注的专家",
               kCTIconCellIconKey: @"ProfileMiscIcon",
               kCTIconCellDataKey: _customer.interestedInExperts},
             @{kCTIconCellTitleKey: @"我的草稿",
               kCTIconCellIconKey: @"ProfileMiscIcon",
               kCTIconCellDataKey: @[@"", @""]},
             @{},//placeholder
             @{kCTIconCellTitleKey: @"成为专家",
               kCTIconCellIconKey: @"ProfileMiscIcon"},
             @{},//placeholder
             @{kCTIconCellTitleKey: @"帮助",
               kCTIconCellIconKey: @"ProfileMiscIcon"}
             ];
}


@end
