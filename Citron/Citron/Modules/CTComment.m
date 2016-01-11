//
//  CTComment.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTComment.h"
#import "CTUser.h"

@implementation CTComment

- (instancetype)initWithJSONDictionary:(NSDictionary *)jsonDict {
    self = [super init];
    if (self) {
    }
    return self;
}

- (instancetype)initWithComment:(NSString *)comment from:(CTUser *)fromUser to:(CTUser *)toUser date:(NSDate *)date {
    self = [super init];
    if (self) {
        _comment = comment;
        _fromUser = fromUser;
        _toUser = toUser;
        _date = date;
    }
    return self;
}

@end
