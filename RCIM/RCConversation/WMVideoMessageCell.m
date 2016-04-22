


//
//  WMVideoMessageCell.m
//  RCIM
//
//  Created by 郑文明 on 16/4/20.
//  Copyright © 2016年 郑文明. All rights reserved.
//

#import "WMVideoMessageCell.h"
#import "WMVideoMessage.h"

@implementation WMVideoMessageCell

- (NSDictionary *)attributeDictionary {
    if (self.messageDirection == MessageDirection_SEND) {
        return @{
                 @(NSTextCheckingTypeLink) : @{NSForegroundColorAttributeName : [UIColor blueColor]},
                 @(NSTextCheckingTypePhoneNumber) : @{NSForegroundColorAttributeName : [UIColor blueColor]}
                 };
    } else {
        return @{
                 @(NSTextCheckingTypeLink) : @{NSForegroundColorAttributeName : [UIColor blueColor]},
                 @(NSTextCheckingTypePhoneNumber) : @{NSForegroundColorAttributeName : [UIColor blueColor]}
                 };
    }
    return nil;
}

- (NSDictionary *)highlightedAttributeDictionary {
    return [self attributeDictionary];
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}
- (void)initialize {
    self.bubbleBackgroundView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.messageContentView addSubview:self.bubbleBackgroundView];
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    //    self.textLabel.attributeDictionary = [self attributeDictionary];
    //    self.textLabel.highlightedAttributeDictionary = [self highlightedAttributeDictionary];
    //    [self.textLabel setFont:[UIFont systemFontOfSize:Text_Message_Font_Size]];
    
    //    self.textLabel.numberOfLines = 0;
    //    [self.textLabel setLineBreakMode:NSLineBreakByWordWrapping];
    //    [self.textLabel setTextAlignment:NSTextAlignmentLeft];
    //    [self.textLabel setTextColor:[UIColor blackColor]];
    //[self.textLabel setBackgroundColor:[UIColor yellowColor]];
    
    [self.bubbleBackgroundView addSubview:self.webView];
    self.bubbleBackgroundView.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
    [self.bubbleBackgroundView addGestureRecognizer:longPress];
}

- (void)setDataModel:(RCMessageModel *)model {
    [super setDataModel:model];
    
    [self setAutoLayout];
}
- (void)setAutoLayout {
    WMVideoMessage *_videoMessage = (WMVideoMessage *)self.model.content;
    if (_videoMessage) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://admin.weixin.ihk.cn/ihkwx_upload/test.mp4"]]];
    } else {
        //DebugLog(@”[RongIMKit]: RCMessageModel.content is NOT RCTextMessage object”);
    }
    // ios 7
    CGSize __textSize ;
    //    [_textMessage.content
    //     boundingRectWithSize:CGSizeMake(self.baseContentView.bounds.size.width -
    //                                     (10 + [RCIM sharedKit].globalMessagePortraitSize.width + 10) * 2 – 5 -
    //                                     35,
    //                                     MAXFLOAT)
    //     options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin |
    //     NSStringDrawingUsesFontLeading
    //     attributes:@{
    //                  NSFontAttributeName : [UIFont systemFontOfSize:Text_Message_Font_Size]
    //                  } context:nil]
    //    .size;
    __textSize = CGSizeMake(ceilf(150), ceilf(100));
    CGSize __labelSize = CGSizeMake(__textSize.width + 5, __textSize.height + 5);
    
    CGFloat __bubbleWidth = __labelSize.width + 15 + 20 < 50 ? 50 : (__labelSize.width + 15 + 20);
    CGFloat __bubbleHeight = __labelSize.height + 5 + 5 < 35 ? 35 : (__labelSize.height + 5 + 5);
    
    CGSize __bubbleSize = CGSizeMake(__bubbleWidth, __bubbleHeight);
    
    CGRect messageContentViewRect = self.messageContentView.frame;
    
    if (MessageDirection_RECEIVE == self.messageDirection) {
        messageContentViewRect.size.width = __bubbleSize.width;
        self.messageContentView.frame = messageContentViewRect;
        
        self.bubbleBackgroundView.frame = CGRectMake(0, 0, __bubbleSize.width, __bubbleSize.height);
        self.webView.frame=CGRectMake(20, 5, __labelSize.width, __labelSize.height);
        //        self.textLabel.frame = CGRectMake(20, 5, __labelSize.width, __labelSize.height);
        self.bubbleBackgroundView.image = [self imageNamed:@"chat_from_bg_normal" ofBundle:@"RongCloud.bundle"];
        UIImage *image = self.bubbleBackgroundView.image;
        self.bubbleBackgroundView.image = [self.bubbleBackgroundView.image
                                           resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.8, image.size.width * 0.8,
                                                                                        image.size.height * 0.2, image.size.width * 0.2)];
    } else {
        messageContentViewRect.size.width = __bubbleSize.width;
        messageContentViewRect.origin.x =
        self.baseContentView.bounds.size.width -
        (messageContentViewRect.size.width + 10 + [RCIM sharedRCIM].globalMessagePortraitSize.width + 10);
        self.messageContentView.frame = messageContentViewRect;
        
        self.bubbleBackgroundView.frame = CGRectMake(0, 0, __bubbleSize.width, __bubbleSize.height);
        self.webView.frame=CGRectMake(15, 5, __labelSize.width, __labelSize.height);
        //        self.textLabel.frame = CGRectMake(15, 5, __labelSize.width, __labelSize.height);
        
        self.bubbleBackgroundView.image = [self imageNamed:@"chat_to_bg_normal" ofBundle:@"RongCloud.bundle"];
        UIImage *image = self.bubbleBackgroundView.image;
        self.bubbleBackgroundView.image = [self.bubbleBackgroundView.image
                                           resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.8, image.size.width * 0.2,
                                                                                        image.size.height * 0.2, image.size.width * 0.8)];
    }
    
}
- (UIImage *)imageNamed:(NSString *)name ofBundle:(NSString *)bundleName {
    UIImage *image = nil;
    NSString *image_name = [NSString stringWithFormat:@"%@.png", name];
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *bundlePath = [resourcePath stringByAppendingPathComponent:bundleName];
    NSString *image_path = [bundlePath stringByAppendingPathComponent:image_name];
    image = [[UIImage alloc] initWithContentsOfFile:image_path];
    
    return image;
}

- (void)longPressed:(id)sender {
    UILongPressGestureRecognizer *press = (UILongPressGestureRecognizer *)sender;
    if (press.state == UIGestureRecognizerStateEnded) {
        //DebugLog(@”long press end”);
        return;
    } else if (press.state == UIGestureRecognizerStateBegan) {
        [self.delegate didLongTouchMessageCell:self.model inView:self.bubbleBackgroundView];
    }
}

@end
