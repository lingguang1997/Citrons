//
//  CTTopicDetailViewController.h
//  Citron
//
//  Created by Zijiao Liu on 3/6/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTPriceView;

@interface CTTopicDetailViewController : UIViewController

@property (nonatomic, nonnull) IBOutlet UILabel *titleLabel;
@property (nonatomic, nonnull) IBOutlet UILabel *descLabel;
@property (nonatomic, nonnull) IBOutlet UIView *seperatorView;
@property (nonatomic, nonnull) IBOutlet CTPriceView *priceView;
@property (nonatomic, nonnull) IBOutlet UIImageView *durationImageView;
@property (nonatomic, nonnull) IBOutlet UILabel *durationLabel;
@property (nonatomic, nonnull) IBOutlet UIButton *nextButton;

@end
