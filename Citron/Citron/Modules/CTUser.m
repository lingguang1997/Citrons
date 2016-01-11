//
//  CTUser.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTUser.h"

@implementation CTUser

- (instancetype)initWithJSONDictionary:(NSDictionary *)jsonDict {
    self = [super init];
    if (self) {
    }
    return self;
}

- (instancetype)initWithID:(NSString *)ID name:(NSString *)name email:(NSString *)email phoneNumber:(NSString *)phoneNumber {
    self = [super init];
    if (self) {
        _ID = ID;
        _name = name;
        _email = email;
        _phoneNumber = phoneNumber;
    }
    return self;
}

@end
