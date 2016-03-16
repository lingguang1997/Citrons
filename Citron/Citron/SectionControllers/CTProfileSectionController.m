//
//  CTProfileCoverSectionController.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/9.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <AppKit/AKDataViewController.h>

#import "CTButtonIconCellAdapter.h"
#import "CTCustomer.h"
#import "CTTextCell.h"
#import "CTProfileSectionController.h"
#import "CTProfileCoverCellAdapter.h"
#import "CTTextCellAdapter.h"
#import "CTProfileQuestionStatusCellAdapter.h"
#import "CTProfileModule.h"
#import "CTProfileCoverCell.h"
#import "CTQuestionsListViewController.h"

@implementation CTProfileSectionController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self registerAdapter:[CTProfileCoverCellAdapter new] forItemClass:[CTCustomer class]];
        [self registerAdapter:[CTTextCellAdapter new] forItemClass:[NSDictionary class]];
        [self registerAdapter:[CTButtonIconCellAdapter new] forItemClass:[NSArray class]];
    }
    return self;
}

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)module heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [super dataViewController:dataViewController item:module heightForRowAtIndexPath:indexPath];
}

- (AKTableViewCell *)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   return [super dataViewController:dataViewController item:item cellForRowAtIndexPath:indexPath];
}

- (void)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([item isKindOfClass:[NSDictionary class]]){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"CTMyQuestionsStoryBoard" bundle:nil];
        CTQuestionsListViewController *questionsListVC = [storyboard instantiateInitialViewController];
        questionsListVC.hidesBottomBarWhenPushed = YES;
        [dataViewController.navigationController pushViewController:questionsListVC animated:YES];
        NSDictionary *itemDict = (NSDictionary *)item;
        if ([itemDict.allKeys containsObject:kCTTextCellDataKey]) {
            id data = itemDict[kCTTextCellDataKey];
            if ([data isKindOfClass: [CTCustomer class]]){
                [questionsListVC setupWithCustomer:data];
            }
        }
    }
}

@end
