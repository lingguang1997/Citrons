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
static CGFloat const kHPaddingBtwTags = 5;
static CGFloat const kVPaddingBtwTagLines = 2;

@interface CTExpertSummaryView ()

@property (nonatomic, nonnull) UIImageView *profileImageView;
@property (nonatomic, nonnull) UILabel *nameLabel;
@property (nonatomic, nonnull) UILabel *titleLabel;
@property (nonatomic, nonnull) UILabel *educationBackgroundLabel;
@property (nonatomic, nonnull) NSMutableArray<CTTagView *> *tagLabels;

@property (nonatomic, nonnull) UIScrollView *tagScrollView;

@end

@implementation CTExpertSummaryView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _commonInit];
    }
    return self;
}

- (void)_commonInit {
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

    self.backgroundColor = [UIColor colorWithRed:27 / 255.0 green:60 / 255.0 blue:79 / 255.0 alpha:1];
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
        // 1. get length of each labels
        __block NSMutableArray *tags = [NSMutableArray arrayWithCapacity:_tagLabels.count];
        [_tagLabels enumerateObjectsUsingBlock:^(CTTagView * _Nonnull tagView, NSUInteger idx, BOOL * _Nonnull stop) {
            [tags addObject:tagView.label.text];
        }];
        NSArray *sizes = [[self class] _getSizesOfallTags:tags];
        // 2. find indexes of the first and last items each line
        NSArray *firstAndLastItemIndexes = [[self class] _getFirstAndLastItemIndexesOfEachLineOfTags:sizes canvasWidth:canvasWidth];
        // 3. loop btw first and last indexes each line, adjust the frames
        for (NSInteger i = 0; i < firstAndLastItemIndexes.count; i += 2) {
            NSInteger startIndex = [firstAndLastItemIndexes[i] integerValue];
            NSInteger endIndex = [firstAndLastItemIndexes[i + 1] integerValue];
            CGFloat lengthOfLine = kHPaddingBtwTags * (endIndex - startIndex);
            for (NSInteger j = startIndex; j <= endIndex; j++) {
                lengthOfLine += CGRectGetWidth(_tagLabels[j].frame);
            }
            CGFloat hPadding = (canvasWidth - lengthOfLine) / 2;
            NSInteger lineNumber = i / 2;
            CGFloat originY = (kBarHeight + kVPaddingBtwTagLines) * lineNumber + CGRectGetMaxY(_educationBackgroundLabel.frame);
            for (NSInteger j = startIndex; j <= endIndex; j++) {
                CGRect frame = _tagLabels[j].frame;
                if (j == startIndex) {
                    frame.origin = CGPointMake(hPadding, originY);
                } else {
                    frame.origin = CGPointMake(CGRectGetMaxX(_tagLabels[j - 1].frame) + kHPaddingBtwTags, originY);
                }
                frame.size = [sizes[j] CGSizeValue];
                _tagLabels[j].frame = frame;
            }
        }
    }
}

# pragma mark - Private methods

+ (NSArray *)_getSizesOfallTags:(NSArray *)tags {
    // 1. get length of each label
    __block NSMutableArray *lengths = [NSMutableArray arrayWithCapacity:tags.count];
    [tags enumerateObjectsUsingBlock:^(NSString * _Nonnull tag, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat width = [CTTagView widthWithText:tag height:kBarHeight];
        [lengths addObject:[NSValue valueWithCGSize:CGSizeMake(width, kBarHeight)]];
    }];
    return lengths;
}

+ (NSArray *)_getFirstAndLastItemIndexesOfEachLineOfTags:(NSArray *)sizes canvasWidth:(CGFloat)canvasWidth {
    // 2. find indexes of the first and last items each line
    __block NSMutableArray *firstAndLastItemIndexes = [NSMutableArray arrayWithCapacity:sizes.count + sizes.count];
    __block CGFloat potentialLengthOfEachLine = 0;
    CGFloat const maxLengthOfEachLine = canvasWidth - kHPadding - kHPadding;
    [sizes enumerateObjectsUsingBlock:^(NSValue * _Nonnull size, NSUInteger idx, BOOL * _Nonnull stop) {
        if (potentialLengthOfEachLine > 0) {
            potentialLengthOfEachLine += kHPaddingBtwTags;
        } else {
            [firstAndLastItemIndexes addObject:@(idx)];
        }
        potentialLengthOfEachLine += ([sizes[idx] CGSizeValue].width);
        if (idx > 0) {
            if (potentialLengthOfEachLine > maxLengthOfEachLine) {
                potentialLengthOfEachLine = 0;
                [firstAndLastItemIndexes addObject:@(idx - 1)];
            }
        }
    }];
    if (firstAndLastItemIndexes.count % 2 != 0) {
        [firstAndLastItemIndexes addObject:@(sizes.count - 1)];
    } else if ([firstAndLastItemIndexes.lastObject integerValue] < sizes.count - 1) {
        [firstAndLastItemIndexes addObject:@(sizes.count - 1)];
        [firstAndLastItemIndexes addObject:@(sizes.count - 1)];
    }
    return firstAndLastItemIndexes;
}

# pragma mark - AKDynamicHeightView

+ (CGFloat)heightWithItem:(CTExpert *)expert canvasWidth:(CGFloat)canvasWidth {
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
        NSArray *sizes = [self _getSizesOfallTags:expert.tags];
        NSArray *firstAndLastItemIndexesOfEachLineOfTags = [self _getFirstAndLastItemIndexesOfEachLineOfTags:sizes canvasWidth:canvasWidth];
        NSInteger lineNumber = firstAndLastItemIndexesOfEachLineOfTags.count / 2;
        height += (kBarHeight * lineNumber);
        height += (kVPaddingBtwTagLines * (lineNumber - 1));
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
        tagView.label.text = obj;
        [_tagLabels addObject:tagView];
        [self addSubview:tagView];
    }];
    [self setNeedsLayout];
}

@end
