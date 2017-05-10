//
//  NSString+IRVerify.m
//  IRCategoryCollection
//
//  Created by irena on 2017/5/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "NSString+IRVerify.h"

@implementation NSString (IRVerify)

+(BOOL)verifyingMoneyWithMoneyText:(NSString*)moneyText{
    
    NSString *moneyRegex = @"^([0-9]\\d*)(\\.[0-9]\\d*)?$";
    NSString *moneyRegexZero = @"^([0]\\d*)(\\.[0]\\d*)?$";
    
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", moneyRegex];
    NSPredicate *numPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", moneyRegexZero];
    
    if ([numPredicate evaluateWithObject:moneyText] ) {
        return NO;
    }
    return [phoneTest evaluateWithObject:moneyText];
}

/**
 验证身份证合法性
 
 @param cardNo 身份证号
 @return 是否合法【YES = 合法，NO = 不合法】
 */
+ (BOOL)checkIdentityCardNo:(NSString *)cardNo{
    if (cardNo.length != 18) {
        return NO;
    }
    NSArray *codeArray = [NSArray
                          arrayWithObjects:@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6",
                          @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2", nil];
    NSDictionary *checkCodeDic = [NSDictionary
                                  dictionaryWithObjects:[NSArray arrayWithObjects:@"1", @"0", @"X", @"9",
                                                         @"8", @"7", @"6", @"5",
                                                         @"4", @"3", @"2", nil]
                                  forKeys:[NSArray arrayWithObjects:@"0", @"1", @"2", @"3",
                                           @"4", @"5", @"6", @"7",
                                           @"8", @"9", @"10", nil]];
    NSScanner *scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    for (int i = 0; i < 17; i++) {
        sumValue += [[cardNo substringWithRange:NSMakeRange(i, 1)] intValue] *
        [[codeArray objectAtIndex:i] intValue];
    }
    NSString *strlast = [checkCodeDic
                         objectForKey:[NSString stringWithFormat:@"%d", sumValue % 11]];
    if ([strlast isEqualToString:[[cardNo substringWithRange:NSMakeRange(17, 1)]
                                  uppercaseString]]) {
        return YES;
    }
    return NO;
}


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
