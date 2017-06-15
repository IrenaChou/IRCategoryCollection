//
//  UIViewController+navigationBarBackgrounTransparent.m
//  Single
//
//  Created by zhongdai on 16/5/23.
//  Copyright © 2016年 zhongdai. All rights reserved.
//

#import "UIViewController+IRNavigationBarBackgrounTransparent.h"

@implementation UIViewController (IRNavigationBarBackgrounTransparent)
/**
 *  状态栏是否显示背景色
 *
 *  @param show yes为显示背景色，否则为透明
 */
- (void)setNavigationBarBackgroundShow:(BOOL)show {
  self.navigationController.navigationBar.translucent = !show;
  UIColor *color = nil;
  if (show) {
    color = [UIColor whiteColor];
  } else {
    color = [UIColor clearColor];
  }
  CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, 64);
  UIGraphicsBeginImageContext(rect.size);
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(context, [color CGColor]);
  CGContextFillRect(context, rect);
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();
  [self.navigationController.navigationBar
      setBackgroundImage:image
           forBarMetrics:UIBarMetricsDefault];
  self.navigationController.navigationBar.clipsToBounds = !show;
}
@end
