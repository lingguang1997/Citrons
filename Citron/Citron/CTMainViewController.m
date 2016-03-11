//
//  CTMainViewController.m
//  Citron
//
//  Created by Zijiao Liu on 1/10/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "UIColor+CTColor.h"
#import "CTHomeViewController.h"
#import "CTProfileViewController.h"
#import "CTMainViewController.h"

@interface CTMainViewController ()

@end

@implementation CTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [UITabBar appearance].tintColor = [UIColor ct_blueColor];

    UITabBarController *tabBarContoller = [UITabBarController new];

    CTHomeViewController *homeViewController = [CTHomeViewController new];
    UINavigationController *homeNC = [[UINavigationController alloc] initWithRootViewController:homeViewController];

    CTProfileViewController *profileViewController = [CTProfileViewController new];
    UINavigationController *profileNC = [[UINavigationController alloc] initWithRootViewController:profileViewController];
    
    tabBarContoller.viewControllers = @[homeNC, profileNC];

    [self addChildViewController:tabBarContoller];
    [self.view addSubview:tabBarContoller.view];
    [tabBarContoller didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
