//
//  CTWXHTTPSessionManager.h
//  Citron
//
//  Created by Zijiao Liu on 1/23/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "CTHTTPSessionManager.h"

@class SendAuthResp;

extern NSString * _Nonnull const WXOpenID;
extern NSString * _Nonnull const WXAccessToken;

@interface CTWXHTTPSessionManager : AFHTTPSessionManager

+ (nonnull instancetype)sharedHTTPSessionManager;

- (void)refreshTokenIfPossibleWithSuccess:(nonnull void(^)(BOOL accessTokenExpired))success failure:(nonnull CTFailureBlock)failure;
- (void)getUserInfoWithSuccess:(nonnull void(^)(NSDictionary * _Nonnull userDict))success failure:(nonnull CTFailureBlock)failure;
- (void)authorizeWithSendAuthResp:(nonnull SendAuthResp *)resp success:(nonnull void(^)())success failure:(nonnull CTFailureBlock)failure;

@end
