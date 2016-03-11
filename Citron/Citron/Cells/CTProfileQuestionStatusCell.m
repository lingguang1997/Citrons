//
//  CTProfileQuestionStatusCell.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTProfileQuestionStatusCell.h"

@implementation CTProfileQuestionStatusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [UIColor redColor].CGColor;
    }
    return self;
}


@end
