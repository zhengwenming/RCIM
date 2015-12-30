//
//  RCDataManager.h
//  RCIM
//
//  Created by 郑文明 on 15/12/30.
//  Copyright © 2015年 郑文明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RongIMKit/RongIMKit.h>

@interface RCDataManager : NSObject<RCIMUserInfoDataSource>
+(RCDataManager *) shareManager;
- (void)getUserInfoWithUserId:(NSString*)userId completion:(void (^)(RCUserInfo*))completion;

-(BOOL)hasTheFriendWithUserId:(NSString *)userId;
-(void)loginRongCloudWithUserInfo:(RCUserInfo *)userInfo;
/**
 *  从服务器同步好友列表
 */
-(void) syncFriendList:(void (^)(NSMutableArray * friends,BOOL isSuccess))completion;
-(void) refreshBadgeValue;
-(NSString *)currentNameWithUserId:(NSString *)userId;
-(RCUserInfo *)currentUserInfoWithUserId:(NSString *)userId;
@end
