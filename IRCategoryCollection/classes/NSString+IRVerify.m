//
//  NSString+IRVerify.m
//  IRCategoryCollection
//
//  Created by irena on 2017/5/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "NSString+IRVerify.h"

@implementation NSString (IRVerify)

/**
 验证手机号的合法性
 
 @param mobile 需要验证的手机号
 @return 是否合法【YES = 合法，NO = 不合法】
 */
-(BOOL)isValidateMobile:(NSString *)mobile{
    //手机号以13, 15,18开头,八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

/**
 验证银行卡号的合法性
 
 @param cardNo 需要验证的银行卡号
 @return 是否合法【YES = 合法，NO = 不合法】
 */
-(BOOL)isValidateBankCard:(NSString *)cardNo{
    NSString *cardRegex =
    @"/^\\d{16,19}$|^\\d{6}\\d{10,13}$|^\\d{4}\\d{4}\\d{4}\\d{4,7}$/";
    NSPredicate *bankTest =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", cardRegex];
    return [bankTest evaluateWithObject:cardNo];
}

/**
 验证数字字符串是否为整数
 
 @param pureNumber 需要判断的数字字符串
 @return 是否是整数【YES = 是，NO = 不是】
 */
- (BOOL)stringIsPureNumber:(NSString*)pureNumber {
    NSScanner* scan = [NSScanner scannerWithString:pureNumber];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

/**
 验证数字字符串是否为浮点型
 
 @param floatString 需要判断的浮点型字符串
 @return 是否为浮点型【YES = 是，NO = 不是】
 */
- (BOOL)floatIsPureFloat:(NSString*)floatString {
    NSScanner* scan = [NSScanner scannerWithString:floatString];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

@end
