//
//  WMVideoMessageCell.h
//  RCIM
//
//  Created by 郑文明 on 16/4/20.
//  Copyright © 2016年 郑文明. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

@interface WMVideoMessageCell : RCMessageCell
@property(nonatomic, strong) UIImageView *bubbleBackgroundView;
@property(nonatomic,strong)UIWebView *webView;
- (void)setDataModel:(RCMessageModel *)model;
- (void)initialize;
@end
