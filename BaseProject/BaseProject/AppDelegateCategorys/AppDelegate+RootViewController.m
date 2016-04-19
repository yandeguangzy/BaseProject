//
//  AppDelegate+RootViewController.m
//  LBBuyer
//
//  Created by wangkeke on 15/12/3.
//  Copyright © 2015年 Lubao. All rights reserved.
//

#import "AppDelegate+RootViewController.h"
#import "HomeViewController.h"
#import "LBUserCenterViewController.h"
#import "MoreViewController.h"
#import "HallViewController.h"
#import "UITabBarController+LBConfig.h"
#import "LBLoginViewController.h"
#import "AppDelegate+NavigationAppearance.h"
#import "JCAlertView+LBAddtion.h"
#import "LBNavigationController.h"
#import "LBSocketSharedModel.h"
#import "LBAuctionDetailViewController.h"
#import "LBAttentionCarsViewController.h"

@implementation AppDelegate (RootViewController)

-(UIViewController*)rootViewController{
    if (!self.window.rootViewController) {
        
        UITabBarController *tabVC = [[UITabBarController alloc]init];
        
        tabVC.viewControllers = @[[self homeNavVC],[self hallNavVC],[self myInfoNavVC],[self moreNavVC]];
        [tabVC lbConfigTabBarWithTitles:@[@"首页",@"拍卖大厅",@"个人中心",@"更多"] andDefaultImages:@[@"tabbar_home_icon",@"tabbar_hall_icon",@"tabbar_person_icon",@"tabbar_more_icon"] andSelectedImages:@[@"tabbar_home_select_icon",@"tabbar_hall_select_icon",@"tabbar_person_select_icon",@"tabbar_more_select_icon"]];

        return tabVC;
    }
    return self.window.rootViewController;
}

/*
 首页
 */
-(UINavigationController*)homeNavVC{
    
    HomeViewController *homeVC = nil;

    if(iPhone4){
        homeVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController_4" bundle:nil];
    }else{
        homeVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController_56p" bundle:nil];
    }

    homeVC.title = @"首页";
    
    LBNavigationController *nav = [[LBNavigationController alloc]initWithRootViewController:homeVC];
    return nav;
}

/*
 拍卖大厅
 */
-(UINavigationController*)hallNavVC{
    HallViewController * hallVC = [[HallViewController alloc]initWithNibName:@"HallViewController" bundle:nil];
    hallVC.title = @"拍卖大厅";
    LBNavigationController *nav = [[LBNavigationController alloc]initWithRootViewController:hallVC];
    
    return nav;
}

/*
 个人中心
 */
-(UINavigationController*)myInfoNavVC{
    LBUserCenterViewController *userCenterCtl = [[LBUserCenterViewController alloc]init];
    userCenterCtl.title = @"个人中心";
    
    LBNavigationController *nav = [[LBNavigationController alloc]initWithRootViewController:userCenterCtl];
    
    return nav;
}

/*
 首页
 */
-(UINavigationController*)moreNavVC{
    MoreViewController *moreVC = [[MoreViewController alloc]initWithNibName:@"MoreViewController" bundle:nil];
    moreVC.title = @"更多";
    
    LBNavigationController *nav = [[LBNavigationController alloc]initWithRootViewController:moreVC];
    
    return nav;
}

/*
 Session失效的回调方法
 */
-(void)operateSessionInvalid:(NSNotification*)notification{
    
     [[LBUserManager sharedInstance] logoutCurrentSellerWithCompletion:NULL];
    
    __weak typeof(self)weakself= self;
    
    if (notification.object) {//logout
        [self popLoginView];
    }else{
        if(self.window.rootViewController.presentedViewController){
            return;
        }
        [JCAlertView showAbnormalLoginAlertWithReLoginBlock:^(id alert) {
            [alert dismissWithCompletion:nil];
            
            [weakself setNavigationAppearance];
            
            [weakself popLoginView];
        }];
    }
}

-(void)popLoginView{
    //弹出登录页面
    LBLoginViewController *vc = [[LBLoginViewController alloc] initWithNibName:NSStringFromClass([LBLoginViewController class]) bundle:nil];
    LBNavigationController *nav = [[LBNavigationController alloc] initWithRootViewController:vc];
    nav.navigationBarHidden = YES;
    
    [self.rootViewController presentViewController:nav
                                          animated:YES
                                        completion:^{
                                            //将页面返回到首页
                                            if ([self.rootViewController isKindOfClass:[UITabBarController class]]) {
                                                UITabBarController *tabVC = (UITabBarController*)self.rootViewController;
                                                
                                                if ([tabVC.selectedViewController isKindOfClass:[UINavigationController class]]) {
                                                    UINavigationController *navVC = (UINavigationController *)tabVC.selectedViewController;
                                                    [navVC popToRootViewControllerAnimated:NO];
                                                }
                                                
                                                [tabVC setSelectedIndex:0];
                                            }
                                            [LBUserManager sharedInstance].currentUser.sessionKey = nil;
                                        }];
}

- (void)globalSocket:(NSNotification *)noti{
    LBSocketSharedModel *socketShareModel = (LBSocketSharedModel *)noti.object;
    
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    UITabBarController *tabController = (UITabBarController*)app.window.rootViewController;
    if (!([tabController.selectedViewController isKindOfClass:[HomeViewController class]] | [tabController.selectedViewController isKindOfClass:[LBAuctionDetailViewController class]] | [tabController.selectedViewController isKindOfClass:[LBAttentionCarsViewController class]] )){
        
        if ([socketShareModel.isHaveMessage boolValue]){
            [LBTool showTipsOnWindow:@"您关注的车有新的有效代理价" forSecond:2];
        }
    }
}

@end
