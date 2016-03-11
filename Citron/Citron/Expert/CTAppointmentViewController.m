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
static CGFloat const kTextViewBtwPadding = 5;

@interface CTAppointmentViewController () <UIScrollViewDelegate>

@end

@implementation CTAppointmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _scrollView.delegate = self;
    self.view.backgroundColor = [UIColor greenColor];
    _priceView.price = 250;
    _titleLabel.text = @"如何将大数据运用到企业当中去？如何将大数据运用到企业当中去？";
    _stepBar.steps = 2;
    [_nextButton addTarget:self action:@selector(_nextButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
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
    _scrollView.frame = CGRectMake(kHPadding, CGRectGetMaxY(_stepBar.frame) + 10, width, 350);
    _questionTextView.frame = CGRectMake(0, 0, width - 10, CGRectGetHeight(_scrollView.frame));
    _selfIntroView.frame = CGRectMake(CGRectGetMaxX(_questionTextView.frame) + kTextViewBtwPadding, 0, CGRectGetWidth(_questionTextView.frame), CGRectGetHeight(_questionTextView.frame));
    _scrollView.contentSize = CGSizeMake(CGRectGetMaxX(_selfIntroView.frame), CGRectGetHeight(_scrollView.frame));
    _nextButton.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds) - kNextButtonHeight, canvasWidth, kNextButtonHeight);
    _scrollView.backgroundColor = [UIColor purpleColor];
    _questionTextView.backgroundColor = [UIColor brownColor];
    _selfIntroView.backgroundColor = [UIColor orangeColor];
}

# pragma mark - UIScrollViewDelegate

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (velocity.x < 0) {
        [self _scrollToPreviousStep];
    } else if (velocity.x > 0 &&  _nextButton.enabled){
        [self _scrollToNextStep];
    }
}

- (void)_scrollToPreviousStep {
    [_stepBar previousStep];
    _nextButton.enabled = YES;
    [self _updateNextButtonTitle];
}

- (void)_scrollToNextStep {
    if (_scrollView.contentOffset.x < _scrollView.contentSize.width - CGRectGetWidth(_scrollView.frame)) {
        [_stepBar nextStep];
        [self _updateNextButtonTitle];
    }
}

- (void)_updateNextButtonTitle {
    if (_stepBar.currentStep == _stepBar.steps - 1) {
        [_nextButton setTitle:@"提交" forState:UIControlStateNormal];
    } else {
        [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    }
}

- (void)_nextButtonTapped:(UIButton *)button {
    if (_stepBar.currentStep == _stepBar.steps - 1) {
        // submite
    } else {
        [_scrollView setContentOffset:CGPointMake(CGRectGetMinX(_selfIntroView.frame), 0) animated:YES];
        [self _scrollToNextStep];
    }
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
