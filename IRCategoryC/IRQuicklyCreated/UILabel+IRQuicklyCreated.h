//
//  UILabel+IRQuicklyCreated.h
//  IRCategoryCollection
//
//  Created by qiaoqiao on 2017/7/6.
//  Copyright © 2017年 irena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (IRQuicklyCreated)


/**
 快速创建label

 @param text 文本信息
 @param fontSize 文本字号
 @return UILabel
 */
+(instancetype)label_textWhite_Center_WithText:(NSString *)text fontSize:(CGFloat)fontSize;

@end
