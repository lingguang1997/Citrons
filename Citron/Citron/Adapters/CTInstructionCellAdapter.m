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

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(id)item heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CTInstructionCell heightForItem:item fixedWidth:CGRectGetWidth(dataViewController.view.frame)];
}

- (UITableViewCell<AKCell> *)dataViewController:(AKDataViewController *)dataViewController item:(id)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTInstructionCell *cell = [[CTInstructionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CTInstructionCell"];
    return cell;
}

@end
