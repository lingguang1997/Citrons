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

#define kTagFont [UIFont ct_appFontWithSize:10]

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
        _label.font = kTagFont;
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
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat width = [[self class] widthWithText:_label.text height:height];
    _label.frame = CGRectMake(0, 0, width, height);
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake([[self class] widthWithText:_label.text height:size.height], size.height);
}

+ (CGFloat)widthWithText:(NSString *)text height:(CGFloat)height {
    return [text ak_WidthWithFont:kTagFont fixedHeight:height] + kHPadding + kHPadding;
}

@end
