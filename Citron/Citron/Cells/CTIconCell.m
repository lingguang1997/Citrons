//
//  CTButtonIconCell.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTIconCell.h"
#import "UIFont+CTFont.h"

@interface CTIconCell ()


@end

@implementation CTIconCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont ct_appFontWithSize:15];
        self.seperatorEnabled = YES;
    }
    return self;
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
}

@end
