//
//  IANBaseModel.h
//  iAnSoft
//
//  Created by 韩学鹏 on 16/1/5.
//  Copyright © 2016年 韩学鹏. All rights reserved.
//
//  模型基类

#import <Foundation/Foundation.h>

@interface IANBaseModel : NSObject <NSCoding>

/**
 *  模型对象id
 */
@property (nonatomic, assign) NSInteger objectID;

/**
 *  模型对象name
 */
@property (nonatomic, copy) NSString *name;

@end
