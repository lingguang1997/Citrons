//
//  CTOnboardingViewController.m
//  Citron
//
//  Created by Zijiao Liu on 1/28/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AppKit/AKStepBar.h>
#import <AppKit/NSString+AKContent.h>
#import "CTOnboardingViewController.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"
#import "UIImage+CTImage.h"

static NSInteger const kSteps = 3;
static CGFloat const kStepBarHeight = 5;
static CGFloat const kBarVPadding = 5;
static CGFloat const kCornerRadius = 3;
static CGFloat const kBarHeight = 45;
static CGFloat const kHPadding = 25;


@protocol CTFormDelegate <NSObject>

- (void)formChanged:(BOOL)completed;

@end

@protocol CTForm <NSObject>

@property (nonatomic, weak) id<CTFormDelegate> delegate;

- (BOOL)editingCompleted;

@end

@interface CTRegisterIDView : UIView <UITextFieldDelegate, CTForm>

@property (nonatomic) UITextField *emailTextField;
@property (nonatomic) UITextField *cellPhoneTextField;

@property (nonatomic) UILabel *seperatorLabel;

@property (nonatomic) NSString *email;
@property (nonatomic) NSString *cellPhone;

@end

@implementation CTRegisterIDView

@synthesize delegate = _delegate;


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat barWidth = CGRectGetWidth(frame) - kHPadding - kHPadding;

        _cellPhoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(kHPadding, 0, barWidth, kBarHeight)];
        _cellPhoneTextField.placeholder = @"+86 12345678900";
        _cellPhoneTextField.layer.cornerRadius = kCornerRadius;
        _cellPhoneTextField.clipsToBounds = YES;
        _cellPhoneTextField.delegate = self;
        _cellPhoneTextField.backgroundColor = [UIColor ct_transparentWhiteColor];
        _cellPhoneTextField.textAlignment = NSTextAlignmentCenter;
        _cellPhoneTextField.textColor = [UIColor whiteColor];
        [self addSubview:_cellPhoneTextField];

        _seperatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(kHPadding, CGRectGetMaxY(_cellPhoneTextField.frame) + kBarVPadding, barWidth, kBarHeight)];
        _seperatorLabel.text = @"或";
        _seperatorLabel.textColor = [UIColor ct_grayColor];
        _seperatorLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_seperatorLabel];

        _emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(kHPadding, CGRectGetMaxY(_seperatorLabel.frame) + kBarVPadding, barWidth , kBarHeight)];
        _emailTextField.placeholder = @"iaskdata@example.com";
        _emailTextField.layer.cornerRadius = kCornerRadius;
        _emailTextField.clipsToBounds = YES;
        _emailTextField.delegate = self;
        _emailTextField.backgroundColor = [UIColor ct_transparentWhiteColor];
        _emailTextField.textAlignment = NSTextAlignmentCenter;
        _emailTextField.textColor = [UIColor whiteColor];
        [self addSubview:_emailTextField];
    }
    return self;
}

# pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == _emailTextField) {
        _email = [textField.text stringByReplacingCharactersInRange:range withString:string];
    } else {
        _cellPhone = [textField.text stringByReplacingCharactersInRange:range withString:string];
    }
    [_delegate formChanged:[self editingCompleted]];
    return YES;
}

# pragma mark - CTForm

- (BOOL)editingCompleted {
    if ([_email stringByReplacingOccurrencesOfString:@"@" withString:@""].length + 1 == _email.length && [_email stringByReplacingOccurrencesOfString:@"." withString:@""].length + 1 == _email.length) {
        NSRange atRange = [_email rangeOfString:@"@"];
        if (atRange.location != NSNotFound && atRange.location != 0) {
            NSRange dotRange = [_email rangeOfString:@"."];
            if (dotRange.location != NSNotFound && dotRange.location != _email.length - 1) {
                return YES;
            }
        }
    }
    NSString *cellPhoneWithoutPlus = [_cellPhone stringByReplacingOccurrencesOfString:@"+" withString:@""];
    NSString *cellPhoneWithoutPlusAndSpace = [cellPhoneWithoutPlus stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (cellPhoneWithoutPlus.length + 1 == _cellPhone.length && cellPhoneWithoutPlusAndSpace.length + 1 == cellPhoneWithoutPlus.length) {
        NSRange plusRange = [_cellPhone rangeOfString:@"+"];
        if (plusRange.location == 0) {
            NSRange spaceRange = [_cellPhone rangeOfString:@" "];
            if (spaceRange.location > 1 && spaceRange.location < _cellPhone.length - 1 && [cellPhoneWithoutPlusAndSpace isNumber]) {
                return YES;
            }
        }
    } else if ([_cellPhone isNumber]) {
        return YES;
    }
    return NO;
}

@end

@interface CTUsernameView : UIView <UITextFieldDelegate, CTForm>

@property (nonatomic) UITextField *usernameTextField;
@property (nonatomic, getter=isFilled) BOOL filled;
@property (nonatomic, weak) id<CTFormDelegate> delegate;

@property (nonatomic) NSString *username;

@end

@implementation CTUsernameView

@synthesize delegate = _delegate;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(kHPadding, (CGRectGetHeight(frame) - kBarHeight) / 2, CGRectGetWidth(frame) - kHPadding - kHPadding, kBarHeight)];
        _usernameTextField.placeholder = @"请输入用户名";
        _usernameTextField.delegate = self;
        _usernameTextField.layer.cornerRadius = kCornerRadius;
        _usernameTextField.clipsToBounds = YES;
        _usernameTextField.backgroundColor = [UIColor ct_transparentWhiteColor];
        _usernameTextField.textAlignment = NSTextAlignmentCenter;
        _usernameTextField.textColor = [UIColor whiteColor];
        [self addSubview:_usernameTextField];
    }
    return self;
}

# pragma mark - CTForm

- (BOOL)editingCompleted {
    return !!_username.length;
}

# pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    _username = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [_delegate formChanged:[self editingCompleted]];
    return YES;
}

@end


@interface CTPasswordView : UIView <UITextFieldDelegate, CTForm>

@property (nonatomic) UITextField *passwordTextField;
@property (nonatomic) NSString *password;

@end

@implementation CTPasswordView

@synthesize delegate = _delegate;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(kHPadding, (CGRectGetHeight(frame) - kBarHeight) / 2, CGRectGetWidth(frame) - kHPadding - kHPadding, kBarHeight)];
        _passwordTextField.placeholder = @"请输入密码";
        _passwordTextField.delegate = self;
        _passwordTextField.layer.cornerRadius = kCornerRadius;
        _passwordTextField.clipsToBounds = YES;
        _passwordTextField.backgroundColor = [UIColor ct_transparentWhiteColor];
        _passwordTextField.textAlignment = NSTextAlignmentCenter;
        _passwordTextField.textColor = [UIColor whiteColor];
        _passwordTextField.secureTextEntry = YES;
        [self addSubview:_passwordTextField];
    }
    return self;
}

# pragma mark - CTForm

- (BOOL)editingCompleted {
    return !!_password.length;
}

# pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    _password = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [_delegate formChanged:[self editingCompleted]];
    return YES;
}

@end

@interface CTOnboardingViewController () <CTFormDelegate, UIScrollViewDelegate>

@property (nonatomic) UIButton *backButton;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) AKStepBar *stepBar;
@property (nonatomic) UILabel *errorLabel;
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UIButton *nextButton;

@end

@implementation CTOnboardingViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"注册";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = NO;

    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *backgroundView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    backgroundView.frame = self.view.bounds;
    [self.view addSubview:backgroundView];

    CGFloat width = CGRectGetWidth(self.view.bounds);

    CGFloat statusBarHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    CGFloat titleLabelHeight = 50;
    UIImage *backButtonImage = [UIImage imageNamed:@"ArrowLeft"];
    CGSize backButtonSize = CGSizeMake(8 * backButtonImage.size.width, 2 * backButtonImage.size.height);
    _backButton = [[UIButton alloc] initWithFrame:CGRectMake(kHPadding, statusBarHeight + (titleLabelHeight - backButtonSize.height) / 2, backButtonSize.width, backButtonSize.height)];
    [_backButton setImage:backButtonImage forState:UIControlStateNormal];
    CGFloat backButtonVPadding = (backButtonSize.height - backButtonImage.size.height) / 2;
    _backButton.imageEdgeInsets = UIEdgeInsetsMake(backButtonVPadding, 0, backButtonVPadding, backButtonSize.width - backButtonImage.size.width);
    [_backButton setTitle:@"登录" forState:UIControlStateNormal];
    _backButton.titleLabel.font = [UIFont ct_appFontWithSize:18];

    [_backButton addTarget:self action:@selector(_backButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];

    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(2 * kHPadding, statusBarHeight, width - 4 * kHPadding, titleLabelHeight)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont ct_appBoldFontWithSize:18];
    _titleLabel.text = self.title;
    [self.view addSubview:_titleLabel];


    _stepBar = [[AKStepBar alloc] initWithFrame:CGRectMake(0,  CGRectGetMaxY(_titleLabel.frame), width, kStepBarHeight) steps:kSteps];
    [self.view addSubview:_stepBar];

    _errorLabel = [[UILabel alloc] initWithFrame:CGRectMake(kHPadding, CGRectGetMaxY(_stepBar.frame) + 33, width - kHPadding - kHPadding, kBarHeight)];
    _errorLabel.textAlignment = NSTextAlignmentCenter;
    _errorLabel.textColor = [UIColor redColor];
    _errorLabel.font = [UIFont ct_appBoldFontWithSize:12];
    _errorLabel.text = @"此电话号码已被注册";
    _errorLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_errorLabel];

    CGFloat scrollViewHeight = kBarVPadding * 2 + kBarHeight * 3;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_errorLabel.frame) + 5, width, scrollViewHeight)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(width, scrollViewHeight);
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];

    [_scrollView addSubview:[self _registerIDViewWithFrame:CGRectMake(0, 0, width, scrollViewHeight)]];
    [_scrollView addSubview:[self _usernameViewWithFrame:CGRectMake(width, 0, width, scrollViewHeight)]];
    [_scrollView addSubview:[self _passwordViewWithFrame:CGRectMake(2 * width, 0, width, scrollViewHeight)]];

    _nextButton = [[UIButton alloc] initWithFrame:CGRectMake(kHPadding, CGRectGetMaxY(_scrollView.frame) + 50, width - kHPadding - kHPadding, kBarHeight)];
    _nextButton.layer.cornerRadius = kCornerRadius;
    _nextButton.clipsToBounds = YES;
    [_nextButton setBackgroundImage:[UIImage ct_imageWithColor:[AKStepBar defaultHighlightColor] size:_nextButton.frame.size] forState:UIControlStateNormal];
    [_nextButton setBackgroundImage:[UIImage ct_imageWithColor:[AKStepBar defaultHighlightColor] size:_nextButton.frame.size] forState:UIControlStateSelected];
    [_nextButton setBackgroundImage:[UIImage ct_imageWithColor:[AKStepBar defaultBackgroundColor] size:_nextButton.frame.size] forState:UIControlStateDisabled];
    [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_nextButton setTitleColor:[UIColor ct_grayColor] forState:UIControlStateDisabled];
    [self _updateNextButtonTitle];
    _nextButton.enabled = NO;
    _nextButton.userInteractionEnabled = NO;
    [self.view addSubview:_nextButton];
    [_nextButton addTarget:self action:@selector(_nextButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextButton];
    self.view.backgroundColor = [UIColor clearColor];

}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = NO;
//    self.navigationController.navigationBar.backItem.title = @"";
//}

# pragma mark - CTFormDelegate

- (void)formChanged:(BOOL)completed {
    _nextButton.enabled = completed;
    _nextButton.userInteractionEnabled = completed;
}

# pragma mark - UIScrollViewDelegate 

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (velocity.x < 0) {
        [self _scrollToPreviousStep];
    } else if (velocity.x > 0 &&  _nextButton.enabled){
        [self _scrollToNextStep];
    }
}

# pragma mark - Private methods

- (void)_backButtonTapped:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)_nextButtonTapped:(UIButton *)sender {
    if ([_stepBar canGoNextStep]) {
        [_stepBar nextStep];
        _scrollView.contentSize = CGSizeMake((_stepBar.currentStep + 1) * CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame));
        [UIView animateWithDuration:.3 animations:^{
            [_scrollView setContentOffset:CGPointMake(_stepBar.currentStep * CGRectGetWidth(_scrollView.frame), 0)];
        }];
        _nextButton.enabled = NO;
        _nextButton.userInteractionEnabled = NO;
        [self _updateNextButtonTitle];
        _errorLabel.text = @"";
    } else {
        [self.navigationController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)_scrollToPreviousStep {
    [_stepBar previousStep];
    _nextButton.enabled = YES;
    [self _updateNextButtonTitle];
}

- (void)_scrollToNextStep {
    if (_scrollView.contentOffset.x < _scrollView.contentSize.width - CGRectGetWidth(_scrollView.frame)) {
        [_stepBar nextStep];
        UIView<CTForm> *view = [_scrollView.subviews objectAtIndex:_stepBar.currentStep];
        _nextButton.enabled = view.editingCompleted;
        [self _updateNextButtonTitle];
    }
}

- (void)_updateNextButtonTitle {
    if (_stepBar.currentStep == _stepBar.steps - 1) {
        [_nextButton setTitle:@"完成" forState:UIControlStateNormal];
    } else {
        [_nextButton setTitle:@"继续" forState:UIControlStateNormal];
    }
}

- (UIView *)_registerIDViewWithFrame:(CGRect)frame {
    UIView<CTForm> *view = [[CTRegisterIDView alloc] initWithFrame:frame];
    view.delegate = self;
    return view;
}

- (UIView *)_usernameViewWithFrame:(CGRect)frame {
    UIView<CTForm> *view = [[CTUsernameView alloc] initWithFrame:frame];
    view.delegate = self;
    return view;
}

- (UIView *)_passwordViewWithFrame:(CGRect)frame {
    UIView<CTForm> *view = [[CTPasswordView alloc] initWithFrame:frame];
    view.delegate = self;
    return view;
}

@end
