//
//  NSString+IRPinYin.m
//  IRCategoryCollection
//
//  Created by qiaoqiao on 2017/5/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "NSString+IRPinYin.h"

@implementation NSString (IRPinYin)

/**
 汉字转成没有声调有空格的拼音
 (空格可根据需求调整return的withString后的字符串)

 @param wordStr 需要拼音的汉字(词组/句子)
 @return 拼音
 */
+ (NSString *)transformToPinYin:(NSString *)wordStr {
    NSMutableString *mutableString = [NSMutableString stringWithString:wordStr];
    //带声调
    CFStringTransform((CFMutableStringRef)mutableString, NULL,
                      kCFStringTransformToLatin, NO);
    //  //不带声调
    CFStringTransform((CFMutableStringRef)mutableString, NULL,
                      kCFStringTransformStripDiacritics, NO);
    //你好 -> ni hao -> nihao
    return [mutableString stringByReplacingOccurrencesOfString:@" "
                                                    withString:@"    "];
}

/**
 汉字转成有声调有空格的拼音
 (空格可根据需求调整return的withString后的字符串)

 @param wordStr 需要拼音的汉字(词组/句子)
 @return 带声调的拼音
 */
+ (NSString *)transformToPinYinHaveTone:(NSString *)wordStr {
    NSMutableString *mutableString = [NSMutableString stringWithString:wordStr];
    //带声调
    CFStringTransform((CFMutableStringRef)mutableString, NULL,
                      kCFStringTransformToLatin, NO);
    //你好 -> ni hao -> nihao
    return [mutableString stringByReplacingOccurrencesOfString:@" "
                                                    withString:@"    "];
}
@end
