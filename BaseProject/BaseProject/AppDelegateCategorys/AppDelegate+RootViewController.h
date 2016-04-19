//
//  AppDelegate+RootViewController.h
//  LBBuyer
//
//  Created by wangkeke on 15/12/3.
//  Copyright © 2015年 Lubao. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (RootViewController)

-(UIViewController*)rootViewController;

-(void)operateSessionInvalid:(NSNotification*)notification;

@end
