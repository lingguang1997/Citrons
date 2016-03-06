//
//  CTLink.h
//  Citron
//
//  Created by Zijiao Liu on 2/23/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTLink : NSObject

@property (nonatomic, readonly, nonnull) NSString *linkText;
@property (nonatomic, readonly, nonnull) NSString *urlString;

- (nonnull instancetype)initWithLinkText:(nonnull NSString *)linkText urlString:(nonnull NSString *)urlString;

@end
