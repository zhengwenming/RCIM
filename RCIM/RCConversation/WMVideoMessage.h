//
//  WMVideoMessage.h
//  RCIM
//
//  Created by 郑文明 on 16/4/20.
//  Copyright © 2016年 郑文明. All rights reserved.
//

#import <RongIMLib/RongIMLib.h>
#import <RongIMLib/RCMessageContentView.h>
#define RCLocalMessageTypeIdentifier @”RC:SimpleMsg”
@interface WMVideoMessage : RCMessageContent<NSCoding,RCMessageContentView>
@property(nonatomic,strong)NSString *content;
@property(nonatomic, strong) NSString* extra;
+(instancetype)messageWithContent:(NSString *)content;

@end
