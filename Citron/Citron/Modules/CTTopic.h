//
//  CTTopic.h
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTTopic : NSObject

@property (nonatomic, copy, readonly, nonnull) NSString *title;
@property (nonatomic, readonly) NSUInteger price;
@property (nonatomic, readonly) NSInteger salePrice;
@property (nonatomic, copy, readonly, nonnull) NSString *detail;
@property (nonatomic, readonly) CGFloat duration;

- (nonnull instancetype)init NS_UNAVAILABLE;
- (nonnull instancetype)initWithJSONDictionary:(nonnull NSDictionary *)jsonDict NS_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithTitle:(nonnull NSString *)title price:(NSInteger)price salePrice:(NSInteger)salePrice detail:(nonnull NSString *)detail duration:(CGFloat)duration /* in hour */ NS_DESIGNATED_INITIALIZER;

@end
