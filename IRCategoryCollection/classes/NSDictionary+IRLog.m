//
//  NSDictionary+LTLog.m
//  xFollow
//
//  Created by qiaoqiao on 2017/3/10.
//  Copyright © 2017年 LT. All rights reserved.
//

#import "NSDictionary+IRLog.h"

@implementation NSArray (IRLog)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    [strM appendString:@")"];
    
    return strM;
}

@end

@implementation NSDictionary (IRLog)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}

@end
