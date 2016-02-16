//
//  CTExpertDetailViewController.m
//  Citron
//
//  Created by Zijiao Liu on 2/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTExpertDetailViewController.h"
#import "CTExpertSummaryView.h"

@interface CTExpertDetailViewController ()

@property (nonatomic, readonly, nonnull) CTExpert *expert;
@property (nonatomic, nonnull) UIScrollView *scrollView;

@end

@implementation CTExpertDetailViewController

- (instancetype)initWithExpert:(CTExpert *)expert {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"专家详情";
        _expert = expert;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_scrollView];

    CGFloat summaryViewHeight = [CTExpertSummaryView heightWithItem:_expert];
    CGFloat scrollViewContentHeight = summaryViewHeight;
    CGFloat scrollViewWidth = CGRectGetWidth(_scrollView.frame);
    _scrollView.contentSize = CGSizeMake(scrollViewWidth, scrollViewContentHeight);

    CTExpertSummaryView *summaryView = [[CTExpertSummaryView alloc] initWithFrame:CGRectMake(0, 0, scrollViewWidth, summaryViewHeight)];
    [summaryView updateWithExpert:_expert];
    [_scrollView addSubview:summaryView];
}

@end
