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
 将日期字符串转成NSDate
  self = @"2017-05-10"
 
 @return NSDate【2017-05-09 16:00:00 +0000】
 */
- (NSDate *)getDate;


/**
 将日期转成字符串【年-月-日】

 @param date 要转换的NSDate
 @return 字符串日期【年-月-日】
 */
+ (NSString *)getStringWithDate:(NSDate*)date;
@end
