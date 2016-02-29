//
//  CTExpertBioView.m
//  Citron
//
//  Created by Zijiao Liu on 2/23/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTExpertBioView.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"

@implementation CTExpertBioView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.lineBreakMode = NSLineBreakByWordWrapping;
        self.numberOfLines = 0;
        self.font = [UIFont ct_appFontWithSize:12];
        self.textColor = [UIColor ct_grayColor];
        self.layer.borderColor = [UIColor ct_grayColor].CGColor;
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 3;
    }
    return self;
}

@end
