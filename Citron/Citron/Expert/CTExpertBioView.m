//
//  CTExpertBioView.m
//  Citron
//
//  Created by Zijiao Liu on 2/23/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/NSString+AKDrawing.h>
#import "CTExpert.h"
#import "CTExpertBioView.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"

#define kBioLabelFont [UIFont ct_appFontWithSize:12]

static CGFloat const kOuterHPadding = 15;
static CGFloat const kHPadding = 8;
static CGFloat const kVPadding = 8;

static CGFloat const kTitleLabelBottomPadding = 4;

@interface CTExpertBioView ()

@property (nonatomic, nonnull) UIView *borderView;
@property (nonatomic, nonnull) UILabel *bioLabel;

@end

@implementation CTExpertBioView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _commonInit];
    }
    return self;
}

- (void)_commonInit {
    self.titleLabel.text = @"专家简介";
    _borderView = [UIView new];
    _borderView.layer.cornerRadius = 2;
    _borderView.layer.borderColor = [UIColor ct_grayColor].CGColor;
    _borderView.layer.borderWidth = 1;
    [self addSubview:_borderView];
    _bioLabel = [UILabel new];
    _bioLabel.textColor = [UIColor ct_grayColor];
    _bioLabel.font = kBioLabelFont;
    _bioLabel.numberOfLines = 0;
    _bioLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [_borderView addSubview:_bioLabel];
    self.titleLabel.backgroundColor = [UIColor purpleColor];
    _bioLabel.backgroundColor = [UIColor blueColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat canvasWidth = CGRectGetWidth(self.bounds);
    CGFloat borderViewWidth = canvasWidth - kOuterHPadding - kOuterHPadding;
    CGFloat borderViewOriginY = CGRectGetMaxY(self.titleLabel.frame) + kTitleLabelBottomPadding;
    _borderView.frame = CGRectMake(kOuterHPadding, CGRectGetMaxY(self.titleLabel.frame) + kTitleLabelBottomPadding, borderViewWidth, CGRectGetHeight(self.bounds) - borderViewOriginY - kTitleLabelBottomPadding);

    CGFloat bioLabelWidth = borderViewWidth - kHPadding - kHPadding;
    _bioLabel.frame = CGRectMake(kHPadding, kVPadding, bioLabelWidth, [_bioLabel.text ak_HeightWithFont:kBioLabelFont fixedWidth:bioLabelWidth]);
}

- (void)updateWithExpert:(CTExpert *)expert {
    _bioLabel.text = expert.bio;
    [self setNeedsLayout];
}

# pragma mark - AKDynamicHeightView

+ (CGFloat)heightWithItem:(CTExpert *)expert canvasWidth:(CGFloat)canvasWidth {
    if (expert.bio.length) {
        CGFloat width = canvasWidth - kOuterHPadding - kOuterHPadding;
        CGFloat height = [super heightWithItem:expert canvasWidth:canvasWidth];
        height += kTitleLabelBottomPadding;
        height += [expert.bio ak_HeightWithFont:kBioLabelFont fixedWidth:width];
        height += kTitleLabelBottomPadding;
        return height + kVPadding + kVPadding;
    }
    return 0;
}

@end
