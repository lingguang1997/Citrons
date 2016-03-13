//
//  CTTextCell.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTTextCell.h"
#import "UIFont+CTFont.h"

static CGFloat const kLeftPadding   = 16.0f;
static CGFloat const kRightPadding  = 16.0f;

@interface CTTextCell (){
    UIView  *sepLine;
}

@property (nonatomic, nonnull) UILabel  *titleLabel;
@property (nonatomic, nonnull) UILabel  *subTitleLabel;

@end

@implementation CTTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont ct_appFontWithSize:15];
        [self addSubview:_titleLabel];
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _subTitleLabel.font = [UIFont ct_appFontWithSize:12];
        _subTitleLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_subTitleLabel];
        self.contentView.backgroundColor = [UIColor whiteColor];
        sepLine = [[UIView alloc] initWithFrame:CGRectZero];
        sepLine.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:223.0/255.0 blue:223.0/255.0 alpha:1.0];
        [self addSubview:sepLine];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _titleLabel.frame = CGRectMake(kLeftPadding, 0, CGRectGetWidth(self.frame) - kLeftPadding, CGRectGetHeight(self.frame));
    _titleLabel.center = CGPointMake(_titleLabel.center.x, CGRectGetHeight(self.frame) / 2);
    
    _subTitleLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame) - kRightPadding, CGRectGetHeight(self.frame));
    _subTitleLabel.center = CGPointMake(_subTitleLabel.center.x, CGRectGetHeight(self.frame) / 2);
    
    sepLine.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 0.5f, CGRectGetWidth(self.frame), 0.5f);
}


- (void)updateWithItem:(NSDictionary *)item{
    if ([item.allKeys containsObject: kCTTextCellTitleKey]){
        NSString *title = item[kCTTextCellTitleKey];
        _titleLabel.text = title;
    }
    if ([item.allKeys containsObject:kCTTextCellSubTitleKey]){
        NSString *subTitle = item[kCTTextCellSubTitleKey];
        _subTitleLabel.text = subTitle;
    }
}
@end
