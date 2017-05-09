//
//  UIViewController+navigationBarBackgrounTransparent.h
//  Single
//
//  Created by zhongdai on 16/5/23.
//  Copyright © 2016年 zhongdai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (navigationBarBackgrounTransparent)
/**
 *  状态栏是否显示背景色
 *
 *  @param show yes为显示背景色，否则为透明
 */
- (void)setNavigationBarBackgroundShow:(BOOL)show;
@end
