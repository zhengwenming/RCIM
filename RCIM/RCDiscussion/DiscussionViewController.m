


//
//  DiscussionViewController.m
//  RCIM
//
//  Created by 郑文明 on 16/1/11.
//  Copyright © 2016年 郑文明. All rights reserved.
//

#import "DiscussionViewController.h"
#import "AppDelegate.h"

@interface DiscussionViewController (){
 
}

@end

@implementation DiscussionViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
/**
 *  创建讨论组
 *
 *  @param sender sender 按钮
 */
-(IBAction)createDiscussionAction:(UIButton *)sender{
    
    NSMutableArray *IDS = [[NSMutableArray alloc]init];

    for (RCUserInfo *friendsInfo in [AppDelegate shareAppDelegate].friendsArray) {
        [IDS addObject:friendsInfo.userId];
    }
    if (![IDS containsObject:[RCIM sharedRCIM].currentUserInfo.userId]) {
        [IDS addObject:[RCIM sharedRCIM].currentUserInfo.userId];
    }
    
    [[RCIMClient sharedRCIMClient] createDiscussion:@"融云学习讨论组" userIdList:IDS success:^(RCDiscussion *discussion) {
        NSLog(@"success  %@",discussion.discussionName);
        NSLog(@"%@",discussion.discussionId);
        self.discussionId = discussion.discussionId;
        dispatch_async(dispatch_get_main_queue(), ^{
            [WMUtil showTipsWithHUD:@"成功加入讨论组"];
        });

    } error:^(RCErrorCode status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [WMUtil showTipsWithHUD:@"创建讨论组失败"];
        });
        NSLog(@"faild %ld",status);

    }];
}

/**
 *  讨论组加人
 *
 *  @param sender sender 按钮
 */
-(IBAction)addMemberAction:(UIButton *)sender{
    if (self.discussionId) {
        NSMutableArray *IDS = [[NSMutableArray alloc]init];
        
        for (RCUserInfo *aUserInfo in [AppDelegate shareAppDelegate].friendsArray) {
            [IDS addObject:aUserInfo.userId];
        }
        [[RCIMClient sharedRCIMClient] addMemberToDiscussion:self.discussionId userIdList:IDS success:^(RCDiscussion *discussion) {
            NSLog(@"%@",discussion.discussionName);
            dispatch_async(dispatch_get_main_queue(), ^{
                [WMUtil showTipsWithHUD:@"加入讨论组成功"];
            });

        } error:^(RCErrorCode status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [WMUtil showTipsWithHUD:@"加入讨论组失败"];
            });

            NSLog(@"加入讨论组失败%ld",status);
        }];

    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [WMUtil showTipsWithHUD:@"请先创建讨论组"];
        });

    }
}
/**
 *  讨论T人
 *
 *  @param sender sender 按钮
 */
-(IBAction)removeMemberAction:(UIButton *)sender{
    
    NSString *theMemberID ;
    NSString *theMemberName;
    if (self.discussionId) {
        NSArray  *Members = [AppDelegate shareAppDelegate].friendsArray;
        
        for (NSInteger i = 0; i<Members.count; i++) {
            RCUserInfo *aMember = Members[i];
            if (![aMember.userId isEqualToString:[RCIM sharedRCIM].currentUserInfo.userId]) {
                theMemberID = aMember.userId;
                theMemberName = aMember.name;
                break;
            }
        }
        
        
        [[RCIMClient sharedRCIMClient] removeMemberFromDiscussion:self.discussionId userId:theMemberID success:^(RCDiscussion *discussion) {
            NSLog(@"T人成功 %@",discussion.discussionName);
            dispatch_async(dispatch_get_main_queue(), ^{
                [WMUtil showTipsWithHUD:[NSString stringWithFormat:@"%@被T出讨论组",theMemberName]];
            });
            
        } error:^(RCErrorCode status) {
            NSLog(@"T人失败 %ld",status);
            dispatch_async(dispatch_get_main_queue(), ^{
                [WMUtil showTipsWithHUD:@"T人失败"];
            });

        }];
        
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [WMUtil showTipsWithHUD:@"请先创建讨论组"];
        });

    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
