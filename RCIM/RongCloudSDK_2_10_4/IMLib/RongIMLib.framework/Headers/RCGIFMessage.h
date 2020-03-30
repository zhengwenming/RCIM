//
//  RCGIFMessage.h
//  RongIMLib
//
//  Created by liyan on 2018/12/20.
//  Copyright © 2018年 RongCloud. All rights reserved.
//

#import <RongIMLib/RongIMLib.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 GIF 消息的类型名
 */
#define RCGIFMessageTypeIdentifier @"RC:GIFMsg"

@interface RCGIFMessage : RCMediaMessageContent

/*!
 GIF 图的大小
 */
@property (nonatomic, assign) long long gifDataSize;

/*!
 GIF 图的宽
 */
@property (nonatomic, assign) long width;

/*!
 GIF 图的高
 */
@property (nonatomic, assign) long height;

/*!
 GIF 消息的附加信息
 */
@property (nonatomic, copy) NSString *extra;

/*!
 初始化 GIF 消息

 @param gifImageData    GIF 图的数据
 @param width           GIF 的宽
 @param height          GIF 的高

 @return                GIF消息对象
 */
+ (instancetype)messageWithGIFImageData:(NSData *)gifImageData width:(long)width height:(long)height;

/*!
 初始化 GIF 消息

 @param gifURI          GIF 的本地路径
 @param width           GIF 的宽
 @param height          GIF 的高

 @return                GIF消息对象
 */
+ (instancetype)messageWithGIFURI:(NSString *)gifURI width:(long)width height:(long)height;

@end

NS_ASSUME_NONNULL_END
