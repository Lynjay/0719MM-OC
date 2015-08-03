//
//  BaseViewController.h
//  0719MM-OC
//
//  Created by gwchina on 15/8/3.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import <UIKit/UIKit.h>

enum BaseViewCtlElements {
    
    kBackButtonTag = 9999,
};

@interface BaseViewController : UIViewController {
    float viewWidth, viewHeight;
    float navHeight, tabBarHeight, statusBarHeight;
    
    NSString *tabTitle;
    UILabel *titleLable;
    
//    Application *app;
    
    BOOL tabbarHidden;
}

@property (nonatomic, assign) BOOL showTotal;
@property (nonatomic, strong) NSString *totalCount;

- (id) initWithTabTitle:(NSString *)title TabbarHidden:(BOOL)hidden;

/*
 data为一个数组，数组类型为NSDictionnary，两个属性：image－tag
 */
- (void) setNavigationBarLeftView:(UIView *)leftView;
- (void) setNavigationBarRightView:(UIView *)rightView;
- (void) setNavigationBarBackView:(UIView *)backView;
- (void) setNavigationBarCenterView:(UIView *)centerView;

- (void) refreshTitleWithCount:(NSString *)total;
- (void) refreshTitle;
- (void) judgeAndCreateEmptyDefaultViewWithTotal:(NSString *)total Tip:(NSString *)tip PaddingVer:(float)paddingVer;

- (void) baseButtonEvent:(id)sender;


@end
