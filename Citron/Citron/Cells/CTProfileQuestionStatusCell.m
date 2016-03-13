//
//  CTProfileQuestionStatusCell.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTProfileQuestionStatusCell.h"
#import "UIFont+CTFont.h"

@interface CTProfileQuestionStatusCell ()
@property (nonatomic, nonnull) CTIconButton *requestingButton;
@property (nonatomic, nonnull) CTIconButton *ongoingButton;
@property (nonatomic, nonnull) CTIconButton *completedButton;
@end

@implementation CTProfileQuestionStatusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _requestingButton = [[CTIconButton alloc] initWithTitle:@"邀约中" icon:[UIImage imageNamed: @"RequestingIcon"]];
        [self addSubview:_requestingButton];
        _ongoingButton = [[CTIconButton alloc] initWithTitle:@"进行中" icon:[UIImage imageNamed: @"RequestOnGoingIcon"]];
        [self addSubview:_ongoingButton];
        _completedButton = [[CTIconButton alloc] initWithTitle:@"已完成" icon:[UIImage imageNamed: @"RequestCompletedIcon"]];
        [self addSubview:_completedButton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _requestingButton.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds) / 3, CGRectGetHeight(self.bounds));
    _ongoingButton.frame = CGRectMake(CGRectGetMaxX(_requestingButton.frame), 0, CGRectGetWidth(_requestingButton.frame), CGRectGetHeight(_requestingButton.frame));
    _completedButton.frame = CGRectMake(CGRectGetMaxX(_ongoingButton.frame), 0, CGRectGetWidth(_ongoingButton.frame), CGRectGetHeight(_requestingButton.frame));
}

- (void)updateWithCustomer:(CTCustomer *)customer{
    
}


@end


@interface CTIconButton ()
@property (nonatomic, nonnull) UILabel      *textLabel;
@property (nonatomic, nonnull) UIImageView  *iconView;
@property (nonatomic, nonnull) UILabel      *numberLabel;
@end

@implementation CTIconButton

static CGFloat const kCTIconButtonTopPadding    = 20;
static CGFloat const kCTIconButtonTextPadding   = 3;
static CGFloat const kCTIconButtonIconWidth     = 60;
static CGFloat const kCTIconButtonIconHeight    = kCTIconButtonIconWidth;

- (instancetype)initWithTitle:(NSString *)title icon:(UIImage *)icon{
    self = [super init];
    if (self) {
        _iconView = [[UIImageView alloc] initWithImage:icon];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_iconView];
        
        _textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.text = title;
        _textLabel.font = [UIFont ct_appFontWithSize:11];
        [self addSubview:_textLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _iconView.frame = CGRectMake(0, kCTIconButtonTopPadding, kCTIconButtonIconWidth, kCTIconButtonIconHeight);
    _iconView.center = CGPointMake(CGRectGetWidth(self.bounds) / 2, _iconView.center.y);
    
    [_textLabel sizeToFit];
    
    _textLabel.frame = CGRectMake(0, CGRectGetMaxY(_iconView.frame) + kCTIconButtonTextPadding, CGRectGetWidth(self.bounds), CGRectGetHeight(_textLabel.frame));
}

- (void)updateNumber:(NSInteger)number{
    
}

@end