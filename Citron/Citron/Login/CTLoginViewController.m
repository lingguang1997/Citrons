//
//  CTLoginViewController.m
//  Citron
//
//  Created by Zijiao Liu on 1/20/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <AFNetworking/AFHTTPSessionManager.h>
#import <AppKit/AKRoundedView.h>
#import <AppKit/Utils.h>
#import "CTHTTPSessionManager.h"
#import "CTLoginViewController.h"
#import "CTMainViewController.h"
#import "CTOnboardingViewController.h"
#import "CTSettings.h"
#import "CTWXHTTPSessionManager.h"
#import "UIColor+CTColor.h"
#import "UIFont+CTFont.h"
#import "UIImage+CTImage.h"
//#import "WXApi.h"

static CGFloat const kHPadding = 25;
static CGFloat const kCornerRadius = 3;

@interface CTLoginViewController () <UITextFieldDelegate>//<WXApiDelegate>

@property (nonatomic, nonnull) UITextField *usernameTextField;
@property (nonatomic, nonnull) UITextField *passwordTextField;

@end

@implementation CTLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *backgroundView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    backgroundView.frame = self.view.bounds;
    [self.view addSubview:backgroundView];
    self.view.backgroundColor = [UIColor clearColor];

    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat dismissButtonDimension = 50;
    UIButton *dismissButton = [[UIButton alloc] initWithFrame:CGRectMake(screenSize.width - 60, kHPadding, dismissButtonDimension, dismissButtonDimension)];
    [dismissButton setImage:[UIImage imageNamed:@"ArrowDown"] forState:UIControlStateNormal];
    [dismissButton addTarget:self action:@selector(_dismissButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissButton];

    NSString *logoImageViewYKey = @"logoViewImageYKey";
    NSString *usernameBackgroundViewYKey = @"usernameBackgroundViewYKey";
    NSString *passwordBackgroundViewYKey = @"passwordBackgroundViewYKey";
    NSString *loginButtonYKey = @"loginButtonYKey";
    NSString *policyButtonYKey = @"policyButtonYKey";
    NSString *seperatorLabelYKey = @"seperatorLabelYKey";
    NSString *wechatLabelYKey = @"wechatLabelYKey";
    NSString *wechatButtonYKey = @"wechatButtonYKey";
    NSString *registerButtonYKey = @"registerButtonYKey";

    NSDictionary *vPaddings;
    CGFloat barHeight;
    CGSize logoSize = CGSizeMake(82, 81);
    if (IS_IPHONE_4_OR_LESS) {
        vPaddings =  @{ logoImageViewYKey : @52.5,
               usernameBackgroundViewYKey : @13,
               passwordBackgroundViewYKey : @1,
                          loginButtonYKey : @13,
                         policyButtonYKey : @14,
                       seperatorLabelYKey : @10,
                          wechatLabelYKey : @12,
                         wechatButtonYKey : @13,
                       registerButtonYKey : @19};
        barHeight = 35;
        logoSize = CGSizeMake(60, 60);
    } else if (IS_IPHONE_5) {
        vPaddings =  @{ logoImageViewYKey : @60,
               usernameBackgroundViewYKey : @24,
               passwordBackgroundViewYKey : @1,
                          loginButtonYKey : @13,
                         policyButtonYKey : @15,
                       seperatorLabelYKey : @15,
                          wechatLabelYKey : @16,
                         wechatButtonYKey : @25,
                       registerButtonYKey : @27};
        barHeight = 40;
        logoSize = CGSizeMake(70, 70);
    } else if (IS_IPHONE_6) {
        vPaddings =  @{ logoImageViewYKey : @80.0,
               usernameBackgroundViewYKey : @35,
               passwordBackgroundViewYKey : @1,
                          loginButtonYKey : @15,
                         policyButtonYKey : @14,
                       seperatorLabelYKey : @14,
                          wechatLabelYKey : @15,
                         wechatButtonYKey : @24,
                       registerButtonYKey : @38};
        barHeight = 45;
    } else if (IS_IPHONE_6P) {
        vPaddings =  @{ logoImageViewYKey : @100,
               usernameBackgroundViewYKey : @42,
               passwordBackgroundViewYKey : @1,
                          loginButtonYKey : @15,
                         policyButtonYKey : @20,
                       seperatorLabelYKey : @22,
                          wechatLabelYKey : @20,
                         wechatButtonYKey : @30,
                       registerButtonYKey : @45};
        barHeight = 45;
    }

    UIImageView *logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo"]];
    logoImageView.frame = CGRectMake((screenSize.width - logoSize.width) / 2, [vPaddings[logoImageViewYKey] floatValue], logoSize.width, logoSize.height);
    [self.view addSubview:logoImageView];

    [[UITextField appearance] setTintColor:[UIColor whiteColor]];
    AKRoundedView *usernameBackgroundView = [[AKRoundedView alloc] initWithFrame:CGRectMake(kHPadding, CGRectGetMaxY(logoImageView.frame) + [vPaddings[usernameBackgroundViewYKey] floatValue], screenSize.width - kHPadding - kHPadding, barHeight)];
    usernameBackgroundView.roundedCorners = AKRoundedCornerTopLeft | AKRoundedCornerTopRight;
    usernameBackgroundView.cornerRadius = kCornerRadius;
    usernameBackgroundView.borderWidth = 0;
    NSArray *gradientColorsAndLocations = (@[@{ AKRoundedViewGradientColorKey : [UIColor ct_transparentWhiteColor], AKRoundedViewGradientLocationKey : @(0.0f)}]);
    usernameBackgroundView.gradientColorsAndLocations = gradientColorsAndLocations;
    usernameBackgroundView.clipsToBounds = YES;
    [self.view addSubview:usernameBackgroundView];
    UIImageView *usernameIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"UsernameIcon"]];
    CGRect usernameIconFrame = usernameIcon.frame;
    usernameIconFrame.origin = CGPointMake(15, (CGRectGetHeight(usernameBackgroundView.frame) - CGRectGetHeight(usernameIconFrame)) / 2);
    usernameIcon.frame = usernameIconFrame;
    [usernameBackgroundView addSubview:usernameIcon];
    CGFloat iconHPadding = CGRectGetMinX(usernameIconFrame);
    _usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(usernameIconFrame) + iconHPadding, 0, CGRectGetWidth(usernameBackgroundView.frame) - iconHPadding - iconHPadding - CGRectGetMaxX(usernameIconFrame), CGRectGetHeight(usernameBackgroundView.frame))];
    _usernameTextField.placeholder = @"用户名";
    _usernameTextField.font = [UIFont ct_appFontWithSize:14];
    _usernameTextField.textColor = [UIColor whiteColor];
    _usernameTextField.delegate = self;
    [usernameBackgroundView addSubview:_usernameTextField];

    AKRoundedView *passwordBackgroundView = [[AKRoundedView alloc] initWithFrame:CGRectMake(kHPadding, CGRectGetMaxY(usernameBackgroundView.frame) + [vPaddings[passwordBackgroundViewYKey] floatValue], CGRectGetWidth(usernameBackgroundView.frame), barHeight)];
    passwordBackgroundView.roundedCorners = AKRoundedCornerBottomLeft | AKRoundedCornerBottomRight;
    passwordBackgroundView.cornerRadius = usernameBackgroundView.cornerRadius;
    passwordBackgroundView.borderWidth = usernameBackgroundView.borderWidth;
    passwordBackgroundView.gradientColorsAndLocations = gradientColorsAndLocations;
    passwordBackgroundView.clipsToBounds = YES;
    [self.view addSubview:passwordBackgroundView];
    UIImageView *passwordIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PasswordIcon"]];
    passwordIcon.frame = usernameIconFrame;
    [passwordBackgroundView addSubview:passwordIcon];

    _passwordTextField = [[UITextField alloc] initWithFrame:_usernameTextField.frame];
    _passwordTextField.placeholder = @"密码";
    _passwordTextField.font = _usernameTextField.font;
    _passwordTextField.textColor = _usernameTextField.textColor;
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.delegate = self;
    [passwordBackgroundView addSubview:_passwordTextField];

    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(kHPadding, CGRectGetMaxY(passwordBackgroundView.frame) + [vPaddings[loginButtonYKey] floatValue], CGRectGetWidth(passwordBackgroundView.frame), barHeight)];
    loginButton.layer.cornerRadius = kCornerRadius;
    loginButton.clipsToBounds = YES;
    [loginButton setBackgroundImage:[UIImage ct_imageWithColor:[UIColor ct_lightBlueColor] size:loginButton.frame.size] forState:UIControlStateNormal];
    [loginButton setBackgroundImage:[UIImage ct_imageWithColor:[UIColor ct_blueColor] size:loginButton.frame.size] forState:UIControlStateSelected];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:loginButton];
    [loginButton addTarget:self action:@selector(_loginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];

    UIButton *policyButton = [[UIButton alloc] initWithFrame:CGRectMake(kHPadding, CGRectGetMaxY(loginButton.frame) + [vPaddings[policyButtonYKey] floatValue], CGRectGetWidth(loginButton.frame), 20)];
    [policyButton addTarget:self action:@selector(_policyButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:policyButton];
    UILabel *policyLabel = [[UILabel alloc] initWithFrame:policyButton.bounds];
    NSString *whiteText = @"点击登录即代表同意书问的";
    NSString *blueText = @"用户协议";
    NSString *text = [NSString stringWithFormat:@"%@%@", whiteText, blueText];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString setAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont ct_appFontWithSize:10]  } range:[text rangeOfString:whiteText]];
    [attributedString setAttributes:@{ NSForegroundColorAttributeName : [UIColor ct_lightBlueColor], NSFontAttributeName : [UIFont ct_appFontWithSize:10] } range:[text rangeOfString:blueText]];
    policyLabel.textAlignment = NSTextAlignmentCenter;
    policyLabel.attributedText = attributedString;
    [policyButton addSubview:policyLabel];

    CGFloat seperatorLabelWidth = 28;
    UILabel *seperatorLabel = [[UILabel alloc] initWithFrame:CGRectMake((screenSize.width - seperatorLabelWidth) / 2, CGRectGetMaxY(policyButton.frame) + [vPaddings[seperatorLabelYKey] floatValue], seperatorLabelWidth, 20)];
    seperatorLabel.text = @"或";
    seperatorLabel.font = [UIFont ct_appFontWithSize:14];
    seperatorLabel.textColor = [UIColor whiteColor];
    seperatorLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:seperatorLabel];

    CGFloat seperatorHeight = 1;
    UIView *leftSeperatorView = [[UIView alloc] initWithFrame:CGRectMake(kHPadding, seperatorLabel.center.y - seperatorHeight, screenSize.width / 2 - kHPadding - kHPadding, seperatorHeight)];
    leftSeperatorView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:leftSeperatorView];

    UIView *rightSeperatorView = [[UIView alloc] initWithFrame:CGRectMake(screenSize.width - kHPadding - CGRectGetWidth(leftSeperatorView.frame), CGRectGetMinY(leftSeperatorView.frame), CGRectGetWidth(leftSeperatorView.frame), CGRectGetHeight(leftSeperatorView.frame))];
    rightSeperatorView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:rightSeperatorView];

    UILabel *wechatLabel = [[UILabel alloc] initWithFrame:CGRectMake(kHPadding, CGRectGetMaxY(seperatorLabel.frame) + [vPaddings[wechatLabelYKey] floatValue], screenSize.width - kHPadding - kHPadding, CGRectGetHeight(seperatorLabel.frame))];
    wechatLabel.text = @"使用微信账号直接登录";
    wechatLabel.textColor = [UIColor whiteColor];
    wechatLabel.font = [UIFont ct_appFontWithSize:13];
    wechatLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:wechatLabel];

    CGFloat wechatButtonDimension = 69;
    UIButton *wechatButton = [[UIButton alloc] initWithFrame:CGRectMake((screenSize.width - wechatButtonDimension) / 2, CGRectGetMaxY(wechatLabel.frame) + [vPaddings[wechatButtonYKey] floatValue], wechatButtonDimension, wechatButtonDimension)];
    [wechatButton setBackgroundImage:[UIImage imageNamed:@"WeChatLoginIcon"] forState:UIControlStateNormal];
    [wechatButton addTarget:self action:@selector(_wechatLoginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:wechatButton];

    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(kHPadding, CGRectGetMaxY(wechatButton.frame) + [vPaddings[registerButtonYKey] floatValue], screenSize.width - kHPadding - kHPadding, CGRectGetHeight(wechatLabel.frame))];
    [registerButton addTarget:self action:@selector(_registerButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    UILabel *registerLabel = [[UILabel alloc] initWithFrame:registerButton.bounds];
    registerLabel.textAlignment = NSTextAlignmentCenter;
    whiteText = @"没有账号？去";
    NSString *yellowText = @"注册";
    text = [NSString stringWithFormat:@"%@%@", whiteText, yellowText];
    attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString setAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont ct_appFontWithSize:14]  } range:[text rangeOfString:whiteText]];
    [attributedString setAttributes:@{ NSForegroundColorAttributeName : [UIColor ct_yellowColor], NSFontAttributeName : [UIFont ct_appFontWithSize:14] } range:[text rangeOfString:yellowText]];
    registerLabel.attributedText = attributedString;
    [registerButton addSubview:registerLabel];

//    if ([WXApi isWXAppInstalled]) {
//        _wechatLoginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
//        _wechatLoginButton.backgroundColor = [UIColor redColor];
//        [_wechatLoginButton addTarget:self action:@selector(_wechatLoginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:_wechatLoginButton];
//    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocationInUsernameTextField = [touch locationInView:_usernameTextField];
    CGPoint touchLocationInPasswordTextField = [touch locationInView:_passwordTextField];
    if (!CGRectContainsPoint(_usernameTextField.bounds, touchLocationInUsernameTextField) && !CGRectContainsPoint(_passwordTextField.bounds, touchLocationInPasswordTextField)) {
        [self.view endEditing:YES];
    }
}

# pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return YES;
}

# pragma mark - WXApiDelegate

//- (void)onResp:(BaseResp *)resp {
//    if ([resp isKindOfClass:[SendAuthResp class]]) {
//        SendAuthResp *authResp = (SendAuthResp *)resp;
//        __weak typeof(self) weakSelf = self;
//        [[CTWXHTTPSessionManager sharedHTTPSessionManager] authorizeWithSendAuthResp:authResp success:^{
//            [weakSelf _getUserInfo];
//        } failure:^(NSError * _Nonnull error) {
//        }];
//    }
//}

# pragma mark - Private methods

- (void)_dismissButtonTapped:(UIButton *)sender {
    [self.navigationController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)_wechatLoginButtonTapped:(UIButton *)sender {
    __weak typeof(self) weakSelf = self;
    [[CTWXHTTPSessionManager sharedHTTPSessionManager] refreshTokenIfPossibleWithSuccess:^(BOOL accessTokenExpired) {
        if (accessTokenExpired) {
            [weakSelf _wechatLogin];
        } else {
            [weakSelf _getUserInfo];
        }
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (void)_wechatLogin {
//    SendAuthReq *req = [SendAuthReq new];
//    // access the user info
//    req.scope = @"snsapi_userinfo";
//    //  a random number to prevent csrf attach
//    req.state = [@(arc4random()) stringValue];
//    [WXApi sendReq:req];
}

- (void)_getUserInfo {
    [[CTWXHTTPSessionManager sharedHTTPSessionManager] getUserInfoWithSuccess:^(NSDictionary * _Nonnull userDict) {
        // Initialize the user
        // Navigate to Home
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (void)_loginButtonTapped:(UIButton *)sender {
    NSString *username = _usernameTextField.text;
    NSString *password = _passwordTextField.text;
    if (username.length) {
        if (password.length) {
            [[CTHTTPSessionManager sharedHTTPSessionManager] loginWithUsername:username password:password success:^(CTUser * _Nonnull user) {
            } failure:^(NSError * _Nonnull error) {
                NSLog(@"%@", error);
            }];
        } else {
            // alert: password is empty
        }
    } else {
        // alert: username is empty
    }
}

- (void)_policyButtonTapped:(UIButton *)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)_registerButtonTapped:(UIButton *)sender {
    CTOnboardingViewController *controller = [CTOnboardingViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
