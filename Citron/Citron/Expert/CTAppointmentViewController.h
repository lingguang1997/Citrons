//
//  CTAppointmentViewController.h
//  Citron
//
//  Created by Zijiao Liu on 3/10/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKStepBar;
@class CTPriceView;

@interface CTAppointmentViewController : UIViewController

@property (nonatomic, nonnull) IBOutlet UILabel *titleLabel;
@property (nonatomic, nonnull) IBOutlet UIView *seperatorView;
@property (nonatomic, nonnull) IBOutlet CTPriceView *priceView;
@property (nonatomic, nonnull) IBOutlet UIImageView *durationImageView;
@property (nonatomic, nonnull) IBOutlet UILabel *durationLabel;
@property (nonatomic, nonnull) IBOutlet AKStepBar *stepBar;
@property (nonatomic, nonnull) IBOutlet UIScrollView *scrollView;
@property (nonatomic, nonnull) IBOutlet UITextView *questionTextView;
@property (nonatomic, nonnull) IBOutlet UITextView *selfIntroView;

@property (nonatomic, nonnull) IBOutlet UIButton *nextButton;

@end
