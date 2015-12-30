//
//  MyFriendsListViewController.m
//  RCIM
//
//  Created by 郑文明 on 15/12/30.
//  Copyright © 2015年 郑文明. All rights reserved.
//

#import "MyFriendsListViewController.h"
#import "AppDelegate.h"
#import "FriendCell.h"
#import "UIImageView+WebCache.h"
#import "RCUserInfo+Addition.h"
#import "WMConversationViewController.h"

@interface MyFriendsListViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *table;
    NSMutableArray *friendsArray;
}

@end

@implementation MyFriendsListViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        friendsArray = [[NSMutableArray alloc]init];
    }
    return self;
}
-(void)dealData{
      friendsArray = [AppDelegate shareAppDelegate].friendsArray;
    [friendsArray addObject:[RCIM sharedRCIM].currentUserInfo];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self dealData];
    [self initTable];
}
-(void)initTable{
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    table.dataSource = self;
    table.delegate =  self;
    [table registerNib:[UINib nibWithNibName:@"FriendCell" bundle:nil] forCellReuseIdentifier:@"FriendCell"];
    table.tableFooterView = [UIView new];
    [self.view addSubview:table];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return friendsArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 98;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendCell  *cell = (FriendCell *)[tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
   
    RCUserInfo *aUserInfo = friendsArray[indexPath.row];
    [cell.portraitImageView sd_setImageWithURL:[NSURL URLWithString:aUserInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"DefaultHeader"]];
    cell.userNameLabel.text = aUserInfo.name;
    cell.QQLabel.text = aUserInfo.QQ;
    cell.sexLabel.text = aUserInfo.sex;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RCUserInfo *aUserInfo = friendsArray[indexPath.row];
    NSLog(@"%@",aUserInfo.portraitUri);

    //开始进入会话聊天的界面，进行聊天
     WMConversationViewController *_conversationVC = [[WMConversationViewController alloc]init];
    _conversationVC.conversationType = ConversationType_PRIVATE;
    _conversationVC.targetId = [NSString stringWithFormat:@"%@",aUserInfo.userId];
    _conversationVC.title = [NSString stringWithFormat:@"%@",aUserInfo.name];
    [self.navigationController pushViewController:_conversationVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
