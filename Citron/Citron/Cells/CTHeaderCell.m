//
//  CTHeaderCell.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/NSString+AKDrawing.h>
#import "CTHeaderCell.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"

static CGFloat const kHeight = 32;
static CGFloat const kLeftPadding = 11;
static CGFloat const kHPadding = 7;

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
        _titleLabel.font = [UIFont ct_appFontWithSize:14];
        _titleLabel.textColor = [UIColor ct_textDarkBlueColor];
        [self.contentView addSubview:_titleLabel];

        _dismissButton = [UIButton new];
        UIImage *crossImage = [UIImage imageNamed:@"BlueDismissIcon"];
        [_dismissButton setImage:crossImage forState:UIControlStateNormal];
        [_dismissButton setImage:crossImage forState:UIControlStateSelected];
        [_dismissButton addTarget:self action:@selector(_dismissButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_dismissButton];
        _dismissButton.hidden = YES;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect iconImageViewFrame = _iconImageView.frame;
    iconImageViewFrame.origin = CGPointMake(kLeftPadding, 11);
    _iconImageView.frame = iconImageViewFrame;

    CGRect canvasBounds = self.contentView.bounds;
    _dismissButton.frame = CGRectMake(CGRectGetWidth(canvasBounds) - 10 - kLeftPadding, CGRectGetMinY(iconImageViewFrame), 10, 10);

    CGFloat titleLabelWidth = CGRectGetWidth(self.contentView.bounds) - CGRectGetMaxX(iconImageViewFrame) - kLeftPadding * 2;
    CGFloat titleLabelHeight = [_titleLabel.text ak_HeightWithFont:_titleLabel.font fixedWidth:titleLabelWidth];
    _titleLabel.frame = CGRectMake(CGRectGetMaxX(iconImageViewFrame) + kHPadding, (CGRectGetHeight(canvasBounds) - titleLabelHeight) / 2, titleLabelWidth, titleLabelHeight);
}

- (void)setDismissable:(BOOL)dismissable {
    if (_dismissable != dismissable) {
        _dismissable = dismissable;
        _dismissButton.hidden = !_dismissable;
    }
}

- (void)updateWithItem:(NSString *)title {
    _titleLabel.text = title;
}

+ (CGFloat)heightForItem:(id)item fixedWidth:(CGFloat)fixedWidth {
    return kHeight;
}

- (void)_dismissButtonTapped:(id)sender {
    UITableView *tableView = self.tableView;
    NSIndexPath *indexPath = [tableView indexPathForCell:self];
    [tableView.dataSource tableView:tableView commitEditingStyle:UITableViewCellEditingStyleDelete forRowAtIndexPath:indexPath];
}

@end
