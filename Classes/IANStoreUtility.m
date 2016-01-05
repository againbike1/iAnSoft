//
//  IANStoreUtility.m
//  iAnSoft
//
//  Created by 韩学鹏 on 16/1/5.
//  Copyright © 2016年 韩学鹏. All rights reserved.
//

#import "IANStoreUtility.h"
#import "NSString+Exist.h"
#import "IANAccountHelper.h"
#import "IanSoftMacro.h"

@implementation IANStoreUtility

+ (BOOL)storeToRootDirectory:(id)data key:(NSString *)key
{
    NSParameterAssert(data && [data conformsToProtocol:@protocol(NSCoding)]);
    NSParameterAssert([key isExist]);
    
    return [NSKeyedArchiver archiveRootObject:data toFile:[self rootPathKey:key]];
}


+ (BOOL)storeToUserDirectory:(id)data key:(NSString *)key
{
    NSParameterAssert(data && [data conformsToProtocol:@protocol(NSCoding)]);
    NSParameterAssert([key isExist]);
    
    return [NSKeyedArchiver archiveRootObject:data toFile:[self userPathKey:key]];
}


+ (id)fetchInRootDirectoryByKey:(NSString *)key
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self rootPathKey:key]];
}

+ (id)fetchInUserDirectoryByKey:(NSString *)key
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self userPathKey:key]];
}


+ (BOOL)deleteInRootDirectoryByKey:(NSString *)key
{
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:[self rootPathKey:key]]) {
        return [fm removeItemAtPath:[self rootPathKey:key] error:nil];
    }else {
        return NO;
    }
}


+ (BOOL)deleteInUserDirectoryByKey:(NSString *)key
{
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:[self userPathKey:key]]) {
        return [fm removeItemAtPath:[self userPathKey:key] error:nil];
    }else {
        return NO;
    }
}




#pragma mark - 私有方法

+ (NSString *)rootPathKey:(NSString *)key
{
    return [[self storeRootDirectory] stringByAppendingPathComponent:key];
}

+ (NSString *)userPathKey:(NSString *)key
{
    return [[self storeUserDirectory] stringByAppendingPathComponent:key];
}

+ (NSString *)storeRootDirectory
{
    NSString *path = [NSString stringWithFormat:@"%@/iAnStore", kDOCUMENT_DIRECTORY];
    BOOL isDirectory;
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory];
    if (!isExist || !isDirectory) {
        NSError *error = nil;
        BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (success) {
            [self addSkipBackupAttributeToItemAtPath:path];
        }else {
            IANErrorLog(error);
        }
    }
    
    return path;
}

+ (NSString *)storeUserDirectory
{
    NSString *path = [NSString stringWithFormat:@"%@/iAnStore/%@", kDOCUMENT_DIRECTORY, [IANAccountHelper shareInstance].user.name];
    BOOL isDirectory;
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory];
    if (!isExist || !isDirectory) {
        NSError *error = nil;
        BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (success) {
            [self addSkipBackupAttributeToItemAtPath:path];
        }else {
            IANErrorLog(error);
        }
    }
    
    return path;
}


+ (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)filePathString
{
    NSURL *URL = [NSURL fileURLWithPath:filePathString];
    
    assert([[NSFileManager defaultManager] fileExistsAtPath:URL.path]);
    
    NSError *error = nil;
    BOOL success = [URL setResourceValue:@(YES) forKey:NSURLIsExcludedFromBackupKey error:&error];
    if (error) IANErrorLog(error);
    
    return success;
}

@end
