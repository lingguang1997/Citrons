//
//  CTRequest.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/10.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTRequest.h"

@implementation CTRequest

- (instancetype)initWithJSONDictionary:(NSDictionary *)jsonDict {
    self = [super init];
    if (self) {
    }
    return self;
}

- (instancetype)initWithRequestId:(NSString *)requestId customerId:(NSString *)customerId expertId:(NSString *)expertId topicId:(NSString *)topicId topicTitle:(NSString *)topicTitle topicRequestedTime:(NSDate *)topicRequestedTime topicAcceptedTime:(NSDate *)topicAcceptedTime topicScheduledTime:(NSDate *)topicScheduledTime topicServedTime:(NSDate *)topicServedTime topicRatedTime:(NSDate *)topicRatedTime topicComment:(CTComment *)topicComment stage:(NSInteger)stage{
    self = [super init];
    if (self) {
        _requestId = requestId;
        _customerId = customerId;
        _expertId = expertId;
        _topicId = topicId;
        _topicTitle = topicTitle;
        _topicRequestedTime = topicRequestedTime;
        _topicAcceptedTime = topicAcceptedTime;
        _topicScheduledTime = topicScheduledTime;
        _topicServedTime = topicServedTime;
        _topicRatedTime = topicRatedTime;
        _topicComment = topicComment;
        _stage = stage;
    }
    return self;
}

- (NSString *)description {
    return _topicTitle;
}

@end
