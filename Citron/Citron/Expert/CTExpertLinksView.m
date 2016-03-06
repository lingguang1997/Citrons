//
//  CTExpertLinksView.m
//  Citron
//
//  Created by Zijiao Liu on 2/23/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTExpert.h"
#import "CTExpertLinksView.h"
#import "CTLink.h"
#import "CTLinkView.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"
#import "UIView+InterfaceBuilder.h"

static CGFloat const kHPadding = 15;
static CGFloat const kTitleLabelBottomPadding = 4;
static CGFloat const kVPadding = 8;

@interface CTExpertLinksView ()

@property (nonatomic, nullable) NSMutableArray<CTLinkView *> *linkViews;

@end

@implementation CTExpertLinksView

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
    self.titleLabel.text = @"专家链接";
    self.titleLabel.backgroundColor = [UIColor purpleColor];
    _borderView = [UIView new];
    _borderView.layer.cornerRadius = 2;
    _borderView.layer.borderColor = [UIColor ct_grayColor].CGColor;
    _borderView.layer.borderWidth = 1;
    _borderView.clipsToBounds = YES;
    _borderView.backgroundColor = [UIColor redColor];
    [self addSubview:_borderView];
}

- (void)setLinks:(NSArray<CTLink *> *)links {
    if (![_links isEqualToArray:links]) {
        [self.linkViews removeAllObjects];
        _links = links;
        [_links enumerateObjectsUsingBlock:^(CTLink * _Nonnull link, NSUInteger idx, BOOL * _Nonnull stop) {
            CTLinkView *linkView = [CTLinkView ct_loadFromNib];
            [linkView updateWithLink:link];
            [_linkViews addObject:linkView];
            [_borderView addSubview:linkView];
        }];
    }
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat canvasWidth = CGRectGetWidth(self.bounds);
    CGFloat width = canvasWidth - kHPadding - kHPadding;
    __block CGFloat originY = 0;
    [_linkViews enumerateObjectsUsingBlock:^(CTLinkView * _Nonnull linkView, NSUInteger idx, BOOL * _Nonnull stop) {
        linkView.frame = CGRectMake(0, originY, width, [CTLinkView heightWithItem:nil canvasWidth:0]);
        originY = CGRectGetMaxY(linkView.frame);
    }];
     _borderView.frame = CGRectMake(kHPadding, CGRectGetMaxY(self.titleLabel.frame) + kTitleLabelBottomPadding, width, originY);
}

- (NSMutableArray<CTLinkView *> *)linkViews {
    if (!_linkViews) {
        _linkViews = [NSMutableArray arrayWithCapacity:_links.count];
    }
    return _linkViews;
}

+ (CGFloat)heightWithItem:(CTExpert *)expert canvasWidth:(CGFloat)canvasWidth {
    CGFloat height = [super heightWithItem:expert canvasWidth:canvasWidth];
    return height + kTitleLabelBottomPadding + kVPadding + expert.links.count * [CTLinkView heightWithItem:nil canvasWidth:canvasWidth];
}

@end
