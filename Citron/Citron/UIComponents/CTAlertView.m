//
//  CTAlertView.m
//  Citron
//
//  Created by Zijiao Liu on 3/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/NSString+AKDrawing.h>
#import "CTAlertView.h"

static CGFloat const kAlertViewLeading = 50;
static CGFloat const kTopPadding = 10;
static CGFloat const kLeftPadding = 15;
static CGFloat const kButtonHeight = 30;

@implementation CTAlertView

- (void)setStyle:(CTAlertViewStyle)style {
    if (_style != style) {
        _style = style;
        switch (_style) {
            case CTAlertViewStyleComfirm:
                self.buttons = @[[self _confirmButton]];
                break;
            case CTAlertViewStyleConfirmAndCancel:
                self.buttons = @[[self _confirmButton], [self _cancelButton]];
                break;
            case CTAlertViewStyleCustom:
                break;
            default:
                assert(NO);
                break;
        }
        [self setNeedsLayout];
    }
}

- (void)setButtons:(NSArray<UIButton *> *)buttons {
    if (![_buttons isEqualToArray:buttons]) {
        _buttons = buttons;
        __weak CTAlertView *weakSelf = self;
        [_buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
            [weakSelf addSubview:button];
        }];
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat canvasWidth = CGRectGetWidth(self.frame);
    CGFloat width = canvasWidth - kLeftPadding - kLeftPadding;
    CGFloat originY = kTopPadding;
    if (_titleLabel.text.length) {
        CGFloat height = [_titleLabel.text ak_HeightWithFont:_titleLabel.font fixedWidth:width];
        _titleLabel.frame = CGRectMake(kLeftPadding, originY, width, height);
        originY = CGRectGetMaxY(_titleLabel.frame);
    }
    if (_detailLabel.text.length) {
        CGFloat height = [_detailLabel.text ak_HeightWithFont:_detailLabel.font fixedWidth:width];
        _detailLabel.frame = CGRectMake(kLeftPadding, originY + kTopPadding, width, height);
        originY += CGRectGetMaxY(_detailLabel.frame);
    }
    if (_buttons.count == 1) {
        UIButton *button = [_buttons firstObject];
        button.frame = CGRectMake(kLeftPadding, originY + kTopPadding, width, kButtonHeight);
    } else if (_buttons.count == 2) {
        UIButton *button1 = [_buttons firstObject];
        button1.frame = CGRectMake(kLeftPadding, originY + kTopPadding, width / 2, kButtonHeight);
        UIButton *button2 = [_buttons lastObject];
        CGRect frame = button1.frame;
        frame.origin.x = CGRectGetMaxX(button1.frame);
        button2.frame = frame;
    } else if (_buttons.count > 2) {
        __block CGFloat originY = 0;
        [_buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
            button.frame = CGRectMake(kLeftPadding, originY, width, kButtonHeight);
            originY = CGRectGetMaxY(button.frame) + 5;
        }];
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGRect frame = self.frame;
    frame.size.width = CGRectGetWidth([[UIScreen mainScreen] bounds]) - kAlertViewLeading - kAlertViewLeading;
    self.frame = frame;
    [self setNeedsLayout];
    [self layoutIfNeeded];
    frame = self.frame;
    frame.size.height = CGRectGetMaxY([_buttons lastObject].frame);
    frame.origin = CGPointMake(kAlertViewLeading, (CGRectGetHeight([[UIScreen mainScreen] bounds]) - CGRectGetHeight(frame)) / 2);
    self.frame = frame;
    return frame.size;
}

- (void)showOnView:(UIView *)view {
    assert(view);
    [self sizeToFit];
    CGRect frame = self.frame;
    frame.origin = CGPointMake(kAlertViewLeading, (CGRectGetHeight([[UIScreen mainScreen] bounds]) - CGRectGetHeight(self.frame)) / 2);
    self.frame = frame;
    [view addSubview:self];
    
}

# pragma mark - Private methods

- (UIButton *)_confirmButton {
    UIButton *button = [UIButton new];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_confirmButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)_confirmButtonTapped:(UIButton *)button {
    [self removeFromSuperview];
}

- (UIButton *)_cancelButton {
    UIButton *button = [UIButton new];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_cancelButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)_cancelButtonTapped:(UIButton *)button {
    [self removeFromSuperview];
}

@end
