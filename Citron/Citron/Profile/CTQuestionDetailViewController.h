//
//  CTQuestionDetailViewController.h
//  Citron
//
//  Created by Shuo Zhang on 16/3/16.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTQuestionDetailViewController : UIViewController

@property (nonatomic, nonnull) IBOutlet UILabel *questionTitleLabel;
@property (nonatomic, nonnull) IBOutlet UILabel *contentLabel;
@property (nonatomic, nonnull) IBOutlet UILabel *dateLabel;
@property (nonatomic, nonnull) IBOutlet UIView *sepLine;
@property (nonatomic, nonnull) IBOutlet UIView *bottomSepLine;
@property (nonatomic, nonnull) IBOutlet UIButton *chatHistoryButton;
@property (nonatomic, nonnull) IBOutlet UIImageView *profileImageView;
@property (nonatomic, nonnull) IBOutlet UILabel *titleLabel;
@property (nonatomic, nonnull) IBOutlet UILabel *schoolLabel;
@property (nonatomic, nonnull) IBOutlet UIView *tagView;
@property (nonatomic, nonnull) IBOutlet UILabel *resolvedQuestionLabel;
@property (nonatomic, nonnull) IBOutlet UILabel *priceLabel;
@property (nonatomic, nonnull) IBOutlet UILabel *originalPriceLabel;

@end
