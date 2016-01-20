//
//  CTCategoryModule.h
//  Citron
//
//  Created by Zijiao Liu on 1/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDataModule.h>

@interface CTCategoryModule : NSObject <AKDataModule>

@property (nonatomic, readonly, nonnull) NSArray<NSString *> *categories;

- (nonnull instancetype)init NS_UNAVAILABLE;
- (nonnull instancetype)initWithJSONDictionary:(nonnull NSDictionary *)jsonDict NS_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithCategories:(nonnull NSArray *)categories NS_DESIGNATED_INITIALIZER;

@end