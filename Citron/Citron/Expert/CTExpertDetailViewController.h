//
//  CTExpertDetailViewController.h
//  Citron
//
//  Created by Zijiao Liu on 2/27/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTExpert;
@class CTExpertBioView;
@class CTExpertLinksView;
@class CTExpertSummaryView;
@class CTTopicsView;

@interface CTExpertDetailViewController : UIViewController

@property (nonatomic, nonnull) IBOutlet UIScrollView *scrollView;
@property (nonatomic, nonnull) IBOutlet UIView *scrollContentView;
@property (nonatomic, nonnull) IBOutlet CTExpertSummaryView *summaryView;
@property (nonatomic, nonnull) IBOutlet UIView *summaryViewSeperator;
@property (nonatomic, nonnull) IBOutlet CTTopicsView *topicsView;
@property (nonatomic, nonnull) IBOutlet UIView *topicsViewSeperator;
@property (nonatomic, nonnull) IBOutlet CTExpertBioView *bioView;
@property (nonatomic, nonnull) IBOutlet UIView *bioSeperator;
@property (nonatomic, nonnull) IBOutlet CTExpertLinksView *linksView;

- (nonnull instancetype)initWithExpert:(nonnull CTExpert *)expert;

@end
