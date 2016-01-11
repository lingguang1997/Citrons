//
//  CTStarExpertsCellAdapter.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDataViewController.h>
#import "CTStarExpertsCell.h"
#import "CTStarExpertsCellAdapter.h"
#import "CTStarExpertsModule.h"

@implementation CTStarExpertsCellAdapter

- (UITableViewCell<AKCell> *)dataViewController:(AKDataViewController *)dataViewController item:(CTStarExpertsModule *)module cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTStarExpertsCell *cell = [[CTStarExpertsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CTStarExpertsCell"];
    return cell;
}

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(CTStarExpertsModule *)module heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CTStarExpertsCell heightForItem:module fixedWidth:CGRectGetWidth(dataViewController.view.frame)];
}

- (void)dataViewController:(AKDataViewController *)dataViewController item:(id)item didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
