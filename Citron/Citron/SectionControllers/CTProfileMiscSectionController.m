//
//  CTProfileMiscSectionController.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <AppKit/AKDataViewController.h>
#import "CTProfileMiscSectionController.h"
#import "CTIconCellAdapter.h"
#import "CTCustomer.h"
#import "CTIConCell.h"
#import "CTExpert.h"
#import "CTExpertsListViewController.h"
#import "CTQuestionsListViewController.h"
#import "CTRequest.h"

@implementation CTProfileMiscSectionController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self registerAdapter:[CTIconCellAdapter new] forItemClass:[NSDictionary class]];
    }
    return self;
}

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)module heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [super dataViewController:dataViewController item:module heightForRowAtIndexPath:indexPath];
}

- (AKTableViewCell *)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [super dataViewController:dataViewController item:item cellForRowAtIndexPath:indexPath];
}

- (void)dataViewController:(AKDataViewController *)dataViewController item:(NSDictionary *)item didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([item.allKeys containsObject:kCTIconCellDataKey]) {
        id data = item[kCTIconCellDataKey];
        if ([data isKindOfClass:[NSArray class]]) {
            NSArray *array = (NSArray *)data;
            if (array.count > 0) {
                id itemData = array[0];
                if ([itemData isKindOfClass:[CTExpert class]]) {
                    CTExpertsListViewController *expertsVC = [[CTExpertsListViewController alloc] initWithNibName:nil bundle:nil];
                    expertsVC.hidesBottomBarWhenPushed = YES;
                    [dataViewController.navigationController pushViewController:expertsVC animated:YES];
                }else if ([itemData isKindOfClass:[CTRequest class]]){
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"CTMyQuestionsStoryBoard" bundle:nil];
                    CTQuestionsListViewController *questionsListVC = [storyboard instantiateInitialViewController];
                    questionsListVC.hidesBottomBarWhenPushed = YES;
                    [dataViewController.navigationController pushViewController:questionsListVC animated:YES];
                }
            }
        }
    }
}


@end
