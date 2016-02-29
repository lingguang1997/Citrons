//
//  CTSectionView1.m
//  Citron
//
//  Created by Zijiao Liu on 2/25/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTSectionView.h"
#import "UIFont+CTFont.h"
#import "UIView+InterfaceBuilder.h"

static CGFloat const kHPadding = 15;
static CGFloat const kVPadding = 8;
static CGFloat const kHeight = 20;

@implementation CTSectionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _titleLabel.frame = CGRectMake(kHPadding, kVPadding, CGRectGetWidth(self.bounds) - kHPadding - kHPadding, kHeight);
}

- (void)commonInit {
    _titleLabel = [UILabel new];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont ct_appFontWithSize:15];
    [self addSubview:_titleLabel];
}

# pragma mark - AKDynamicHeightView

+ (CGFloat)heightWithItem:(id)item canvasWidth:(CGFloat)canvasWidth {
    return kVPadding + kHPadding;
}

@end
