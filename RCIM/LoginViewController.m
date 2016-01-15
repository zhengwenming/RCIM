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
#import "FriendCell.h"
#import "UIImageView+WebCache.h"

@interface LoginViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *dataSource;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation LoginViewController

-(void)alreadyLogin:(NSNotification *)notice{
    [self presentViewController:[AppDelegate shareAppDelegate].tabbarVC animated:YES completion:^{
    }];
}
-(void)initLoacalTestData{
    dataSource = [[NSMutableArray alloc]init];
    
    for (NSInteger i = 1; i<7; i++) {
        
        
        if(i==1){
            RCUserInfo *aUserInfo =[[RCUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"文明" portrait:@"http://weixin.ihk.cn/ihkwx_upload/fodder/20151210/1449727866527.jpg" QQ:@"740747055" sex:@"男"];
            [dataSource addObject:aUserInfo];
            
        }else if (i==2) {
            RCUserInfo *aUserInfo =[[RCUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"张全蛋" portrait:@"http://weixin.ihk.cn/ihkwx_upload/fodder/20151210/1449727755947.jpg" QQ:@"张全蛋的QQ信息" sex:@"男"];
            [dataSource addObject:aUserInfo];
        }else if(i==3){
            RCUserInfo *aUserInfo =[[RCUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"怕瓦落地" portrait:@"http://pic.ihk.cn/head/base/ihk/2014/04/30/213816839.jpg" QQ:@"帕瓦落地的QQ信息" sex:@"男"];
            [dataSource addObject:aUserInfo];
            
        }else if(i==4){
            RCUserInfo *aUserInfo =[[RCUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"凤姐" portrait:@"http://weixin.ihk.cn/ihkwx_upload/fodder/20151218/1450420944608.jpg" QQ:@"凤姐的QQ信息" sex:@"女"];
            [dataSource addObject:aUserInfo];
            
        }else if(i==5){
            RCUserInfo *aUserInfo =[[RCUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"猴塞雷" portrait:@"http://pic.ihk.cn/head/80_93/ihk/2015/05/20/104331022.jpg" QQ:@"猴塞雷的QQ信息" sex:@"男"];
            [dataSource addObject:aUserInfo];
            
        }else if(i==6){
            RCUserInfo *aUserInfo =[[RCUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"犀利哥" portrait:@"" QQ:@"犀利哥的QQ信息" sex:@"男"];
            [dataSource addObject:aUserInfo];
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLoacalTestData];
    [self.table registerNib:[UINib nibWithNibName:@"FriendCell" bundle:nil] forCellReuseIdentifier:@"FriendCell"];
    self.title = @"选择一个人登录";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alreadyLogin:) name:@"alreadyLogin" object:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 98;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendCell  *cell = (FriendCell *)[tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
    
    RCUserInfo *aUserInfo = dataSource[indexPath.row];
    [cell.portraitImageView sd_setImageWithURL:[NSURL URLWithString:aUserInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"DefaultHeader"]];
    cell.userNameLabel.text = aUserInfo.name;
    cell.QQLabel.text = aUserInfo.QQ;
    cell.sexLabel.text = aUserInfo.sex;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RCUserInfo *aUserInfo = dataSource[indexPath.row];
    NSString *token;
    if([aUserInfo.userId integerValue]==1){
        token = @"YPZX96tteXrJBkOq4137oMiB84K4U91I4g4lR+rfSMxb1+MTtN6Qs+CBmQsA0oXoplkjb+XpS8E1/ycNRHY7Iw==";
    }else if ([aUserInfo.userId integerValue]==2) {
        token = @"JjubCaEVT/msNjSi2QF7BciB84K4U91I4g4lR+rfSMxItOSXUqCncwXtgW5WChhk/GXLkWyL9WU1/ycNRHY7Iw==";

    }else if([aUserInfo.userId integerValue]==3){
        token = @"RiRT5rmPBg4LGcgCi2dT4QGcGFEME62fyalXoKlHsJ9MHTknAcMavUWumLV6el1XyucSWTxn3qDfpYpUCtzRTw==";

    }else if([aUserInfo.userId integerValue]==4){
        
        token = @"lvoKr6oBr5AWDZ54BQ+misiB84K4U91I4g4lR+rfSMxItOSXUqCnc7ufYqrR+WDwde0+LYjIt3c1/ycNRHY7Iw==";

    }else if([aUserInfo.userId integerValue]==5){
        token = @"ihAqgDqgVix2P62H7md63ciB84K4U91I4g4lR+rfSMxItOSXUqCnc+lJna59LkSbgdyXfEEw/gU1/ycNRHY7Iw==";

        
    }else if([aUserInfo.userId integerValue]==6){
        token = @"50KmKa69Hh0e3fVbcEluC8iB84K4U91I4g4lR+rfSMxItOSXUqCnc25Czkoo4lYY1yaUiLrSQbU1/ycNRHY7Iw==";

    }
    
    [[RCDataManager shareManager] loginRongCloudWithUserInfo:[[RCUserInfo alloc]initWithUserId:aUserInfo.userId name:aUserInfo.name portrait:aUserInfo.portraitUri QQ:aUserInfo.QQ sex:aUserInfo.sex] withToken:token];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];    
}

@end
