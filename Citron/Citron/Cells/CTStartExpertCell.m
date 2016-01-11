//
//  CTStartExpertCell.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>
#import "CTStartExpertCell.h"
#import "CTExpert.h"
#import "UIFont+CTFont.h"
#import "UIImage+CTImage.h"

static CGFloat const kHeight = 275.5;
static CGFloat const kLabelXOffset = 30;
static CGFloat const kNameLabelYOffset = 250;
static CGFloat const kLabelHeight = 10;
static CGFloat const kLabelVPadding = 5;

@implementation CTStartExpertCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [UIImageView new];
        [self.contentView addSubview:_imageView];

        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont ct_appFontWithSize:30];
        _nameLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_nameLabel];

        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont ct_appFontWithSize:24];
        _titleLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat canvasWidth = CGRectGetWidth(self.bounds);
    _imageView.frame = self.bounds;
    _nameLabel.frame = CGRectMake(kLabelXOffset, kNameLabelYOffset, canvasWidth - kLabelXOffset - kLabelXOffset, kLabelHeight);
    _titleLabel.frame = CGRectMake(kLabelXOffset, CGRectGetMaxY(_nameLabel.frame) + kLabelVPadding, CGRectGetWidth(_nameLabel.frame), kLabelHeight);
}

# pragma mark - AKCell

- (void)updateWithItem:(CTExpert *)expert {
    NSURL *profileImageURL = [NSURL URLWithString:expert.profileImageURL];
    assert(profileImageURL);
    [_imageView setImageWithURL:profileImageURL placeholderImage:[UIImage ct_profilePlaceHolder]];

    _nameLabel.text = expert.name;
    _titleLabel.text = expert.title;

    [self setNeedsLayout];
}

- (void)prepareForReuse {
    [_imageView cancelImageDownloadTask];
    _imageView.image = nil;
}

+ (CGFloat)heightForItem:(id)item fixedWidth:(CGFloat)fixedWidth {
    return kHeight;
}

@end
