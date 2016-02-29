//
//  CTPriceView.m
//  Citron
//
//  Created by Zijiao Liu on 2/21/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/NSString+AKDrawing.h>
#import "CTPriceView.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"
#import "UIView+InterfaceBuilder.h"

static CGFloat const kHPadding = 5;

static CGFloat const kHeight = 30;

@interface CTPriceView ()

@end


@implementation CTPriceView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _commonInit];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _commonInit];
    }
    return self;
}

- (void)_commonInit {
    self.layer.cornerRadius = 5;
    self.layer.borderColor = [UIColor ct_lightBlueColor].CGColor;
    self.layer.borderWidth = 1;
    self.clipsToBounds = YES;
    _rmbSignImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BlueRMB"]];
    [self addSubview:_rmbSignImageView];
    _priceLabel = [UILabel new];
    _priceLabel.textAlignment = NSTextAlignmentCenter;
    _priceLabel.font = [UIFont ct_appFontWithSize:16];
    _priceLabel.textColor = [UIColor ct_lightBlueColor];
    [self addSubview:_priceLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat canvasHeight = CGRectGetHeight(self.bounds);
    CGRect rmbSignImageViewFrame = _rmbSignImageView.frame;
    rmbSignImageViewFrame.origin = CGPointMake(kHPadding, (canvasHeight - CGRectGetHeight(rmbSignImageViewFrame)) / 2);
    _rmbSignImageView.frame = rmbSignImageViewFrame;

    CGFloat width = [self _priceLabelWidthWithHeight:canvasHeight];
    _priceLabel.frame = CGRectMake(CGRectGetMaxX(_rmbSignImageView.frame) + kHPadding, 0, width, canvasHeight);
}

- (CGFloat)_priceLabelWidthWithHeight:(CGFloat)height {
    return CGRectGetWidth([_priceLabel.attributedText boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil]);
}

+ (CGFloat)height {
    return kHeight;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(kHPadding * 3 + CGRectGetWidth(_rmbSignImageView.frame) + [self _priceLabelWidthWithHeight:kHeight], kHeight);
}

- (void)setPrice:(NSUInteger)price {
    if (_price != price) {
        [self updateWithPrice:price];
    }
}

- (void)updateWithPrice:(NSUInteger)price {
    _price = price;
    NSString *priceString = [NSString stringWithFormat:@"%lu", (unsigned long)price];
    NSString *timesString = @"/次";
    NSString *string = [NSString stringWithFormat:@"%@%@", priceString, timesString];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString setAttributes:@{ NSForegroundColorAttributeName : [UIColor ct_lightBlueColor], NSFontAttributeName : [UIFont ct_appFontWithSize:16]  } range:[string rangeOfString:priceString]];
    [attributedString setAttributes:@{ NSForegroundColorAttributeName : [UIColor ct_lightBlueColor], NSFontAttributeName : [UIFont ct_appFontWithSize:12] } range:[string rangeOfString:timesString]];
    _priceLabel.attributedText = attributedString;
    [self setNeedsLayout];
}

@end
