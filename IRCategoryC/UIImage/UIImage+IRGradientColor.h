//
//  UIImage+IRGradientColor.h
//  IRCategoryCollection
//
//  Created by qiaoqiao on 2017/7/20.
//  Copyright © 2017年 irena. All rights reserved.
//

#import <UIKit/UIKit.h>

//渐变方向
typedef NS_ENUM(NSUInteger, IRGradientType) {
    IRGradientTypeTopToBottom = 0,      //从上到小
    IRGradientTypeLeftToRight = 1,      //从左到右
    IRGradientTypeUpleftToLowright = 2, //左上到右下
    IRGradientTypeUprightToLowleft = 3, //右上到左下
};

@interface UIImage (IRGradientColor)


/**
 通过颜色及渐变方向生成渐变图片

 @param colors 组成渐变的颜色
 @param gradientType 渐变方向
 @param imgSize 渐变范围
 @return UIImage【渐变图片】
 */
+ (UIImage *)gradientColorImageFromColors:(NSArray *)colors
                             gradientType:(IRGradientType)gradientType
                                  imgSize:(CGSize)imgSize;
@end
