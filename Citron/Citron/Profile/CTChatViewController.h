//
//  CTChatViewController.h
//  Citron
//
//  Created by Shuo Zhang on 16/3/23.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTChatViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    UITableView *chatTableView;
    
}
@property (nonatomic, nonnull) IBOutlet UIView *bottomView;
@property (nonatomic, nonnull) IBOutlet UITextField *textField;
@end
