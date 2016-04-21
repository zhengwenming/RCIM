//
//  RCDataManager.h
//  RCIM
//
//  Created by 郑文明 on 15/12/30.
//  Copyright © 2015年 郑文明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RongIMKit/RongIMKit.h>
/**
 *  RCDataManager类为核心管理融云一切逻辑的类，包括充当用户信息提供者的代理，同步好友列表，同步群组列表，登录融云服务器，刷新角标badgeValue等等
 *  RCDataManager类为自己写的类，和融云SDK无关（不要以为是SDK内部的类）
 */
@interface RCDataManager : NSObject<RCIMUserInfoDataSource,RCIMGroupInfoDataSource>
/**
 *  RCDataManager单例对象
 *
 *  @return RCDataManager单例
 */
+(RCDataManager *) shareManager;
- (void)getUserInfoWithUserId:(NSString*)userId completion:(void (^)(RCUserInfo*))completion;
/**
 *  判断我的好友列表中有没有此人
 *
 *  @param userId 此人的id
 *
 *  @return YES代表有这个好友，NO代表无这个好友
 */
-(BOOL)hasTheFriendWithUserId:(NSString *)userId;
/**
 *  登录融云服务器（connect，用token去连接）
 *
 *  @param userInfo 用户信息
 *  @param token    token令牌
 */
-(void)loginRongCloudWithUserInfo:(RCUserInfo *)userInfo withToken:(NSString *)token;
/**
 *  从服务器同步好友列表
 */

-(void) syncFriendList:(void (^)(NSMutableArray * friends,BOOL isSuccess))completion;

/**
 *  从服务器同步群组列表
 */

-(void) syncGroupList:(void (^)(NSMutableArray * groups,BOOL isSuccess))completion;

/**
 *  刷新tabbar的角标
 */
-(void) refreshBadgeValue;
/**
 *  得到一个用户的名字
 *
 *  @param userId 用户的id
 *
 *  @return 返回用户的名字
 */
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
