//
//  CTRecommendedExpertCellAdapter.m
//  Citron
//
//  Created by Zijiao Liu on 1/19/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDataViewController.h>
#import "CTRecommendedExpertCell.h"
#import "CTRecommendedExpertCellAdapter.h"

@implementation CTRecommendedExpertCellAdapter

- (AKTableViewCell *)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTRecommendedExpertCell *cell = [[CTRecommendedExpertCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CTRecommendedExpertCell"];
    return cell;
}

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CTRecommendedExpertCell heightForItem:item fixedWidth:CGRectGetWidth(dataViewController.view.frame)];
}

@end
