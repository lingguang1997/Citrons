//
//  CTTopicView1.m
//  Citron
//
//  Created by Zijiao Liu on 2/25/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/NSString+AKDrawing.h>
#import "CTPriceView.h"
#import "CTTopic.h"
#import "CTTopicView.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"
#import "UIView+InterfaceBuilder.h"

static CGFloat const kHPadding = 15;
static CGFloat const kTitleLabelTopPadding = 5;
static CGFloat const kDetailLabelTopPadding = 5;
static CGFloat const kSeperatorTopPadding = 3;
static CGFloat const kPriceViewTopPadding = 3;

static CGFloat const kTopicTitleLabelHeight = 30;
static CGFloat const kDurationLabelHeight = 20;

@implementation CTTopicView

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
    self.layer.cornerRadius = 5;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor ct_grayColor].CGColor;
    self.clipsToBounds = YES;

    _detailLabel.font = [[self class] _detailLabelFont];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat canvasWidth = CGRectGetWidth(self.bounds);
    CGFloat width = canvasWidth - kHPadding - kHPadding;
    _topicTitleLabel.frame = CGRectMake(kHPadding, kTitleLabelTopPadding, width, kTopicTitleLabelHeight);
    _detailLabel.frame = CGRectMake(kHPadding, CGRectGetMaxY(_topicTitleLabel.frame) + kDetailLabelTopPadding, width, [[self class] _detailLabelHeightWithDetail:_detailLabel.text fixedWidth:width]);
    _seperator.frame = CGRectMake(kHPadding, CGRectGetMaxY(_detailLabel.frame) + kSeperatorTopPadding, width, 1);
    CGRect frame = _priceView.frame;
    frame.origin = CGPointMake(kHPadding, CGRectGetMaxY(_seperator.frame) + kSeperatorTopPadding);
    _priceView.frame = frame;
    CGFloat durationLabelWidth = [_durationLabel.text ak_WidthWithFont:_durationLabel.font fixedHeight:kDurationLabelHeight];
    _durationLabel.frame = CGRectMake(canvasWidth - kHPadding - durationLabelWidth, CGRectGetMidY(_priceView.frame) - kDurationLabelHeight / 2, durationLabelWidth, kDurationLabelHeight);
}

+ (CGFloat)_detailLabelHeightWithDetail:(NSString *)detail fixedWidth:(CGFloat)fixedWidth {
    CGFloat height = [detail ak_HeightWithFont:[self _detailLabelFont] fixedWidth:fixedWidth];
    CGFloat maxHeight = 80;
    return (height < maxHeight) ? height : maxHeight;
}

+ (UIFont *)_detailLabelFont {
    return [UIFont ct_appFontWithSize:12];
}

- (void)updateWithTopic:(CTTopic *)topic {
    _topic = topic;
    _topicTitleLabel.text = topic.title;
    _detailLabel.text = topic.detail;
    _priceView.price = topic.price;
    [_priceView sizeToFit];
    _durationLabel.text = [NSString stringWithFormat:@"约%.1f小时", topic.duration];
}

+ (CGFloat)heightWithItem:(CTTopic *)topic canvasWidth:(CGFloat)canvasWidth {
    CGFloat height = kTitleLabelTopPadding + kTopicTitleLabelHeight;
    height += kDetailLabelTopPadding;
    height += [self _detailLabelHeightWithDetail:topic.detail fixedWidth:canvasWidth - kHPadding - kHPadding];
    height += (kSeperatorTopPadding + 1);
    height += (kPriceViewTopPadding + [CTPriceView height]);
    height += kTitleLabelTopPadding;
    return height;
}

@end
