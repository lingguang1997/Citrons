//
//  CTTagView.h
//  Citron
//
//  Created by Zijiao Liu on 2/15/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTTagView : UIView

@property (nonatomic, nonnull) UILabel *label;

- (nonnull instancetype)initWithTag:(nonnull NSString *)tag;

@end
