//
//  AppDelegate.h
//  0719MM-OC
//
//  Created by gwchina on 15/8/3.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
/**
 *  登录成功后设置侧边栏导航控制器
 */
- (void)showMainView;
/**
 *  设置根目录
 *
 *  @param viewController 待设置的试图控制器
 */
- (void)rootViewController:(UIViewController *)viewController;


@end

