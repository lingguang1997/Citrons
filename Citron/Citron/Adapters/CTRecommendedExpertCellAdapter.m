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
    CTExpertDetailViewController *controller = [[CTExpertDetailViewController alloc] initWithExpert:item];
    [dataViewController.navigationController pushViewController:controller animated:YES];
}

@end
