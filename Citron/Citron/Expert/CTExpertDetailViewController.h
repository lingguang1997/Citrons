//
//  CTExpertDetailViewController.h
//  Citron
//
//  Created by Zijiao Liu on 2/27/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTExpert;
@class CTExpertSummaryView;
@class CTTopicsView;

@interface CTExpertDetailViewController : UIViewController

@property (nonatomic, nonnull) IBOutlet UIScrollView *scrollView;
@property (nonatomic, nonnull) IBOutlet UIView *scrollContentView;
@property (nonatomic, nonnull) IBOutlet CTExpertSummaryView *summaryView;
@property (nonatomic, nonnull) IBOutlet UIView *summaryViewSeperator;
@property (nonatomic, nonnull) IBOutlet CTTopicsView *topicsView;

- (nonnull instancetype)initWithExpert:(nonnull CTExpert *)expert;

@end
