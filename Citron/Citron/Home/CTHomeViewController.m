//
//  CTHomeViewController.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTCategoryModule.h"
#import "CTCategorySectionController.h"
#import "CTHeaderCellAdapter.h"
#import "CTHomeStream.h"
#import "CTHomeViewController.h"
#import "CTInstructionCellAdapter.h"
#import "CTInstructionModule.h"
#import "CTInstructionSectionController.h"
#import "CTRecommendedExpertModule.h"
#import "CTRecommendedExpertSectionController.h"
#import "CTStarExpertsModule.h"
#import "CTStarExpertSectionController.h"

@implementation CTHomeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self _setUpTabBarItem];
        [self registerSectionController:[CTStarExpertSectionController new] forDataModuleClass:[CTStarExpertsModule class]];
        [self registerSectionController:[CTInstructionSectionController new] forDataModuleClass:[CTInstructionModule class]];
        [self registerSectionController:[CTRecommendedExpertSectionController new] forDataModuleClass:[CTRecommendedExpertModule class]];
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
