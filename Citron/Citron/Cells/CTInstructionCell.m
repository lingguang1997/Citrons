//
//  CTInstructionCell.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTInstructionCell.h"

static CGFloat const kHPadding = 15;
static CGFloat const kVPadding = 10;
static CGFloat const kInstructionCellHeight = 61.5 + kVPadding + kVPadding;
static CGFloat const kSteps = 4;

@interface CTInstructionCell ()

@property (nonatomic) NSMutableArray *stepImageViews;
@property (nonatomic) NSMutableArray *seperatorImageViews;

@end

@implementation CTInstructionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _stepImageViews = [NSMutableArray arrayWithCapacity:kSteps];
        for (NSInteger i = 0; i < kSteps; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"InstructionStep%@", @(i + 1)]]];
            [_stepImageViews addObject:imageView];
            [self.contentView addSubview:imageView];
        }
        _seperatorImageViews = [NSMutableArray arrayWithCapacity:kSteps - 1];
        for (NSInteger i = 0; i < kSteps - 1; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"InstructionSeperator"]];
            [_seperatorImageViews addObject:imageView];
            [self.contentView addSubview:imageView];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = CGRectGetWidth(self.contentView.bounds);
    CGFloat stepImageViewWidth = CGRectGetWidth([_stepImageViews[0] frame]);
    CGFloat seperatorImageViewWidth = CGRectGetWidth([_seperatorImageViews[0] frame]);
    CGFloat paddingBtw = (width - kHPadding - kHPadding - kSteps * stepImageViewWidth - (kSteps - 1) * seperatorImageViewWidth) / 2 / (kSteps - 1);
    for (NSInteger i = 0; i < kSteps; i++) {
        UIImageView *imageView = _stepImageViews[i];
        CGRect frame = imageView.frame;
        if (i == 0) {
            frame.origin = CGPointMake(kHPadding, kVPadding);
        } else {
            CGFloat seperatorMaxX = CGRectGetMaxX([_seperatorImageViews[i - 1] frame]);
            frame.origin = CGPointMake(seperatorMaxX + paddingBtw, kVPadding);
        }
        imageView.frame = frame;
        if (i < kSteps - 1) {
            UIImageView *seperatorImageView = _seperatorImageViews[i];
            frame = seperatorImageView.frame;
            frame.origin = CGPointMake(CGRectGetMaxX(imageView.frame) + paddingBtw, (CGRectGetHeight(imageView.frame) - CGRectGetHeight(frame)) / 2 + kVPadding);
            seperatorImageView.frame = frame;
        }
    }
}

- (void)updateWithItem:(id)item {
    [self setNeedsLayout];
}

+ (CGFloat)heightForItem:(id)item fixedWidth:(CGFloat)fixedWidth {
    return kInstructionCellHeight;
}

@end
