/**
 * Copyright (c) 2014-2015, RongCloud.
 * All rights reserved.
 *
 * All the contents are the copyright of RongCloud Network Technology Co.Ltd.
 * Unless otherwise credited. http://rongcloud.cn
 *
 */

//  RCHandShakeMessage.h
//  Created by Heq.Shinoda on 14-6-30.

#import "RCMessageContent.h"

/*!
 客服握手消息的类型名
 */
#define RCHandShakeMessageTypeIdentifier @"RC:HsMsg"

/*!
 客服握手消息类
 
 @discussion 客服握手消息类，此消息不存储不计入未读消息数。
 给客服发送消息之前，可以向客服发送一条此消息，客服服务器即可获取当前的用户ID或用户信息。
 */
@interface RCHandShakeMessage : RCMessageContent <RCMessageCoding, RCMessagePersistentCompatible>

/*!
 初始化客服握手消息
 
 @return 客服握手消息的对象
 */
- (instancetype)init;

@end
