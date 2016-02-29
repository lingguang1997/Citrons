//
//  CTExpertLinksView.m
//  Citron
//
//  Created by Zijiao Liu on 2/23/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTExpertLinksView.h"
#import "CTLink.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"

static CGFloat const kLinkeLabelHeight = 15;

@interface CTExpertLinksView ()

@property (nonatomic, nullable) NSMutableArray<UILabel *> *linkLabels;

@end

@implementation CTExpertLinksView

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat canvasWidth = CGRectGetWidth(self.bounds);
    __block CGFloat originY = 0;
    if (_linkLabels.count) {
        [_linkLabels enumerateObjectsUsingBlock:^(UILabel * _Nonnull linkLabel, NSUInteger idx, BOOL * _Nonnull stop) {
            linkLabel.frame = CGRectMake(0, originY, canvasWidth, kLinkeLabelHeight);
            originY = CGRectGetMaxY(linkLabel.frame);
        }];
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat width = CGRectGetWidth(self.bounds);
    if (width == 0) {
        assert(size.width == CGRectGetWidth(self.bounds));
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
    __block CGFloat height = 0;
    [_linkLabels enumerateObjectsUsingBlock:^(UILabel * _Nonnull linkLabel, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat maxY = CGRectGetMaxY(linkLabel.frame);
        if (height < maxY) {
            height = maxY;
        }
    }];
    return CGSizeMake(size.width, height);
}

- (void)setLinks:(NSArray<CTLink *> *)links {
    if (![_links isEqualToArray:links]) {
        [_linkLabels removeAllObjects];
        _links = links;
        [_links enumerateObjectsUsingBlock:^(CTLink * _Nonnull link, NSUInteger idx, BOOL * _Nonnull stop) {
            UILabel *linkLabel = [UILabel new];
            linkLabel.textAlignment = NSTextAlignmentCenter;
            linkLabel.textColor = [UIColor ct_lightBlueColor];
            linkLabel.font = [UIFont ct_appFontWithSize:12];
            if (link.linkeText.length) {
                linkLabel.text = link.linkeText;
            } else {
                linkLabel.text = link.urlString;
            }
            [_linkLabels addObject:linkLabel];
            [self addSubview:linkLabel];
        }];
    }
}

- (NSArray<UILabel *> *)linkLabels {
    if (!_linkLabels) {
        _linkLabels = [NSMutableArray arrayWithCapacity:_links.count];
    }
    return _linkLabels;
}

@end
