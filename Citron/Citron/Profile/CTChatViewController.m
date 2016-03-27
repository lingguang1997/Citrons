//
//  CTChatViewController.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/23.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTChatViewController.h"
#import "CTChatItem.h"

@interface CTChatViewController (){
    NSMutableArray<CTChatItem *> *chats;
}

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpacing;

@end

@implementation CTChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    CTChatItem *item1 = [[CTChatItem alloc] initWithText:@"你好！" date:[NSDate date] type:CTChatItemTypeCustomer];
    CTChatItem *item2 = [[CTChatItem alloc] initWithText:@"同学你好！" date:[NSDate date] type:CTChatItemTypeExpert];
    CTChatItem *item3 = [[CTChatItem alloc] initWithText:@"我特别好！" date:[NSDate date] type:CTChatItemTypeCustomer];
    CTChatItem *item4 = [[CTChatItem alloc] initWithText:@"你真的好！" date:[NSDate date] type:CTChatItemTypeExpert];
    chats = [NSMutableArray arrayWithObjects:item1, item2, item3, item4, nil];
    [_chatTableView reloadData];
 }

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
    
    [super viewWillDisappear:animated];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Keyboard methods

- (void)keyboardWillChange:(NSNotification *)notification{
    NSValue *frameValue = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect frame = [frameValue CGRectValue];
    _bottomSpacing.constant = CGRectGetHeight(self.view.frame) - CGRectGetMinY(frame);
    [UIView animateWithDuration:0.25f animations:^{
        [self updateViewConstraints];
    }];
}

#pragma mark - UITextField methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    CTChatItem *item = [[CTChatItem alloc] initWithText:_textField.text date:[NSDate date] type:CTChatItemTypeCustomer];
    [chats addObject:item];
    [_chatTableView reloadData];
    [_chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:chats.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    textField.text = nil;
    return YES;
}

#pragma mark - UITableView datasource & delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return chats.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CTChatItem *item = chats[indexPath.row];

    switch (item.type) {
        case CTChatItemTypeCustomer:{
            CTChatViewCustomerCell *cell = (CTChatViewCustomerCell *)[tableView dequeueReusableCellWithIdentifier:@"CustomerChatCell"];
            if (cell == nil) {
                cell = [[CTChatViewCustomerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CustomerChatCell"];
            }
            [cell updateCell:item];
            return  cell;
            break;
        }
        case CTChatItemTypeExpert:{
            CTChatViewExpertCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExpertChatCell"];
            if (cell == nil) {
                cell = [[CTChatViewExpertCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ExpertChatCell"];
            }
            [cell updateCell:item];
            return cell;
            break;
        }
        default:
            break;
    }
    
    return [UITableViewCell new];
}

#pragma mark - Image Picker Delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - IBActions
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)didTappedEnd:(id)sender {
    [_chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:chats.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (IBAction)didTappedChatView:(id)sender {
    [_textField resignFirstResponder];
}

- (IBAction)didTappedImageButton:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

@end

@implementation CTChatViewCustomerCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)updateCell:(CTChatItem *)item{
    _chatTextLabel.text = item.text;
}

@end


@implementation CTChatViewExpertCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

-(void)updateCell:(CTChatItem *)item{
    _chatTextLabel.text = item.text;
}

@end