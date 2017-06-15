//
//  NSDate+IRString.m
//  IRWeather
//
//  Created by qiaoqiao on 2017/6/15.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "NSDate+IRString.h"

@implementation NSDate (IRString)
+(NSString*)getTodayStringDate{
    //获取系统当前时间
    NSDate *currentDate = [NSDate date];
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
    return currentDateString;
}
@end
