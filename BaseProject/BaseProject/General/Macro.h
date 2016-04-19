//
//  Macro.h
//  NewKnowledgeSystem
//
//  Created by xiangming on 14-9-7.
//  Copyright (c) 2014年 JunePartner. All rights reserved.
//

#ifndef NewKnowledgeSystem_Macro_h
#define NewKnowledgeSystem_Macro_h


/**
 *
 * 方法简化名
 *
 **/
#pragma mark - 方法简化名

#define Version                         [[[UIDevice currentDevice] systemVersion] floatValue]       //获取当前设备的系统版本
#define DefaultValueForKey(key)         [[NSUserDefaults standardUserDefaults] valueForKey:key]     //从defaults中取值
#define SetValueForKey(dic,value,key)   [dic setValue:value forKey:key];                            //给字典设置键值对
#define DoubleToString(x)               [NSString stringWithFormat:@"%f",x]                         //double类型转string类型
#define IntToString(x)                  [NSString stringWithFormat:@"%d",x]                         //int类型转string类型
#define ObjToString(obj)                [NSString stringWithFormat:@"%@",obj]                       //id类型转string类型

#define IOS5                            [[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0
#define IOS6                            [[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0
#define IOS7                            [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
#define IOS8                            [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0


//设备大小判断
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


#define COLOR_RGB(r,g,b) [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:1]
#define Color(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]                //获取颜色的方法
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define GrayTextColor UIColorFromRGB(0x878787)      //灰色字体
#define GrayLineColor UIColorFromRGB(0xd7d7d7)      //灰色线条



#define COLOR_RGBA(r,g,b,a)     [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:a]
#define kBackgroundColor        RGBA(226, 226, 226, 1)
/**
 *
 * 适配使用的常量、通用颜色
 *
 **/
#pragma mark - 常量

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#define kToolBarHeight  44
#define KStateBarHeight 20
#define kTabBarHeight   49
#define kShowHeight kHeight - kToolBarHeight - KStateBarHeight

#define kSideViewControllerWidth 220




#define kTextAlignmentLeft IOS6 ? NSTextAlignmentLeft : UITextAlignmentLeft
#define kTextAlignmentRight IOS6 ? NSTextAlignmentRight : UITextAlignmentRight
#define kTextAlignmentCenter IOS6 ? NSTextAlignmentCenter : UITextAlignmentCenter



#define IS_PLUS_INCH_SCREEN  (([[UIScreen mainScreen] bounds].size.height == 10) ? YES : NO)


#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height - ((IS_IOS_7) ? 0 : 20))

#define STATUS_HIGHT (IS_IOS_7) ? 20 : 0//状态栏高度


#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define DOCUMENT_DIRECTORY_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

#define BUNDLE_IDENTIFIER [[NSBundle mainBundle] bundleIdentifier]

#define BUNDLE_DISPLAY_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]





//判断字符串是否为nil,如果是nil则设置为空字符串
#define CHECK_IS_NULL(txt) (txt == nil || txt.length == 0 || [txt isEqualToString:@"(null)"] || [txt isEqualToString:@"<null>"]) ? @"" : txt



//判断Server返回数据是否为NSNull 类型 txt为参数 type为类型,like NSString,NSArray,NSDictionary
#define CHECK_DATA_IS_NSNULL(param,type) param = [param isKindOfClass:[NSNull class]] ? [type new] : param

#define NAV_BAR_HEIGHT (IS_IOS_7 ? 64 : 44)


#define DEFAULT_REQUEST_PAGE_SIZE @"20"

#define NUMBERS @"0123456789\n"

#define DECIMAL_NUMBERS @"0123456789,.\n"


//系统版本
#define BUNDLE_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

//标题字号大小
#define TITLEBIG_FONG       20
#define TITLEMEDIUM_FONT    16
#define TITLESMALL_FONT     13

#define SUBTITLE_BIG_FONT 18
#define SUBTITLE_MEDIUM_FONT 14
#define SUBTITLE_SMALL_FONT 11


/**
 *
 * 第三方Key
 *
 **/
#pragma mark - Key Value





/**
 *
 * 保存文件的文件名
 *
 **/
#pragma mark - 保存文件的文件名







/**
 *
 * 保存数据等键/值
 *
 **/
#pragma mark - 保存数据等键/值




/**
 *
 * 通知名称
 *
 **/
#pragma mark- 通知名称


#pragma mark - 单例
//单例定义
#define AS_SINGLETON( __class ) \
+ (__class *)sharedInstance;

//单例的实现
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ \
__singleton__ = [[__class alloc] init]; \
} ); \
return __singleton__; \
}

#endif
