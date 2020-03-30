//
//  RCGIFMessageCell.h
//  RongIMKit
//
//  Created by liyan on 2018/12/20.
//  Copyright © 2018年 RongCloud. All rights reserved.
//

#import "RCMessageCell.h"
#import "RCGIFImageView.h"
#import "RCImageMessageProgressView.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCGIFMessageCell : RCMessageCell

/*!
 显示图片缩略图的View
 */
@property (nonatomic, strong) RCGIFImageView *gifImageView;

/*!
 显示发送进度的View
 */
@property (nonatomic, strong) RCImageMessageProgressView *progressView;

@end

NS_ASSUME_NONNULL_END
