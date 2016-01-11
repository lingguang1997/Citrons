//
//  CTComment.h
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CTUser;

@interface CTComment : NSObject

@property (nonatomic, copy, readonly, nonnull) NSString *comment;
@property (nonatomic, copy, readonly, nonnull) CTUser *fromUser;
@property (nonatomic, copy, readonly, nonnull) CTUser *toUser;
@property (nonatomic, readonly, nonnull) NSDate *date;

- (nonnull instancetype)init NS_UNAVAILABLE;
- (nonnull instancetype)initWithJSONDictionary:(nonnull NSDictionary *)jsonDict NS_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithComment:(nonnull NSString *)comment from:(nonnull CTUser *)fromUser to:(nonnull CTUser *)toUser date:(nonnull NSDate *)date NS_DESIGNATED_INITIALIZER;

@end
