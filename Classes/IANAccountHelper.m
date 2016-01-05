//
//  IANAccountHelper.m
//  iAnSoft
//
//  Created by 韩学鹏 on 16/1/5.
//  Copyright © 2016年 韩学鹏. All rights reserved.
//

#import "IANAccountHelper.h"
#import "IANStoreUtility.h"

NSString *const kCurrentUserKey = @"kCurrentUserKey";

static IANAccountHelper *_accountHelper = nil;

@interface IANAccountHelper ()

@end

@implementation IANAccountHelper

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _accountHelper = [[self alloc] init];
    });
    
    return _accountHelper;
}

- (BOOL)isLogin
{
    return _user != nil;
}

- (BOOL)logout
{
    return [IANStoreUtility deleteInRootDirectoryByKey:kCurrentUserKey];
}


+ (instancetype)new
{
    return nil;
}

- (instancetype)init
{
    if (self == [super init]) {
        _user = [IANStoreUtility fetchInRootDirectoryByKey:kCurrentUserKey];
    }
    return self;
}




@end
