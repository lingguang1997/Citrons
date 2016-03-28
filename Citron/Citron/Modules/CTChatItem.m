//
//  CTChatItem.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/27.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTChatItem.h"

@implementation CTChatItem

- (instancetype)initWithText:(NSString *)text date:(NSDate *)date imageURL:(nullable NSString *)imageURL image:(nullable UIImage *)image type:(CTChatItemType)type{
    self = [super init];
    if (self) {
        _text = text;
        _date = date;
        _imageURL = imageURL;
        _image = image;
        _type = type;
    }
    return self;
}

- (instancetype)initWithText:(NSString *)text date:(NSDate *)date type:(CTChatItemType)type{
    return [self initWithText:text date:date imageURL:nil image:nil type:type];
}

- (instancetype)initWithImageURL:(NSString *)imageURL date:(NSDate *)date type:(CTChatItemType)type{
    return [self initWithText:@"" date:date imageURL:imageURL image:nil type:type];
}

- (instancetype)initWithImage:(UIImage *)image date:(NSDate *)date type:(CTChatItemType)type{
    return [self initWithText:@"" date:date imageURL:nil image:image type:type];
}

@end
