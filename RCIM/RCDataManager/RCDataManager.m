



//
//  RCDataManager.m
//  RCIM
//
//  Created by 郑文明 on 15/12/30.
//  Copyright © 2015年 郑文明. All rights reserved.
//

#import "RCDataManager.h"
#import "RCUserInfo+Addition.h"
#import "AppDelegate.h"
@implementation RCDataManager{
        NSMutableArray *dataSoure;
}

- (instancetype)init{
    if (self = [super init]) {
        [RCIM sharedRCIM].userInfoDataSource = self;
    }
    return self;
}

+ (RCDataManager *)shareManager{
    static RCDataManager* manager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[[self class] alloc] init];
    });
    return manager;
}

-(void)syncFriendList:(void (^)(NSMutableArray* friends,BOOL isSuccess))completion
{
    dataSoure = [[NSMutableArray alloc]init];

    for (NSInteger i = 2; i<7; i++) {
        if (i==2) {
          RCUserInfo *aUserInfo =[[RCUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"张全蛋" portrait:@"http://weixin.ihk.cn/ihkwx_upload/fodder/20151210/1449727755947.jpg" QQ:@"张全蛋的QQ信息" sex:@"男"];
            [dataSoure addObject:aUserInfo];
        }else if(i==3){
            RCUserInfo *aUserInfo =[[RCUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"怕瓦落地" portrait:@"http://pic.ihk.cn/head/base/ihk/2014/04/30/213816839.jpg" QQ:@"帕瓦落地的QQ信息" sex:@"男"];
            [dataSoure addObject:aUserInfo];

        }else if(i==4){
            RCUserInfo *aUserInfo =[[RCUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"凤姐" portrait:@"http://weixin.ihk.cn/ihkwx_upload/fodder/20151218/1450420944608.jpg" QQ:@"凤姐的QQ信息" sex:@"女"];
            [dataSoure addObject:aUserInfo];
            
        }else if(i==5){
            RCUserInfo *aUserInfo =[[RCUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"猴塞雷" portrait:@"http://pic.ihk.cn/head/80_93/ihk/2015/05/20/104331022.jpg" QQ:@"猴塞雷的QQ信息" sex:@"男"];
            [dataSoure addObject:aUserInfo];
            
        }else if(i==6){
            RCUserInfo *aUserInfo =[[RCUserInfo alloc]initWithUserId:[NSString stringWithFormat:@"%ld",i] name:@"犀利哥" portrait:@"" QQ:@"犀利哥的QQ信息" sex:@"男"];
            [dataSoure addObject:aUserInfo];
            
        }
        
        
    }
    [AppDelegate shareAppDelegate].friendsArray = dataSoure;
    completion(dataSoure,YES);

}
-(RCUserInfo *)currentUserInfoWithUserId:(NSString *)userId{
    for (NSInteger i = 0; i<[AppDelegate shareAppDelegate].friendsArray.count; i++) {
        RCUserInfo *aUser = [AppDelegate shareAppDelegate].friendsArray[i];
        if ([userId isEqualToString:aUser.userId]) {
            NSLog(@"current ＝ %@",aUser.name);
            return aUser;
        }
    }
    return nil;
}
-(NSString *)currentNameWithUserId:(NSString *)userId{
    for (NSInteger i = 0; i<[AppDelegate shareAppDelegate].friendsArray.count; i++) {
        RCUserInfo *aUser = [AppDelegate shareAppDelegate].friendsArray[i];
        if ([userId isEqualToString:aUser.userId]) {
            NSLog(@"current ＝ %@",aUser.name);
            return aUser.name;
        }
    }
    return nil;
}
#pragma mark - RCIMUserInfoDataSource
- (void)getUserInfoWithUserId:(NSString*)userId completion:(void (^)(RCUserInfo*))completion
{
    NSLog(@"getUserInfoWithUserId ----- %@", userId);
    
    if (userId == nil || [userId length] == 0 )
    {
        [self syncFriendList:^(NSMutableArray *friends, BOOL isSuccess) {
            
        }];
        
        completion(nil);
        return ;
    }
    
    if ([userId isEqualToString:[RCIM sharedRCIM].currentUserInfo.userId]) {
        RCUserInfo *myselfInfo = [[RCUserInfo alloc]initWithUserId:[RCIM sharedRCIM].currentUserInfo.userId name:[RCIM sharedRCIM].currentUserInfo.name portrait:[RCIM sharedRCIM].currentUserInfo.portraitUri QQ:[RCIM sharedRCIM].currentUserInfo.QQ sex:[RCIM sharedRCIM].currentUserInfo.sex];
        completion(myselfInfo);
    }
    
    for (NSInteger i = 0; i<[AppDelegate shareAppDelegate].friendsArray.count; i++) {
        RCUserInfo *aUser = [AppDelegate shareAppDelegate].friendsArray[i];
        if ([userId isEqualToString:aUser.userId]) {
            completion(aUser);
        }
    }
}
-(void)loginRongCloudWithUserInfo:(RCUserInfo *)userInfo{
                [[RCIM sharedRCIM] connectWithToken:@"YPZX96tteXrJBkOq4137oMiB84K4U91I4g4lR+rfSMxb1+MTtN6Qs+CBmQsA0oXoplkjb+XpS8E1/ycNRHY7Iw==" success:^(NSString *userId) {
                    [RCIM sharedRCIM].globalNavigationBarTintColor = [UIColor redColor];
                    NSLog(@"login success with userId %@",userId);
                    //同步好友列表
                    [self syncFriendList:^(NSMutableArray *friends, BOOL isSuccess) {
                        NSLog(@"%@",friends);
                        if (isSuccess) {
                            NSLog(@" success 发送通知");
                            [[NSNotificationCenter defaultCenter] postNotificationName:@"alreadyLogin" object:nil];
                        }
                    }];
                    

                    [RCIMClient sharedRCIMClient].currentUserInfo = userInfo;
                    [[RCDataManager shareManager] refreshBadgeValue];
                } error:^(RCConnectErrorCode status) {
                    NSLog(@"status = %ld",(long)status);
                } tokenIncorrect:^{
                    
                    NSLog(@"token 错误");
                }];
            
            
        
   
}

-(void)refreshBadgeValue{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        
        NSInteger unreadMsgCount = (NSInteger)[[RCIMClient sharedRCIMClient] getUnreadCount:@[@(ConversationType_PRIVATE)]];
        UINavigationController  *chatNav = [AppDelegate shareAppDelegate].tabbarVC.viewControllers[0];
        if (unreadMsgCount == 0) {
            chatNav.tabBarItem.badgeValue = nil;
        }else{
            chatNav.tabBarItem.badgeValue = [NSString stringWithFormat:@"%li",(long)unreadMsgCount];
            
        }
    });
}
-(BOOL)hasTheFriendWithUserId:(NSString *)userId{
    if ([AppDelegate shareAppDelegate].friendsArray.count) {
        NSMutableArray *tempArray = [[NSMutableArray alloc]init];
        
        for (RCUserInfo *aUserInfo in [AppDelegate shareAppDelegate].friendsArray) {
            [tempArray addObject:aUserInfo.userId];
        }
        
        if ([tempArray containsObject:userId]) {
            return YES;
        }
    }
    
    
    return NO;
}
@end

