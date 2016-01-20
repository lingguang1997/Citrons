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

- (instancetype)initWithID:(NSString *)ID name:(NSString *)name email:(NSString *)email phoneNumber:(NSString *)phoneNumber title:(NSString *)title schoole:(NSString *)school degree:(NSString *)degree tags:(NSArray<NSString *> *)tags topics:(NSArray<CTTopic *> *)topics bio:(NSString *)bio links:(NSArray<NSString *> *)links credits:(NSInteger)credits commentsFromExperts:(NSArray<CTComment *> *)commentFromExperts commentsFromUsers:(NSArray<CTComment *> *)commentsFromUsers profileImageURL:(NSString *)profileImageURL {
    self = [super initWithID:ID name:name email:email phoneNumber:phoneNumber];
    if (self) {
        _title = title;
        _school = school;
        _degree = degree;
        _tags = tags;
        _topics = topics;
        _bio = bio;
        _links = links;
        _credits = credits;
        _commentsFromExperts = commentFromExperts;
        _commentsFromUsers = commentsFromUsers;
        _profileImageURL = profileImageURL;
    }
    return self;
}

- (NSString *)description {
    return self.name;
}

@end
