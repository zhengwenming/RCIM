//
//  PersonCenterViewController.m
//  RCIM
//
//  Created by 郑文明 on 16/1/15.
//  Copyright © 2016年 郑文明. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "WMConversationViewController.h"
#import "AppDelegate.h"
#import "UIImageView+WebCache.h"
@interface PersonCenterViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *dataSource;
    UIView *headerView;
    UIImageView *headerIV;
    UIButton *chatBtn;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation PersonCenterViewController

-(void)logoutAction:(UIBarButtonItem *)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        [[RCIMClient sharedRCIMClient] disconnect:YES];
    }];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.showUserInfo==nil) {
        self.showUserInfo = [RCIM sharedRCIM].currentUserInfo;
    }
    dataSource = [[NSMutableArray alloc]init];
    [dataSource addObject:[NSString stringWithFormat:@"姓名:%@",self.showUserInfo.name]];
    [dataSource addObject:[NSString stringWithFormat:@"QQ:%@",self.showUserInfo.QQ]];
    [dataSource addObject:[NSString stringWithFormat:@"性别:%@",self.showUserInfo.sex]];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTableAndHeader];
}
-(void)initTableAndHeader{
    
    chatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    chatBtn.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
    [chatBtn setTitle:@"私聊" forState:UIControlStateNormal];
    [chatBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [chatBtn addTarget:self action:@selector(chatRightNow:) forControlEvents:UIControlEventTouchUpInside];
    chatBtn.backgroundColor = [UIColor lightGrayColor];
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, (self.view.frame.size.width)*1/3)];
    headerView.backgroundColor = [UIColor lightGrayColor];
    headerIV = [[UIImageView alloc]initWithFrame:headerView.bounds];
    [headerIV sd_setImageWithURL:[NSURL URLWithString:self.showUserInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"DefaultHeader"]];
    [headerView addSubview:headerIV];
    
    
    

    self.table.estimatedRowHeight = 1000;
    self.table.rowHeight = UITableViewAutomaticDimension;
    self.table.backgroundColor = [UIColor whiteColor];
    self.table.tableFooterView = chatBtn;
    self.table.tableHeaderView = headerView;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [headerIV sd_setImageWithURL:[NSURL URLWithString:self.showUserInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"DefaultHeader"]];
    return dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = dataSource[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)chatRightNow:(UIButton *)sender {
    
    if (self.showUserInfo) {
        WMConversationViewController *_conversationVC = [[WMConversationViewController alloc]init];
        _conversationVC.conversationType = ConversationType_PRIVATE;
        
        _conversationVC.targetId = self.showUserInfo.userId;
        _conversationVC.title = [NSString stringWithFormat:@"%@",self.showUserInfo.name];
        [self.navigationController pushViewController:_conversationVC animated:YES];
    }else{
        WMConversationViewController *_conversationVC = [[WMConversationViewController alloc]init];
        _conversationVC.conversationType = ConversationType_PRIVATE;
        _conversationVC.targetId = [RCIM sharedRCIM].currentUserInfo.userId;
        _conversationVC.title = [NSString stringWithFormat:@"%@",[RCIM sharedRCIM].currentUserInfo.name];
        [self.navigationController pushViewController:_conversationVC animated:YES];
    }
    
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset = self.table.contentOffset.y;
    //向上偏移量变正  向下偏移量变负
    CGFloat confuse = headerView.frame.size.height;
    if (yOffset < 0) {
        CGFloat factor = ABS(yOffset)+confuse;
        CGRect f = CGRectMake(-([[UIScreen mainScreen] bounds].size.width*factor/(confuse)-[[UIScreen mainScreen] bounds].size.width)/2,-ABS(yOffset), [[UIScreen mainScreen] bounds].size.width*factor/(confuse), factor);
        headerIV.frame = f;
    }else {
        CGRect f = headerView.frame;
        f.origin.y = 0;
        headerView.frame = f;
        headerIV.frame = CGRectMake(0, f.origin.y, [[UIScreen mainScreen] bounds].size.width, (confuse));
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
