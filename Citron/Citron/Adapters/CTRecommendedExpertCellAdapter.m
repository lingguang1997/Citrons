//
//  CTRecommendedExpertCellAdapter.m
//  Citron
//
//  Created by Zijiao Liu on 1/19/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDataViewController.h>
#import "CTExpert.h"
#import "CTExpertDetailViewController.h"
#import "CTLoginViewController.h"
#import "CTRecommendedExpertCell.h"
#import "CTRecommendedExpertCellAdapter.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"

@implementation CTRecommendedExpertCellAdapter

- (AKTableViewCell *)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTRecommendedExpertCell *cell = [[CTRecommendedExpertCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CTRecommendedExpertCell"];
    return cell;
}

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(CTExpert *)item groupStyle:(AKTableViewCellGroupStyle)groupStyle seperatorEnabled:(BOOL)seperatorEnabled heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CTRecommendedExpertCell heightForItem:item groupStyle:groupStyle seperatorEnabled:seperatorEnabled fixedWidth:CGRectGetWidth(dataViewController.view.frame)];
}

- (void)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    CTLoginViewController *controller = [CTLoginViewController new];
//    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
//    if ([navController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        navController.interactivePopGestureRecognizer.enabled = NO;
//    }
//    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor ct_grayColor], NSFontAttributeName: [UIFont ct_appFontWithSize:20]}];
//
//    CGRect bounds = navController.navigationBar.bounds;
//    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
//    visualEffectView.frame = bounds;
//    visualEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    [navController.navigationBar addSubview:visualEffectView];
//    navController.navigationBar.backgroundColor = [UIColor clearColor];
//    [navController.navigationBar sendSubviewToBack:visualEffectView];
//    navController.navigationBar.barTintColor = [UIColor clearColor];
//    navController.navigationBar.tintColor = [UIColor ct_grayColor];
////    navController.navigationBar.translucent = NO;
//    navController.navigationBar.backgroundColor = [UIColor clearColor];
//    navController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    navController.view.backgroundColor = [UIColor clearColor];
//    [dataViewController presentViewController:navController animated:YES completion:nil];
//    dataViewController.tabBarController.tabBar.hidden = YES;

    CTExpertDetailViewController *controller = [[CTExpertDetailViewController alloc] initWithExpert:item];
    [dataViewController.navigationController pushViewController:controller animated:YES];
}

@end
