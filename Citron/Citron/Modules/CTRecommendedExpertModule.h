//
//  CTRecommendedExpertModule.h
//  Citron
//
//  Created by Zijiao Liu on 1/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDataModule.h>

@interface CTRecommendedExpertModule : NSObject <AKDataModule>

@property (nonatomic, readonly, nonnull) NSArray *experts;

- (nonnull instancetype)init NS_UNAVAILABLE;
- (nonnull instancetype)initWithJSONDictionary:(nonnull NSDictionary *)jsonDict NS_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithExperts:(nonnull NSArray *)experts NS_DESIGNATED_INITIALIZER;

@end
