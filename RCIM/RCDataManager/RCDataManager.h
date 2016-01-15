//
//  RCDataManager.h
//  RCIM
//
//  Created by 郑文明 on 15/12/30.
//  Copyright © 2015年 郑文明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RongIMKit/RongIMKit.h>

@interface RCDataManager : NSObject<RCIMUserInfoDataSource,RCIMGroupInfoDataSource>
+(RCDataManager *) shareManager;
- (void)getUserInfoWithUserId:(NSString*)userId completion:(void (^)(RCUserInfo*))completion;

-(BOOL)hasTheFriendWithUserId:(NSString *)userId;
-(void)loginRongCloudWithUserInfo:(RCUserInfo *)userInfo withToken:(NSString *)token;
/**
 *  从服务器同步好友列表
 */

-(void) syncFriendList:(void (^)(NSMutableArray * friends,BOOL isSuccess))completion;

/**
 *  从服务器同步群组列表
 */

-(void) syncGroupList:(void (^)(NSMutableArray * groups,BOOL isSuccess))completion;


-(void) refreshBadgeValue;
-(NSString *)currentNameWithUserId:(NSString *)userId;
/**
 *  userId 参数用户的id
    获取RCUserInfo
 */
-(RCUserInfo *)currentUserInfoWithUserId:(NSString *)userId;
#pragma mark
#pragma mark 根据userId获取RCGroup


/**
 *  groupId 群组id
 获取RCGroup
 */
-(RCGroup *)currentGroupInfoWithGroupId:(NSString *)groupId;
@end
