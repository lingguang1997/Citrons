//
//  CTCategoryCellAdapter.m
//  Citron
//
//  Created by Zijiao Liu on 1/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDataViewController.h>
#import "CTCategoryCell.h"
#import "CTCategoryCellAdapter.h"

@implementation CTCategoryCellAdapter

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(NSString *)category heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CTCategoryCell heightForItem:category fixedWidth:CGRectGetWidth(dataViewController.view.frame)];
}

- (AKTableViewCell *)dataViewController:(AKDataViewController *)dataViewController item:(id)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTCategoryCell *cell = [[CTCategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CTCategoryCell"];
    return cell;
}

- (void)dataViewController:(AKDataViewController *)dataViewController item:(id)item didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Goto Category tab
}

@end
