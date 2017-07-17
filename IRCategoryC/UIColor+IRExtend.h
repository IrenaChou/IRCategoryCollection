//
//  UIColor+extend.h
//  DealExtreme

#import <UIKit/UIKit.h>

// 扩展UIColor类
@interface UIColor(IRExtend)

/**
 将十六进制的颜色值转为objective-c的颜色

 @param hexColor 十六进制颜色字符串【位数只支持6位   如:80ffaa】
 @return 转换后的UIColor
 */
+ (id)getColorWithHexStringColor:(NSString *) hexColor;


/**
 将十六进制的颜色值转为objective-c的颜色

 @param hexColor 十六进制颜色字符串【位数只支持6位   如：80ffaa】
 @param alpha 透明度
 @return 转换后的UIColor
 */
+ (id)getColorWithHexStringColor:(NSString *) hexColor alpha:(CGFloat)alpha;


/**
 UIColor 转UIImage

 @param color 颜色
 @return UIImage
 */
+ (UIImage*) imageWithColor: (UIColor*) color;

@end
