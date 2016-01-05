//
//  IanSoftMacro.h
//  iAnSoft
//
//  Created by 韩学鹏 on 16/1/5.
//  Copyright © 2016年 韩学鹏. All rights reserved.
//

#ifndef IanSoftMacro_h
#define IanSoftMacro_h

/**
 *  NSLog
 */
#ifdef DEBUG
#define IANLog(...) NSLog(__VA_ARGS__)
#else
#define IANLog(...){}
#endif

/**
 *  ErrorLog
 */
#define IANErrorLog(error) NSLog(@"Error: %@", error)

/**
 *  App info
 */
#define APP_NAME    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"])
#define APP_VERSION ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define APP_BUILD   ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])


/**
 * Other
 */

//目录
#define kDOCUMENT_DIRECTORY NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

//当前window
#define kWindow [UIApplication sharedApplication].keyWindow

//设备屏幕宽高缩放比
#define kScaleWidth(iphone6Width) [[UIScreen mainScreen] bounds].size.width / 375.f * iphone6Width
#define kScaleHeight(iphone6Height) [[UIScreen mainScreen] bounds].size.height / 667.f * iphone6Height

//设备屏幕宽高
#define kScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

//1像素宽
#define k1PX_WIDTH (1 / [UIScreen mainScreen].scale)



#endif /* IanSoftMacro_h */
