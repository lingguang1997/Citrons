//
//  CTHTTPSessionManager.m
//  Citron
//
//  Created by Zijiao Liu on 1/24/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTHTTPSessionManager.h"

static NSString *kBaseURL = @"";

@implementation CTHTTPSessionManager

+ (nonnull instancetype)sharedHTTPSessionManager {
    static CTHTTPSessionManager *sessionManager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sessionManager = [[CTHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
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

- (void)loginWithUsername:(NSString *)username password:(NSString *)password success:(void (^)(CTUser * _Nonnull))success failure:(CTFailureBlock)failure {
    
}

@end
