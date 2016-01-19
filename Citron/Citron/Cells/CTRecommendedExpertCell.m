//
//  CTRecommendedExpertCell.m
//  Citron
//
//  Created by Zijiao Liu on 1/19/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>
#import "CTExpert.h"
#import "CTRecommendedExpertCell.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"
#import "UIImage+CTImage.h"

@implementation CTRecommendedExpertCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _profileImageView = [UIImageView new];
        [self.contentView addSubview:_profileImageView];

        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont ct_appFontWithSize:26];
        _nameLabel.textColor = [UIColor ct_lightBlueColor];
        [self.contentView addSubview:_nameLabel];

        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont ct_appFontWithSize:30];
        _titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLabel];

        _schoolLabel = [UILabel new];
        _schoolLabel.font = [UIFont ct_appFontWithSize:24];
        _schoolLabel.textColor = [UIColor ct_grayColor];
        [self.contentView addSubview:_schoolLabel];

        _creditImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PhoneIcon"]];
        [self.contentView addSubview:_creditImageView];

        _creditLabel = [UILabel new];
        _creditLabel.font = [UIFont ct_appFontWithSize:16];
        _creditLabel.textColor = [UIColor ct_textDarkBlueColor];
        [self.contentView addSubview:_creditLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
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
    return 50;
}

@end
