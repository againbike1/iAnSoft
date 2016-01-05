//
//  IANBaseModel.m
//  iAnSoft
//
//  Created by 韩学鹏 on 16/1/5.
//  Copyright © 2016年 韩学鹏. All rights reserved.
//

#import "IANBaseModel.h"

@implementation IANBaseModel

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:[NSNumber numberWithInteger:self.objectID] forKey:@"objectID"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self == [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.objectID = [[aDecoder decodeObjectForKey:@"objectID"] integerValue];
    }
    
    return self;
}

@end
