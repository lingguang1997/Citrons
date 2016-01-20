//
//  CTInstructionModule.h
//  Citron
//
//  Created by Zijiao Liu on 1/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDataModule.h>
#import <UIKit/UIKit.h>

@interface CTInstructionModule : NSObject <AKDataModule>

@property (nonatomic, copy, readonly, nonnull) NSString *header;
@property (nonatomic, copy, readonly, nonnull) UIImage *instructionImage;

- (nonnull instancetype)init NS_UNAVAILABLE;
- (nonnull instancetype)initWithJSONDictionary:(nonnull NSDictionary *)jsonDict NS_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithHeader:(nonnull NSString *)header instructionImageName:(nonnull NSString *)instructionImageName NS_DESIGNATED_INITIALIZER;

@end