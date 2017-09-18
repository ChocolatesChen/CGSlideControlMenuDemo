//
//  CGSlideMenuView.h
//  CGSlideControlMenuDemo
//
//  Created by aofan on 2017/9/15.
//  Copyright © 2017年 aofan. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat margin = 80;

typedef NS_ENUM(NSUInteger,CGSlideMenuModal) {
    /*左边显示*/
    CGSlideMenuModalLeft,
    /*右边显示*/
    CGSlideMenuModalRight
};
@interface CGSlideMenuView : UIView
{
    CGSlideMenuModal _slideControlModal;
    UIView *_controlMenu;
}

/*
 @breaf 得到滑动菜单
 */
+ (instancetype)defaultSlideMenu;

/*
 @breaf
 
 @param modal 显示方式
 @param controlMenu 显示的菜单
 */
- (void)showModal:(CGSlideMenuModal)modal controlMenu:(UIView *)controlMenu;

@end
