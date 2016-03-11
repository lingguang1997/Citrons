//
//  CTCustomer.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/10.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTCustomer.h"

@implementation CTCustomer

- (instancetype)initWithJSONDictionary:(NSDictionary *)jsonDict {
    self = [super initWithJSONDictionary:jsonDict];
    if (self) {
    }
    return self;
}

- (instancetype)initWithID:(NSString *)ID name:(NSString *)name email:(NSString *)email phoneNumber:(NSString *)phoneNumber title:(NSString *)title company:(NSString *)company about:(NSString *)about lastSeenDate:(NSDate *)lastSeenDate interestedInExperts:(NSArray<CTExpert *> *)interestedInExperts onGoingTopicRequests:(NSArray<CTRequest *> *)onGoingTopicRequests completedTopicRequests:(NSArray<CTRequest *> *)completedTopicRequests profileImageURL:(NSString *)profileImageURL profileImageThumbURL:(NSString *)profileImageThumbURL{
    self = [super initWithID:ID name:name email:email phoneNumber:phoneNumber];
    if (self) {
        _title = title;
        _company = company;
        _about = about;
        _lastSeenDate = lastSeenDate;
        _interestedInExperts = interestedInExperts;
        _onGoingTopicRequests = onGoingTopicRequests;
        _completedTopicRequests = completedTopicRequests;
        _profileImageURL = profileImageURL;
        _profileThumbnailURL = profileImageThumbURL;
    }
    return self;
}

- (NSString *)description {
    return self.name;
}


@end
