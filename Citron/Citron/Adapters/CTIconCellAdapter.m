//
//  CTIconCellAdapter.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTIconCellAdapter.h"
#import "CTIconCell.h"
#import "CTBlankCell.h"

static CGFloat const kIconCellHeight  = 55.0f;
static CGFloat const kIconCellGroupVerticalSpacing  = 5.0f;

@implementation CTIconCellAdapter

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(NSDictionary *)item groupStyle:(AKTableViewCellGroupStyle)groupStyle seperatorEnabled:(BOOL)seperatorEnabled heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([item isKindOfClass:[NSDictionary class]]) {
        if (item.count > 0) {
            return kIconCellHeight;
        }
    }
    return kIconCellGroupVerticalSpacing;
}

- (UITableViewCell<AKCell> *)dataViewController:(AKDataViewController *)dataViewController item:(NSDictionary *)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([item isKindOfClass:[NSDictionary class]]) {
        if (item.count > 0) {
            CTIconCell *cell = [[CTIconCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"IconCell"];
            return cell;
        }
    }
    
    CTBlankCell *blankCell = [[CTBlankCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BlankCell"];
    return blankCell;
}

@end
