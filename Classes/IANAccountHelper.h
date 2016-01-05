//
//  IANAccountHelper.h
//  iAnSoft
//
//  Created by 韩学鹏 on 16/1/5.
//  Copyright © 2016年 韩学鹏. All rights reserved.
//
//  用户相关单例

#import <Foundation/Foundation.h>
#import "IANBaseModel.h"

FOUNDATION_EXTERN NSString *const kCurrentUserKey;


@interface IANAccountHelper : NSObject


/**
 *  获取单例对象
 *
 *  @return return value description
 */
+ (instancetype)shareInstance;

/**
 *  用户是否登陆
 */
@property (nonatomic, assign, readonly, getter=isLogin) BOOL login;


/**
 *  当前登陆的用户
 */
@property (nonatomic, strong, readonly) IANBaseModel *user;


/**
 *  用户登出
 *
 *  @return return value description
 */
- (BOOL)logout;

/**
 *  禁用此方法创建对象
 *
 *  @return nil
 */
- (instancetype)init DEPRECATED_ATTRIBUTE;


/**
 *  禁用此方法创建对象
 *
 *  @return nil
 */
+ (instancetype)new DEPRECATED_ATTRIBUTE;

@end
