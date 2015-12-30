//
//  WMPersonalPageViewController.m
//  RCIM
//
//  Created by 郑文明 on 15/12/30.
//  Copyright © 2015年 郑文明. All rights reserved.
//

#import "WMPersonalPageViewController.h"
#import "WMConversationViewController.h"
@interface WMPersonalPageViewController ()

@end

@implementation WMPersonalPageViewController
-(void)logoutAction:(UIBarButtonItem *)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        [[RCIMClient sharedRCIMClient] disconnect:YES];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"退出登录" style:UIBarButtonItemStylePlain target:self action:@selector(logoutAction:)];
}
- (IBAction)chatRightNow:(UIButton *)sender {
    WMConversationViewController *_conversationVC = [[WMConversationViewController alloc]init];
    _conversationVC.conversationType = ConversationType_PRIVATE;
    _conversationVC.targetId = [NSString stringWithFormat:@"%@",[RCIM sharedRCIM].currentUserInfo.userId];
    _conversationVC.title = [NSString stringWithFormat:@"%@",[RCIM sharedRCIM].currentUserInfo.name];
    [self.navigationController pushViewController:_conversationVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
