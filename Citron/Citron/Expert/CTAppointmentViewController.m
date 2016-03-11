//
//  CTAppointmentViewController.m
//  Citron
//
//  Created by Zijiao Liu on 3/10/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/NSString+AKDrawing.h>
#import <AppKit/AKStepBar.h>
#import "CTAppointmentViewController.h"
#import "CTPriceView.h"

static CGFloat const kHPadding = 15;
static CGFloat const kSeperatorTopPadding = 10;
static CGFloat const kStepBarHeight = 5;
static CGFloat const kNextButtonHeight = 40;

@interface CTAppointmentViewController ()

@end

@implementation CTAppointmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    _priceView.price = 250;
    _titleLabel.text = @"如何将大数据运用到企业当中去？如何将大数据运用到企业当中去？";
    _stepBar.steps = 2;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat canvasWidth = CGRectGetWidth(self.view.bounds);
    CGFloat width = canvasWidth - kHPadding - kHPadding;
    CGFloat titleLabelHeight = [_titleLabel.text ak_HeightWithFont:_titleLabel.font fixedWidth:width];
    _titleLabel.frame = CGRectMake(kHPadding, kHPadding, width, titleLabelHeight);
    _seperatorView.frame = CGRectMake(kHPadding, CGRectGetMaxY(_titleLabel.frame) + kSeperatorTopPadding, width, 1);
    [_priceView sizeToFit];
    CGRect priceViewFrame = _priceView.frame;
    priceViewFrame.origin = CGPointMake(kHPadding, CGRectGetMaxY(_seperatorView.frame) + 10);
    _priceView.frame = priceViewFrame;
    _stepBar.frame = CGRectMake(kHPadding, CGRectGetMaxY(_priceView.frame) + 10, width, kStepBarHeight);
    _textView.frame = CGRectMake(kHPadding, CGRectGetMaxY(_stepBar.frame) + 10, width, 350);
    _nextButton.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds) - kNextButtonHeight, canvasWidth, kNextButtonHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
