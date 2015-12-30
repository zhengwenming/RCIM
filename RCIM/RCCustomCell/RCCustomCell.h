//
//  RCCustomCell.h
//  RCIM
//
//  Created by 郑文明 on 15/12/30.
//  Copyright © 2015年 郑文明. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>
#import "PPDragDropBadgeView.h"
#define kCellHeight 80

@interface RCCustomCell : RCConversationBaseCell
///头像
@property (nonatomic,retain) UIImageView *avatarIV;
///真实姓名
@property (nonatomic,retain) UILabel *nameLabel;
///时间
@property (nonatomic,retain) UILabel *timeLabel;
///内容
@property (nonatomic,retain) UILabel *contentLabel;
///角标（UIView）
@property (nonatomic,retain) PPDragDropBadgeView *ppBadgeView;
@end
