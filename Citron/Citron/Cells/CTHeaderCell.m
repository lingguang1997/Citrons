//
//  CTHeaderCell.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTHeaderCell.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"

static CGFloat const kHeight = 32;

@interface CTHeaderCell ()

@property (nonatomic, nonnull) UIImageView *iconImageView;
@property (nonatomic, nonnull) UILabel *titleLabel;
@property (nonatomic, nonnull) UIButton *dismissButton;

@end

@implementation CTHeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HeaderIcon"]];
        [self.contentView addSubview:_iconImageView];

        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont ct_appFontWithSize:28];
        _titleLabel.textColor = [UIColor ct_textBlueColor];
        [self.contentView addSubview:_titleLabel];

        _dismissButton = [UIButton new];
        [_dismissButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_dismissButton setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        [_dismissButton addTarget:self action:@selector(_dismissButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_dismissButton];
        _dismissButton.hidden = YES;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect iconImageViewFrame = _iconImageView.frame;
    iconImageViewFrame.origin = CGPointMake(22, 28);
    _iconImageView.frame = iconImageViewFrame;

    _dismissButton.frame = CGRectMake(661, 21, 10, 10);

    _titleLabel.frame = CGRectMake(43, 27, CGRectGetWidth(self.bounds) - 43 - 43, 63);
}

- (void)setDismissable:(BOOL)dismissable {
    if (_dismissable != dismissable) {
        _dismissable = dismissable;
        _dismissButton.hidden = !_dismissable;
    }
}

- (void)updateWithItem:(id)item {
    _titleLabel.text = @"专家服务流程";
}

+ (CGFloat)heightForItem:(id)item fixedWidth:(CGFloat)fixedWidth {
    return kHeight;
}

- (void)_dismissButtonTapped:(id)sender {
    
}

@end
