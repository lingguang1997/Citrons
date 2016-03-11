//
//  CTRequest.h
//  Citron
//
//  Created by Shuo Zhang on 16/3/10.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CTComment;

typedef NS_ENUM(NSInteger, CTRequestStageType) {
    CTRequestStageTypeRequesting        = 1,
    CTRequestStageTypeScheduled         = 16,
    CTRequestStageTypeDone              = 32,
};

@interface CTRequest : NSObject

@property (nonatomic, copy, readonly, nonnull) NSString *customerId;
@property (nonatomic, copy, readonly, nonnull) NSString *expertId;
@property (nonatomic, copy, readonly, nonnull) NSString *requestId;
@property (nonatomic, copy, readonly, nonnull) NSString *topicId;
@property (nonatomic, copy, readonly, nullable) NSDate *topicAcceptedTime;
@property (nonatomic, copy, readonly, nullable) NSDate *topicServedTime;
@property (nonatomic, copy, readonly, nullable) NSDate *topicRatedTime;
@property (nonatomic, copy, readonly, nonnull)  NSDate *topicRequestedTime;
@property (nonatomic, copy, readonly, nullable) NSDate *topicScheduledTime;
@property (nonatomic, copy, readonly, nonnull)  NSString    *topicTitle;
@property (nonatomic, copy, readonly, nullable) CTComment   *topicComment;
@property (nonatomic, readonly) NSInteger stage;

- (nonnull instancetype)init NS_UNAVAILABLE;
- (nonnull instancetype)initWithJSONDictionary:(nonnull NSDictionary *)jsonDict NS_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithRequestId:(nonnull NSString *)requestId
                               customerId:(nonnull NSString *)customerId
                                 expertId:(nonnull NSString *)expertId
                                  topicId:(nonnull NSString *)topicId
                               topicTitle:(nonnull NSString *)topicTitle
                       topicRequestedTime:(nonnull NSDate *)topicRequestedTime
                        topicAcceptedTime:(nullable NSDate *)topicAcceptedTime
                       topicScheduledTime:(nullable NSDate *)topicScheduledTime
                          topicServedTime:(nullable NSDate *)topicServedTime
                           topicRatedTime:(nullable NSDate *)topicRatedTime
                             topicComment:(nullable CTComment *)topicComment
                                    stage:(NSInteger)stage NS_DESIGNATED_INITIALIZER;

@end
