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
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray *groupList;
@property (nonatomic, retain)RootTabbarViewController *tabbarVC;
@property(nonatomic,retain) NSMutableArray *friendsArray;

/// func
+ (AppDelegate* )shareAppDelegate;
@end

