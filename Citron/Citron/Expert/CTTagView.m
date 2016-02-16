//
//  CTTagView.m
//  Citron
//
//  Created by Zijiao Liu on 2/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/NSString+AKDrawing.h>
#import "CTTagView.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"

static CGFloat const kHPadding = 5;

@implementation CTTagView

- (instancetype)initWithTag:(NSString *)tag {
    self = [super init];
    if (self) {
        _label.text = tag;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:frame];
        _label.font = [UIFont ct_appFontWithSize:10];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor ct_grayColor];
        _label.lineBreakMode = NSLineBreakByClipping;
        [self addSubview:_label];
        self.layer.cornerRadius = 3;
        self.layer.borderColor = _label.textColor.CGColor;
        self.layer.borderWidth = 1;
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = [_label.text ak_WidthWithFont:_label.font fixedHeight:CGRectGetHeight(self.frame)];
    _label.frame = CGRectMake(kHPadding, 0, width, CGRectGetHeight(self.frame));
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
    [self setNeedsLayout];
    [self layoutIfNeeded];
    return CGSizeMake(kHPadding + kHPadding + CGRectGetWidth(_label.frame), size.height);
}

@end
