//
//  CTHeaderCellAdapter.m
//  Citron
//
//  Created by Zijiao Liu on 1/12/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDataViewController.h>
#import "CTHeaderCell.h"
#import "CTHeaderCellAdapter.h"

@implementation CTHeaderCellAdapter

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item groupStyle:(AKTableViewCellGroupStyle)groupStyle seperatorEnabled:(BOOL)seperatorEnabled heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CTHeaderCell heightForItem:item groupStyle:groupStyle seperatorEnabled:seperatorEnabled fixedWidth:CGRectGetWidth(dataViewController.view.frame)];
}

- (UITableViewCell<AKCell> *)dataViewController:(AKDataViewController *)dataViewController item:(id)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTHeaderCell *cell = [[CTHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CTInstructionHeaderCell"];
    return cell;
}

@end
