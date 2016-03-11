//
//  CTCustomer.h
//  Citron
//
//  Created by Shuo Zhang on 16/3/10.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTUser.h"

@class CTExpert;
@class CTRequest;

@interface CTCustomer : CTUser

@property (nonatomic, copy, readonly, nonnull) NSString *title;
@property (nonatomic, copy, readonly, nonnull) NSString *about;
@property (nonatomic, copy, readonly, nonnull) NSString *company;
@property (nonatomic, copy, readonly, nullable) NSDate *lastSeenDate;
@property (nonatomic, copy, readonly, nullable) NSString *profileThumbnailURL;
@property (nonatomic, copy, readonly, nullable) NSString *profileImageURL;
@property (nonatomic, copy, readonly, nonnull) NSArray<CTExpert *> *interestedInExperts;
@property (nonatomic, copy, readonly, nonnull) NSArray<CTRequest *> *onGoingTopicRequests;
@property (nonatomic, copy, readonly, nonnull) NSArray<CTRequest *> *completedTopicRequests;

- (nonnull instancetype)init NS_UNAVAILABLE;
- (nonnull instancetype)initWithID:(nonnull NSString *)ID name:(nonnull NSString *)name email:(nullable NSString *)email phoneNumber:(nullable NSString *)phoneNumber NS_UNAVAILABLE;
- (nonnull instancetype)initWithJSONDictionary:(nonnull NSDictionary *)jsonDict NS_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithID:(nonnull NSString *)ID
                              name:(nonnull NSString *)name
                             email:(nullable NSString *)email
                       phoneNumber:(nullable NSString *)phoneNumber
                             title:(nonnull NSString *)title
                           company:(nullable NSString *)company
                             about:(nullable NSString *)about
                      lastSeenDate:(nonnull NSDate *)lastSeenDate
               interestedInExperts:(nullable NSArray<CTExpert *> *)interestedInExperts
              onGoingTopicRequests:(nullable NSArray<CTRequest *> *)onGoingTopicRequests
            completedTopicRequests:(nullable NSArray<CTRequest *> *)completedTopicRequests
                   profileImageURL:(nullable NSString *)profileImageURL
              profileImageThumbURL:(nullable NSString *)profileImageThumbURL NS_DESIGNATED_INITIALIZER;

@end
