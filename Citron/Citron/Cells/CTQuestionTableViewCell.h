//
//  CTQuestionTableViewCell.h
//  Citron
//
//  Created by Shuo Zhang on 16/3/15.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTRequest.h"

@interface CTQuestionTableViewCell : UITableViewCell

@property (nonatomic, nonnull) IBOutlet UIView  *backView;
@property (nonatomic, nonnull) IBOutlet UILabel *questionTitleLabel;
@property (nonatomic, nonnull) IBOutlet UILabel *contentLabel;
@property (nonatomic, nonnull) IBOutlet UILabel *titleLabel;
@property (nonatomic, nonnull) IBOutlet UILabel *schoolLabel;
@property (nonatomic, nonnull) IBOutlet UIButton *actionButton;
@property (nonatomic, nonnull) IBOutlet UIImageView *profileImageView;
@property (nonatomic, nonnull) IBOutlet UILabel *nameLabel;
@property (nonatomic, nonnull) IBOutlet UILabel *dateLabel;


- (void)updateWithQuestionRequest:(nonnull CTRequest *)request;
@end
