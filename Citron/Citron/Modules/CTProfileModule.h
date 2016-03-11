//
//  CTProfileModule.h
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <AppKit/AKDataModule.h>
@class CTCustomer;

@interface CTProfileModule : NSObject <AKDataModule>
@property (nonatomic, readonly , nonnull) CTCustomer *customer;

- (nonnull instancetype)init NS_UNAVAILABLE;
- (nonnull instancetype)initWithJSONDictionary:(nonnull NSDictionary *)jsonDict NS_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithCustomer:(nonnull CTCustomer *)customer NS_DESIGNATED_INITIALIZER;

@end
