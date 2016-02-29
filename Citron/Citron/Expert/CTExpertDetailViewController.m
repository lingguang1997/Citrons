//
//  CTExpertDetailViewController.m
//  Citron
//
//  Created by Zijiao Liu on 2/27/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTExpert.h"
#import "CTExpertBioView.h"
#import "CTExpertDetailViewController.h"
#import "CTExpertSummaryView.h"
#import "CTTopicsView.h"
#import "UIView+InterfaceBuilder.h"

static CGFloat const kHPadding = 15;

@interface CTExpertDetailViewController ()

@property (nonatomic, nonnull) CTExpert *expert;

@property (nonatomic, nonnull) NSArray *summaryViewHeightConstraint;
@property (nonatomic, nonnull) NSArray *summaryViewSeperatorLeadingConstraint;
@property (nonatomic, nonnull) NSArray *summaryViewSeperatorTrainlingConstraint;
@property (nonatomic, nonnull) NSArray *topicsViewHeightConstraint;

@end

@implementation CTExpertDetailViewController

- (instancetype)initWithExpert:(CTExpert *)expert {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _expert = expert;
        self.title = @"专家详情";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_summaryView updateWithExpert:_expert];
    [_topicsView updateWithExpert:_expert];
    [_bioView updateWithExpert:_expert];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    CGFloat canvasWidth = CGRectGetWidth(self.view.frame);
    _summaryView.frame = CGRectMake(0, 0, canvasWidth, [CTExpertSummaryView heightWithItem:_expert canvasWidth:canvasWidth]);

    _summaryViewSeperator.frame = CGRectMake(kHPadding, CGRectGetMaxY(_summaryView.frame), canvasWidth - kHPadding - kHPadding, 1);

    _topicsView.frame = CGRectMake(0, CGRectGetMaxY(_summaryViewSeperator.frame), canvasWidth, [CTTopicsView heightWithItem:_expert canvasWidth:canvasWidth]);
    _bioView.frame = CGRectMake(0, CGRectGetMaxY(_topicsView.frame), canvasWidth, [CTExpertBioView heightWithItem:_expert canvasWidth:canvasWidth]);
    _scrollView.frame = self.view.bounds;
    _scrollContentView.frame = CGRectMake(0, 0, canvasWidth, CGRectGetMaxY(_bioView.frame));
    _scrollView.contentSize = _scrollView.frame.size;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
