//
//  CTPriceView.h
//  Citron
//
//  Created by Zijiao Liu on 2/21/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTPriceView : UIView

@property (nonatomic, nonnull) IBOutlet UIImageView *rmbSignImageView;
@property (nonatomic, nonnull) IBOutlet UILabel *priceLabel;
@property (nonatomic) NSUInteger price;

- (void)updateWithPrice:(NSUInteger)price;
+ (CGFloat)height;

@end
