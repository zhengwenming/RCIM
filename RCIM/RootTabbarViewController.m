


//
//  RootTabbarViewController.m
//  RCIM
//
//  Created by 郑文明 on 15/12/30.
//  Copyright © 2015年 郑文明. All rights reserved.
//

#import "RootTabbarViewController.h"
#import "FriendsListViewController.h"
#import "PersonCenterViewController.h"
#import "WMConversationListViewController.h"
#import "GroupListViewController.h"
#import "DiscussionViewController.h"

@interface RootTabbarViewController ()

@end

@implementation RootTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WMConversationListViewController *wmConversationListVC = [[WMConversationListViewController alloc]init];
    wmConversationListVC.title = @"会话列表";
    UINavigationController *converNav = [[UINavigationController alloc]initWithRootViewController:wmConversationListVC];
    UITabBarItem *converListItem = [[UITabBarItem alloc]initWithTitle:@"会话列表" image:[UIImage imageNamed:@"tab1_unselected"] selectedImage:[[UIImage imageNamed:@"tab1_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    converNav.tabBarItem = converListItem;
    [converNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab1_selected"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab1_unselected"]];
    

    
    
    FriendsListViewController *FriendsListVC = [[FriendsListViewController alloc]init];
    FriendsListVC.title = @"好友列表";
    UINavigationController *friendsListNav = [[UINavigationController alloc]initWithRootViewController:FriendsListVC];
    
    UITabBarItem *friendsListItem = [[UITabBarItem alloc]initWithTitle:@"好友列表" image:[UIImage imageNamed:@"tab0_unselected"] selectedImage:[[UIImage imageNamed:@"tab0_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    friendsListNav.tabBarItem = friendsListItem;
    [friendsListNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab0_selected"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab0_unselected"]];
    
    
    GroupListViewController *groupVC = [[GroupListViewController alloc]init];
    groupVC.title = @"群组";
    UINavigationController *groupNav = [[UINavigationController alloc]initWithRootViewController:groupVC];
    
    UITabBarItem *groupItem = [[UITabBarItem alloc]initWithTitle:@"群组" image:[UIImage imageNamed:@"tab2_unselected"] selectedImage:[[UIImage imageNamed:@"tab2_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    groupNav.tabBarItem = groupItem;
    [groupNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab2_selected"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab2_unselected"]];
    
    
    DiscussionViewController *discussionVC = [[DiscussionViewController alloc]init];
    discussionVC.title = @"讨论组";
    UINavigationController *discussionNav = [[UINavigationController alloc]initWithRootViewController:discussionVC];
    
    UITabBarItem *discussionItem = [[UITabBarItem alloc]initWithTitle:@"讨论组" image:[UIImage imageNamed:@"tab3_unselected"] selectedImage:[[UIImage imageNamed:@"tab3_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    discussionNav.tabBarItem = discussionItem;
    [discussionNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab3_selected"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab3_unselected"]];
    
    
    PersonCenterViewController *personCenterVC = [[PersonCenterViewController alloc]init];
    personCenterVC.title = @"个人主页";
    UINavigationController *personCenterNav = [[UINavigationController alloc]initWithRootViewController:personCenterVC];
    
    UITabBarItem *personalPageItem = [[UITabBarItem alloc]initWithTitle:@"个人主页" image:[UIImage imageNamed:@"tab4_unselected"] selectedImage:[[UIImage imageNamed:@"tab4_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    personCenterNav.tabBarItem = personalPageItem;
    [personCenterNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab4_selected"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab4_unselected"]];

    
    
    
    
    self.viewControllers = @[friendsListNav,converNav,groupNav,discussionNav,personCenterNav];
    
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
