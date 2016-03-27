//
//  CTChatItem.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/27.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTChatItem.h"

@implementation CTChatItem

- (instancetype)initWithText:(NSString *)text date:(NSDate *)date type:(CTChatItemType)type{
    self = [super init];
    if (self) {
        _text = text;
        _date = date;
        _type = type;
    }
    return self;
}

@end
