//
//  CTStarExpertsModule.h
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CTExpert;

@interface CTStarExpertsModule : NSObject

@property (nonatomic, nonnull) NSArray<CTExpert *> *experts;

- (nonnull instancetype)init NS_UNAVAILABLE;
- (nonnull instancetype)initWithJSONDictionary:(nonnull NSDictionary *)jsonDict NS_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithExperts:(nonnull NSArray<CTExpert *> *)experts NS_DESIGNATED_INITIALIZER;

@end