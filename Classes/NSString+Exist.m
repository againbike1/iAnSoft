//
//  NSString+Exist.m
//  iAnSoft
//
//  Created by 韩学鹏 on 16/1/5.
//  Copyright © 2016年 韩学鹏. All rights reserved.
//

#import "NSString+Exist.h"

@implementation NSString (Exist)

- (BOOL)isExist
{
    return [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] != 0;
}

@end
