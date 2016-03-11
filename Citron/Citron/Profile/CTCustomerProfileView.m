//
//  CTProfileCoverView.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/9.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>
#import "CTCustomerProfileView.h"
#import "UIFont+CTFont.h"
#import "UIImage+CTImage.h"
#import "CTCustomer.h"

static CGFloat const kHPadding = 15;
static CGFloat const kProfileImageViewDimension = 70;
static CGFloat const kProfileImageViewTopPadding = 14;
static CGFloat const kBarHeight = 20;
static CGFloat const kNameLabelTopPadding = 5;
static CGFloat const kPaddingBtw = 0;

@interface CTCustomerProfileView ()
@property (nonatomic, nonnull) UIImageView *profileImageView;
@property (nonatomic, nonnull) UILabel *nameLabel;
@property (nonatomic, nonnull) UILabel *titleLabel;
@property (nonatomic, nonnull) UIImageView *backgroundView;

@end

@implementation CTCustomerProfileView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
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
    
    _backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ProfileCoverBackground"]];
    _backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_backgroundView];
    [self sendSubviewToBack:_backgroundView];
}

- (void)layoutSubviews{
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
    
    _backgroundView.frame = self.bounds;
}

- (void)updateWithCustomer:(CTCustomer *)customer{
    NSURL *profileImageURL = [NSURL URLWithString:customer.profileImageURL];
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
    
    _nameLabel.text = customer.name;
    _titleLabel.text = customer.title;
    
    [self setNeedsLayout];
}

# pragma mark - AKDynamicHeightView

+ (CGFloat)heightWithItem:(CTCustomer *)customer canvasWidth:(CGFloat)canvasWidth {
    CGFloat height = kProfileImageViewTopPadding * 2 + kProfileImageViewDimension + kNameLabelTopPadding + kBarHeight;
    if (customer.title.length) {
        height += kPaddingBtw;
        height += kBarHeight;
    }
    
    return height;
}

@end
