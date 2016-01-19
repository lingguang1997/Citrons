//
//  CTExpert.h
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTUser.h"

@class CTComment;
@class CTTopic;

@interface CTExpert : CTUser

@property (nonatomic, copy, readonly, nonnull) NSString *title;
@property (nonatomic, copy, readonly, nonnull) NSString *school;
@property (nonatomic, copy, readonly, nonnull) NSString *degree;
@property (nonatomic, copy, readonly, nullable) NSString *profileThumbnailURL;
@property (nonatomic, copy, readonly, nullable) NSString *profileImageURL;
@property (nonatomic, copy, readonly, nonnull) NSArray<NSString *> *tags;
@property (nonatomic, copy, readonly, nonnull) NSArray<CTTopic *> *topics;
@property (nonatomic, copy, readonly, nonnull) NSString *bio;
@property (nonatomic, copy, readonly, nonnull) NSArray<NSString *> *links;
@property (nonatomic, readonly) NSInteger credits;
@property (nonatomic, copy, readonly, nonnull) NSArray<CTComment *> *commentsFromExperts;
@property (nonatomic, copy, readonly, nonnull) NSArray<CTComment *> *commentsFromUsers;

- (nonnull instancetype)init NS_UNAVAILABLE;
- (nonnull instancetype)initWithID:(nonnull NSString *)ID name:(nonnull NSString *)name email:(nullable NSString *)email phoneNumber:(nullable NSString *)phoneNumber NS_UNAVAILABLE;
- (nonnull instancetype)initWithJSONDictionary:(nonnull NSDictionary *)jsonDict NS_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithID:(nonnull NSString *)ID name:(nonnull NSString *)name email:(nullable NSString *)email phoneNumber:(nullable NSString *)phoneNumber title:(nonnull NSString *)title schoole:(nullable NSString *)school degree:(nullable NSString *)degree tags:(nullable NSArray<NSString *> *)tags topics:(nullable NSArray<CTTopic *> *)topics bio:(nullable NSString *)bio links:(nullable NSArray<NSString *> *)links credits:(NSInteger)credits commentsFromExperts:(nullable NSArray<CTComment *> *)commentFromExperts commentsFromUsers:(nullable NSArray<CTComment *> *)commentsFromUsers profileImageURL:(nullable NSString *)profileImageURL NS_DESIGNATED_INITIALIZER;

@end
