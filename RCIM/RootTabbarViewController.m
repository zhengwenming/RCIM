


//
//  RootTabbarViewController.m
//  RCIM
//
//  Created by 郑文明 on 15/12/30.
//  Copyright © 2015年 郑文明. All rights reserved.
//

#import "RootTabbarViewController.h"
#import "MyFriendsListViewController.h"
#import "WMPersonalPageViewController.h"
#import "WMConversationListViewController.h"

@interface RootTabbarViewController ()

@end

@implementation RootTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    WMConversationListViewController *wmConversationListVC = [[WMConversationListViewController alloc]init];
    wmConversationListVC.title = @"会话列表";
    UINavigationController *converNav = [[UINavigationController alloc]initWithRootViewController:wmConversationListVC];
    UITabBarItem *converListItem = [[UITabBarItem alloc]initWithTitle:@"会话列表" image:[UIImage imageNamed:@"tab0_unselected"] selectedImage:[[UIImage imageNamed:@"tab0_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    converNav.tabBarItem = converListItem;
    [converNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab0_selected"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab0_unselected"]];
    

    
    
    MyFriendsListViewController *myFriendsListVC = [[MyFriendsListViewController alloc]init];
    myFriendsListVC.title = @"好友列表";
    UINavigationController *friendsListNav = [[UINavigationController alloc]initWithRootViewController:myFriendsListVC];
    
    UITabBarItem *friendsListItem = [[UITabBarItem alloc]initWithTitle:@"好友列表" image:[UIImage imageNamed:@"tab1_unselected"] selectedImage:[[UIImage imageNamed:@"tab1_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    friendsListNav.tabBarItem = friendsListItem;
[friendsListNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab1_selected"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab1_unselected"]];
    
    
    
    
    
    
    WMPersonalPageViewController *wmPersonalPageVC = [[WMPersonalPageViewController alloc]init];
    wmPersonalPageVC.title = @"个人主页";
    UINavigationController *personalPageNav = [[UINavigationController alloc]initWithRootViewController:wmPersonalPageVC];
    
    UITabBarItem *personalPageItem = [[UITabBarItem alloc]initWithTitle:@"个人主页" image:[UIImage imageNamed:@"tab2_unselected"] selectedImage:[[UIImage imageNamed:@"tab2_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    personalPageNav.tabBarItem = personalPageItem;
    [personalPageNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab2_selected"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab2_unselected"]];

    
    
    
    
    self.viewControllers = @[converNav,friendsListNav,personalPageNav];
    
    if ([[UIDevice currentDevice].systemVersion floatValue]<8.0) {
        [[UITabBarItem appearance] setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:
          [UIColor redColor], NSForegroundColorAttributeName, nil]
                                                 forState:UIControlStateHighlighted];
    }else
    {
        [self.tabBar setTintColor:[UIColor redColor]];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
