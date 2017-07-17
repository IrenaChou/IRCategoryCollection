//
//  UIColor+extend.m
//  DealExtreme

#import "UIColor+IRExtend.h"


@implementation UIColor(IRExtend)

+ (id)getColorWithHexStringColor:(NSString *) hexColor alpha:(CGFloat)alpha
{
    if (hexColor.length != 6) {
        NSLog(@"【ERROR】十六进制颜色字符串只支持6位");
        return [UIColor blackColor];
    }
    
	unsigned int redInt_, greenInt_, blueInt_;
	NSRange rangeNSRange_;
	rangeNSRange_.length = 2;  // 范围长度为2
	
	// 取红色的值
	rangeNSRange_.location = 0; 
	[[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&redInt_];

	// 取绿色的值
	rangeNSRange_.location = 2; 
	[[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&greenInt_];
	
	// 取蓝色的值
	rangeNSRange_.location = 4; 
	[[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&blueInt_];	
	
	return [UIColor colorWithRed:(float)(redInt_/255.0f) green:(float)(greenInt_/255.0f) blue:(float)(blueInt_/255.0f) alpha:alpha];
}

+(id)getColorWithHexStringColor:(NSString *)hexColor{
    
    if (hexColor.length != 6) {
        NSLog(@"【ERROR】十六进制颜色字符串只支持6位");
        return [UIColor blackColor];
    }

    return [self getColorWithHexStringColor:hexColor alpha:1.0f];
}
+ (UIImage*) imageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0,0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
