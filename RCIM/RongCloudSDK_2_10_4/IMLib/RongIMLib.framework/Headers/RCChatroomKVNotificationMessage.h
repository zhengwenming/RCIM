//
//  RCChatroomKVNotificationMessage.h
//  RongIMLib
//
//  Created by 孙浩 on 2019/10/14.
//  Copyright © 2019 RongCloud. All rights reserved.
//

#import <RongIMLib/RongIMLib.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 聊天室自定义属性通知消息的类型名
 */
#define RCChatroomKVNotificationMessageTypeIdentifier @"RC:chrmKVNotiMsg"

typedef NS_ENUM(NSInteger, RCChatroomKVNotificationType) {
    /*!
     设置 KV 的操作
     */
    RCChatroomKVNotificationTypeSet = 1,
    /*!
     删除 KV 的操作
     */
    RCChatroomKVNotificationTypeRemove = 2
};

/**
聊天室自定义属性通知消息

@discussion 不要随意构造此类消息发送，调用设置或者删除接口时会自动构建。
*/
@interface RCChatroomKVNotificationMessage : RCMessageContent

/*!
 聊天室操作的类型
*/
@property (nonatomic, assign) RCChatroomKVNotificationType type;

/*!
 聊天室属性名称
 */
@property (nonatomic, copy) NSString *key;

/*!
 聊天室属性对应的值
 */
@property (nonatomic, copy) NSString *value;

/*!
 通知消息的自定义字段，最大长度 2 kb
 */
@property (nonatomic, copy) NSString *extra;

/*!
初始化聊天室自定义属性通知消息

@param key 聊天室属性名称
@param value 聊天室属性对应的值（删除 key 时不用传）
@param extra 通知消息的自定义字段
@return 聊天室自定义属性通知消息的对象
*/
+ (instancetype)notificationWithType:(RCChatroomKVNotificationType)type
                                 key:(NSString *)key
                               value:(NSString *_Nullable)value
                               extra:(NSString *)extra;

@end

NS_ASSUME_NONNULL_END
