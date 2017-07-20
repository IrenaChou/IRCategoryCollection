//
//  UIImage+IRGradientColor.m
//  IRCategoryCollection
//
//  Created by qiaoqiao on 2017/7/20.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "UIImage+IRGradientColor.h"

@implementation UIImage (IRGradientColor)

+ (UIImage *)gradientColorImageFromColors:(NSArray *)colors
                             gradientType:(IRGradientType)gradientType
                                  imgSize:(CGSize)imgSize {
    NSMutableArray *colorsArray = [NSMutableArray array];
    for (UIColor *color in colors) {
        [colorsArray addObject:(id)color.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(imgSize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace =
    CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient =
    CGGradientCreateWithColors(colorSpace, (CFArrayRef)colorsArray, NULL);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case IRGradientTypeTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        case IRGradientTypeLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, 0.0);
            break;
        case IRGradientTypeUpleftToLowright:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, imgSize.height);
            break;
        case IRGradientTypeUprightToLowleft:
            start = CGPointMake(imgSize.width, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end,
                                kCGGradientDrawsBeforeStartLocation |
                                kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

@end
