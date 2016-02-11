//
//  CTHTTPSessionManager.h
//  Citron
//
//  Created by Zijiao Liu on 1/24/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@class CTUser;

typedef void(^CTFailureBlock)(NSError * _Nonnull error);

@interface CTHTTPSessionManager : AFHTTPSessionManager

+ (nonnull instancetype)sharedHTTPSessionManager;

- (void)loginWithUsername:(nonnull NSString *)username password:(nonnull NSString *)password success:(nonnull void(^)(CTUser * _Nonnull user))success failure:(nonnull CTFailureBlock)failure;

@end
