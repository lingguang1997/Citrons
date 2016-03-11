//
//  CTTopicsView.m
//  Citron
//
//  Created by Zijiao Liu on 2/26/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTExpert.h"
#import "CTTopicView.h"
#import "CTTopicsView.h"
#import "UIView+InterfaceBuilder.h"

static CGFloat const kHPadding = 15;
static CGFloat const kTitleLabelBottomPadding = 4;
static CGFloat const kVPaddingBtw = 5;

@interface CTTopicsView ()

@property (nonatomic, nonnull) NSMutableArray<CTTopicView *> *topicViews;

@end

@implementation CTTopicsView

- (void)commonInit {
    [super commonInit];
    self.titleLabel.text = @"专家话题";
    UIGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectATopic:)];
    [self addGestureRecognizer:gr];
}

- (void)updateWithExpert:(CTExpert *)expert {
    if (!_topicViews) {
        _topicViews = [NSMutableArray arrayWithCapacity:expert.topics.count];
    } else {
        [_topicViews removeAllObjects];
    }
    [expert.topics enumerateObjectsUsingBlock:^(CTTopic * _Nonnull topic, NSUInteger idx, BOOL * _Nonnull stop) {
        CTTopicView *topicView = [CTTopicView ct_loadFromNib];
        [topicView updateWithTopic:topic];
        [_topicViews addObject:topicView];
        [self addSubview:topicView];
    }];
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat canvasWidth = CGRectGetWidth(self.bounds);
    __block CGFloat originY = 0;
    [_topicViews enumerateObjectsUsingBlock:^(CTTopicView * _Nonnull topicView, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            originY = CGRectGetMaxY(self.titleLabel.frame)+ kTitleLabelBottomPadding;
        } else {
            originY += kVPaddingBtw;
        }
        topicView.frame = CGRectMake(kHPadding, originY, canvasWidth - kHPadding - kHPadding, [CTTopicView heightWithItem:topicView.topic canvasWidth:canvasWidth]);
        originY += CGRectGetHeight(topicView.frame);
    }];
}

- (void)selectATopic:(UITapGestureRecognizer *)tapRecognizer {
    CGPoint touchPoint = [tapRecognizer locationInView: self];
    [_topicViews enumerateObjectsUsingBlock:^(CTTopicView * _Nonnull topicView, NSUInteger idx, BOOL * _Nonnull stop) {
        topicView.selected = CGRectContainsPoint(topicView.frame, touchPoint);
    }];

}

# pragma mark - AKDynamicHeightView

+ (CGFloat)heightWithItem:(CTExpert *)expert canvasWidth:(CGFloat)canvasWidth {
    if (expert.topics.count) {
        __block CGFloat height = [super heightWithItem:expert canvasWidth:canvasWidth];
        height += kTitleLabelBottomPadding;
        [expert.topics enumerateObjectsUsingBlock:^(CTTopic * _Nonnull topic, NSUInteger idx, BOOL * _Nonnull stop) {
            height += [CTTopicView heightWithItem:topic canvasWidth:canvasWidth];
        }];
        height += (kVPaddingBtw * (expert.topics.count));
        height += 8;
        return height;
    }
    return 0;
}

@end
