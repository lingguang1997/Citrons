//
//  CTExpertSummaryView.m
//  Citron
//
//  Created by Zijiao Liu on 2/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>
#import "CTExpert.h"
#import "CTExpertSummaryView.h"
#import "CTTagView.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"
#import "UIImage+CTImage.h"

static CGFloat const kHPadding = 15;
static CGFloat const kProfileImageViewDimension = 70;
static CGFloat const kProfileImageViewTopPadding = 14;
static CGFloat const kBarHeight = 20;
static CGFloat const kNameLabelTopPadding = 5;
static CGFloat const kPaddingBtw = 0;

@interface CTExpertSummaryView ()

@property (nonatomic, nonnull) UIImageView *profileImageView;
@property (nonatomic, nonnull) UILabel *nameLabel;
@property (nonatomic, nonnull) UILabel *titleLabel;
@property (nonatomic, nonnull) UILabel *educationBackgroundLabel;
@property (nonatomic, nonnull) NSMutableArray<CTTagView *> *tagLabels;

@property (nonatomic, nonnull) UIScrollView *tagScrollView;

@end

@implementation CTExpertSummaryView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kProfileImageViewDimension, kProfileImageViewDimension)];
        _profileImageView.layer.cornerRadius = kProfileImageViewDimension / 2;
        _profileImageView.clipsToBounds = YES;
        [self addSubview:_profileImageView];

        _nameLabel = [UILabel new];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont ct_appFontWithSize:13];
        [self addSubview:_nameLabel];

        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont ct_appFontWithSize:13];
        [self addSubview:_titleLabel];

        _educationBackgroundLabel = [UILabel new];
        _educationBackgroundLabel.textAlignment = NSTextAlignmentCenter;
        _educationBackgroundLabel.textColor = [UIColor ct_grayColor];
        _educationBackgroundLabel.font = [UIFont ct_appFontWithSize:10];
        [self addSubview:_educationBackgroundLabel];

        _tagScrollView = [UIScrollView new];
        _tagScrollView.layer.cornerRadius = 3;
        _tagScrollView.clipsToBounds = YES;
        [self addSubview:_tagScrollView];

//        _nameLabel.backgroundColor = [UIColor blueColor];
//        _titleLabel.backgroundColor = [UIColor yellowColor];
//        _educationBackgroundLabel.backgroundColor = [UIColor greenColor];
//        _profileImageView.backgroundColor = [UIColor brownColor];

        self.backgroundColor = [UIColor colorWithRed:27 / 255.0 green:60 / 255.0 blue:79 / 255.0 alpha:1];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat canvasWidth = CGRectGetWidth(self.bounds);
    CGRect profileImageViewFrame = _profileImageView.frame;
    profileImageViewFrame.origin = CGPointMake((canvasWidth - CGRectGetWidth(profileImageViewFrame)) / 2, kProfileImageViewTopPadding);
    _profileImageView.frame = profileImageViewFrame;

    _nameLabel.frame = CGRectMake(kHPadding, CGRectGetMaxY(_profileImageView.frame) + kNameLabelTopPadding, canvasWidth - kHPadding - kHPadding, kBarHeight);

    CGFloat originY = CGRectGetMaxY(_nameLabel.frame);
    if (_titleLabel.text.length) {
        _titleLabel.frame = CGRectMake(kHPadding, originY + kPaddingBtw, canvasWidth - kHPadding - kHPadding, kBarHeight);
        originY = CGRectGetMaxY(_titleLabel.frame);
    }

    if (_educationBackgroundLabel.text.length) {
        _educationBackgroundLabel.frame = CGRectMake(kHPadding, originY + kPaddingBtw, canvasWidth - kHPadding - kHPadding, kBarHeight);
        originY = CGRectGetMaxY(_educationBackgroundLabel.frame);
    }

    if (_tagLabels.count) {
        [_tagLabels enumerateObjectsUsingBlock:^(CTTagView * _Nonnull tagView, NSUInteger idx, BOOL * _Nonnull stop) {
            CGRect frame = tagView.frame;
            frame.size.height = kBarHeight;
            tagView.frame = frame;
            [tagView sizeToFit];
            frame = tagView.frame;
            if (idx == 0) {
                frame.origin = CGPointMake(0, 0);
            } else {
                frame.origin = CGPointMake(CGRectGetMaxX(_tagLabels[idx - 1].frame) + 5, 0);
            }
            tagView.frame = frame;
        }];
        _tagScrollView.contentSize = CGSizeMake(CGRectGetMaxX([_tagLabels.lastObject frame]), kBarHeight);
        CGFloat tagScrollViewWidth = canvasWidth - kHPadding - kHPadding;
        if (_tagScrollView.contentSize.width < tagScrollViewWidth) {
            tagScrollViewWidth = _tagScrollView.contentSize.width;
        }
        _tagScrollView.frame = CGRectMake((canvasWidth - tagScrollViewWidth) / 2, originY + kPaddingBtw, tagScrollViewWidth, kBarHeight);
    }
}

# pragma mark - AKDynamicHeightView

+ (CGFloat)heightWithItem:(CTExpert *)expert {
    CGFloat height = kProfileImageViewTopPadding * 2 + kProfileImageViewDimension + kNameLabelTopPadding + kBarHeight;
    if (expert.title.length) {
        height += kPaddingBtw;
        height += kBarHeight;
    }
    if (expert.school.length + expert.degree.length) {
        height += kPaddingBtw;
        height += kBarHeight;
    }
    if (expert.tags.count) {
        height += kPaddingBtw;
        height += kBarHeight;
    }
    return height;
}

- (void)updateWithExpert:(CTExpert *)expert {
    NSURL *profileImageURL = [NSURL URLWithString:expert.profileImageURL];
    if (profileImageURL) {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:profileImageURL];
        [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
        __weak UIImageView *weakImageView = _profileImageView;
        [_profileImageView setImageWithURLRequest:request placeholderImage:[UIImage ct_profilePlaceHolder] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
            if (weakImageView) {
                UIImageView *strongImageView = weakImageView;
                [UIView transitionWithView:strongImageView duration:.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    strongImageView.image = image;
                } completion:^(BOOL finished) {
                }];
            }
        } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
            NSLog(@"%@", error);
        }];
    }

    _nameLabel.text = expert.name;
    _titleLabel.text = expert.title;
    _educationBackgroundLabel.text = [NSString stringWithFormat:@"%@ %@", expert.school, expert.degree];
    _tagLabels = [NSMutableArray arrayWithCapacity:expert.tags.count];
    [expert.tags enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CTTagView *tagView = [CTTagView new];
//        tagView.backgroundColor = [UIColor brownColor];
        tagView.label.text = obj;
        [_tagLabels addObject:tagView];
        [_tagScrollView addSubview:tagView];
    }];
}

@end
