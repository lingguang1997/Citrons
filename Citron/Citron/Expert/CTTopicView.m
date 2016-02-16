//
//  CTTopicView.m
//  Citron
//
//  Created by Zijiao Liu on 2/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTExpert.h"
#import "CTTopicView.h"

@interface CTTopicView ()

@property (nonatomic, nonnull) UILabel *titleLabel;
@property (nonatomic, nonnull) UILabel *descLabel;
@property (nonatomic, nonnull) UIView *seperatorView;
//@property (nonatomic, nonnull) 

@end

@implementation CTTopicView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

# pragma mark - AKDynamicHeightView

+ (CGFloat)heightWithItem:(CTExpert *)expert {
    return 44;
}

@end
