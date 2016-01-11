//
//  CTUser.h
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTUser : NSObject

@property (nonatomic, copy, readonly, nonnull) NSString *ID;
@property (nonatomic, copy, readonly, nonnull) NSString *name;
@property (nonatomic, copy, readonly, nonnull) NSString *email;
@property (nonatomic, copy, readonly, nonnull) NSString *phoneNumber;
@property (nonatomic, readonly) BOOL isExpert;

- (nonnull instancetype)init NS_UNAVAILABLE;
- (nonnull instancetype)initWithJSONDictionary:(nonnull NSDictionary *)jsonDict NS_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithID:(nonnull NSString *)ID name:(nonnull NSString *)name email:(nullable NSString *)email phoneNumber:(nullable NSString *)phoneNumber NS_DESIGNATED_INITIALIZER;

@end
