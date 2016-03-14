//
//  CTButtonIconCell.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTIconCell.h"
#import "UIFont+CTFont.h"

static CGFloat const kRightPadding = 20.0f;
static CGFloat const kIconCellNumberPadding = 12.0f;
static CGFloat const kIconCellNumberHeight = 21.0f;

@interface CTIconCell (){
    UIColor *highlightBGColor;
    UIColor *normalBGColor;
    UIView  *sepLine;
}
@property (nonatomic, nonnull) UILabel *numberLabel;
@end

@implementation CTIconCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        highlightBGColor = [UIColor colorWithRed:249.0/255.0 green:209.0/255.0 blue:51.0/255.0 alpha:1.0];
        normalBGColor = [UIColor grayColor];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont ct_appFontWithSize:15];
        self.seperatorEnabled = YES;
        
        _numberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        _numberLabel.font = [UIFont systemFontOfSize:11.0];
        
        _numberLabel.clipsToBounds = YES;
        _numberLabel.textColor = [UIColor whiteColor];
        _numberLabel.backgroundColor = highlightBGColor;
        [self addSubview:_numberLabel];
        
        sepLine = [[UIView alloc] initWithFrame:CGRectZero];
        sepLine.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:223.0/255.0 blue:223.0/255.0 alpha:1.0];
        [self addSubview:sepLine];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_numberLabel sizeToFit];
    
    
    _numberLabel.frame = CGRectMake(CGRectGetWidth(self.bounds) - CGRectGetWidth(_numberLabel.frame) - 2 * kIconCellNumberPadding - kRightPadding, 0, CGRectGetWidth(_numberLabel.frame) + 2 * kIconCellNumberPadding, kIconCellNumberHeight);
    _numberLabel.center = CGPointMake(_numberLabel.center.x, CGRectGetHeight(self.bounds) / 2);
    
    _numberLabel.layer.cornerRadius = CGRectGetHeight(_numberLabel.frame) / 2;
    
    sepLine.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 0.5f, CGRectGetWidth(self.frame), 0.5f);
}

- (void)updateWithItem:(NSDictionary *)item{
    if ([item.allKeys containsObject: kCTIconCellTitleKey]){
        NSString *title = item[kCTIconCellTitleKey];
        self.textLabel.text = title;
    }
    if ([item.allKeys containsObject:kCTIconCellIconKey]){
        NSString *iconImageName = item[kCTIconCellIconKey];
        self.imageView.image = [UIImage imageNamed:iconImageName];
    }
    if ([item.allKeys containsObject:kCTIconCellDataKey]) {
        NSArray *dataArray = item[kCTIconCellDataKey];
        self.numberLabel.hidden = NO;
        self.numberLabel.text = [NSString stringWithFormat:@"%ld", dataArray.count];
    }else{
        self.numberLabel.hidden = YES;
    }
}

- (void)updateNumber:(CGFloat)number{
    
}

@end
