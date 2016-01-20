//
//  CTInstructionCellAdapter.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDataViewController.h>
#import "CTInstructionCell.h"
#import "CTInstructionCellAdapter.h"

@implementation CTInstructionCellAdapter

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item groupStyle:(AKTableViewCellGroupStyle)groupStyle seperatorEnabled:(BOOL)seperatorEnabled heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CTInstructionCell heightForItem:item groupStyle:groupStyle seperatorEnabled:seperatorEnabled fixedWidth:CGRectGetWidth(dataViewController.view.frame)];
}

- (AKTableViewCell *)dataViewController:(AKDataViewController *)dataViewController item:(id)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTInstructionCell *cell = [[CTInstructionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CTInstructionCell"];
    return cell;
}

@end
