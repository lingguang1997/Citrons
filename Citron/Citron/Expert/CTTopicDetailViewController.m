//
//  CTTopicDetailViewController.m
//  Citron
//
//  Created by Zijiao Liu on 3/6/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/NSString+AKDrawing.h>
#import "CTAppointmentViewController.h"
#import "CTPriceView.h"
#import "CTTopicDetailViewController.h"

static CGFloat const kHPadding = 15;
static CGFloat const titleLabelTopPadding = 20;
static CGFloat const titleLabelHeight = 20;
static CGFloat const descLabelTopPadding = 10;
static CGFloat const descLabelBottomPadding = 10;
static CGFloat const descLabelHeight = 400;
static CGFloat const seperatorHeight = 1;
static CGFloat const priceViewTopPadding = 10;
static CGFloat const kDurationLabelHeight = 20;
static CGFloat const kNextButtonHeight = 40;


@interface CTTopicDetailViewController ()

@end

@implementation CTTopicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    _priceView.price = 300;
    _durationLabel.text = @"约1小时";
    [_nextButton setTitle:@"针对此问题约专家" forState:UIControlStateNormal];
    [_nextButton addTarget:self action:@selector(_nextButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat canvasWidth = CGRectGetWidth(self.view.bounds);
    CGFloat width = canvasWidth - kHPadding - kHPadding;
    _titleLabel.frame = CGRectMake(kHPadding, titleLabelTopPadding, width, titleLabelHeight);
    _descLabel.frame = CGRectMake(kHPadding, CGRectGetMaxY(_titleLabel.frame) + descLabelTopPadding, width, descLabelHeight);
    _seperatorView.frame = CGRectMake(kHPadding, CGRectGetMaxY(_descLabel.frame) + descLabelBottomPadding, width, seperatorHeight);
    [_priceView sizeToFit];
    CGRect priceViewFrame = _priceView.frame;
    priceViewFrame.origin = CGPointMake(kHPadding, CGRectGetMaxY(_seperatorView.frame) + priceViewTopPadding);
    _priceView.frame = priceViewFrame;
    CGFloat durationLabelWidth = [_durationLabel.text ak_WidthWithFont:_durationLabel.font fixedHeight:kDurationLabelHeight];
    _durationLabel.frame = CGRectMake(canvasWidth - kHPadding - durationLabelWidth, CGRectGetMidY(_priceView.frame) - kDurationLabelHeight / 2, durationLabelWidth, kDurationLabelHeight);
    _nextButton.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds) - kNextButtonHeight, canvasWidth, kNextButtonHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_nextButtonTapped:(UIButton *)button {
    CTAppointmentViewController *controller = [CTAppointmentViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
