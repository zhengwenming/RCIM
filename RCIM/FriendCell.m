

//
//  FriendCell.m
//  RCIM
//
//  Created by 郑文明 on 15/12/30.
//  Copyright © 2015年 郑文明. All rights reserved.
//

#import "FriendCell.h"

@implementation FriendCell

- (void)awakeFromNib {
    // Initialization code
    
    if (@available(iOS 13.0, *)) {
        self.userNameLabel.textColor = [UIColor labelColor];
        self.QQLabel.textColor = [UIColor labelColor];
        self.sexLabel.textColor = [UIColor labelColor];
    } else {
        // Fallback on earlier versions
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
