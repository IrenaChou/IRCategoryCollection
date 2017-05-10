//
//  UIImage+qrcode.h
//  Test
//
//  Created by zhongdai on 16/11/8.
//  Copyright © 2016年 irena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (IRQRCode)

/**
 通过二维码字符串生成可扫描的二维码图片

 @param qrcode 二维码字符串
 @return 可扫描的二维码图片
 */
+ (UIImage*)createQRCodeImageWithQRCode:(NSString*)qrcode;
@end
