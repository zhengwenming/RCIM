
//
//  GroupListViewController.m
//  RCIM
//
//  Created by 郑文明 on 16/1/11.
//  Copyright © 2016年 郑文明. All rights reserved.
//

#import "GroupListViewController.h"
#import "FriendCell.h"
#import "AppDelegate.h"
#import "UIImageView+WebCache.h"
#import "WMConversationViewController.h"
@interface GroupListViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *groupsArray;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation GroupListViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        groupsArray = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    groupsArray = [AppDelegate shareAppDelegate].groupsArray;

    [self.table registerNib:[UINib nibWithNibName:@"FriendCell" bundle:nil] forCellReuseIdentifier:@"FriendCell"];
    self.table.tableFooterView = [UIView new];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return groupsArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 98;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendCell  *cell = (FriendCell *)[tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
    RCGroup *aGroupInfo = groupsArray[indexPath.row];
    [cell.portraitImageView sd_setImageWithURL:[NSURL URLWithString:aGroupInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"DefaultHeader"]];
    cell.userNameLabel.text = aGroupInfo.groupName;
    cell.QQLabel.text = [NSString stringWithFormat:@"帮ID= %@",aGroupInfo.groupId];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RCGroup *aGroupInfo = groupsArray[indexPath.row];
    WMConversationViewController *_conversationVC = [[WMConversationViewController alloc]init];
    _conversationVC.conversationType = ConversationType_GROUP;
    _conversationVC.targetId = aGroupInfo.groupId;
    _conversationVC.title = [NSString stringWithFormat:@"%@",aGroupInfo.groupName];
    [self.navigationController pushViewController:_conversationVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
