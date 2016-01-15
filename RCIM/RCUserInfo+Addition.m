//
//  RCUserInfo+Addition.m
//  IHK
//
//  Created by 郑文明 on 15/7/28.
//  Copyright (c) 2015年 郑文明. All rights reserved.
//

#import "RCUserInfo+Addition.h"
#import <objc/runtime.h>




@implementation RCUserInfo (Addition)
@dynamic QQ;
@dynamic sex;
- (instancetype)initWithUserId:(NSString *)userId name:(NSString *)username portrait:(NSString *)portrait QQ:(NSString *)QQ sex:(NSString *)sex{
    if (self = [super init]) {
        self.userId        =   userId;
        self.name          =   username;
        self.portraitUri   =   portrait;
        self.QQ         =   QQ;
        self.sex   =   sex;

    }
    return self;
}

//添加属性扩展set方法
static char* const QQ = "QQ";
static char* const SEX = "SEX";

-(void)setQQ:(NSString *)newQQ{
    
    objc_setAssociatedObject(self,QQ,newQQ,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
-(void)setSex:(NSString *)newSex{
    
    objc_setAssociatedObject(self,SEX,newSex,OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

//添加属性扩展get方法
-(NSString *)QQ{
    return objc_getAssociatedObject(self,QQ);
}
-(NSString *)sex{
    return objc_getAssociatedObject(self,SEX);
}

@end

