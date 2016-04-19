//
//  DGTabbarViewController.m
//  BaseProject
//
//  Created by FSLB on 16/4/14.
//  Copyright © 2016年 FSLB. All rights reserved.
//

#import "DGTabbarViewController.h"

@interface DGTabbarViewController ()

@end

@implementation DGTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //这一步是获取LaunchScreen.storyboard里的UIViewController,UIViewController 的identifer是LaunchScreen
//    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LaunchScreen"];
//    UIView *launchView = viewController.view;
//    UIImageView  * Imageview= [[UIImageView  alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    Imageview.backgroundColor = [UIColor purpleColor];
//    [launchView addSubview:Imageview];
//    [self.view addSubview:launchView];
//    
//
//    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0f *NSEC_PER_SEC));
//    
//    void (^task)() = ^{
//        [launchView removeFromSuperview];
//    };
//    dispatch_after(when, dispatch_get_main_queue(), task);
    
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
