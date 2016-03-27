//
//  CTChatItem.h
//  Citron
//
//  Created by Shuo Zhang on 16/3/27.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, CTChatItemType){
    CTChatItemTypeCustomer,
    CTChatItemTypeExpert
};

@interface CTChatItem : NSObject
@property (nonatomic, readonly, nonnull) NSString *text;
@property (nonatomic, readonly, nonnull) NSDate *date;
@property (nonatomic, readonly, assign) CTChatItemType type;

- (nonnull instancetype)initWithText:(nonnull NSString *)linkText date:(nonnull NSDate *)date type:(CTChatItemType)type;
@end
