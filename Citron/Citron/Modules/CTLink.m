//
//  CTLink.m
//  Citron
//
//  Created by Zijiao Liu on 2/23/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTLink.h"

@implementation CTLink

- (instancetype)initWithLinkText:(NSString *)linkText urlString:(NSString *)urlString {
    self = [super init];
    if (self) {
        _linkText = linkText;
        _urlString = urlString;
    }
    return self;
}

@end
