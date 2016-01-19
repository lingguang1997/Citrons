//
//  CTInstructionModule.m
//  Citron
//
//  Created by Zijiao Liu on 1/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTInstructionModule.h"

@implementation CTInstructionModule

- (instancetype)initWithJSONDictionary:(NSDictionary *)jsonDict {
    self = [super init];
    if (self) {
    }
    return self;
}

- (instancetype)initWithHeader:(NSString *)header instructionImageName:(NSString *)instructionImageName {
    self = [super init];
    if (self) {
        _header = header;
        _instructionImage = [UIImage imageNamed:instructionImageName];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return nil;
}

- (NSString *)identifier {
    return @"CTInstructionModule";
}

- (NSArray *)data {
    return @[_header, _instructionImage];
}

@end
