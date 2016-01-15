//
//  AppDelegate.h
//  RCIM
//
//  Created by 郑文明 on 15/4/15.
//  Copyright (c) 2015年 郑文明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RongIMKit/RongIMKit.h>
#import "RootTabbarViewController.h"
#import "RCDataManager.h"
#import "WMUtil.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain)RootTabbarViewController *tabbarVC;
@property(nonatomic,retain) NSMutableArray *friendsArray;
@property(nonatomic,retain) NSMutableArray *groupsArray;

/// func
+ (AppDelegate* )shareAppDelegate;
@end

