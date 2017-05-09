//
//  UIColor+extend.h
//  DealExtreme
//
//  Created by xiongcaixing on 10-8-30.
//  Copyright 2010 epro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 扩展UIColor类
@interface UIColor(IRExtend)

// 将十六进制的颜色值转为objective-c的颜色
+ (id)getColor:(NSString *) hexColor;

+ (id)getColor:(NSString *) hexColor alpha:(CGFloat)alpha;

@end
