//
//  NSString+LTDate.h
//  xFollow
//
//  Created by irena on 2017/3/10.
//  Copyright © 2017年 LT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IRDate)


/**
 获取当前日期

 @return 当前日期字符串【年-月-日】
 */
- (NSDate *)getDate;


/**
 将日期转成字符串【年-月-日】

 @param date 要转换的NSDate
 @return 字符串日期【年-月-日】
 */
+ (NSString *)getStringWithDate:(NSDate*)date;
@end
