//
//  UILabel+IRQuicklyCreated.m
//  IRCategoryCollection
//
//  Created by qiaoqiao on 2017/7/6.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "UILabel+IRQuicklyCreated.h"

@implementation UILabel (IRQuicklyCreated)

+(instancetype)label_textWhite_Center_WithText:(NSString *)text fontSize:(CGFloat)fontSize{
    UILabel *lbl = [[UILabel alloc]init];
    
    lbl.text = text;
    lbl.textColor = [UIColor whiteColor];
    lbl.font = [UIFont systemFontOfSize:fontSize];
    lbl.textAlignment = NSTextAlignmentCenter;
    
    [lbl sizeToFit];
    
    return lbl;
}

+(instancetype)label_Center_WithTextColor:(UIColor*)textColor fontSize:(CGFloat)fontSize{
    UILabel *lbl = [[UILabel alloc]init];
    
    lbl.textColor = textColor;
    lbl.font = [UIFont systemFontOfSize:fontSize];
    lbl.textAlignment = NSTextAlignmentCenter;
    
    return lbl;
}
+(instancetype)labelWithFontSize:(CGFloat)fontSize{
    UILabel *lbl = [[UILabel alloc]init];
    
    lbl.textColor = [UIColor blackColor];
    lbl.font = [UIFont systemFontOfSize:fontSize];
    lbl.textAlignment = NSTextAlignmentLeft;
    
    return lbl;
}
@end
