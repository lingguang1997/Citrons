//
//  CTQuestionDetailViewController.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/16.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTQuestionDetailViewController.h"
#import "CTChatViewController.h"

@interface CTQuestionDetailViewController ()

@end

@implementation CTQuestionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _chatHistoryButton.layer.cornerRadius = 3.0f;
    _profileImageView.layer.cornerRadius = CGRectGetHeight(_profileImageView.frame) / 2;
    _questionTitleLabel.layer.cornerRadius = 2.0f;
    _questionTitleLabel.clipsToBounds = YES;
    
    CGRect frame = _priceLabel.frame;
    frame.size.width += 30.0f;
    _priceLabel.frame = frame;
    
    _priceLabel.layer.borderColor = [UIColor blueColor].CGColor;
    _priceLabel.layer.borderWidth = 0.5f;
    _priceLabel.layer.cornerRadius = CGRectGetHeight(_priceLabel.frame) / 2;
    
    frame = _sepLine.frame;
    frame.size.height = 0.5f;
    _sepLine.frame = frame;
    
    frame = _bottomSepLine.frame;
    frame.size.height = 0.5f;
    _bottomSepLine.frame = frame;
}


- (IBAction)didClickBottomButton:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"CTMyQuestionsStoryBoard" bundle:nil];
    CTChatViewController *chatVC = [storyboard instantiateViewControllerWithIdentifier:@"ChatViewController"];
    [self.navigationController pushViewController:chatVC animated:YES];
}

@end