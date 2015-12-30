//
//  FriendCell.h
//  RCIM
//
//  Created by 郑文明 on 15/12/30.
//  Copyright © 2015年 郑文明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *portraitImageView;

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;



@property (weak, nonatomic) IBOutlet UILabel *sexLabel;


@property (weak, nonatomic) IBOutlet UILabel *QQLabel;

@end
