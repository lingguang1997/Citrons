//
//  AppDelegate.m
//  Citron
//
//  Created by Zijiao Liu on 1/10/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

//#import <TLSSDK/TLSAccountHelper.h>
//#import <TLSSDK/TLSLoginHelper.h>
//#import <ImSDK/ImSDK.h>
#import "AppDelegate.h"
#import "CTMainViewController.h"
#import "CTSettings.h"
#import "CTWXHTTPSessionManager.h"

#import <AppKit/NSString+AKContent.h>
//#import "WXApi.h"

@interface AppDelegate () //<WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [CTMainViewController new];
    [self.window makeKeyAndVisible];
//    [self _registerQCloud];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
//    return [WXApi handleOpenURL:url delegate:self];
//}
//
//# pragma mark - WXApiDelegate
//
//- (void)onReq:(BaseReq *)req {
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}
//
//- (void)onResp:(BaseResp *)resp {
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}
//
//# pragma mark - Private methods
//
//- (void)_registerQCloud {
//    // Init QCloud SDK
//    [[TIMManager sharedInstance] setEnv:TLS_SDK_ENV_VALUE];
//    [[TIMManager sharedInstance] initSdk:TLS_SDK_APP_ID accountType:[NSString stringWithFormat:@"%d", TLS_SDK_ACCOUNT_TYPE]];
//
//    // Init login and account helpers
//    // The warning is caused by poor Tencent code
//    [[TLSLoginHelper getInstance] init:TLS_SDK_APP_ID andAccountType:TLS_SDK_ACCOUNT_TYPE andAppVer:APP_VERSION];
//    [[TLSAccountHelper getInstance] init:TLS_SDK_APP_ID andAccountType:TLS_SDK_ACCOUNT_TYPE andAppVer:APP_VERSION];
//    [[TLSLoginHelper getInstance] setLogcat:YES];
//
//    // Allow Weixin login
//    [WXApi registerApp:WXOpenID];
//}


@end
