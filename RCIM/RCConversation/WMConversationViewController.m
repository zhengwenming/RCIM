



//
//  WMConversationViewController.m
//  RCIM
//
//  Created by 郑文明 on 15/12/30.
//  Copyright © 2015年 郑文明. All rights reserved.
//

#import "WMConversationViewController.h"
#import "WMVideoMessage.h"
#import "WMVideoMessageCell.h"
/*!
 消息Cell点击的回调  RCMessageCellDelegate（我们要点击cell，播放视频，所以要遵守这个代理，然后实现点击cell的方法）
 */
@interface WMConversationViewController ()<RCMessageCellDelegate>

@end

@implementation WMConversationViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //在功能面板上插入一个Item，用来发送视频，并标记tag，方便区分
    [self.pluginBoardView insertItemWithImage:[UIImage imageNamed:@"add_ico"]
                                        title:@"发送视频"
                                          tag:201];
    
    ///注册自定义视频消息Cell
    [self registerClass:[WMVideoMessageCell class] forCellWithReuseIdentifier:@"WMVideoMessageCell"];
}
//功能面板点击事件的方法，通过tag区分点击到的哪个item
- (void)pluginBoardView:(RCPluginBoardView *)pluginBoardView clickedItemWithTag:(NSInteger)tag{
    switch (tag) {
        case 201:
        {
            [super pluginBoardView:pluginBoardView clickedItemWithTag:tag];//记得调用super父类的方法
            NSLog(@"shipin");
            //初始化一个视频消息，传进去参数conten，为一个视频的url
            WMVideoMessage *videoMessage=[WMVideoMessage messageWithContent:@"http://admin.weixin.ihk.cn/ihkwx_upload/test.mp4"];
            //发送消息
            [self sendMessage:videoMessage pushContent:nil];
        }
            break;
        default:
            [super pluginBoardView:pluginBoardView clickedItemWithTag:tag];
            NSLog(@"%ld",(long)pluginBoardView.tag);
            break;
    }
}
- (RCMessageBaseCell *)rcConversationCollectionView:(UICollectionView *)collectionView
                             cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RCMessageModel *model =
    [self.conversationDataRepository objectAtIndex:indexPath.row];
    
    if (!self.displayUserNameInCell) {
        if (model.messageDirection == MessageDirection_RECEIVE) {
            model.isDisplayNickname = NO;
        }
    }
    RCMessageContent *messageContent = model.content;
    
    if ([messageContent isMemberOfClass:[WMVideoMessage class]])
    {
        WMVideoMessageCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"WMVideoMessageCell" forIndexPath:indexPath];
        [cell setDataModel:model];
        [cell setDelegate:self];
        return cell;
    }
    else {
        return [super rcConversationCollectionView:collectionView cellForItemAtIndexPath:indexPath];
    }
}
- (CGSize)rcConversationCollectionView:(UICollectionView *)collectionView
                                layout:(UICollectionViewLayout *)collectionViewLayout
                sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    RCMessageModel *model = [self.conversationDataRepository objectAtIndex:indexPath.row];
    RCMessageContent *messageContent = model.content;
    if ([messageContent isMemberOfClass:[RCRealTimeLocationStartMessage class]]) {
        if (model.isDisplayMessageTime) {
            return CGSizeMake(collectionView.frame.size.width, 66);
        }
        return CGSizeMake(collectionView.frame.size.width, 66);
    }   else if ([messageContent isMemberOfClass:[WMVideoMessage class]])
    {
        return CGSizeMake(collectionView.frame.size.width, 140);
    }
    else {
        return [super rcConversationCollectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

