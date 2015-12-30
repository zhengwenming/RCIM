/**
 * Copyright (c) 2014-2015, RongCloud.
 * All rights reserved.
 *
 * All the contents are the copyright of RongCloud Network Technology Co.Ltd.
 * Unless otherwise credited. http://rongcloud.cn
 *
 */

//  RCInterruptMessage.h
//  Created by xugang on 15/1/12.

#import <Foundation/Foundation.h>
#import "RCMessageContent.h"

/*!
 客服挂断消息的类型名
 */
#define RCInterruptMessageTypeIdentifier @"RC:SpMsg"

/*!
 客服挂断消息类
 
 @discussion 客服挂断消息类，此消息不存储不计入未读消息数。
 结束与客服的会话之前，可以向客服发送一条此消息，客服服务器即可知道用户即将离开客服会话。
 */
@interface RCSuspendMessage : RCMessageContent <RCMessageCoding, RCMessagePersistentCompatible>

/*!
 初始化客服挂断消息
 
 @return 客服挂断消息的对象
 */
- (instancetype)init;

@end
