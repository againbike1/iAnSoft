//
//  IANStoreUtility.h
//  iAnSoft
//
//  Created by 韩学鹏 on 16/1/5.
//  Copyright © 2016年 韩学鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IANStoreUtility : NSObject

/**
 *  存储在Document/iAnStore目录下
 *
 *  @param data 存储的对象
 *  @param key  key
 *
 *  @return return value description
 */
+ (BOOL)storeToRootDirectory:(id)data key:(NSString *)key;

/**
 *  存储在用户目录下：Document/iAnStore/<当前用户名>
 *
 *  @param data data description
 *  @param key  key description
 *
 *  @return return value description
 */
+ (BOOL)storeToUserDirectory:(id)data key:(NSString *)key;


/**
 *  在Document/iAnStore目录下取出存储的对象
 *
 *  @param key key description
 *
 *  @return return value description
 */
+ (id)fetchInRootDirectoryByKey:(NSString *)key;

/**
 *  在Document/iAnStore/<当前用户名>目录下取出存储的对象
 *
 *  @param key key description
 *
 *  @return return value description
 */
+ (id)fetchInUserDirectoryByKey:(NSString *)key;


/**
 *  删除Document/iAnStore目录下的对象
 *
 *  @param key key description
 *
 *  @return return value description
 */
+ (BOOL)deleteInRootDirectoryByKey:(NSString *)key;


/**
 *  删除Document/iAnStore/<当前用户名>目录下的对象
 *
 *  @param key key description
 *
 *  @return return value description
 */
+ (BOOL)deleteInUserDirectoryByKey:(NSString *)key;
@end
