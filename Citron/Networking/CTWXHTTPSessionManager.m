//
//  CTWXHTTPSessionManager.m
//  Citron
//
//  Created by Zijiao Liu on 1/23/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTSettings.h"
#import "CTWXHTTPSessionManager.h"
//#import "WXApi.h"

NSString * const WXOpenID = @"";
NSString * const WXAccessToken = @"access_token";

NSString * const WXDoctorAppID = @"";
NSString * const WXDoctorAppSecret = @"";
NSString * const WXPatientAppID = @"";
NSString * const WXPatientAppSecret = @"";

static NSString * const kBaseURL = @"https://api.weixin.qq.com/sns";
static NSString * const kRefreshURLFormat = @"oauth2/refresh_token?appid=%@&grant_type=refresh_token&refresh_token=%@";
static NSString * const kWXRefreshToken = @"refresh_token";
static NSString * const kUserURLFormat = @"userinfo?access_token=%@&openid=%@";
static NSString * const kAccessURLFormat = @"oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code";

@implementation CTWXHTTPSessionManager

+ (instancetype)sharedHTTPSessionManager {
    static CTWXHTTPSessionManager *sessionManager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sessionManager = [[CTWXHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    });
    return sessionManager;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

- (void)refreshTokenIfPossibleWithSuccess:(void (^)(BOOL))success failure:(CTFailureBlock)failure {
    NSString *accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:WXAccessToken];
    NSString *openID = [[NSUserDefaults standardUserDefaults] objectForKey:WXOpenID];
    if (accessToken.length && openID.length) {
        NSString *refreshToken = [[NSUserDefaults standardUserDefaults] objectForKey:kWXRefreshToken];
        NSString *refreshURL = [NSString stringWithFormat:kRefreshURLFormat, WXOpenID, refreshToken];
        [self GET:refreshURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *refreshDict = [NSDictionary dictionaryWithDictionary:responseObject];
            NSString *reaccessToken = [refreshDict objectForKey:WXAccessToken];
            // nil reaccess token means access token is expired
            if (reaccessToken.length) {
                [[NSUserDefaults standardUserDefaults] setObject:reaccessToken forKey:WXAccessToken];
                [[NSUserDefaults standardUserDefaults] setObject:[refreshDict objectForKey:WXOpenID] forKey:WXOpenID];
                [[NSUserDefaults standardUserDefaults] setObject:[refreshDict objectForKey:kWXRefreshToken] forKey:kWXRefreshToken];
                [[NSUserDefaults standardUserDefaults] synchronize];
                success(NO);
            } else {
                success(YES);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
    success(NO);
}

- (void)getUserInfoWithSuccess:(void (^)(NSDictionary * _Nonnull))success failure:(CTFailureBlock)failure {
    NSString *accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:WXAccessToken];
    NSString *openID = [[NSUserDefaults standardUserDefaults] objectForKey:WXOpenID];
    NSString *userURL = [NSString stringWithFormat:kUserURLFormat, accessToken, openID];
    [self GET:userURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *userDict = [NSDictionary dictionaryWithDictionary:responseObject];
        success(userDict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)authorizeWithSendAuthResp:(SendAuthResp *)resp success:(void (^)())success failure:(CTFailureBlock)failure {
//    NSString *accessURL = [NSString stringWithFormat:kAccessURLFormat, WXPatientAppID, WXPatientAppSecret, resp.code];
//    [self GET:accessURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *accessDict = [NSDictionary dictionaryWithDictionary:responseObject];
//        NSString *accessToken = [accessDict objectForKey:WXAccessToken];
//        NSString *openID = [accessDict objectForKey:WXOpenID];
//        NSString *refreshToken = [accessDict objectForKey:kWXRefreshToken];
//        if (accessToken.length && openID.length) {
//            [[NSUserDefaults standardUserDefaults] setObject:accessToken forKey:WXAccessToken];
//            [[NSUserDefaults standardUserDefaults] setObject:openID forKey:WXOpenID];
//            [[NSUserDefaults standardUserDefaults] setObject:refreshToken forKey:kWXRefreshToken];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//        }
//        success();
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        failure(error);
//    }];
}

@end
