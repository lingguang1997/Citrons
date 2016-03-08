//
//  CTTopicView1.h
//  Citron
//
//  Created by Zijiao Liu on 2/25/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKDynamicHeightView.h>

@class CTPriceView;
@class CTTopic;

@interface CTTopicView : UIView <AKDynamicHeightView>

@property (nonatomic, nonnull) IBOutlet UILabel *topicTitleLabel;
@property (nonatomic, nonnull) IBOutlet UILabel *detailLabel;
@property (nonatomic, nonnull) IBOutlet UIView *seperator;
@property (nonatomic, nonnull) IBOutlet CTPriceView *priceView;
@property (nonatomic, nonnull) IBOutlet UILabel *durationLabel;

@property (nonatomic, getter=isSelected) BOOL selected;

@property (nonatomic, readonly, nonnull) CTTopic *topic;

- (void)updateWithTopic:(nonnull CTTopic *)topic;

- (BOOL)toggleSelected;

@end
