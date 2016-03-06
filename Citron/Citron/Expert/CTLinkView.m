//
//  CTLinkView.m
//  Citron
//
//  Created by Zijiao Liu on 3/2/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <objc/runtime.h>
#import "CTLink.h"
#import "CTLinkView.h"

static CGFloat const kHeight = 44;

@implementation CTLinkView

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
    [_button addTarget:self action:@selector(_buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.backgroundColor = [UIColor orangeColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat canvasWidth = CGRectGetWidth(self.bounds);
    _button.frame = CGRectMake(0, 0, canvasWidth, kHeight);
}

- (void)updateWithLink:(CTLink *)link {
    [_button setTitle:link.linkText forState:UIControlStateNormal];
}

- (void)_buttonTapped:(UIButton *)button {
    NSLog(@"link button tapped");
}

# pragma mark - AKDynamicHeightView

+ (CGFloat)heightWithItem:(id)item canvasWidth:(CGFloat)canvasWidth {
    return kHeight;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

@end
