//
//  CTTopic.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTTopic.h"

@implementation CTTopic

- (instancetype)initWithJSONDictionary:(NSDictionary *)jsonDict {
    self = [super init];
    if (self) {
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title price:(NSInteger)price salePrice:(NSInteger)salePrice detail:(NSString *)detail duration:(CGFloat)duration {
    self = [super init];
    if (self) {
        _title = title;
        _price = price;
        _salePrice = salePrice;
        _detail = detail;
        _duration = duration;
    }
    return self;
}

@end
