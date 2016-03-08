//
//  CTTopicDetailViewController.m
//  Citron
//
//  Created by Zijiao Liu on 3/6/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/NSString+AKDrawing.h>
#import "CTPriceView.h"
#import "CTTopicDetailViewController.h"

static CGFloat const kHPadding = 15;
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
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat canvasWidth = CGRectGetWidth(self.view.bounds);
    CGFloat width = canvasWidth - kHPadding - kHPadding;
    _titleLabel.frame = CGRectMake(kHPadding, 20, width, 20);
    _descLabel.frame = CGRectMake(kHPadding, CGRectGetMaxY(_titleLabel.frame) + 10, width, 400);
    _seperatorView.frame = CGRectMake(kHPadding, CGRectGetMaxY(_descLabel.frame) + 10, width, 1);
    [_priceView sizeToFit];
    CGRect priceViewFrame = _priceView.frame;
    priceViewFrame.origin = CGPointMake(kHPadding, CGRectGetMaxY(_seperatorView.frame) + 10);
    _priceView.frame = priceViewFrame;
    CGFloat durationLabelWidth = [_durationLabel.text ak_WidthWithFont:_durationLabel.font fixedHeight:kDurationLabelHeight];
    _durationLabel.frame = CGRectMake(canvasWidth - kHPadding - durationLabelWidth, CGRectGetMidY(_priceView.frame) - kDurationLabelHeight / 2, durationLabelWidth, kDurationLabelHeight);
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
