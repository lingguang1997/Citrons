//
//  CTHomeViewController.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTHomeStream.h"
#import "CTHomeViewController.h"
#import "CTInstructionCellAdapter.h"
#import "CTHeaderCellAdapter.h"
#import "CTStarExpertsCellAdapter.h"
#import "CTStarExpertsModule.h"

@implementation CTHomeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self _setUpTabBarItem];
        [self registerAdapter:[CTStarExpertsCellAdapter new] forItemClass:[CTStarExpertsModule class]];
        [self registerAdapter:[CTHeaderCellAdapter new] forItemClass:[NSString class]];
        [self registerAdapter:[CTInstructionCellAdapter new] forItemClass:[UIImage class]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

# pragma mark - AKStream

- (CTHomeStream *)stream {
    static CTHomeStream *homeStream = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        homeStream = [CTHomeStream new];
        homeStream.delegate = self;
    });
    return homeStream;
}

# pragma mark - Helpers

- (void)_setUpTabBarItem {
    UIImage *image = [UIImage imageNamed:@"HomeTab"];
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:image selectedImage:image];
}

@end
