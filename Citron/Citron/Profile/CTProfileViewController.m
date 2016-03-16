//
//  CTAccountPageViewController.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/8.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTProfileViewController.h"
#import "CTProfileSectionController.h"
#import "CTProfileStream.h"
#import "CTProfileModule.h"
#import "CTProfileMiscSectionController.h"
#import "CTProfileMiscModule.h"

@interface CTProfileViewController (){
    UILabel *titleLabel;
}

@end

@implementation CTProfileViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        [self _setUpTabBarItem];
        [self registerSectionController:[CTProfileSectionController new] forDataModuleClass:[CTProfileModule class]];
        [self registerSectionController:[CTProfileMiscSectionController new] forDataModuleClass:[CTProfileMiscModule class]];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"个人中心";
    [titleLabel sizeToFit];
    
    self.title = @"";
    
    self.navigationItem.titleView = titleLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - AKStream

- (CTProfileStream *)stream {
    static CTProfileStream *profileStream = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        profileStream = [CTProfileStream new];
        profileStream.delegate = self;
    });
    return profileStream;
}

# pragma mark - Helpers

- (void)_setUpTabBarItem {
    UIImage *image = [UIImage imageNamed:@"ProfileTab"];
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:image selectedImage:image];
}

@end
