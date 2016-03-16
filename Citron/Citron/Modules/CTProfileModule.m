//
//  CTProfileModule.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTProfileModule.h"
#import "CTCustomer.h"
#import "CTTextCell.h"

@implementation CTProfileModule

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
    return @[_customer, @{kCTTextCellTitleKey: @"我的问题", kCTTextCellSubTitleKey: @"查看全部", kCTTextCellDataKey: _customer}, @[]];
}

@end
