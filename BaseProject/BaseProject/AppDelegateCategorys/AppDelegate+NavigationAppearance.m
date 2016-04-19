//
//  AppDelegate+NavigationAppearance.m
//  BaseProject
//
//  Created by FSLB on 16/4/15.
//  Copyright © 2016年 FSLB. All rights reserved.
//

#import "AppDelegate+NavigationAppearance.h"

@implementation AppDelegate (NavigationAppearance)

- (void)setNavigationAppearance{
    UIFont *font = [UIFont systemFontOfSize:18.f];
    NSDictionary * _Nonnull  textAttributes = @{
                                                NSFontAttributeName : font,
                                                NSForegroundColorAttributeName : [UIColor whiteColor],
                                                };
    [[UINavigationBar appearance] setTitleTextAttributes:textAttributes];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x2F91E4)];//蓝色
    //去掉Nav下面的黑线
    //    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UITextField appearance] setTintColor:UIColorFromRGB(0x2F91E4)];
    [[UITextView appearance] setTintColor:UIColorFromRGB(0x2F91E4)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}

@end
