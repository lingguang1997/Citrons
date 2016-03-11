//
//  CTProfileCoverView.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/9.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTCustomerProfileView.h"
#import "CTCustomer.h"

@interface CTCustomerProfileView ()

@property (nonatomic, nonnull) UIImageView *backgroundView;

@end

@implementation CTCustomerProfileView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _commonInit];
    }
    return self;
}

- (void)_commonInit {
    _backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ProfileCoverBackground"]];
    _backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_backgroundView];
    [self sendSubviewToBack:_backgroundView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _backgroundView.frame = self.bounds;
}

- (void)updateWithCustomer:(CTCustomer *)customer{
    NSURL *profileImageURL = [NSURL URLWithString:customer.profileImageURL];
    if (profileImageURL) {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:profileImageURL];
        [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
        __weak UIImageView *weakImageView = super.profileImageView;
        [profileImageView setImageWithURLRequest:request placeholderImage:[UIImage ct_profilePlaceHolder] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
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
    
    _nameLabel.text = expert.name;
    _titleLabel.text = expert.title;
    _educationBackgroundLabel.text = [NSString stringWithFormat:@"%@ %@", expert.school, expert.degree];
    _tagLabels = [NSMutableArray arrayWithCapacity:expert.tags.count];
    [expert.tags enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CTTagView *tagView = [CTTagView new];
        tagView.label.text = obj;
        [_tagLabels addObject:tagView];
        [self addSubview:tagView];
    }];
    [self setNeedsLayout];
}

@end
