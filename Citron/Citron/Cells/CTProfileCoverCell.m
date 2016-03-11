//
//  CTProfileCoverCell.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/9.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTProfileCoverCell.h"

@implementation CTProfileCoverCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _coverView = [CTCustomerProfileView new];
        [self.contentView addSubview:_coverView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _coverView.frame = self.contentView.bounds;
}

# pragma mark - AKCell

- (void)updateWithItem:(CTCustomer *)customer{
    [_coverView updateWithCustomer:customer];
    [self setNeedsLayout];
}

+ (CGFloat)heightForItem:(CTCustomer *)customer fixedWidth:(CGFloat)fixedWidth {
    return [CTCustomerProfileView heightWithItem:customer canvasWidth:fixedWidth];
}
@end
