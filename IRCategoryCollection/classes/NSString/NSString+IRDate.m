//
//  NSString+LTDate.m
//  xFollow
//
//  Created by irena on 2017/3/10.
//  Copyright © 2017年 LT. All rights reserved.
//

#import "NSString+IRDate.h"

@implementation NSString (IRDate)
- (NSDate *)getDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:self];
    return date;
}
/**
 *  将日期转成字符串【年-月-日】
 *
 *  @return 字符串日期【年-月-日】
 */
+ (NSString *)getStringWithDate:(NSDate*)date{
    if (date == nil) {
        date = [NSDate date];
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}
@end
