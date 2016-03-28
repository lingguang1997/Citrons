//
//  CTChatViewController.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/23.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>
#import <AssetsLibrary/AssetsLibrary.h>
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
    
    self.chatTableView.rowHeight = UITableViewAutomaticDimension;
    self.chatTableView.estimatedRowHeight = 100.0;
    
    CTChatItem *item1 = [[CTChatItem alloc] initWithText:@"你好！" date:[NSDate date] type:CTChatItemTypeCustomer];
    CTChatItem *item2 = [[CTChatItem alloc] initWithText:@"同学你好！" date:[NSDate date] type:CTChatItemTypeExpert];
    CTChatItem *item3 = [[CTChatItem alloc] initWithText:@"我特别好！" date:[NSDate date] type:CTChatItemTypeCustomer];
    CTChatItem *item4 = [[CTChatItem alloc] initWithText:@"你真的好！" date:[NSDate date] type:CTChatItemTypeExpert];
    CTChatItem *item5 = [[CTChatItem alloc] initWithImageURL:@"https://img1.doubanio.com/view/photo/large/public/p2264598192.jpg" date:[NSDate date] type:CTChatItemTypeExpert];
    CTChatItem *item6 = [[CTChatItem alloc] initWithText:@"妈妈 妈妈我被选上了 我被选为担任操作保护人类的eva驾驶员 是世界第一哦 这件事我还没告诉别人 不过我只告诉妈妈 那的人对我都好好 所以 我一点也不寂寞 因此 即使没有爸爸也没关系 我一点也不寂寞 所以妈妈 看看我吧 不要杀死我" date:[NSDate date] type:CTChatItemTypeCustomer];
    chats = [NSMutableArray arrayWithObjects:item1, item2, item3, item4, item5, item6, nil];
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
    NSURL *imageURL = info[UIImagePickerControllerReferenceURL];
    
    ALAssetsLibraryAssetForURLResultBlock resultblock = ^(ALAsset *myasset)
    {
        CGImageRef imageRef = myasset.thumbnail;
        UIImage *thumbImage = [UIImage imageWithCGImage:imageRef];
        CTChatItem *item = [[CTChatItem alloc] initWithImage:thumbImage date:[NSDate date] type:CTChatItemTypeCustomer];
        [chats addObject:item];
        [_chatTableView reloadData];
    };
    
    ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init];
    [assetslibrary assetForURL:imageURL
                   resultBlock:resultblock
                  failureBlock:nil];
    
    
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
        _chatImageView.clipsToBounds = YES;
    }
    return self;
}

- (void)updateCell:(CTChatItem *)item{
    if (item.imageURL != nil) {
        [_chatImageView setImageWithURL:[NSURL URLWithString:item.imageURL]];
        _chatTextLabel.text = nil;
    }else if (item.image != nil){
        [_chatImageView setImage:item.image];
        _chatTextLabel.text = nil;
    }
    else{
        _chatTextLabel.text = item.text;
        _chatImageView.image = nil;
    }
}

@end


@implementation CTChatViewExpertCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _chatImageView.clipsToBounds = YES;
    }
    return self;
}

-(void)updateCell:(CTChatItem *)item{
    if (item.imageURL != nil) {
        [_chatImageView setImageWithURL:[NSURL URLWithString:item.imageURL]];
        _chatTextLabel.text = nil;
    }else if (item.image != nil){
        [_chatImageView setImage:item.image];
        _chatTextLabel.text = nil;
    }
    else{
        _chatTextLabel.text = item.text;
        _chatImageView.image = nil;
    }
}

@end