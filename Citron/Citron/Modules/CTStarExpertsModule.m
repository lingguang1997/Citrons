//
//  CTStarExpertsModule.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTExpert.h"
#import "CTStarExpertsModule.h"

@implementation CTStarExpertsModule

- (nonnull instancetype)initWithJSONDictionary:(nonnull NSDictionary *)jsonDict {
    self = [super init];
    if (self) {
    }
    return self;
}

- (nonnull instancetype)initWithExperts:(nonnull NSArray<CTExpert *> *)experts {
    self = [super init];
    if (self) {
        _experts = experts;
    }
    return self;
}

@end
