//
//  CTFileOwner.h
//  Citron
//
//  Created by Zijiao Liu on 2/25/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTFileOwner : NSObject

@property (nonatomic, nonnull) IBOutlet UIView *view;

+ (nonnull id)viewFromNibNamed:(nonnull NSString *)nibName;

@end
