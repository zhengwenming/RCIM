
//
//  RCCustomCell.m
//  RCIM
//
//  Created by 郑文明 on 15/12/30.
//  Copyright © 2015年 郑文明. All rights reserved.
//

#import "RCCustomCell.h"
#define kbadageWidth 20
#define kgap 10
@implementation RCCustomCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //头像
        self.avatarIV = [[UIImageView alloc]initWithFrame:CGRectMake(kgap, kgap, kCellHeight-2*kgap, kCellHeight-2*kgap)];
        self.avatarIV.clipsToBounds = YES;
        self.avatarIV.layer.cornerRadius = 8;
        [self.contentView addSubview:self.avatarIV];
        //realName
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarIV.frame.origin.x+self.avatarIV.frame.size.width+kgap, self.avatarIV.frame.origin.y+7,[UIScreen mainScreen].bounds.size.width-self.avatarIV.frame.size.width-2*kgap-80, self.avatarIV.frame.size.height/2-kgap/2)];
        self.nameLabel.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.nameLabel];
   
        //时间
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.nameLabel.frame.origin.x+self.nameLabel.frame.size.width, self.nameLabel.frame.origin.y, [UIScreen mainScreen].bounds.size.width-2*kgap-self.nameLabel.frame.size.width, self.nameLabel.frame.size.height)];
        self.timeLabel.textAlignment = NSTextAlignmentLeft;

        self.timeLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.timeLabel];
        //内容
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.nameLabel.frame.origin.x, self.nameLabel.frame.origin.y+self.nameLabel.frame.size.height+2, self.nameLabel.frame.size.width+2*kgap, self.nameLabel.frame.size.height)];

        self.contentLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.contentLabel];
        //角标
        self.ppBadgeView = [[PPDragDropBadgeView alloc]initWithFrame:CGRectMake(self.contentLabel.frame.origin.x+self.contentLabel.frame.size.width, self.contentLabel.frame.origin.y, 25, 25)];
        self.ppBadgeView.fontSize = 12;
        [self.contentView addSubview:self.ppBadgeView];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
}
@end
