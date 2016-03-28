//
//  CTChatViewController.h
//  Citron
//
//  Created by Shuo Zhang on 16/3/23.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTChatItem.h"

@interface CTChatViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>{
}
@property (nonatomic, nonnull) IBOutlet UIView *bottomView;
@property (nonatomic, nonnull) IBOutlet UITextField *textField;
@property (nonatomic, nonnull) IBOutlet UITableView *chatTableView;
@end


@interface CTChatViewExpertCell : UITableViewCell
@property (nonatomic, nonnull) IBOutlet UILabel *chatTextLabel;
@property (nonatomic, nonnull) IBOutlet UIImageView *backgroundBubbleView;
@property (nonatomic, nonnull) IBOutlet UIImageView *chatImageView;
- (void)updateCell:(nonnull CTChatItem *)item;
@end

@interface CTChatViewCustomerCell : UITableViewCell
@property (nonatomic, nonnull) IBOutlet UILabel *chatTextLabel;
@property (nonatomic, nonnull) IBOutlet UIImageView *backgroundBubbleView;
@property (nonatomic, nonnull) IBOutlet UIImageView *chatImageView;
- (void)updateCell:(nonnull CTChatItem *)item;
@end