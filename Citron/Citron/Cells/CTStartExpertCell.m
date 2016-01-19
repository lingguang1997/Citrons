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
static CGFloat const kNameLabelYOffset = 205;
static CGFloat const kLabelHeight = 30;
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

- (void)prepareForReuse {
    [_imageView cancelImageDownloadTask];
    _imageView.image = nil;
}

# pragma mark - AKCell

- (void)updateWithItem:(CTExpert *)expert {
    NSURL *profileImageURL = [NSURL URLWithString:expert.profileImageURL];
    if (profileImageURL) {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:profileImageURL];
        [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
        __weak UIImageView *weakImageView = self.imageView;
        [_imageView setImageWithURLRequest:request placeholderImage:[UIImage ct_profilePlaceHolder] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
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

    [self setNeedsLayout];
}

+ (CGFloat)heightForItem:(id)item fixedWidth:(CGFloat)fixedWidth {
    return kHeight;
}

@end
