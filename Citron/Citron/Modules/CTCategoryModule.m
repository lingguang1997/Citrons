//
//  CTCategoryModule.m
//  Citron
//
//  Created by Zijiao Liu on 1/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTCategoryModule.h"

@implementation CTCategoryModule


- (nonnull instancetype)initWithJSONDictionary:(nonnull NSDictionary *)jsonDict {
    self = [super init];
    if (self) {
    }
    return self;
}

- (instancetype)initWithCategories:(NSArray *)categories {
    self = [super init];
    if (self) {
        _categories = categories;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return nil;
}

- (NSString *)identifier {
    return @"Category";
}

- (NSArray *)data {
    return _categories;
}

@end
