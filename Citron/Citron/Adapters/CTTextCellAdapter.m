//
//  CTTextCellAdapter.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <AppKit/AKDataViewController.h>
#import "CTTextCellAdapter.h"
#import "CTTextCell.h"
@implementation CTTextCellAdapter

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item groupStyle:(AKTableViewCellGroupStyle)groupStyle seperatorEnabled:(BOOL)seperatorEnabled heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0f;
}

- (UITableViewCell<AKCell> *)dataViewController:(AKDataViewController *)dataViewController item:(id)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTTextCell *cell = [[CTTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TextCell"];
    return cell;
}

@end
