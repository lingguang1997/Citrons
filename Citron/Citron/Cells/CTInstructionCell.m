//
//  CTInstructionCell.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTInstructionCell.h"

static CGFloat const kInstructionCellHeight = 63;

@implementation CTInstructionCell

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

- (void)updateWithItem:(id)item {
    self.imageView.image = [UIImage imageNamed:@"instruction"];
    [self setNeedsLayout];
}

+ (CGFloat)heightForItem:(id)item fixedWidth:(CGFloat)fixedWidth {
    return kInstructionCellHeight;
}

@end
