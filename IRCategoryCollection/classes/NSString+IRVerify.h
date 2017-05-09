//
//  NSString+IRVerify.h
//  IRCategoryCollection
//
//  Created by irena on 2017/5/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IRVerify)

/**
 验证手机号的合法性

 @param mobile 需要验证的手机号
 @return 是否合法【YES = 合法，NO = 不合法】
 */
-(BOOL)isValidateMobile:(NSString *)mobile;

/**
 验证银行卡号的合法性

 @param cardNo 需要验证的银行卡号
 @return 是否合法【YES = 合法，NO = 不合法】
 */
-(BOOL)isValidateBankCard:(NSString *)cardNo;

/**
 验证数字字符串是否为整数

 @param pureNumber 需要判断的数字字符串
 @return 是否是整数【YES = 是，NO = 不是】
 */
- (BOOL)stringIsPureNumber:(NSString*)pureNumber;

/**
 验证数字字符串是否为浮点型

 @param floatString 需要判断的浮点型字符串
 @return 是否为浮点型【YES = 是，NO = 不是】
 */
- (BOOL)floatIsPureFloat:(NSString*)floatString;
@end
