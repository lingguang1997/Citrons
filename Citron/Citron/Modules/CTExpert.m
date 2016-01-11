//
//  CTExpert.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTExpert.h"

@implementation CTExpert

- (instancetype)initWithJSONDictionary:(NSDictionary *)jsonDict {
    self = [super initWithJSONDictionary:jsonDict];
    if (self) {
    }
    return self;
}

- (instancetype)initWithID:(NSString *)ID name:(NSString *)name email:(NSString *)email phoneNumber:(NSString *)phoneNumber title:(NSString *)title schoole:(NSString *)school degree:(NSString *)degree tags:(NSArray<NSString *> *)tags topics:(NSArray<CTTopic *> *)topics bio:(NSString *)bio links:(NSArray<NSString *> *)links commentsFromExperts:(NSArray<CTComment *> *)commentFromExperts commentsFromUsers:(NSArray<CTComment *> *)commentsFromUsers {
    self = [super initWithID:ID name:name email:email phoneNumber:phoneNumber];
    if (self) {
        _title = title;
        _school = school;
        _degree = degree;
        _tags = tags;
        _topics = topics;
        _bio = bio;
        _links = links;
        _commentsFromExperts = commentFromExperts;
        _commentsFromUsers = commentsFromUsers;
    }
    return self;
}

@end
