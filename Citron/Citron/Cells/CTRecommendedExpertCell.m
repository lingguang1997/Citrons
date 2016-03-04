//
//  CTRecommendedExpertCell.m
//  Citron
//
//  Created by Zijiao Liu on 1/19/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>
#import <AppKit/NSString+AKDrawing.h>
#import "CTExpert.h"
#import "CTRecommendedExpertCell.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"
#import "UIImage+CTImage.h"

static CGFloat const kTopPadding = 15;
static CGFloat const kLeftPadding = 10;
static CGFloat const titleLeftPadding = 15;
static CGFloat const creditLabelTopPadding = 36;
static CGFloat const creditLabelLeftPadding = 3;
static CGFloat const creditLabelTopAdjustment = 3;
static CGFloat const textHeight = 20;
static CGFloat const creditLabelHeight = 16;
static CGFloat const creditImageViewDimension = 10;
static CGFloat const kProfileImageViewDimension = 45.5;
static CGFloat const kHeight = 108;

@implementation CTRecommendedExpertCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _profileImageView = [UIImageView new];
        _profileImageView.layer.cornerRadius = kProfileImageViewDimension / 2;
        _profileImageView.clipsToBounds = YES;
        [self.contentView addSubview:_profileImageView];

        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont ct_appFontWithSize:13];
        _nameLabel.textColor = [UIColor ct_lightBlueColor];
        [self.contentView addSubview:_nameLabel];

        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont ct_appFontWithSize:15];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.lineBreakMode = NSLineBreakByClipping;
        [self.contentView addSubview:_titleLabel];

        _schoolLabel = [UILabel new];
        _schoolLabel.font = [UIFont ct_appFontWithSize:12];
        _schoolLabel.textColor = [UIColor ct_grayColor];
        [self.contentView addSubview:_schoolLabel];

        _creditImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PhoneIcon"]];
        [self.contentView addSubview:_creditImageView];

        _creditLabel = [UILabel new];
        _creditLabel.font = [UIFont ct_appFontWithSize:8];
        _creditLabel.textColor = [UIColor ct_textDarkBlueColor];
        [self.contentView addSubview:_creditLabel];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    _profileImageView.frame = CGRectMake(kLeftPadding, kTopPadding, kProfileImageViewDimension, kProfileImageViewDimension);
    
    CGFloat nameLabelWidth = [_nameLabel.text ak_WidthWithFont:_nameLabel.font fixedHeight:textHeight];
    _nameLabel.frame = CGRectMake(0, CGRectGetMaxY(_profileImageView.frame), nameLabelWidth, textHeight);
    _nameLabel.center = CGPointMake(_profileImageView.center.x, CGRectGetMaxY(_profileImageView.frame) + CGRectGetHeight(_nameLabel.frame) / 2);

    CGFloat titleLabelWidth = [_titleLabel.text ak_WidthWithFont:_titleLabel.font fixedHeight:textHeight];
    _titleLabel.frame = CGRectMake(CGRectGetMaxX(_profileImageView.frame), 0, titleLabelWidth, textHeight);
    _titleLabel.center = CGPointMake(CGRectGetMaxX(_profileImageView.frame) + CGRectGetWidth(_titleLabel.frame) / 2 + titleLeftPadding, _profileImageView.center.y / 3 * 2);
    
    CGFloat schoolLabelWidth = [_schoolLabel.text ak_WidthWithFont:_schoolLabel.font fixedHeight:textHeight];
    _schoolLabel.frame = CGRectMake(_titleLabel.frame.origin.x, CGRectGetMaxY(_titleLabel.frame), schoolLabelWidth, textHeight);
    
    _creditImageView.frame = CGRectMake(_titleLabel.frame.origin.x, CGRectGetMaxY(_schoolLabel.frame) + creditLabelTopPadding, creditImageViewDimension, creditImageViewDimension);
    
    CGFloat creditLabelWidth = [_creditLabel.text ak_WidthWithFont:_creditLabel.font fixedHeight:creditLabelHeight];
    _creditLabel.frame = CGRectMake(_titleLabel.frame.origin.x + creditImageViewDimension + creditLabelLeftPadding, CGRectGetMaxY(_schoolLabel.frame) + creditLabelTopPadding - creditLabelTopAdjustment, creditLabelWidth, creditLabelHeight);
}

- (void)prepareForReuse {
    [_profileImageView cancelImageDownloadTask];
    _profileImageView.image = nil;
}

# pragma mark - AKCell

- (void)updateWithItem:(CTExpert *)expert {
    NSURL *profileImageURL = [NSURL URLWithString:expert.profileImageURL];
    assert(profileImageURL);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:profileImageURL];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    __weak typeof(self) weakSelf = self;
    [_profileImageView setImageWithURLRequest:request placeholderImage:[UIImage ct_profilePlaceHolder] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        typeof(self) strongSelf = weakSelf;
        if (strongSelf) {
            strongSelf.profileImageView.image = image;
        }
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];

    _nameLabel.text = expert.name;
    _titleLabel.text = expert.title;
    _schoolLabel.text = expert.school;

    _creditLabel.text = [NSString stringWithFormat:@"已为%lu人解决问题", expert.credits];
}

+ (CGFloat)heightForItem:(id)item fixedWidth:(CGFloat)fixedWidth {
    return kHeight;
}

@end
