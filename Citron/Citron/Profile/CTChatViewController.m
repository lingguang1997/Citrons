//
//  CTChatViewController.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/23.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTChatViewController.h"

@interface CTChatViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpacing;

@end

@implementation CTChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
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
