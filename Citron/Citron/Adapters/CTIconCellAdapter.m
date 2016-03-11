//
//  CTIconCellAdapter.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTIconCellAdapter.h"
#import "CTIconCell.h"

@implementation CTIconCellAdapter

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item groupStyle:(AKTableViewCellGroupStyle)groupStyle seperatorEnabled:(BOOL)seperatorEnabled heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55.0f;
}

- (UITableViewCell<AKCell> *)dataViewController:(AKDataViewController *)dataViewController item:(id)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTIconCell *cell = [[CTIconCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"IconCell"];
    return cell;
}

@end
