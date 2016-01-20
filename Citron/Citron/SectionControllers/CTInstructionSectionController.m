//
//  CTInstructionSectionController.m
//  Citron
//
//  Created by Zijiao Liu on 1/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTHeaderCell.h"
#import "CTHeaderCellAdapter.h"
#import "CTInstructionCellAdapter.h"
#import "CTInstructionModule.h"
#import "CTInstructionSectionController.h"

@implementation CTInstructionSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.grouped = YES;
        [self registerAdapter:[CTHeaderCellAdapter new] forItemClass:[NSString class]];
        [self registerAdapter:[CTInstructionCellAdapter new] forItemClass:[UIImage class]];
    }
    return self;
}

- (AKTableViewCell *)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTHeaderCell *cell = (CTHeaderCell *)[super dataViewController:dataViewController item:item cellForRowAtIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.dismissable = YES;
    }
    return cell;
}

@end
