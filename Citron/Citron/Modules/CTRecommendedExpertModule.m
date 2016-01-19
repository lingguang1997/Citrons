//
//  CTRecommendedExpertModule.m
//  Citron
//
//  Created by Zijiao Liu on 1/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTRecommendedExpertModule.h"

@implementation CTRecommendedExpertModule

- (instancetype)initWithJSONDictionary:(NSDictionary *)jsonDict {
    self = [super init];
    if (self) {
    }
    return self;
}

- (instancetype)initWithExperts:(NSArray *)experts {
    self = [super init];
    if (self) {
        _experts = experts;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return nil;
}

- (NSString *)identifier {
    return @"CTRecommendedExpertModule";
}

- (NSArray *)data {
    return _experts;
}

@end
