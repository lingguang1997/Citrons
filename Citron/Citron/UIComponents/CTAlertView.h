//
//  CTAlertView.h
//  Citron
//
//  Created by Zijiao Liu on 3/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CTAlertViewStyle) {
    CTAlertViewStyleNone,
    CTAlertViewStyleComfirm,
    CTAlertViewStyleConfirmAndCancel,
    CTAlertViewStyleCustom,
};


@protocol CTAlertViewDelegate <NSObject>

@end

@interface CTAlertView : UIView

@property (nonatomic, nonnull) IBOutlet UILabel *titleLabel;
@property (nonatomic, nonnull) IBOutlet UILabel *detailLabel;
@property (nonatomic, nonnull) NSArray<UIButton *> *buttons;
@property (nonatomic) CTAlertViewStyle style;

- (void)showOnView:(UIView *)view;

@end
