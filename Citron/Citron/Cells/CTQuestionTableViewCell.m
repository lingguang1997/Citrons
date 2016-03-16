//
//  CTQuestionTableViewCell.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/15.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>
#import "CTQuestionTableViewCell.h"
#import "UIImage+CTImage.h"

@implementation CTQuestionTableViewCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _backView.layer.cornerRadius = 4.0f;
    _backView.clipsToBounds = YES;
    _actionButton.layer.cornerRadius = 3.0f;
    _actionButton.clipsToBounds = YES;
    _profileImageView.layer.cornerRadius = CGRectGetWidth(_profileImageView.frame) / 2;
    _profileImageView.clipsToBounds = YES;
}


- (void)updateWithQuestionRequest:(CTRequest *)request{
    NSURL *url = [NSURL URLWithString:@"http://cdn5.raywenderlich.com/wp-content/uploads/2015/05/customlayout-tutorial-image.png"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    __weak UIImageView *weakImageView = _profileImageView;
    
    [_profileImageView setImageWithURLRequest:req placeholderImage:[UIImage ct_profilePlaceHolder] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        if (weakImageView) {
            UIImageView *strongImageView = weakImageView;
            [UIView transitionWithView:strongImageView duration:.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                strongImageView.image = image;
            } completion:^(BOOL finished) {
            }];
        }
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}
@end
