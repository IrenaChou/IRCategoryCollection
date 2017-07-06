//
//  NSString+IRPinYin.h
//  IRCategoryCollection
//
//  Created by qiaoqiao on 2017/5/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IRPinYin)

/**
 汉字转成没有声调有空格的拼音
 (空格可根据需求调整return的withString后的字符串)
 
 @param wordStr 需要拼音的汉字(词组/句子)
 @return 拼音
 */
+ (NSString *)transformToPinYin:(NSString *)wordStr;

/**
 汉字转成有声调有空格的拼音
 (空格可根据需求调整return的withString后的字符串)
 
 @param wordStr 需要拼音的汉字(词组/句子)
 @return 带声调的拼音
 */
+ (NSString *)transformToPinYinHaveTone:(NSString *)wordStr;
@end
