//
//  LoginViewController.m
//  RCIM
//
//  Created by 郑文明 on 15/12/30.
//  Copyright © 2015年 郑文明. All rights reserved.
//

#import "LoginViewController.h"
#import "RCUserInfo+Addition.h"
#import "AppDelegate.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *userIdTF;
@property (weak, nonatomic) IBOutlet UITextField *portraitUriTF;
@property (weak, nonatomic) IBOutlet UITextField *QQTF;

@property (weak, nonatomic) IBOutlet UITextField *sexTF;
@end

@implementation LoginViewController
- (IBAction)loginAction:(UIButton *)sender {
    if ([self.userNameTF.text isEqualToString:@""]) {
        return;
    }
    if ([self.userIdTF.text isEqualToString:@""]) {
        return;
    }
    [[RCDataManager shareManager] loginRongCloudWithUserInfo:[[RCUserInfo alloc]initWithUserId:self.userIdTF.text name:self.userNameTF.text portrait:self.portraitUriTF.text QQ:self.QQTF.text sex:self.sexTF.text]];
}
-(void)alreadyLogin:(NSNotification *)notice{
    [self presentViewController:[AppDelegate shareAppDelegate].tabbarVC animated:YES completion:^{
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"模拟登录";
    self.portraitUriTF.text = @"http://weixin.ihk.cn/ihkwx_upload/fodder/20151210/1449727866527.jpg";
    self.userNameTF.text = @"文明";
    self.userIdTF.text = @"1";
    self.QQTF.text = @"740747055";
    self.sexTF.text = @"男";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alreadyLogin:) name:@"alreadyLogin" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

@end
