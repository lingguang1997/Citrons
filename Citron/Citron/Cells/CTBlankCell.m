//
//  CTBlankCell.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/14.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTBlankCell.h"

@implementation CTBlankCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1.0];
    }
    return self;
}

@end
