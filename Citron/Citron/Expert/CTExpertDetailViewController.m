//
//  CTExpertDetailViewController.m
//  Citron
//
//  Created by Zijiao Liu on 2/27/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTTopicDetailViewController.h"
#import "CTExpert.h"
#import "CTExpertBioView.h"
#import "CTExpertDetailViewController.h"
#import "CTExpertLinksView.h"
#import "CTExpertSummaryView.h"
#import "CTTopicsView.h"
#import "UIView+InterfaceBuilder.h"

static CGFloat const seperatorHeight = 1;
static CGFloat const kHPadding = 15;
static CGFloat const kContactButtonHeight = 40;
static CGFloat const topicViewTopPadding = 10;
static CGFloat const topicViewBottomPadding = 10;
static CGFloat const bioViewTopPadding = 10;
static CGFloat const bioViewBottomPadding = 10;
static CGFloat const linksViewTopPadding = 10;
static CGFloat const linksViewBottomPadding = 10;

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
    self.tabBarController.tabBar.hidden = YES;
    [_summaryView updateWithExpert:_expert];
    [_topicsView updateWithExpert:_expert];
    [_bioView updateWithExpert:_expert];
    _linksView.links = _expert.links;

    [_contactButton addTarget:self action:@selector(_contactButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    CGFloat canvasWidth = CGRectGetWidth(self.view.frame);
    CGFloat seperatorWidth = canvasWidth - kHPadding - kHPadding;

    _summaryView.frame = CGRectMake(0, 0, canvasWidth, [CTExpertSummaryView heightWithItem:_expert canvasWidth:canvasWidth]);
    _summaryViewSeperator.frame = CGRectMake(kHPadding, CGRectGetMaxY(_summaryView.frame), seperatorWidth, seperatorHeight);

    _topicsView.frame = CGRectMake(0, CGRectGetMaxY(_summaryViewSeperator.frame) + topicViewTopPadding, canvasWidth, [CTTopicsView heightWithItem:_expert canvasWidth:canvasWidth]);
    _topicsViewSeperator.frame = CGRectMake(kHPadding, CGRectGetMaxY(_topicsView.frame) + topicViewBottomPadding, seperatorWidth, seperatorHeight);

    _bioView.frame = CGRectMake(0, CGRectGetMaxY(_topicsViewSeperator.frame) + bioViewTopPadding, canvasWidth, [CTExpertBioView heightWithItem:_expert canvasWidth:canvasWidth]);
    _bioSeperator.frame = CGRectMake(kHPadding, CGRectGetMaxY(_bioView.frame) + bioViewBottomPadding, seperatorWidth, 1);

    _linksView.frame = CGRectMake(0, CGRectGetMaxY(_bioSeperator.frame) + linksViewTopPadding, canvasWidth, [CTExpertLinksView heightWithItem:_expert canvasWidth:canvasWidth]);
    _linksViewSeperator.frame = CGRectMake(kHPadding, CGRectGetMaxY(_linksView.frame) + linksViewBottomPadding, seperatorWidth, 1);
    
    CGRect scrollViewFrame = self.view.bounds;
    scrollViewFrame.size.height -= kContactButtonHeight;
    _scrollView.frame = scrollViewFrame;
    _scrollContentView.frame = CGRectMake(0, 0, canvasWidth, CGRectGetMaxY(_linksView.frame));
    _scrollView.contentSize = _scrollContentView.frame.size;
    _contactButton.frame = CGRectMake(0, CGRectGetMaxY(_scrollView.frame), canvasWidth, kContactButtonHeight);
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

- (void)_contactButtonTapped:(UIButton *)button {
    UIView *darkView = [[UIView alloc] initWithFrame:self.view.bounds];
    darkView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:darkView];
    CGFloat nextButtonHeight = 40;
    UIButton *nextButton = [UIButton ct_loadFromNibWithName:@"CTBlueButton"];
    [nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(_nextButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    nextButton.frame = CGRectMake(0, CGRectGetHeight(darkView.frame) - nextButtonHeight, CGRectGetWidth(darkView.frame), nextButtonHeight);
    [darkView addSubview:nextButton];
    [darkView addSubview:_topicsView];
    [UIView animateWithDuration:.3 animations:^{
        CGRect topicsViewFrame = _topicsView.frame;
        topicsViewFrame.origin.y = 0;//(CGRectGetHeight(darkView.frame) - CGRectGetHeight(_topicsView.frame)) / 2;
        _topicsView.frame = topicsViewFrame;
    }];
}

- (void)_nextButtonTapped:(UIButton *)button {
    CTTopicDetailViewController *controller = [CTTopicDetailViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
