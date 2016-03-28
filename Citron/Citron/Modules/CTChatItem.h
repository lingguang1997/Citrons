//
//  CTChatItem.h
//  Citron
//
//  Created by Shuo Zhang on 16/3/27.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, CTChatItemType){
    CTChatItemTypeCustomer,
    CTChatItemTypeExpert
};

@interface CTChatItem : NSObject
@property (nonatomic, readonly, nonnull) NSString *text;
@property (nonatomic, readonly, nonnull) NSDate *date;
@property (nonatomic, readonly, nullable) NSString *imageURL;
@property (nonatomic, readonly, nullable) UIImage *image;
@property (nonatomic, readonly, assign) CTChatItemType type;

- (nonnull instancetype)init NS_UNAVAILABLE;
- (nonnull instancetype)initWithText:(nonnull NSString *)text date:(nonnull NSDate *)date imageURL:(nullable NSString *)imageURL image:(nullable UIImage *)image type:(CTChatItemType)type NS_DESIGNATED_INITIALIZER;

- (nonnull instancetype)initWithText:(nonnull NSString *)text date:(nonnull NSDate *)date type:(CTChatItemType)type;
- (nonnull instancetype)initWithImageURL:(nonnull NSString *)text date:(nonnull NSDate *)date type:(CTChatItemType)type;
- (nonnull instancetype)initWithImage:(nonnull UIImage *)image date:(nonnull NSDate *)date type:(CTChatItemType)type;
@end
