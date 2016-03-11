//
//  CTProfileCoverCellAdapter.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/8.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <AppKit/AKDataViewController.h>
#import "CTProfileCoverCellAdapter.h"
#import "CTProfileCoverCell.h"

@implementation CTProfileCoverCellAdapter


- (UITableViewCell<AKCell> *)dataViewController:(AKDataViewController *)dataViewController item:(id)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTProfileCoverCell *cell = [[CTProfileCoverCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CTProfileCoverCell"];
    return cell;
}

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item groupStyle:(AKTableViewCellGroupStyle)groupStyle seperatorEnabled:(BOOL)seperatorEnabled heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [CTProfileCoverCell heightForItem:item fixedWidth:CGRectGetWidth(dataViewController.view.frame)];
}

@end
